using System;
using System.Web.Security;

namespace WebApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.IsAuthenticated)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
        }
        
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;
            
            // Simple authentication (replace with actual authentication)
            if (ValidateUser(username, password))
            {
                FormsAuthentication.RedirectFromLoginPage(username, false);
            }
            else
            {
                lblMessage.Text = "Invalid username or password";
                lblMessage.Visible = true;
            }
        }
        
        private bool ValidateUser(string username, string password)
        {
            // TODO: Implement actual authentication against database
            // For demo purposes, accept admin/admin123
            return (username == "admin" && password == "admin123");
        }
    }
}
