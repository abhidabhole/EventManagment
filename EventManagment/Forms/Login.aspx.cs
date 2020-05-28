using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace EventManagment.Forms
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            if (txtUsername.Text.ToString()=="Admin" && txtPassword.Text.ToString()=="Abhijeet@123")
            {
                Session["un"] = "Admin";
                Response.Redirect("Admin_Welcome.aspx");
            }

            lblMsg.CssClass = "text-denger";
            lblMsg.Text = "";
            if (string.IsNullOrWhiteSpace(txtUsername.Text) || string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblMsg.CssClass = "text-danger";
                lblMsg.Text = "Username and/or Password is Blank";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);


            string cmdStr = "SELECT CID, CUSERNAME, CPW FROM CUSTOMERS WHERE CUSERNAME = @CUSERNAME AND CPW = @CPW;";

            SqlCommand cmd = new SqlCommand(cmdStr, conn);
            cmd.Parameters.AddWithValue("@CUSERNAME", txtUsername.Text);
            cmd.Parameters.AddWithValue("@CPW", txtPassword.Text);
            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows == false)
                {
                    lblMsg.CssClass = "text-danger";
                    throw new ArgumentException("Invalid Username or Password");
                }
                reader.Read();
                if (chkRemember.Checked == true)
                {
                    HttpCookie cookie = new HttpCookie("logindata");
                    cookie["data"] = txtUsername.Text;
                    cookie.Expires = DateTime.Now.AddDays(15);
                    Response.Cookies.Add(cookie);
                }
                Session["un"] = txtUsername.Text;
                Session["uid"] = reader["CID"].ToString();
                Response.Redirect("Welcome.aspx");

            }
            catch (Exception ex)
            {

                lblMsg.Text = ex.Message;
            }
            finally
            {
                if (conn.State != System.Data.ConnectionState.Closed)
                {
                    conn.Close();
                }

            }
        }
    }
}