//------------------------------------------------------------------------------
// The contents of this file are subject to the nopCommerce Public License Version 1.0 ("License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at  http://www.nopCommerce.com/License.aspx. 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. 
// See the License for the specific language governing rights and limitations under the License.
// 
// The Original Code is nopCommerce.
// The Initial Developer of the Original Code is NopSolutions.
// All Rights Reserved.
// 
// Contributor(s): _______. 
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Compilation;
using System.Web.Security;
using System.Xml;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.CustomerManagement;
using NopSolutions.NopCommerce.BusinessLogic.Localization;
using NopSolutions.NopCommerce.BusinessLogic.Shipping;
using NopSolutions.NopCommerce.BusinessLogic.Tax;
using NopSolutions.NopCommerce.BusinessLogic.Utils;

namespace NopSolutions.NopCommerce.BusinessLogic.ExportImport
{
    /// <summary>
    /// Excel helper
    /// </summary>
    public partial class ExcelHelper : IDisposable 
    {
        #region Fileds
        private string excelObject = "Provider=Microsoft.{0}.OLEDB.{1};Data Source={2};Extended Properties=\"Excel {3};HDR={4};IMEX={5}\"";
        private string filepath = string.Empty;
        private string hdr = "No";
        private string imex = "1";
        private OleDbConnection con = null;
        #endregion

        #region Ctor
        /// <summary>
        /// Ctor
        /// </summary>
        /// <param name="filepath">Excel file path</param>
        public ExcelHelper(string filepath)
        {
            this.filepath = filepath;
        }
        #endregion

        #region Methods

