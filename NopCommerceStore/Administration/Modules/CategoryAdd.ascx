<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.CategoryAddControl"
    CodeBehind="CategoryAdd.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="CategoryInfo" Src="CategoryInfo.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-catalog.png" alt="<%=GetLocaleResourceString("Admin.CategoryAdd.AddNewCategory")%>" />
        <%=GetLocaleResourceString("Admin.CategoryAdd.AddNewCategory")%>
        <a href="Categories.aspx" title="<%=GetLocaleResourceString("Admin.CategoryAdd.BackToCategoryList")%>">
            (<%=GetLocaleResourceString("Admin.CategoryAdd.BackToCategoryList")%>)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" Text="<% $NopResources:Admin.CategoryAdd.SaveButton.Text %>"
            CssClass="adminButtonBlue" OnClick="SaveButton_Click" ToolTip="<% $NopResources:Admin.CategoryAdd.SaveButton.ToolTip %>" />
    </div>
</div>
<ajaxToolkit:TabContainer runat="server" ID="CategoryTabs" ActiveTabIndex="0">
    <ajaxToolkit:TabPanel runat="server" ID="pnlCategoryInfo" HeaderText="<% $NopResources:Admin.CategoryAdd.CategoryInfo %>">
        <ContentTemplate>
            <nopCommerce:CategoryInfo ID="ctrlCategoryInfo" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
</ajaxToolkit:TabContainer>