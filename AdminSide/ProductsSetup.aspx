<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/adminMaster.master" AutoEventWireup="true" CodeFile="ProductsSetup.aspx.cs" Inherits="AdminSide_ProductsSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <asp:Label Text="Name" runat="server" />
            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
            <asp:Label Text="Description" CssClass="form-label mt-2" runat="server" />
            <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control " />
            <asp:Label Text="Image" runat="server" />
            <asp:FileUpload runat="server" ID="ProductImage" CssClass="form-control"/>
            <asp:Label Text="Select Category" runat="server" />
            <asp:DropDownList runat="server" ID="ddlCategory" CssClass="form-select">
            </asp:DropDownList>
            <asp:Label Text="Select Company" runat="server" />
            <asp:DropDownList runat="server" ID="ddlCompany" CssClass="form-select">
                
            </asp:DropDownList>
            <asp:Label Text="MG" runat="server" />
            <asp:TextBox runat="server" ID="txtMG" CssClass="form-control" />
            <asp:Label Text="Quantity" runat="server" />
            <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control" />
            <asp:Label Text="Uses" runat="server" />
            <asp:TextBox runat="server" ID="txtUses" CssClass="form-control" />
            <asp:Label Text="Ingredients" runat="server" />
            <asp:TextBox runat="server" ID="txtIngredients" CssClass="form-control" />
            <asp:Label Text="Benefits" runat="server" />
            <asp:TextBox runat="server" ID="txtBenefits" CssClass="form-control" />
            <%--<asp:Label Text="Company" runat="server" />
            <asp:TextBox runat="server" ID="txtCompany" CssClass="form-control" />--%>
            <asp:Label Text="MFG Date" runat="server" />
            <asp:TextBox runat="server" ID="txtMFG" CssClass="form-control" />
            <asp:Label Text="Expiry Date" runat="server" />
            <asp:TextBox runat="server" ID="txtEXP"  CssClass="form-control" />
            <asp:Label Text="Format" runat="server" />
            <asp:TextBox runat="server" ID="txtFormat" CssClass="form-control" />
            <asp:Label Text="Side Effects" runat="server" />
            <asp:TextBox runat="server" ID="txtSideEffects" CssClass="form-control" />
            <asp:Label Text="Precautions" runat="server" />
            <asp:TextBox runat="server" ID="txtPrecautions" CssClass="form-control" />
            <asp:Label Text="Age Limit" runat="server" />
            <asp:TextBox runat="server" ID="txtAgeLimit" CssClass="form-control" />
            <asp:Label Text="Formula" runat="server" />
            <asp:TextBox runat="server" ID="txtFormula" CssClass="form-control" />
            <asp:Label Text="How to use?" runat="server" />
            <asp:TextBox runat="server" CssClass="form-control" ID="txtManipulation" />
            <asp:Label Text="Price" runat="server" />
            <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control" />
            <asp:Label ID="lblAddMsg" runat="server" /><br />
            <asp:Button Text="Add Product" CssClass="btn btn-primary mt-3 mb-3" ID="btnAddProduct" OnClick="btnAddProduct_Click" runat="server" />
            <asp:HyperLink NavigateUrl="~/AdminSide/ProductsSetup.aspx" CssClass="btn btn-danger mt-3 mb-3" Text="Cancel" runat="server" />
        </div>
        <div class="col-md-4"></div>
    </div>
    
</asp:Content>

