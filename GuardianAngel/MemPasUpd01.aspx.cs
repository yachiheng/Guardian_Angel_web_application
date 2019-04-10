using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class MemPasUpd01 : System.Web.UI.Page
    {
        string initUid = ""; //字串 初始id Session用
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Uid"] == null)
            {
                Server.Transfer("Login.aspx");
            }
            else
            {
                initUid = Session["Uid"].ToString();
            }
        }

        protected void lbtnSend_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
            string sql = "select U_password " + "from User_Data where U_id =" + initUid;  //sds.指令設定
            conn.Open();  //開啟連結資料庫
            SqlCommand cmd = new SqlCommand(sql, conn);  //命令內容
            SqlDataReader reader = cmd.ExecuteReader();  //reader執行sql命令
            if (reader.Read() == true)  //如果讀入
            {
                string password = reader["U_password"].ToString();
                if (password == tbPassword.Text)
                {
                    Server.Transfer("MemPasUpd02.aspx");
                }
                else
                {
                    lblPassError.Text = "密碼錯誤，請確認後重新輸入*";
                }
            }
        }
    }
}