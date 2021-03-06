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
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Utils.Html;
using NopSolutions.NopCommerce.Common;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class ProductWriteReview : BaseNopUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                BindData();
        }

        protected void BindData()
        {
            pnlError.Visible = false;

            Product product = ProductManager.GetProductByID(ProductID);
            if (product != null && product.AllowCustomerReviews)
            {
                FillRatingDropDowns();
                if (NopContext.Current.User == null || NopContext.Current.User.IsGuest)
                {
                    lblLeaveYourReview.Text = GetLocaleResourceString("Products.OnlyRegisteredUsersCanWriteReviews");
                    txtProductReviewTitle.Enabled = false;
                    txtProductReviewText.Enabled = false;
                    btnReview.Enabled = false;
                }
                else
                {
                    lblLeaveYourReview.Text = string.Empty;
                    txtProductReviewTitle.Enabled = true;
                    txtProductReviewText.Enabled = true;
                    btnReview.Enabled = true;
                }
            }
            else
                this.Visible = false;
        }

        private void FillRatingDropDowns()
        {
            this.rblRating.Items.Clear();
            for (int i = 1; i <= 5; i++)
            {
                ListItem ddlRatingItem = new ListItem(string.Empty, i.ToString());
                this.rblRating.Items.Add(ddlRatingItem);
                if (i == 4)
                    ddlRatingItem.Selected = true;
            }
        }

        protected void btnReview_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    Product product = ProductManager.GetProductByID(this.ProductID);
                    if (product != null && product.AllowCustomerReviews)
                    {
                        if (NopContext.Current.User == null || NopContext.Current.User.IsGuest)
                        {
                            lblLeaveYourReview.Text = GetLocaleResourceString("Products.OnlyRegisteredUsersCanWriteReviews");
                            return;
                        }

                        string productReviewTitle = txtProductReviewTitle.Text.Trim();
                        string productReviewText = txtProductReviewText.Text.Trim();
                        if (String.IsNullOrEmpty(productReviewTitle))
                        {
                            throw new NopException(GetLocaleResourceString("Products.PleaseEnterReviewTitle"));
                        }
                        if (String.IsNullOrEmpty(productReviewText))
                        {
                            throw new NopException(GetLocaleResourceString("Products.PleaseEnterReviewText"));
                        }

                        int rating = 4;
                        if (rblRating.SelectedItem != null)
                            rating = int.Parse(rblRating.SelectedItem.Value);

                        ProductManager.InsertProductReview(product.ProductID, NopContext.Current.User.CustomerID,
                            productReviewTitle, productReviewText,
                            rating, 0, 0, false, DateTime.Now);
                        txtProductReviewTitle.Text = string.Empty;
                        txtProductReviewText.Text = string.Empty;
                        lblLeaveYourReview.Text = GetLocaleResourceString("Products.You'llSeeYourProductReviewAfterApprovingByStoreAdministrator");
                    }
                    else
                        Response.Redirect("~/Default.aspx");
                }
            }
            catch (Exception exc)
            {
                pnlError.Visible = true;
                lErrorMessage.Text = Server.HtmlEncode(exc.Message);
            }
        }

        public int ProductID
        {
            get
            {
                return CommonHelper.QueryStringInt("ProductID");
            }
        }
    }
}