        /// <summary>
        /// Gets a schema
        /// </summary>
        /// <returns>Schema</returns>
        public DataTable GetSchema()
        {
            DataTable dtSchema = null;
            if (this.Connection.State != ConnectionState.Open) this.Connection.Open();
            dtSchema = this.Connection.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });
            return dtSchema;
        }

        /// <summary>
        /// Read table
        /// </summary>
        /// <param name="tableName">Table Name</param>
        /// <returns>Table</returns>
        public DataTable ReadTable(string tableName)
        {
            return this.ReadTable(tableName, "");
        }

        /// <summary>
        /// Read table
        /// </summary>
        /// <param name="tableName">Table Name</param>
        /// <param name="criteria">Criteria</param>
        /// <returns>Table</returns>
        public DataTable ReadTable(string tableName, string criteria)
        {
            if (this.Connection.State != ConnectionState.Open)
            {
                this.Connection.Open();

            }
            string cmdText = "Select * from [{0}]";
            if (!string.IsNullOrEmpty(criteria))
            {
                cmdText += " Where " + criteria;
            }
            OleDbCommand cmd = new OleDbCommand(string.Format(cmdText, tableName));
            cmd.Connection = this.Connection;
            OleDbDataAdapter adpt = new OleDbDataAdapter(cmd);

            DataSet ds = new DataSet();

            adpt.Fill(ds, tableName);

            if (ds.Tables.Count >= 1)
            {
                return ds.Tables[0];
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Drop table
        /// </summary>
        /// <param name="tableName">Table Name</param>
        public void DropTable(string tablename)
        {
            if (this.Connection.State != ConnectionState.Open)
            {
                this.Connection.Open();

            }
            string cmdText = "Drop Table [{0}]";
            using (OleDbCommand cmd = new OleDbCommand(string.Format(cmdText, tablename), this.Connection))
            {
                cmd.ExecuteNonQuery();

            }
            this.Connection.Close();
        }

        /// <summary>
        /// Write table
        /// </summary>
        /// <param name="tableName">Table Name</param>
        /// <param name="tableDefinition">Table Definition</param>
        public void WriteTable(string tableName, Dictionary<string, string> tableDefinition)
        {
            using (OleDbCommand cmd = new OleDbCommand(this.GenerateCreateTable(tableName, tableDefinition), this.Connection))
            {
                if (this.Connection.State != ConnectionState.Open) this.Connection.Open();
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// Add new row
        /// </summary>
        /// <param name="dr">Data Row</param>
        public void AddNewRow(DataRow dr)
        {
            string command = this.GenerateInsertStatement(dr);
            ExecuteCommand(command);
        }

        /// <summary>
        /// Execute new command
        /// </summary>
        /// <param name="Command">Command</param>
        public void ExecuteCommand(string Command)
        {
            using (OleDbCommand cmd = new OleDbCommand(Command, this.Connection))
            {
                if (this.Connection.State != ConnectionState.Open) this.Connection.Open();
                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// Generates create table script
        /// </summary>
        /// <param name="tableName">Table Name</param>
        /// <param name="tableDefinition">Table Definition</param>
        /// <returns>Create table script</returns>
        private string GenerateCreateTable(string tableName, Dictionary<string, string> tableDefination)
        {

            StringBuilder sb = new StringBuilder();
            bool firstcol = true;
            sb.AppendFormat("CREATE TABLE [{0}](", tableName);
            firstcol = true;
            foreach (KeyValuePair<string, string> keyvalue in tableDefination)
            {
                if (!firstcol)
                {
                    sb.Append(",");
                }
                firstcol = false;
                sb.AppendFormat("{0} {1}", keyvalue.Key, keyvalue.Value);
            }

            sb.Append(")");
            return sb.ToString();
        }

        /// <summary>
        /// Generates insert statement script
        /// </summary>
        /// <param name="dr">Data row</param>
        /// <returns>Insert statement script</returns>
        private string GenerateInsertStatement(DataRow dr)
        {
            StringBuilder sb = new StringBuilder();
            bool firstcol = true;
            sb.AppendFormat("INSERT INTO [{0}](", dr.Table.TableName);


            foreach (DataColumn dc in dr.Table.Columns)
            {
                if (!firstcol)
                {
                    sb.Append(",");
                }
                firstcol = false;

                sb.Append(dc.Caption);
            }

            sb.Append(") VALUES(");
            firstcol = true;
            for (int i = 0; i <= dr.Table.Columns.Count - 1; i++)
            {
                if (!object.ReferenceEquals(dr.Table.Columns[i].DataType, typeof(int)))
                {
                    sb.Append("'");
                    sb.Append(dr[i].ToString().Replace("'", "''"));
                    sb.Append("'");
                }
                else
                {
                    sb.Append(dr[i].ToString().Replace("'", "''"));
                }
                if (i != dr.Table.Columns.Count - 1)
                {
                    sb.Append(",");
                }
            }

            sb.Append(")");
            return sb.ToString();
        }

        /// <summary>
        /// Dispose
        /// </summary>
        public void Dispose()
        {
            if (this.con != null && this.con.State == ConnectionState.Open)
                this.con.Close();
            if (this.con != null)
                this.con.Dispose();
            this.con = null;
            this.filepath = string.Empty;
        }
        #endregion

        #region Properties
        /// <summary>
        /// Gets connection string
        /// </summary>
        public string ConnectionString
        {
            get
            {
                string result = string.Empty;
                if (String.IsNullOrEmpty(this.filepath))
                    return result;

                //Check for File Format
                FileInfo fi = new FileInfo(this.filepath);
                if (fi.Extension.Equals(".xls"))
                {
                    result = string.Format(this.excelObject, "Jet", "4.0", this.filepath, "8.0", this.hdr, this.imex);
                }
                else if (fi.Extension.Equals(".xlsx"))
                {
                    result = string.Format(this.excelObject, "Ace", "12.0", this.filepath, "12.0", this.hdr, this.imex);
                }
                return result;
            }
        }

        /// <summary>
        /// Gets connection
        /// </summary>
        public OleDbConnection Connection
        {
            get
            {
                if (con == null)
                {
                    OleDbConnection _con = new OleDbConnection { ConnectionString = this.ConnectionString };
                    this.con = _con;
                }
                return this.con;
            }
        }

        /// <summary>
        /// Gets or sets a HDR
        /// </summary>
        public string HDR
        {
            get
            {
                return this.hdr;
            }
            set
            {
                this.hdr = value;
            }
        }

        /// <summary>
        /// Gets or sets an IMEX
        /// </summary>
        public string IMEX
        {
            get
            {
                return this.imex;
            }
            set
            {
                this.imex = value;
            }
        }
        #endregion
    }
}
