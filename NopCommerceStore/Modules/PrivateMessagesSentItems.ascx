<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.PrivateMessagesSentItemsControl"
    CodeBehind="PrivateMessagesSentItems.ascx.cs" %>
<div class="PrivateMessagesBox">
    <asp:GridView ID="gvSent" DataKeyNames="PrivateMessageID" runat="server" AllowPaging="True"
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="odsSent" GridLines="None"
        PageSize="10" SkinID="PrivateMessagesGrid">
        <Columns>
            <asp:TemplateField HeaderText="" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:CheckBox ID="cbSelect" runat="server" />
                    <asp:HiddenField ID="hfPrivateMessageID" runat="server" Value='<%# Eval("PrivateMessageID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<% $NopResources:PrivateMessages.Sent.ToColumn %>"
                ItemStyle-Width="20%">
                <ItemTemplate>
                    <%#GetToInfo(Convert.ToInt32(Eval("ToUserID")))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<% $NopResources:PrivateMessages.Sent.SubjectColumn %>"
                ItemStyle-Width="50%">
                <ItemTemplate>
                    <%#GetSubjectInfo(Container.DataItem as PrivateMessage)%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<% $NopResources:PrivateMessages.Sent.DateColumn %>"
                HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="25%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#DateTimeHelper.ConvertToUserTime((DateTime)Eval("CreatedOn")).ToString()%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div>
        <asp:ObjectDataSource ID="odsSent" runat="server" SelectMethod="GetCurrentUserSentPrivateMessages"
            EnablePaging="true" TypeName="NopSolutions.NopCommerce.Web.ForumHelper" StartRowIndexParameterName="StartIndex"
            MaximumRowsParameterName="PageSize" SelectCountMethod="GetCurrentUserSentPrivateMessagesCount">
        </asp:ObjectDataSource>
    </div>
    <div class="clear">
    </div>
    <div class="Button">
        <asp:Button runat="server" ID="btnDeleteSelected" Text="<% $NopResources:PrivateMessages.Sent.DeleteSelected %>"
            ValidationGroup="SentPrivateMessages" OnClick="btnDeleteSelected_Click" >
        </asp:Button>
    </div>
</div>
