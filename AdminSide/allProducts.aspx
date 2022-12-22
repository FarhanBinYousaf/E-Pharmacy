<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/adminMaster.master" AutoEventWireup="true" CodeFile="allProducts.aspx.cs" Inherits="AdminSide_allProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:HyperLink NavigateUrl="~/AdminSide/ProductsSetup.aspx" CssClass="btn btn-primary mb-3" Text="Add New Product" runat="server" />
            <asp:GridView runat="server" HeaderStyle-CssClass="text-center border-2" HeaderStyle-Font-Size="X-Large" HeaderStyle-BorderColor="Black"  HeaderStyle-BackColor="black" HeaderStyle-ForeColor="White" CssClass="table" ID="productsGV" OnRowEditing="productsGV_RowEditing" OnRowDeleting="productsGV_RowDeleting" OnRowCommand="productsGV_RowCommand" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Name" />
                    <asp:BoundField DataField="ProductPrice" HeaderText="Price" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                    <asp:BoundField DataField="ProductFormat" HeaderText="Format" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ImageUrl='<%#"ProductsImages/"+ Eval("ProductImageName") %>' Width="50px" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton Text="Edit" CommandName="edit" CommandArgument='<%# Eval("ProductID") %>' CssClass="btn btn-primary" runat="server" />
                            <asp:LinkButton Text="Delete" CommandName="delete" CommandArgument='<%# Eval("ProductID") %>' CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete?')" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-3"></div>
    </div>
    <script>
        $(document).ready(function () {
            $('#ContentPlaceHolder1_productsGV').DataTable();
        });
    </script>
</asp:Content>

