<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordHashing.aspx.cs" Inherits="PasswordHashing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" /><br />
        <asp:Button Text="Encrypt" ID="btnEncrypt"  OnClick="btnEncrypt_Click"  runat="server" />
    </div>
    </form>
</body>
</html>
