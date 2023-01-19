<%@ Page Title="" Language="C#" MasterPageFile="~/UserSide/UserSideMaster.master" AutoEventWireup="true" CodeFile="ProductsList.aspx.cs" Inherits="UserSide_ProductsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row mt-4">
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                <div class="card mt-2" style="width: 14rem;background-color:#FE980F">
                    <asp:GridView runat="server" ID="gvCategories" CssClass="border-0" AutoGenerateColumns="false" OnRowCommand="gvCategories_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Categories" HeaderStyle-Font-Size="Large" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <ul class="list-group" style="width:14rem;padding-right:4px;">
                                        <li class="list-group-item">
                                            <asp:LinkButton Text='<%# Eval("CategoryName") %>' CssClass="text-decoration-none mb-0" CommandName="showProducts" CommandArgument='<%# Eval("CategoryID") %>' runat="server" />
                                        </li>
                                    </ul>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="col-xs-12 col-md-9 col-lg-9">
                <div class="row">
                    <h2 class="title text-center">Featured Products</h2>
                    <asp:Label ID="lblAddToCart" ForeColor="#0066ff" CssClass="mb-3" runat="server" />
                    <asp:ListView runat="server" ID="lvProducts" OnItemCommand="lvProducts_ItemCommand" >
                        <ItemTemplate>
                            <div class="col-xs-12 col-sm-6 col-md-4">
                                <div class="card mt-2 mb-3" style="width: 14rem; height: 16rem;">
                                    <asp:Image ImageUrl='<%# "../AdminSide/ProductsImages/" + Eval("ProductImageName") %>' Width="220" Height="150" runat="server" />                                   
                                    <div class="card-body" style="background-color:navy;color:white;">
                                        <h6 class="card-title"><%# Eval("ProductName") %></h6>
                                        <p class="card-text"><%# string.Format("{0:C}", Eval("ProductPrice")) %></p>
                                    </div>
                                    <asp:LinkButton Text="Add to cart" CssClass="btn" BackColor="#FE980F" CommandName="addToCart" CommandArgument='<%# Eval("ProductID") %>' ID="btnAddtoCart" runat="server"><i class="fa-solid fa-cart-shopping"></i>&nbsp;Add to cart </asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

