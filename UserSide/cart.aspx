<%@ Page Title="" Language="C#" MasterPageFile="~/UserSide/UserSideMaster.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="UserSide_cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6"> 
                <asp:HyperLink NavigateUrl="~/UserSide/ProductsList.aspx" Text="Continue Shopping" CssClass="btn btn-primary" runat="server" /> 
                <asp:GridView runat="server" ID="gvCartedItems" ShowHeaderWhenEmpty="true" CssClass="table table-condensed mt-3" BorderStyle="Solid" ShowFooter="true" AutoGenerateColumns="false" OnRowCommand="gvCartedItems_RowCommand">
                    <HeaderStyle BackColor="#FE980F" />
                    <FooterStyle  />
                    <Columns>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ImageUrl='<%# "~/AdminSide/ProductsImages/" + Eval("ProductImageName") %>' Width="100" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ProductName" HeaderText="Name" />
                        <asp:BoundField DataField="ProductPrice" DataFormatString="{0:C}" HeaderText="Price" />
                    </Columns>
                    <Columns>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton Text="Delete" CssClass="btn btn-danger" CommandName="delete_cartedItems" CommandArgument='<%# Eval("ID") %>'  runat="server" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <p>Total: <%= string.Format("{0:C}", price )%></p>
                                <asp:LinkButton Text="Proceed to Checkout" ID="btnChckOut" OnClick="btnChckOut_Click" CssClass="btn" BackColor="#FE980F"  runat="server" />
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
                    <%--<asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtFName" ForeColor="Red" runat="server" />--%>
                    <asp:Label Text="Last Name" runat="server" />
                    <asp:TextBox runat="server" ID="txtLName" CssClass="form-control" />
                    <%--<asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtLName" ForeColor="Red" runat="server" />--%>
                    <asp:Label Text="Email" runat="server" />
                    <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" />
                    <asp:RegularExpressionValidator runat="server" ID="Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Enter Valid Email" ForeColor="Red"></asp:RegularExpressionValidator><br />
                    <%--<asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtEmail" ForeColor="Red" runat="server" />--%>
                    <asp:Label Text="Phone No" runat="server" />
                    <asp:TextBox runat="server" ID="txtPhoneNo" CssClass="form-control" />
                    <%--<asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtPhoneNo" ForeColor="Red" runat="server" />--%>
                    <asp:Label Text="Shipping Address" runat="server" />
                    <asp:TextBox runat="server" ID="txtShippingAddress" CssClass="form-control" />
                    <%--<asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtShippingAddress" ForeColor="Red" runat="server" />--%>
                    <asp:Button Text="Confirm Order" CssClass="btn btn-warning mt-2 mb-3" OnClick="btnCnfirm_Click" ID="btnCnfirm" runat="server" />
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>

    </div>
</asp:Content>

