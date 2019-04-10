using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class MemPasUpd02 : System.Web.UI.Page
    {
        string initUid = ""; //字串 初始id Session用
        int initUidInt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Uid"] == null)
            {
                Server.Transfer("sign_in.aspx");
            }
            else
            {
                initUid = Session["Uid"].ToString();
                initUidInt = int.Parse(initUid);
            }
        }

        protected void lbtnSend_Click(object sender, EventArgs e)
        {
            if ((tbNewPass.Text == "")||(tbNewPassAga.Text == ""))
            {
                lblError.Text = "請輸入欲更改的新密碼*";
            }
            else
            {
                if (tbNewPass.Text != tbNewPassAga.Text)
                {
                    lblError.Text = "密碼不一致，請重新確認*";
                    tbNewPass.Text = "";
                    tbNewPassAga.Text = "";
                }
                else
                {
                    if ((tbNewPass.Text.Length < 8) || (tbNewPassAga.Text.Length < 8))
                    {
                        lblError.Text = "新密碼不得少於8碼，請重新確認*";
                        tbNewPass.Text = "";
                        tbNewPassAga.Text = "";
                    }
                    else
                    {
                        SqlDataSource sql = new SqlDataSource();
                        /*換資料庫的連結*/
                        sql.ConnectionString = @"Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
                        sql.InsertCommand = getInsertsql();
                        sql.Insert();
                        Session["passUpdSuccses"] = 1;
                        Server.Transfer("MemberArea.aspx");
                    }
                }
            }
        }
        private string getInsertsql()
        {
            string sql = "update User_Data set " +
                                    "U_password =" + "'" + tbNewPass.Text + "' " +
                                    "Where U_id =" + initUidInt;
            return sql;
        }
    }
}