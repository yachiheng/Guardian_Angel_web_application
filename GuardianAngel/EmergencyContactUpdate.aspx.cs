using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class EmergencyContactUpdate : System.Web.UI.Page
    {
        string initOid="";
        string initEid = "";
        int initEidint = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["Oid"] = 1;
            judgeOid();// 判斷是否有Oid
            judgePriority();// 判斷是否有priority，若有判斷等級

            if (!IsPostBack)
            {
                SelDataEC();// 從EC資料表檢索資料
            }
            //initEid = Session["Eid"].ToString();
            //Response.Write("<script>console.log('"+ initEid + "');</script>");


        }//進入網頁時執行的內容

        private void judgeOid() {
            if (Session["Oid"] == null) {
                Server.Transfer("GaCare_Update.aspx");
            }
            else {
                initOid = Session["Oid"].ToString();
            }
        }//(方法) 判斷Oid

        private void judgePriority() {            
            if (Session["Priority"] == null)
            {
                Server.Transfer("EmergencyContact.aspx");                
            }
            else
            {
                Session["newPriority"] = Session["Priority"].ToString();
            }
        }//(方法) 判斷priority等級

        private void SelDataEC() {
            int priorityInt = Convert.ToInt32(Session["newPriority"].ToString());
            //sql指令  用O_id搜尋Emergency_contact的E_id
            string sqlSelData = "select * from Relationship as R "+
                "join Emergency_Contact as E on E.E_id = R.E_id where O_id = '"+
                initOid + "' and priority = '"+ priorityInt + "'";
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
            SqlCommand cmd = new SqlCommand(sqlSelData, conn);  //命令內容
            SqlDataReader reader = cmd.ExecuteReader();  //reader執行sql命令

            if (reader.Read() == true)
            {
                initEid = reader["E_id"].ToString();
                Session["Eid"] = reader["E_id"].ToString();
                tbName.Text = reader["E_name"].ToString();
                tbPhone.Text = reader["E_phone"].ToString();
                tbEmail.Text = reader["E_email"].ToString();
                tbRelationship.Text = reader["relationship"].ToString();
                Session["change"] = 1;
            }//如果讀入
            else {
                Session["change"] = 2;
            }//如果沒讀入，給session

            conn.Close();  //關閉連結資料庫
            
        }//(方法)從EC資料表檢索資料

        //新增資料相關
        private void InsertEC()
        {
            int priorityInt = Convert.ToInt32(Session["newPriority"].ToString());
            //sql指令  資料存入Emergency_contact資料庫的指令碼
            string sqlInsertEC = "insert into Emergency_Contact" +
                "(E_name,E_phone,E_email,priority)values('" +
                tbName.Text + "', '" +
                tbPhone.Text + "', '" +
                tbEmail.Text + "', '" +
                priorityInt + "')";
            SqlDataSource sql = new SqlDataSource();
            //選擇連結的資料庫
            sql.ConnectionString =
                @"Data Source=yachiheng.database.windows.net;" +
                "Initial Catalog=Guardian_Angel-20190409084017;" +
                "Persist Security Info=False;" +
                "User ID=yachiheng;" +
                "Password=A2xuioiji;" +
                "MultipleActiveResultSets=False;" +
                "Encrypt=false;" +
                "TrustServerCertificate=False;" +
                "Connection Timeout=30";
            //要輸入的sql指令(存入名字電話信箱，之後查詢Eid)
            sql.InsertCommand = sqlInsertEC;
            //執行輸入
            sql.Insert();
        }//(方法)新增資料進EC資料表

        private void selectECsEid() {
            string strSelECsEid = "select max([E_id]) as E_id from Emergency_Contact";
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
            SqlCommand cmd = new SqlCommand(strSelECsEid, conn);  //命令內容
            SqlDataReader reader = cmd.ExecuteReader();  //reader執行sql命令
            if (reader.Read() == true)
            {
                initEid = reader["E_id"].ToString();
            }//如果讀入
        }//(方法)從EC資料表檢索最新一筆資料的E_id

        private void InsertRS()
        {
            //sql指令  資料存入Emergency_contact資料庫的指令碼
            string sqlInsertRS = "insert into Relationship(O_id,E_id,relationship)values('"+
                initOid+"', '"+
                initEid+"', '"+
                tbRelationship.Text+"')";
            SqlDataSource sql = new SqlDataSource();
            //選擇連結的資料庫
            sql.ConnectionString =
                @"Data Source=yachiheng.database.windows.net;" +
                "Initial Catalog=Guardian_Angel-20190409084017;" +
                "Persist Security Info=False;" +
                "User ID=yachiheng;" +
                "Password=A2xuioiji;" +
                "MultipleActiveResultSets=False;" +
                "Encrypt=false;" +
                "TrustServerCertificate=False;" +
                "Connection Timeout=30";
            //要輸入的sql指令(存入名字電話信箱，之後查詢Eid)
            sql.InsertCommand = sqlInsertRS;
            //執行輸入
            sql.Insert();
        }//(方法)新增資料進RS資料表

        //修改資料相關
        private void UpdateEC() {
            initEidint = Convert.ToInt32(Session["Eid"].ToString());
            //修改sql字串
            string sqlUpdateEC = "update Emergency_Contact set " +
                "E_name='" + tbName.Text +
                "', E_phone='" + tbPhone.Text +
                "',E_email='" + tbEmail.Text +
                "' where E_id = " + initEidint;

            SqlDataSource sql = new SqlDataSource();
            //選擇連結的資料庫
            sql.ConnectionString =
                @"Data Source=yachiheng.database.windows.net;" +
                "Initial Catalog=Guardian_Angel-20190409084017;" +
                "Persist Security Info=False;" +
                "User ID=yachiheng;" +
                "Password=A2xuioiji;" +
                "MultipleActiveResultSets=False;" +
                "Encrypt=false;" +
                "TrustServerCertificate=False;" +
                "Connection Timeout=30";
            //要輸入的sql指令(修改資料)
            sql.InsertCommand = sqlUpdateEC;
            //執行輸入
            sql.Insert();
        }//(方法)修改資料進EC資料表

        private void UpdareRS() {
            int initEidint = Convert.ToInt32(Session["Eid"].ToString());
            string sqlUpdateRS = "update Relationship set "+
                "relationship='"+tbRelationship.Text+
                "' where E_id = "+ initEidint;
            SqlDataSource sql = new SqlDataSource();
            //選擇連結的資料庫
            sql.ConnectionString =
                @"Data Source=yachiheng.database.windows.net;" +
                "Initial Catalog=Guardian_Angel-20190409084017;" +
                "Persist Security Info=False;" +
                "User ID=yachiheng;" +
                "Password=A2xuioiji;" +
                "MultipleActiveResultSets=False;" +
                "Encrypt=false;" +
                "TrustServerCertificate=False;" +
                "Connection Timeout=30";
            //要輸入的sql指令(存入名字電話信箱，之後查詢Eid)
            sql.InsertCommand = sqlUpdateRS;
            //執行輸入
            sql.Insert();

        }//(方法)修改資料進RS資料表

        protected void lbtnSend_Click(object sender, EventArgs e)
        {
            if (tbName.Text == "")
            {
                Response.Write("<script>alert('姓名欄位不得為空');</script>");
            }//判斷姓名欄位是否尚未填寫
            else if (tbPhone.Text == "")
            {
                Response.Write("<script>alert('電話欄位不得為空');</script>");
            }//判斷電話欄位是否尚未填寫
            else if (tbEmail.Text == "")
            {
                Response.Write("<script>alert('信箱欄位不得為空');</script>");
            }//判斷信箱欄位是否尚未填寫
            else if (tbRelationship.Text == "")
            {
                Response.Write("<script>alert('關係欄位不得為空');</script>");
            }//判斷關係欄位是否尚未填寫
            else {
                if (Session["change"].Equals(2))
                {
                    InsertEC();//新增資料入EC
                    selectECsEid(); //(方法)從EC資料表檢索最新一筆資料的E_id
                    InsertRS();//新增資料入RS
                    Session["insSuc"] = 1;
                    Server.Transfer("EmergencyContact.aspx");
                    Session["change"] = null;
                }//沒讀到資料
                else if (Session["change"].Equals(1))
                {
                    UpdateEC();//修改資料入EC
                    UpdareRS();//修改資料入RS
                    Session["updSuc"] = 1;
                    Server.Transfer("EmergencyContact.aspx");
                    Session["change"] = null;
                }//有讀到資料
            }
           

        }//按下送出鈕執行的內容

       
    }
}