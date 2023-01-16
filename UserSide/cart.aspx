<%@ Page Title="" Language="C#" MasterPageFile="~/UserSide/UserSideMaster.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="UserSide_cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">  
                <asp:GridView runat="server" ID="gvCartedItems" CssClass="table table-condensed mt-3" BorderStyle="Solid" ShowFooter="true" AutoGenerateColumns="false">
                    <HeaderStyle BackColor="#FE980F" />
                    <FooterStyle  />
                    <Columns>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ImageUrl='<%# "~/AdminSide/ProductsImages/" + Eval("ProductImageName") %>' Width="100" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ProductName" HeaderText="Name" />
                        <asp:BoundField DataField="ProductPrice" HeaderText="Price" />
                    </Columns>
                    <Columns>
                        <asp:TemplateField>
                            <FooterTemplate>
                                <p>Total: <%= price %></p>
                                <asp:LinkButton Text="Checkout" ID="btnChckOut" OnClick="btnChckOut_Click" CssClass="btn" BackColor="#FE980F"  runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lblOrdrCmplt" ForeColor="#0066ff" CssClass="mb-3" runat="server" />
                <div id="CnfrmOrderForm" runat="server" style="visibility:hidden;">
                    <div>
                        <h4 class="p-2" style="border-radius:5px; background-color:#FE980F;">Get your products at your own address</h4>
                    </div>
                    <asp:Label Text="First Name" runat="server" />
                    <asp:TextBox runat="server" ID="txtFName" CssClass="form-control" />
                    <asp:Label Text="Last Name" runat="server" />
                    <asp:TextBox runat="server" ID="txtLName" CssClass="form-control" />
                    <asp:Label Text="Email" runat="server" />
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                    <asp:Label Text="Phone No" runat="server" />
                    <asp:TextBox runat="server" ID="txtPhoneNo" CssClass="form-control" />
                    <asp:Label Text="Shipping Address" runat="server" />
                    <asp:TextBox runat="server" ID="txtShippingAddress" CssClass="form-control" />
                    <asp:Button Text="Confirm Order" CssClass="btn btn-success mt-2 mb-3" OnClick="btnCnfirm_Click" ID="btnCnfirm" runat="server" />
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>

    </div>
</asp:Content>

