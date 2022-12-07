<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" ></script>
</head>
<body class="img js-fullheight" style="background-image: url(images/bg.jpg); background-repeat:no-repeat;">
     <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">Admin Side</h2>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <%--<div class="alert alert-warning alert-dismissible fade show" runat="server" id="alrt" role="alert">
                        <strong></strong>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>--%>
                    
                    <asp:Label ID="lbError" ForeColor="red" runat="server" />
                    <div class="login-wrap p-0">
                        <form class="signin-form" runat="server">
                            <div class="form-group">
                                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Email" required="" />
                            </div>
                            <div class="form-group">
                                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Password" required="" />
                                <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <asp:Button Text="Login" ID="btnLogin" OnClick="btnLogin_Click" CssClass="form-control btn submit px-3" style="background-color: navy;" runat="server" />
                            </div>
                            <div class="form-group d-md-flex">
                                <%-- <div class="w-100">
                                    <p>Don't have an account? <a href="#">content</a>  </p>
                                </div>--%>
                                <%--<div class="w-0 text-md-right">
                                    <a href="#" style="color: #fff">Forgot Password? </a>
                                </div>--%>
                            </div>
                        </form>
                        <%--<p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
                        <div class="d-flex text-center">
                            <a href="#" style="color: white;"><i class="fa fa-facebook fa-3x mr-2" aria-hidden="true" style="background-color: #4267B2; border-radius: 5px; width: 50px; height: 46px; line-height: 46px; font-size: 32px;"></i></a>
                            <a href="#" style="color: white;"><i class="fa fa-twitter fa-3x mr-2" aria-hidden="true" style="background-color: #00acee; border-radius: 5px; width: 50px; height: 46px; line-height: 46px; font-size: 32px;"></i></a>
                            <a href="#" style="color: white;"><i class="fa fa-google fa-3x mr-2" aria-hidden="true" style="background-color: #F4B400; border-radius: 5px; width: 50px; height: 46px; line-height: 46px; font-size: 32px;"></i></a>

                        </div>--%>
                         <%--<h6 class="mb-4 text-center" style="color: white;">Dont' have an account? <a href="Register_user.aspx" style="color: navy;">Sign Up</a></h6>--%>

                    </div>
                </div>
            </div>
        </div>
    </section>
  <script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
</body>
</html>
