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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);


            string cmdStr = "INSERT INTO CUSTOMERS(CUSERNAME, CPW, CMOB, CADDRESS) VALUES(@CUSERNAME, @CPW, @CMOB, ";
            if (string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                cmdStr = cmdStr + "NULL);";
            }
            else
            {
                cmdStr = cmdStr + "'"+ txtAddress.Text + "');";
            }

            SqlCommand cmd = new SqlCommand(cmdStr, conn);
            cmd.Parameters.AddWithValue("@CUSERNAME", txtName.Text);
            cmd.Parameters.AddWithValue("@CPW", txtCPassword.Text);
            cmd.Parameters.AddWithValue("@CMOB", txtMob.Text);

            try
            {
                conn.Open();
                if (cmd.ExecuteNonQuery() <= 0)
                {
                    lblMsg.Text = "Unable to Insert Data";
                    conn.Close();
                    return;
                }
                lblMsg.CssClass = " text-success";
                lblMsg.Text = "Registration Successful ";
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