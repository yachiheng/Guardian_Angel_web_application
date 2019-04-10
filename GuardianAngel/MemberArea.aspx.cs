using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class MemberData : System.Web.UI.Page
    {

        string initUid = ""; //字串 初始使用者id Session用
        
        string Star = "*"; //隱藏密碼與電話用的*字號
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Uid"] == null)
            {
                Server.Transfer("Login.aspx");
            } 
            else
            {
                initUid = Session["Uid"].ToString();
                if (Session["passUpdSuccses"] != null)
                {
                    Session["passUpdSuccses"] = null;
                    passUpdLoad();
                }
                else if (Session["MemberAreaUpdate"] != null)
                {
                    MemberAreaUpdateLoad();
                    Session["MemberAreaUpdate"] = null;
                }
            }
            if (!IsPostBack)
            {
                sqlLoad();
            }
        }

        protected void passUpdLoad()
        {

            Response.Write("<Script language='JavaScript'>alert('修改密碼成功!');</Script>");
        }
        protected void MemberAreaUpdateLoad()
        {

            Response.Write("<Script language='JavaScript'>alert('修改會員資料成功!');</Script>");
        }

        protected void sqlLoad()
        {
            SqlConnection conn = new SqlConnection(
                "Data Source=yachiheng.database.windows.net;" +
                " Initial Catalog=Guardian_Angel-20190409084017;" + 
                "Persist Security Info=False;"+
                "User ID=yachiheng;"+
                "Password=A2xuioiji;MultipleActiveResultSets=False;"+
                "Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");

            string sql = "select U_id,U_lname, U_fname, U_password, U_account, U_Phone,U_address,U_organization " +
                            "from User_Data where U_id =" + initUid;  //sds.指令設定
            conn.Open();  //開啟連結資料庫
            SqlCommand cmd = new SqlCommand(sql, conn);  //命令內容
            SqlDataReader reader = cmd.ExecuteReader();  //reader執行sql命令
            if (reader.Read() == true)  //如果讀入
            {
                string lname = reader["U_lname"].ToString();
                lblLname.Text = lname.ToString();
                string fname = reader["U_fname"].ToString();
                lblFname.Text = fname.ToString();

                //密碼隱藏
                string password = reader["U_password"].ToString();
                string pasSub="";
                for (int i=3;i<password.Length;i++)
                {
                   pasSub = pasSub + Star;
                }
                string newPass = password.Substring(0,3); //從第"0"+1個字元開始，3個字元
                lblPassword.Text =newPass.ToString()+ pasSub;

                string account = reader["U_account"].ToString();
                lblEmail.Text = account.ToString();

                //電話隱藏
                string phone = reader["U_Phone"].ToString();
                string phSub = "";
                for (int i=3;i<phone.Length;i++)
                {
                    phSub = phSub + Star;
                }
                string newPh = phone.Substring(phone.Length-3);
               

                lblPhone.Text = phSub + newPh.ToString();

                string address = reader["U_address"].ToString();
                lblAddress.Text = address.ToString();
                string organization = reader["U_organization"].ToString();
                lblNaOfAs.Text = organization.ToString();
            }

        }
    }
}