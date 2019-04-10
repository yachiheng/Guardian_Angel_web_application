using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class Login : System.Web.UI.Page
    {
        /*換資料庫的連結*/
       
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrow.Visible = false;
            lblPerro.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
            SqlCommand cmd = null;
            string pas = "";
            string sql = "SELECT U_id,U_password,U_fname FROM User_Data WHERE U_account ='" + txtEmail.Text + "'";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() == true)
            {
                pas = reader["U_password"].ToString();
                if (txtPassword.Text == pas)
                {
                    Session["Uid"] = reader["U_id"].ToString();
                    Session["Uname"] = reader["U_fname"].ToString();
                    Session["Uaccount"] = txtEmail.Text;
                    Server.Transfer("Homepage.aspx");
                }
                else
                {
                    lblPerro.Visible = true;
                }
            }
            else
            {
                lblErrow.Visible = true;               
            }
            reader.Close();
            conn.Close();
        }
    }
}