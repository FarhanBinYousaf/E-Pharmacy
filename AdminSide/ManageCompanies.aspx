<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/adminMaster.master" AutoEventWireup="true" CodeFile="ManageCompanies.aspx.cs" Inherits="AdminSide_ManageCompanies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row mb-4">
        <div class="col-md-4 col-sm-6"></div>
        <div class="col-md-4 col-sm-6 mt-3">
            <div>
                <label for="name" class="form-label">Company Name</label>
                <asp:TextBox runat="server" ID="txtCompanyName" CssClass="form-control"  />
            </div>
            <asp:Label ID="lblMsg" ForeColor="Cyan" runat="server" /><br />
            <asp:Button Text="Add Company" CssClass="btn btn-primary mt-3" ID="btnCompany" runat="server" OnClick="btnCompany_Click" />
            <asp:HyperLink NavigateUrl="#" CssClass="btn btn-danger mt-3" Text="Cancel" runat="server" />
        </div>
        <div class="col-md-4 col-sm-6"></div>
    </div>
</asp:Content>

