using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagment.Forms
{
    public partial class Admin_Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["un"] == null || Session["un"].ToString() == "")
            {
                //lblUserName.Text = "No Data";
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblUsername.Text = Session["un"].ToString();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["un"] = "";
            Session.Abandon();//clear all session data
            Response.Redirect("Login.aspx");
        }

        protected void AdminBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("Booking_History.aspx");
        }
    }
}