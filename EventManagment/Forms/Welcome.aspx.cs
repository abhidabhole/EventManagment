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
    public partial class Welcome : System.Web.UI.Page
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

        protected void btnBook_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);


            string cmdStr = "SELECT BDATE, BVENUE FROM BOOKING WHERE BDATE = @BDATE AND BVENUE = @BVENUE;";

            SqlCommand cmd = new SqlCommand(cmdStr, conn);
            cmd.Parameters.AddWithValue("@BDATE", txtDate.Text);
            cmd.Parameters.AddWithValue("@BVENUE", DdHalls.SelectedValue);
            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows == false)
                {

                    string connstr = ConfigurationManager.ConnectionStrings["MyConn"].ConnectionString;
                    SqlConnection con = new SqlConnection(connstr);


                    string cmdstr = "INSERT INTO BOOKING(BNAME, BSERNAME, BEVENT, BDATE, BVENUE, BCID) VALUES(@BNAME, @BSERNAME, @BEVENT, @BDATE, @BVENUE, @BCID); ";
                    
                    SqlCommand cmmd = new SqlCommand(cmdstr, con);
                    cmmd.Parameters.AddWithValue("@BNAME", txtName.Text);
                    cmmd.Parameters.AddWithValue("@BSERNAME", txtSurname.Text);
                    cmmd.Parameters.AddWithValue("@BEVENT", txtEventname.Text);
                    cmmd.Parameters.AddWithValue("@BDATE", txtDate.Text);
                    cmmd.Parameters.AddWithValue("@BVENUE", DdHalls.SelectedValue);
                    cmmd.Parameters.AddWithValue("@BCID", Session["uid"].ToString());
                    try
                    {
                        con.Open();
                        if (cmmd.ExecuteNonQuery() <= 0)
                        {
                            lblMsg.Text = "Unable to Insert Data";
                            con.Close();
                            return;
                        }
                        lblMsg.CssClass = " text-success";
                        lblMsg.Text = "Congratulations! Your Venue is Booked Successfully";
                    }
                    catch (Exception ex)
                    {

                        lblMsg.Text = ex.Message;
                    }                   

                }
                else
                {
                    lblMsg.CssClass = "text-danger";
                    throw new ArgumentException("Sorry You Are Late! This Venue is Already Booked.");
                }
               

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

        protected void ViewBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBookings.aspx");
        }
    }
}