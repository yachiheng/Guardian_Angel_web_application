using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class warningAPI : System.Web.UI.Page
    {
        string initOid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            reConsole();
            delNoticeData();
            saveNotice();
        }

        private void reConsole() {
            Response.Write("警告內容:" + Request.Form["Data"] +"\n");
            string time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.f");
            Response.Write("警示時間:" + time);
        }

        private void delNoticeData() {
            initOid = Request.Form["dataOid"].ToString();
            string strDelData = "delete from Accident where A_style = 3 and O_id = "+initOid;
            SqlDataSource sql = new SqlDataSource();
            /*換資料庫的連結*/
            sql.ConnectionString =
                @"Data Source=13.76.157.247;" +
                "Initial Catalog=Guardian_Angel-20190409084017;" +
                "Persist Security Info=False;" +
                "User ID=yachiheng;" +
                "Password=A2xuioiji;" +
                "MultipleActiveResultSets=False;" +
                "Encrypt=false;" +
                "TrustServerCertificate=False;" +
                "Connection Timeout=30";
            sql.InsertCommand = strDelData;
            sql.Insert();
        }//(方法)刪除舊資料
        private void saveNotice() {
            DateTime dt1 = DateTime.UtcNow;
            string dateTime = dt1.ToLocalTime().ToString("yyyy-MM-dd HH:mm:ss.f");

            //string time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.f");
            initOid = Request.Form["dataOid"].ToString();
            SqlDataSource sql = new SqlDataSource();
            /*換資料庫的連結*/
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
            string strNotice = "insert into Accident" + 
                "(A_style,A_date,A_status,O_id)values('3','"+ dateTime + "','1','"+initOid+"')";
            sql.InsertCommand = strNotice;
            sql.Insert();

        }//(方法)儲存異常狀況記錄
        
    }
}