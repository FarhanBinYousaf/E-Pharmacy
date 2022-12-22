<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/adminMaster.master" AutoEventWireup="true" CodeFile="AdminSetup.aspx.cs" Inherits="AdminSide_AdminSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row mb-4">
        <div class="col-md-4 col-sm-6"></div>
        <div class="col-md-4 col-sm-6 mt-3">
            <div>
                <label for="name" class="form-label">Name</label>
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control"  />
                <asp:RequiredFieldValidator ErrorMessage="Name is required" ControlToValidate="txtName" ForeColor="Red" runat="server" />
            </div>
            <div>
                <label for="email" class="form-label">Email</label>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"  />
                <asp:RequiredFieldValidator ErrorMessage="Email is required" ControlToValidate="txtEmail" ForeColor="Red" runat="server" />
            </div>
            <div>
                <label for="password" class="form-label">Password</label>
                <asp:TextBox runat="server" ID="txtPass" CssClass="form-control"  />
                <asp:RequiredFieldValidator ErrorMessage="Password is required" ControlToValidate="txtPass" ForeColor="Red" runat="server" />
            </div>
            <div>
                <label for="password" class="form-label">Confirm Password</label>
                <asp:TextBox runat="server" ID="txtConfirmPass" CssClass="form-control"  />
            </div>
            <div>
                <asp:Label ID="lblErrorMsg" ForeColor="Red" runat="server" />
            </div>
            <asp:Button Text="Make Admin" CssClass="btn btn-primary mt-2" ID="btnMakeAdmin" OnClick="btnMakeAdmin_Click" runat="server" />
            <asp:HyperLink NavigateUrl="~/AdminSide/allAdmins.aspx" Text="Cancel" CssClass="btn btn-danger mt-2" runat="server" />
        </div>
        <div class="col-md-4 col-sm-6"></div>
    </div>
</asp:Content>

