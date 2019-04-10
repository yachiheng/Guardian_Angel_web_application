using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class EmergencyContact : System.Web.UI.Page
    {
        string initOid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["Oid"] = 1;
            if (Session["Oid"] != null)
            {
                initOid = Session["Oid"].ToString();
                SelDataECPri1();
                SelDataECPri2();
                SelDataECPri3();
            }
            else {
                Server.Transfer("Login.aspx");
            }
            if (Session["insSuc"] != null) {
                Response.Write("<script>alert('已新增緊急聯絡人');</script>");
                Session["insSuc"] = null;
            } else if (Session["updSuc"] != null) {
                Response.Write("<script>alert('修改資料成功!!');</script>");
                Session["updSuc"] = null;
            }
        }

        protected void btnCon1_Click(object sender, EventArgs e)
        {
            Session["Priority"] = 1;
            Session["insSuc"] = null;
            Session["updSuc"] = null;
            Server.Transfer("EmergencyContactUpdate.aspx");
        }

        protected void btnCon2_Click(object sender, EventArgs e)
        {
            Session["priority"] = 2;
            Session["insSuc"] = null;
            Session["updSuc"] = null;
            Server.Transfer("EmergencyContactUpdate.aspx");
        }

        protected void btnCon3_Click(object sender, EventArgs e)
        {
            Session["Priority"] = 3;
            Session["insSuc"] = null;
            Session["updSuc"] = null;
            Server.Transfer("EmergencyContactUpdate.aspx");
        }

        private void SelDataECPri1()
        {
            //sql指令  用O_id搜尋Emergency_contact的資料
            string sqlSelData = "select * from " +
                "Relationship as R " + "join " +
                "Emergency_Contact as E " +
                "on E.E_id = R.E_id where O_id = '" +
                initOid + "' and priority = 1";
            SqlConnection conn = new SqlConnection(
                "Data Source=yachiheng.database.windows.net;" +
                "Initial Catalog=Guardian_Angel-20190409084017;" +
                "Persist Security Info=False;" +
                "User ID=yachiheng;" +
                "Password=A2xuioiji;" +
                "MultipleActiveResultSets=False;" +
                "Encrypt=false;" +
                "TrustServerCertificate=False;" +
                "Connection Timeout=30");
            conn.Open();  //開啟連結資料庫
            SqlCommand cmd1 = new SqlCommand(sqlSelData, conn);  //命令內容
            SqlDataReader reader1 = cmd1.ExecuteReader();  //reader執行sql命令

            if (reader1.Read() == true)
            {
                tbConNam1.Text = "姓名:"+reader1["E_name"].ToString();
                tbConPho1.Text = "電話:"+reader1["E_phone"].ToString();
            }//如果讀入
            conn.Close();  //關閉連結資料庫

        }//(方法)從EC資料表檢索層級1的資料

        private void SelDataECPri2() {
            //sql指令  用O_id搜尋Emergency_contact的資料
            string sqlSelData = "select * from " +
                "Relationship as R " + "join " +
                "Emergency_Contact as E " +
                "on E.E_id = R.E_id where O_id = '" +
                initOid + "' and priority = 2";
            SqlConnection conn = new SqlConnection(
                "Data Source=yachiheng.database.windows.net;" +
                "Initial Catalog=Guardian_Angel-20190409084017;" +
                "Persist Security Info=False;" +
                "User ID=yachiheng;" +
                "Password=A2xuioiji;" +
                "MultipleActiveResultSets=False;" +
                "Encrypt=false;" +
                "TrustServerCertificate=False;" +
                "Connection Timeout=30");
            conn.Open();  //開啟連結資料庫
            SqlCommand cmd1 = new SqlCommand(sqlSelData, conn);  //命令內容
            SqlDataReader reader1 = cmd1.ExecuteReader();  //reader執行sql命令

            if (reader1.Read() == true)
            {
                tbConNam2.Text = "姓名:" + reader1["E_name"].ToString();
                tbConPho2.Text = "電話:" + reader1["E_phone"].ToString();
            }//如果讀入
            conn.Close();  //關閉連結資料庫
        }//(方法)從EC資料表檢索層級2的資料

        private void SelDataECPri3() {
            //sql指令  用O_id搜尋Emergency_contact的資料
            string sqlSelData = "select * from " +
                "Relationship as R " + "join " +
                "Emergency_Contact as E " +
                "on E.E_id = R.E_id where O_id = '" +
                initOid + "' and priority = 3";
            SqlConnection conn = new SqlConnection(
                "Data Source=40.74.140.54;" +
                "Initial Catalog=Guardian_Angel-20190409084017;" +
                "Persist Security Info=False;" +
                "User ID=yachiheng;" +
                "Password=A2xuioiji;" +
                "MultipleActiveResultSets=False;" +
                "Encrypt=false;" +
                "TrustServerCertificate=False;" +
                "Connection Timeout=30");
            conn.Open();  //開啟連結資料庫
            SqlCommand cmd1 = new SqlCommand(sqlSelData, conn);  //命令內容
            SqlDataReader reader1 = cmd1.ExecuteReader();  //reader執行sql命令

            if (reader1.Read() == true)
            {
                tbConNam3.Text = "姓名:" + reader1["E_name"].ToString();
                tbConPho3.Text = "電話:" + reader1["E_phone"].ToString();
            }//如果讀入
            conn.Close();  //關閉連結資料庫
        }//(方法)從EC資料表檢索層級3的資料

    }
}