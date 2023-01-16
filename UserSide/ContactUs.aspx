<%@ Page Title="" Language="C#" MasterPageFile="~/UserSide/UserSideMaster.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="UserSide_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row mt-4">
            <div class="col-sm-8">
                <div class="contact-form">
                    <h2 class="title text-center">Get In Touch</h2>
                    
                    <div class="status alert alert-success" id="lblMsg" runat="server" style="display:none;"></div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Name" />
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Email" />
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <asp:TextBox runat="server" ID="txtSubject" CssClass="form-control" placeholder="Subject" />
                    </div>
                    <div class="form-group col-md-12">
                        <textarea runat="server" id="txtMessage" class="form-control" rows="8" placeholder="Your Message Here"></textarea>
                    </div>
                    <div class="form-group col-md-12">
                        <asp:Button Text="Submit" CssClass="btn btn-primary pull-right" ID="btnContactUs" OnClick="btnContactUs_Click"  runat="server" />
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-info">
                    <h2 class="title text-center">Contact Info</h2>
                    <address>
                        <p>E-Shopper Inc.</p>
                        <p>935 W. Webster Ave New Streets Chicago, IL 60614, NY</p>
                        <p>Newyork USA</p>
                        <p>Mobile: +2346 17 38 93</p>
                        <p>Fax: 1-714-252-0026</p>
                        <p>Email: info@e-shopper.com</p>
                    </address>
                    <div class="social-networks">
                        <h2 class="title text-center">Social Networking</h2>
                        <ul>
                            <li>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-youtube"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

