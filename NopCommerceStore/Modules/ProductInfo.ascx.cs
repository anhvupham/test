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
using NopSolutions.NopCommerce.BusinessLogic.Media;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.SEO;

namespace NopSolutions.NopCommerce.Web.Modules
{
    public partial class ProductInfoControl : BaseNopUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                BindData();
        }

        protected void BindData()
        {
            Product product = ProductManager.GetProductByID(ProductID);
            if (product != null)
            {
                lProductName.Text = Server.HtmlEncode(product.Name);
                lShortDescription.Text = product.ShortDescription;
                lFullDescription.Text = product.FullDescription;
                lblProductCode.Text = GetLocaleResourceString("Media.Product.ProductCode") + " : " +
                                      product.ProductCode;
                lblProductCode.Visible = product.ProductCode != "" ? true : false;

                SEOHelper.RenderTitle(this.Page, product.Name, true, true);
                SEOHelper.RenderMetaTag(this.Page, "description", product.ShortDescription, true);
                SEOHelper.RenderMetaTag(this.Page, "keywords", product.ShortDescription, true);

                ProductPictureCollection productPictures = product.ProductPictures;
                if (productPictures.Count > 1)
                {
                    defaultImage.ImageUrl = PictureManager.GetPictureUrl(productPictures[0].PictureID, SettingManager.GetSettingValueInteger("Media.Product.DetailImageSize", 300));
                    defaultImage.ToolTip = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.Name);
                    defaultImage.AlternateText = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.Name);
                    lvProductPictures.DataSource = productPictures;
                    lvProductPictures.DataBind();
                }
                else if (productPictures.Count == 1)
                {
                    defaultImage.ImageUrl = PictureManager.GetPictureUrl(productPictures[0].PictureID, SettingManager.GetSettingValueInteger("Media.Product.DetailImageSize", 300));
                    defaultImage.ToolTip = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.Name);
                    defaultImage.AlternateText = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.Name);
                    lvProductPictures.Visible = false;
                }
                else
                {
                    defaultImage.ImageUrl = PictureManager.GetDefaultPictureUrl(SettingManager.GetSettingValueInteger("Media.Product.DetailImageSize", 300));
                    defaultImage.ToolTip = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.Name);
                    defaultImage.AlternateText = String.Format(GetLocaleResourceString("Media.Product.ImageAlternateTextFormat"), product.Name);
                    lvProductPictures.Visible = false;
                }
            }
            else
                this.Visible = false;
        }

        protected override void OnPreRender(EventArgs e)
        {
            string jquery = CommonHelper.GetStoreLocation() + "Scripts/jquery-1.3.2.min.js";
            Page.ClientScript.RegisterClientScriptInclude(jquery, jquery);

            string slimBox = CommonHelper.GetStoreLocation() + "Scripts/slimbox2.js";
            Page.ClientScript.RegisterClientScriptInclude(slimBox, slimBox);

            base.OnPreRender(e);
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