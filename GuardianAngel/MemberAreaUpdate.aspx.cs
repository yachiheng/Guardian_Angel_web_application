using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class MemberAreaUpdate : System.Web.UI.Page
    {
        
        string initUid = ""; //字串 初始id Session用
        string Star = "*"; //隱藏密碼與電話用的*字號
        int initUidInt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Uid"] == null)
            {
                Server.Transfer("Login.aspx");//Session Uid為null 跳轉回登入頁面
            }
            else
            {
                initUid = Session["Uid"].ToString();
                initUidInt = int.Parse(initUid);
            }

            if (!IsPostBack)
            {
                sqlLoad();
            }
        }

        protected void sqlLoad()
        {
            SqlConnection conn = new SqlConnection(
                "Data Source=yachiheng.database.windows.net;" +
                " Initial Catalog=Guardian_Angel-20190409084017;"+
                "Persist Security Info=False;"+
                "User ID=yachiheng;"+
                "Password=A2xuioiji;"+
                "MultipleActiveResultSets=False;"+
                "Encrypt=false;"+
                "TrustServerCertificate=False;"+
                "Connection Timeout=30");
            string sql = "select U_id,U_lname, U_fname, U_account, U_Phone,U_address,U_organization " +
                            "from User_Data where U_id =" + initUid;  //sds.指令設定
            conn.Open();  //開啟連結資料庫
            SqlCommand cmd = new SqlCommand(sql, conn);  //命令內容
            SqlDataReader reader = cmd.ExecuteReader();  //reader執行sql命令
            if (reader.Read() == true)  //如果讀入
            {
                string lname = reader["U_lname"].ToString();
                tbLname.Text = lname.ToString();
                string fname = reader["U_fname"].ToString();
                tbFname.Text = fname.ToString();
                string email = reader["U_account"].ToString();
                tbEmail.Text = email.ToString();
                string phone = reader["U_Phone"].ToString();
                tbPhone.Text = phone.ToString();
                string address = reader["U_address"].ToString();
                tbAddress.Text = address.ToString();
                string organization = reader["U_organization"].ToString();
                tbOrganization.Text = organization.ToString();
                conn.Close();
            }
        }

        protected void lbtnSend_Click(object sender, EventArgs e)
        {
            SqlDataSource sql = new SqlDataSource();
            /*換資料庫的連結*/
            sql.ConnectionString = @"Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            sql.InsertCommand = getInsertsql();
            sql.Insert();
            Session["MemberAreaUpdate"]= 1;
            Server.Transfer("MemberArea.aspx");
        }

        private string getInsertsql()
        {
            string sql = "update User_Data set " +
                                    "U_fname =" + "'" + tbFname.Text + "'," +
                                    "U_lname =" +"'" + tbLname.Text + "',"+                                    
                                    "U_Phone =" + "'" + tbPhone.Text + "'," +
                                    "U_address =" + "'" + tbAddress.Text + "' " +
                                    "Where U_id ="+ initUidInt;
            return sql;
        }

        protected void lbtnCancel_Click(object sender, EventArgs e)
        {
            Server.Transfer("MemberArea.aspx");
        }
    }
}