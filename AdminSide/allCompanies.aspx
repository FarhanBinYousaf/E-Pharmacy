<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/adminMaster.master" AutoEventWireup="true" CodeFile="allCompanies.aspx.cs" Inherits="AdminSide_allCompanies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <asp:HyperLink NavigateUrl="~/AdminSide/CategoriesSetup.aspx" Text="Add New Category" CssClass="btn btn-primary mb-3" runat="server" />
            <asp:GridView runat="server" ID="companyGV" HeaderStyle-CssClass="text-center border-2" HeaderStyle-Font-Size="X-Large" HeaderStyle-BorderColor="Black"  HeaderStyle-BackColor="black" HeaderStyle-ForeColor="White" CssClass="table " AutoGenerateColumns="false" OnRowEditing="companyGV_RowEditing" OnRowDeleting="companyGV_RowDeleting" OnRowCommand="companyGV_RowCommand">
                <Columns>
                    <asp:BoundField DataField="CompanyName" HeaderText="Name"  />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton Text="Edit" CssClass="btn btn-primary" runat="server" CommandName="edit" CommandArgument='<%# Eval("CompanyID") %>' />
                            <asp:LinkButton Text="Delete" CssClass="btn btn-danger" runat="server" CommandName="delete" CommandArgument='<%# Eval("CompanyID") %>' OnClientClick="return confirm('Are you sure you want to delete this?')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-4"></div>
    </div>
</asp:Content>

