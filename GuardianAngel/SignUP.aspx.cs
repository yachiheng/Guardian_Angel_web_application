using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class SignUP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnSignUP_Click(object sender, EventArgs e)
        {
            SqlDataSource sql = new SqlDataSource();
            /*換資料庫的連結*/
            sql.ConnectionString = @"Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            sql.InsertCommand = getInsertsql();
            sql.Insert();
            Response.Write("<script>alert('註冊成功！');window.location='login.aspx';</script>");
            Server.Transfer("Login.aspx");
        }

        private string getInsertsql()
        {         
            string sql = "INSERT INTO User_Data(U_lname,U_fname,U_account,U_password,U_Phone)VALUES('" + 
                txtLname.Text + "','" + txtFname.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "','" + txtPhone.Text + "');";
            return sql;
        }


       
    }
}