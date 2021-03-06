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
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.CustomerManagement;



namespace NopSolutions.NopCommerce.BusinessLogic.Game
{
    /// <summary>
    /// Represents a blog post
    /// </summary>
    public partial class CustomerResult : BaseEntity
    {
        #region Ctor
        /// <summary>
        /// Creates a new instance of the BlogPost class
        /// </summary>
        public CustomerResult()
        {
        }
        #endregion

        #region Properties

        public int CustomerResultID { get; set; }

        public int CustomerID { get; set; }

        public DateTime CompleteDate { get; set; }

        public bool IsCorrectAll { get; set; }

        public bool IsWinner { get; set; }
        
        #endregion 

        #region Custom Properties

        public Customer Customer
        {
            get
            {
                return CustomerManager.GetCustomerByID(CustomerID);
            }
        }
        #endregion
    }

}
