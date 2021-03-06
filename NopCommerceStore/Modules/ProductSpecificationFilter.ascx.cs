﻿//------------------------------------------------------------------------------
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
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;
using System.Xml.XPath;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Categories;
using NopSolutions.NopCommerce.BusinessLogic.Content.Polls;
using NopSolutions.NopCommerce.BusinessLogic.CustomerManagement;
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Localization;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.Products.Specs;
using NopSolutions.NopCommerce.Common.Utils;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class ProductSpecificationFilterControl : BaseNopUserControl
    {
        #region Utilities
        protected void BindData()
        {
            SpecificationAttributeOptionFilterCollection alreadyFilteredOptions = getAlreadyFilteredSpecs();            
            SpecificationAttributeOptionFilterCollection notFilteredOptions = getNotFilteredSpecs();

            if (alreadyFilteredOptions.Count > 0 || notFilteredOptions.Count > 0)
            {
                if (alreadyFilteredOptions.Count > 0)
                {
                    rptAlreadyFilteredPSO.DataSource = alreadyFilteredOptions;
                    rptAlreadyFilteredPSO.DataBind();

                    string url = CommonHelper.GetThisPageURL(true);
                    string[] alreadyFilteredSpecsQueryStringParams = getAlreadyFilteredSpecsQueryStringParams();
                    foreach (string qsp in alreadyFilteredSpecsQueryStringParams)
                    {
                        url = CommonHelper.RemoveQueryString(url, qsp);
                    }
                    url = excludeQueryStringParams(url);
                    hlRemoveFilter.NavigateUrl = url;
                }
                else
                {
                    pnlAlreadyFilteredPSO.Visible = false;
                    pnlRemoveFilter.Visible = false;
                }

                if (notFilteredOptions.Count > 0)
                {
                    rptFilterByPSO.DataSource = notFilteredOptions;
                    rptFilterByPSO.DataBind();
                }
                else
                {
                    pnlPSOSelector.Visible = false;
                }

            }
            else
            {
                Visible = false;
            }
        }

        protected SpecificationAttributeOptionFilterCollection getAlreadyFilteredSpecs()
        {
            SpecificationAttributeOptionFilterCollection result = new SpecificationAttributeOptionFilterCollection();

            string[] queryStringParams = getAlreadyFilteredSpecsQueryStringParams();
            foreach (string qsp in queryStringParams)
            {
                int id = 0;
                int.TryParse(Request.QueryString[qsp], out id);
                SpecificationAttributeOption sao = SpecificationAttributeManager.GetSpecificationAttributeOptionByID(id);
                if (sao != null)
                {
                    SpecificationAttribute sa = sao.SpecificationAttribute;
                    if (sa != null)
                    {
                        result.Add(new SpecificationAttributeOptionFilter
                        {
                            SpecificationAttributeID = sa.SpecificationAttributeID,
                            SpecificationAttributeName = sa.Name,
                            DisplayOrder = sa.DisplayOrder,
                            SpecificationAttributeOptionID = sao.SpecificationAttributeOptionID,
                            SpecificationAttributeOptionName = sao.Name
                        });
                    }
                }
            }

            return result;
        }

        protected SpecificationAttributeOptionFilterCollection getNotFilteredSpecs()
        {
            //get all
            SpecificationAttributeOptionFilterCollection result = SpecificationAttributeManager.GetSpecificationAttributeOptionFilter(this.CategoryID);
           
            //remove already filtered
            SpecificationAttributeOptionFilterCollection alreadyFilteredOptions = getAlreadyFilteredSpecs();
            foreach (SpecificationAttributeOptionFilter saof1 in alreadyFilteredOptions)
            {
                var query = from s
                                in result
                            where s.SpecificationAttributeID == saof1.SpecificationAttributeID
                            select s;

                List<SpecificationAttributeOptionFilter> toRemove = query.ToList();

                foreach (SpecificationAttributeOptionFilter saof2 in toRemove)
                {
                    result.Remove(saof2);
                }
            }
            return result;
        }

        protected string[] getAlreadyFilteredSpecsQueryStringParams()
        {
            List<String> result = new List<string>();

            List<string> reservedQueryStringParamsSplitted = new List<string>();
            if (!String.IsNullOrEmpty(this.ReservedQueryStringParams))
            {
                reservedQueryStringParamsSplitted = this.ReservedQueryStringParams.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).ToList();
            }

            foreach (string qsp in Request.QueryString)
            {
                if (!String.IsNullOrEmpty(qsp))
                {
                    if (!reservedQueryStringParamsSplitted.Contains(qsp))
                    {
                        if (!result.Contains(qsp))
                            result.Add(qsp);
                    }
                }
            }
            return result.ToArray();
        }

        protected string excludeQueryStringParams(string url)
        {
            if (!String.IsNullOrEmpty(this.ExcludedQueryStringParams))
            {
                string[] excludedQueryStringParamsSplitted = this.ExcludedQueryStringParams.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                foreach (string exclude in excludedQueryStringParamsSplitted)
                {
                    url = CommonHelper.RemoveQueryString(url, exclude);
                }
            }

            return url;
        }

        private string lastSA = string.Empty;
        protected string addSpecificationAttribute()
        {
            //Get the data field value of interest for this row   
            string currentSA = Eval("SpecificationAttributeName").ToString();

            //See if there's been a change in value
            if (lastSA != currentSA)
            {
                lastSA = currentSA;
                return String.Format("<tr class=\"group\"><td>{0}</td></tr>", Server.HtmlEncode(currentSA));
            }
            else
            {
                return String.Empty;
            }
        }

        #endregion

        #region Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void rptFilterByPSO_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                SpecificationAttributeOptionFilter row = e.Item.DataItem as SpecificationAttributeOptionFilter;
                HyperLink lnkFilter = e.Item.FindControl("lnkFilter") as HyperLink;
                if (lnkFilter != null)
                {
                    string name = row.SpecificationAttributeName.Replace(" ", "");
                    string url = CommonHelper.ModifyQueryString(CommonHelper.GetThisPageURL(true), name + "=" + row.SpecificationAttributeOptionID, null);
                    url = excludeQueryStringParams(url);
                    lnkFilter.NavigateUrl = url;
                }
            }
        }

        protected void rptAlreadyFilteredPSO_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                SpecificationAttributeOptionFilter row = e.Item.DataItem as SpecificationAttributeOptionFilter;
            }
        }

        #endregion

        #region Methods
        public List<int> GetAlreadyFilteredSpecOptionIDs()
        {
            List<int> result = new List<int>();
            SpecificationAttributeOptionFilterCollection filterOptions = getAlreadyFilteredSpecs();
            foreach (SpecificationAttributeOptionFilter saof in filterOptions)
            {
                if (!result.Contains(saof.SpecificationAttributeOptionID))
                    result.Add(saof.SpecificationAttributeOptionID);
            }
            return result;
        }
        #endregion

        #region Properties
        public string ExcludedQueryStringParams
        {
            get
            {
                if (ViewState["ExcludedQueryStringParams"] == null)
                    return string.Empty;
                else
                    return (string)ViewState["ExcludedQueryStringParams"];
            }
            set
            {
                ViewState["ExcludedQueryStringParams"] = value;
            }
        }

        public string ReservedQueryStringParams
        {
            get
            {
                if (ViewState["ReservedQueryStringParams"] == null)
                    return string.Empty;
                else
                    return (string)ViewState["ReservedQueryStringParams"];
            }
            set
            {
                ViewState["ReservedQueryStringParams"] = value;
            }
        }

        /// <summary>
        /// Category identifier
        /// </summary>
        public int CategoryID
        {
            get
            {
                if (ViewState["CategoryID"] == null)
                    return 0;
                else
                    return (int)ViewState["CategoryID"];
            }
            set
            {
                ViewState["CategoryID"] = value;
            }
        }
        #endregion
    }
}