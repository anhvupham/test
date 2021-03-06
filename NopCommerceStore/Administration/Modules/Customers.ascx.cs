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
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.CustomerManagement;
using NopSolutions.NopCommerce.BusinessLogic.ExportImport;
using NopSolutions.NopCommerce.Common.Utils;
using System.IO;

namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class CustomersControl : BaseNopAdministrationUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetDefaultValues();
                phUsername.Visible = CustomerManager.UsernamesEnabled;
                gvCustomers.Columns[3].Visible = CustomerManager.UsernamesEnabled;
            }
        }

        protected void SetDefaultValues()
        {
            int days = CommonHelper.QueryStringInt("ShowDays");
            if (days > 0)
            {
                txtStartDate.Text = DateTime.UtcNow.AddDays(-days).ToString(cStartDateButtonExtender.Format);
                txtEndDate.Text = DateTime.UtcNow.AddDays(1).ToString(cEndDateButtonExtender.Format);
            }
        }

        protected CustomerCollection GetCustomers()
        {
            DateTime? startDate = null;
            DateTime? endDate = null;
            DateTime startDateTmp = DateTime.Now;
            if (DateTime.TryParse(txtStartDate.Text, out startDateTmp))
            {
                startDate = DateTime.SpecifyKind(startDateTmp, DateTimeKind.Utc);
            }
            DateTime endDateTmp = DateTime.Now;
            if (DateTime.TryParse(txtEndDate.Text, out endDateTmp))
            {
                endDate = DateTime.SpecifyKind(endDateTmp, DateTimeKind.Utc);
            }

            string email = txtEmail.Text;
            string username = txtUsername.Text;
            bool dontLoadGuestCustomers = cbDontLoadGuestCustomers.Checked;
            int totalRecords = 0;
            CustomerCollection customers = CustomerManager.GetAllCustomers(startDate,
                endDate, email, username, dontLoadGuestCustomers, int.MaxValue, 0, out totalRecords);
            if (cbLoadAdminOnly.Checked)
            {
                var revisedList = customers.FindAll(IsAdmin);
                customers.Clear();
                foreach (var customer in revisedList)
                    customers.Add(customer);
            }
            return customers;
        }

        protected  List<Customer> GetBirthdayCustomers()
        {
            DateTime? startDate = null;
            DateTime? endDate = null;
            DateTime startDateTmp = DateTime.Now;
            if (DateTime.TryParse(txtStartDate.Text, out startDateTmp))
            {
                startDate = DateTime.SpecifyKind(startDateTmp, DateTimeKind.Utc);
            }
            DateTime endDateTmp = DateTime.Now;
            if (DateTime.TryParse(txtEndDate.Text, out endDateTmp))
            {
                endDate = DateTime.SpecifyKind(endDateTmp, DateTimeKind.Utc);
            }

            string email = txtEmail.Text;
            string username = txtUsername.Text;
            bool dontLoadGuestCustomers = cbDontLoadGuestCustomers.Checked;
            int totalRecords = 0;
            CustomerCollection customers = CustomerManager.GetAllCustomers(startDate,
                endDate, email, username, dontLoadGuestCustomers, int.MaxValue, 0, out totalRecords);

            return customers.FindAll(IsBirthdayToday);
        }

        protected List<Customer> GetTop20Customers()
        {
            CustomerCollection customers = CustomerManager.CustomerLoadTop20HighestSavePoint();
            return customers;
        }

        protected void BindGrid()
        {
            gvCustomers.DataSource = GetCustomers();
            gvCustomers.DataBind();
        }

        protected void BindBirthdayGrid()
        {           
            gvCustomers.DataSource = GetBirthdayCustomers();
            gvCustomers.DataBind();
        }

        protected void BindTop20Grid()
        {
            gvCustomers.DataSource = GetTop20Customers();
            gvCustomers.DataBind();
        }        

        protected string GetCustomerInfo(Customer customer)
        {
            string customerInfo = string.Empty;
            if (customer != null)
            {
                if (customer.IsGuest)
                {
                    customerInfo = Server.HtmlEncode(GetLocaleResourceString("Admin.Customers.Guest"));
                }
                else
                {
                    customerInfo = Server.HtmlEncode(customer.Email);
                }
            }
            return customerInfo;
        }

        protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCustomers.PageIndex = e.NewPageIndex;
            switch (Session["state"].ToString())
            {
                case "birthday":
                    BindBirthdayGrid();
                    break;
                case "top20":
                    BindTop20Grid();
                    break;
                case "showall": 
                    BindGrid();
                    break;
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    BindGrid();
                    Session["state"] = "showall";
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }

        protected void btnExportXML_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string fileName = string.Format("customers_{0}.xml", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"));

                    CustomerCollection customers = GetCustomers();
                    string xml = ExportManager.ExportCustomersToXML(customers);
                    CommonHelper.WriteResponseXML(xml, fileName);
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }

        protected void btnExportXLS_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string fileName = string.Format("customers_{0}.xls", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"));
                    string filePath = string.Format("{0}files\\ExportImport\\{1}", HttpContext.Current.Request.PhysicalApplicationPath, fileName);
                    CustomerCollection customers = GetCustomers();

                    ExportManager.ExportCustomersToXLS(filePath, customers);
                    CommonHelper.WriteResponseXLS(filePath, fileName);
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }

        protected void btnImportXLS_Click(object sender, EventArgs e)
        {
            if (fuXlsFile.PostedFile != null && !String.IsNullOrEmpty(fuXlsFile.FileName))
            {
                try
                {
                    byte[] fileBytes = fuXlsFile.FileBytes;
                    string extension = "xls";
                    if (fuXlsFile.FileName.EndsWith("xlsx"))
                        extension = "xlsx";
                    
                    string fileName = string.Format("customers_{0}.{1}", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"), extension);
                    string filePath = string.Format("{0}files\\ExportImport\\{1}", HttpContext.Current.Request.PhysicalApplicationPath, fileName);

                    File.WriteAllBytes(filePath, fileBytes);
                    ImportManager.ImportCustomersFromXLS(filePath);
                }
                catch (Exception ex)
                {
                    ProcessException(ex);
                }
            }
        }

        protected void btnBirthday_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    BindBirthdayGrid();
                    Session["state"] = "birthday";
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }

        protected void btnTop20_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    BindTop20Grid();
                    Session["state"] = "top20";
                }
                catch (Exception exc)
                {
                    ProcessException(exc);
                }
            }
        }

        static bool IsBirthdayToday(Customer x)
        {
            return (x.DateOfBirth == DateTime.Today);
        }

        static bool IsAdmin(Customer x)
        {
            return x.IsAdmin;
        }
    }
}