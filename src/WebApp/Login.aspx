<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApp.Login" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login - Inventory System</title>
    <link href="~/Styles/Site.css" rel="stylesheet" />
    <style>
        .login-container {
            width: 400px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            border: 1px solid #ddd;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .login-header {
            text-align: center;
            margin-bottom: 30px;
            color: #003366;
        }
        .login-field {
            margin-bottom: 15px;
        }
        .login-field label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .login-field input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .login-button {
            width: 100%;
            padding: 10px;
            background-color: #003366;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        .login-button:hover {
            background-color: #005599;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-header">
                <h2>Inventory System</h2>
                <p>Please login to continue</p>
            </div>
            <div class="login-field">
                <label>Username:</label>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </div>
            <div class="login-field">
                <label>Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="login-field">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-button" OnClick="btnLogin_Click" />
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="message error" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>

