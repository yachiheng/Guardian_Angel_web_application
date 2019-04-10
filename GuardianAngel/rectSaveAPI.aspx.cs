using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace GuardianAngel
{
    public partial class rectSaveAPI : System.Web.UI.Page
    {
        string initUid = ""; //字串 初始使用者id Session用
        string initOid = ""; //字串 初始守護對象id Session用

        protected void Page_Load(object sender, EventArgs e)
        {
            
            //initUid = Request.Form["dataUid"].ToString();
            //initOid = Request.Form["dataOid"].ToString();
            reConsole();
            sqlDataDelete();
            rectDataSave();
        }
        protected void reConsole()
        {
            initUid = Request.Form["dataUid"].ToString();
            initOid = Request.Form["dataOid"].ToString();
            Response.Write("<script>console.log('API的Uid為"+ initUid +"');</script>");
            Response.Write("<script>console.log('API的Oid為" + initOid + "');</script>");
            Response.Write("資料:" + Request.Form["gpsData"]);
        }//回傳進console的內容
        protected void sqlDataDelete() {
            initUid = Request.Form["dataUid"].ToString();
            initOid = Request.Form["dataOid"].ToString();
            SqlDataSource sql = new SqlDataSource();
            sql.ConnectionString =
                "Data Source=yachiheng.database.windows.net;" +
                "Initial Catalog=Guardian_Angel-20190409084017;" +
                "Persist Security Info=False;" +
                "User ID=yachiheng;" +
                "Password=A2xuioiji;" +
                "MultipleActiveResultSets=False;" +
                "Encrypt=false;" +
                "TrustServerCertificate=False;" +
                "Connection Timeout=30";
            string strSql = "delete from Security where O_id = "+initOid;
            sql.InsertCommand = strSql;
            sql.Insert();
        }//刪除資料庫內容        
        protected void rectDataSave()
        {
            initUid = Request.Form["dataUid"].ToString();
            initOid = Request.Form["dataOid"].ToString();
            string jsonGpsData = @Request.Form["gpsData"];  //字串jsonGpsData為js傳過來的gpsData的值
            JArray obj = JArray.Parse(jsonGpsData) as JArray;  //json陣列
            dynamic data = obj;
            string strSql;
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
            foreach (var d in data)
            {
                strSql = "insert into Security(gbNumber,cenLng,cenLat,neLng,neLat,swLng,swLat,O_id)VALUES('" +
                d.gbNumber + "','" +
                d.cenLng + "','" +
                d.cenLat + "','" +
                d.neLng + "','" +
                d.neLat + "','" +
                d.swLng + "','" +
                d.swLat + "','" +
                initOid + "')";
                sql.InsertCommand = strSql;
                sql.Insert();
            }

        }//存入資料庫
    }
}