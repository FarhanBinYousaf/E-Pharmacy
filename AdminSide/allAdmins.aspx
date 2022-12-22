<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/adminMaster.master" AutoEventWireup="true" CodeFile="allAdmins.aspx.cs" Inherits="AdminSide_allAdmins" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
               <asp:HyperLink NavigateUrl="~/AdminSide/AdminSetup.aspx" Text="Make New Admin" CssClass="btn btn-primary mb-5"  runat="server" />

            <div class="card border-0 shadow">
                <div class="card-body">
                    <asp:GridView runat="server" HeaderStyle-CssClass="text-center border-2" HeaderStyle-Font-Size="X-Large" HeaderStyle-BorderColor="Black"  HeaderStyle-BackColor="black" HeaderStyle-ForeColor="White" OnRowEditing="gvAdmins_RowEditing" OnRowDeleting="gvAdmins_RowDeleting" OnRowCommand="gvAdmins_RowCommand" CssClass="table table-centered mb-0 rounded " ID="gvAdmins" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="AdminName" HeaderText="Name" />
                            <asp:BoundField DataField="AdminEmail" HeaderText="Email" />
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate >
                                    <asp:LinkButton Text="Edit" CommandName="edit" CommandArgument='<%# Eval("AdminID") %>' CssClass="btn btn-primary" runat="server" />
                                    <asp:LinkButton Text="Delete" CommandName="delete" CommandArgument='<%# Eval("AdminID") %>' CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete this?')" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
</asp:Content>

