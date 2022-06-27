<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="GridView.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Product Page</h1>
        </div>
        <asp:GridView ID="gvProducts" runat="server" 
            
            ShowFooter="true" ShowHeaderWhenEmpty="true"
            DataKeyNames="ProductId"
            OnRowCommand="gvProducts_RowCommand"
            OnRowEditing="gvProducts_RowEditing"
           OnRowUpdating="gvProducts_RowUpdating"
            OnRowCancelingEdit="gvProducts_RowCancelingEdit"
            OnRowDeleting="gvProducts_RowDeleting"
            AutoGenerateColumns ="false"

            BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
            <Columns>
                <asp:TemplateField HeaderText="Product Name">
                    <ItemTemplate>
                        <asp:Label  Text='<%#Eval("ProductName")%>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="textProductName" Text='<%# Eval("ProductName") %>' runat="server" />

                       
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="textProductNameFooter" Text='<%# Eval("ProductName") %>' runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Price">
                    <ItemTemplate>
                        <asp:Label  Text='<%# Eval("Price") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="textProductPrice" Text='<%# Eval("Price") %>' runat="server" />

                       
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="textProductPriceFooter" Text='<%# Eval("Price") %>' runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Description">
                    <ItemTemplate>
                        <asp:Label  Text='<%# Eval("ShortDescription") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="textProductShortDescription" Text='<%# Eval("ShortDescription") %>' runat="server" />

                       
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="textProductShortDescriptionFooter" Text='<%# Eval("ShortDescription") %>' runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Product Quantity">
                    <ItemTemplate>
                        <asp:Label  Text='<%# Eval("Quantity") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="textQuantity" Text='<%# Eval("Quantity") %>' runat="server" />

                       
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="textQuantityFooter" Text='<%# Eval("Quantity") %>' runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Amount">
                    <ItemTemplate>
                        <asp:Label  Text='<%# Eval("Amount") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="textAmount" Text='<%# Eval("Amount") %>' runat="server" />

                       
                    </EditItemTemplate>
                    <FooterTemplate>
                         <asp:TextBox ID="text" Text='<%# Eval("Amount") %>' runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                 
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                       <asp:ImageButton runat="server" ImageUrl="~/images/edit.png" CommandName="Edit" Width="30px" Height="25px"/>
                       <asp:ImageButton runat="server" ImageUrl="~/images/Delete.png" CommandName="Delete" Width="30px" Height="25px"/>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" ImageUrl="~/images/save.png" CommandName="Update" Width="30px" Height="25px"/>
                       <asp:ImageButton runat="server" ImageUrl="~/images/cancel.png" CommandName="Cancel" Width="30px" Height="25px"/>

                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton runat="server" ImageUrl="~/images/add.png" CommandName="AddNew" Width="30px" Height="25px"/>
                       
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br/>
        <asp:Label ID="lblSuccesMsg" Text="" runat="server" ForeColor="Green"/>
        <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="red"/>
    </form>
</body>
</html>
