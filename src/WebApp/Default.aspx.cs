using System;

namespace WebApp
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }
        
        private void LoadDashboardData()
        {
            try
            {
                // TODO: Load actual data from database
                lblTotalRecords.Text = "1,250";
                lblActiveRecords.Text = "1,142";
                lblTodayActivity.Text = "$45,230";
            }
            catch (Exception ex)
            {
                // Log error
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }
        
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}
