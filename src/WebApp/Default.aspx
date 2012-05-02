<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp._Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Inventory System</title>
    <link href="~/Styles/Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-header">
            <h1>Inventory System</h1>
            <p>Welcome to the system | <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click" ForeColor="White">Logout</asp:LinkButton></p>
        </div>
        <div class="content">
            <h2>Dashboard</h2>
            <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin: 20px 0;">
                <div style="padding: 20px; background: #f0f8ff; border: 1px solid #ccc;">
                    <h3>Total Transactions</h3>
                    <p style="font-size: 32px; margin: 0;"><asp:Label ID="lblTotalRecords" runat="server">0</asp:Label></p>
                </div>
                <div style="padding: 20px; background: #f0fff0; border: 1px solid #ccc;">
                    <h3>Active Transactions</h3>
                    <p style="font-size: 32px; margin: 0;"><asp:Label ID="lblActiveRecords" runat="server">0</asp:Label></p>
                </div>
                <div style="padding: 20px; background: #fff8f0; border: 1px solid #ccc;">
                    <h3>Today's Sales</h3>
                    <p style="font-size: 32px; margin: 0;"><asp:Label ID="lblTodayActivity" runat="server">0</asp:Label></p>
                </div>
            </div>
            <h3>Quick Links</h3>
            <ul>
                <li><asp:HyperLink ID="lnkMainPage" runat="server" NavigateUrl="~/MainPage.aspx">Sales Transactions</asp:HyperLink></li>
                <li><asp:HyperLink ID="lnkReports" runat="server" NavigateUrl="~/Reports.aspx">Reports</asp:HyperLink></li>
                <li><asp:HyperLink ID="lnkSettings" runat="server" NavigateUrl="~/Settings.aspx">Settings</asp:HyperLink></li>
            </ul>
        </div>
    </form>
</body>
</html>

