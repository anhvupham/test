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
using System.Text;



namespace NopSolutions.NopCommerce.DataAccess.Banner
{
    
    public partial class DBBanner : BaseDBEntity
    {
        #region Ctor

        public DBBanner()
        {
        }
        #endregion

        #region Properties

        public int BannerID { get; set; }

        public string BannerName { get; set; }

        public bool IsPublish { get; set; }

        public int PageID { get; set; }

        public int PictureID { get; set; }

        public string URL { get; set;  }

        public int Views { get; set; }

        public int Position { get; set; }
        
        #endregion 

        
    }

}
