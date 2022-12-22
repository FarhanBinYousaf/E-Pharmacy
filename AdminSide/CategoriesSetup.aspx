<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/adminMaster.master" AutoEventWireup="true" CodeFile="CategoriesSetup.aspx.cs" Inherits="AdminSide_CategoriesSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row mb-4">
        <div class="col-md-4 col-sm-6"></div>
        <div class="col-md-4 col-sm-6 mt-3">
            <div>
                <label for="name" class="form-label">Category Name</label>
                <asp:TextBox runat="server" ID="txtCatName" CssClass="form-control"  />
            </div>
            <div>
                <asp:Label ID="lblErrorMsg" ForeColor="Red" runat="server" />
            </div>
            <asp:Label ForeColor="Navy" ID="lblMsg" runat="server" /><br />
            <asp:Button Text="Add Category" CssClass="btn btn-primary mt-2" OnClick="btnAddCat_Click" ID="btnAddCat"  runat="server" />
            <asp:HyperLink NavigateUrl="~/AdminSide/allCategories.aspx" CssClass="btn btn-danger mt-2" Text="Cancel" runat="server" />
        </div>
        <div class="col-md-4 col-sm-6"></div>
    </div>
</asp:Content>

