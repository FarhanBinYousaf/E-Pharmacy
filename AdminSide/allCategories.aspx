<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/adminMaster.master" AutoEventWireup="true" CodeFile="allCategories.aspx.cs" Inherits="AdminSide_allCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <asp:HyperLink NavigateUrl="~/AdminSide/CategoriesSetup.aspx" CssClass="btn btn-primary mb-3" Text="Add New Category" runat="server" />
            <asp:GridView runat="server" ID="GVCategories" HeaderStyle-CssClass="text-center border-2" HeaderStyle-Font-Size="X-Large" HeaderStyle-BorderColor="Black"  HeaderStyle-BackColor="black" HeaderStyle-ForeColor="White" AutoGenerateColumns="false" CssClass="table " OnRowEditing="GVCategories_RowEditing" OnRowDeleting="GVCategories_RowDeleting" OnRowCommand="GVCategories_RowCommand">
                <Columns>
                    <asp:BoundField DataField="CategoryName" HeaderText="Name" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton Text="Edit" CssClass="btn btn-success" CommandName="edit" CommandArgument='<%# Eval("CategoryID") %>' runat="server" />
                            <asp:LinkButton Text="Delete" CssClass="btn btn-danger" CommandName="delete" CommandArgument='<%# Eval("CategoryID") %>' runat="server" OnClientClick="return confirm('Are you sure want to delete?')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-4"></div>
    </div>
    <script>
        $(document).ready(function () {
            $('#ContentPlaceHolder1_GVCategories').DataTable();
        });
    </script>
</asp:Content>

