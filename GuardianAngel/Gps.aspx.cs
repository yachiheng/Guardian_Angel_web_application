using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Newtonsoft.Json;
using System.Collections;
using Newtonsoft.Json.Linq;

namespace GuardianAngel
{
    
    public partial class maptest : System.Web.UI.Page
    {
        string Uid;
        string initUid = ""; //字串 初始使用者id Session用
        string initOid = ""; //字串 初始守護對象id Session用
        public static string csJsonsData = "0";
        public static string amount = "0"; //計算矩形的數量
        public static string amountL = "0";
        public static string xLocation = "0";
        public static string yLocation = "0";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            identifyUser();
        }

        protected void identifyUser()
        {
            if (Session["Uid"] == null)
            {
                Server.Transfer("Login.aspx");
            }//沒有使用者id的話，跳轉回登入畫面
            else if (Session["Oid"] == null)
            {
                Response.Write("<Script language='JavaScript'>alert('請選擇被照護者');</Script>");
                Server.Transfer("GaCare.aspx");
            }//沒有老人id的話，跳轉回照護者畫面
            else
            {
                initUid = Session["Uid"].ToString();
                initOid = Session["Oid"].ToString();
                sqlLoad();
                gpsButtonEvent();//按鈕特效
                sqlDataLoad();
                sqlGPSLocation();
                Response.Write("<script>console.log('Uid為:"+initUid+"');</script>");
                Response.Write("<script>console.log('Oid為:" + initOid + "');</script>");
            }//皆有的話，進入gps畫面    
        }//辨識使用者

        protected void sqlLoad()
        {
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
            string sqlOld = "select O_name " + "from Oldman_Data where O_id =" + initOid;
            conn.Open();  //開啟連結資料庫
            SqlCommand cmd = new SqlCommand(sqlOld, conn);  //命令內容
            SqlDataReader reader = cmd.ExecuteReader();  //reader執行sql命令
            string oldName = "";
            if (reader.Read() == true) {
                lbName.Text = reader["O_name"].ToString();
                oldName = reader["O_name"].ToString();
            }
            Session["test"] = oldName;
        }//載入老人姓名

        protected void gpsButtonEvent() {
            //一般模式按鈕
            gpsGeneral.Attributes["onmouseout"] = "this.src='../img/r7GpsButtonIcons/r7GpsGeneral01.jpg';"; //滑鼠離開時
            gpsGeneral.Attributes["onmouseover"] = "this.src='../img/r7GpsButtonIcons/r7GpsGeneral02.jpg';";  //滑鼠重疊時
            gpsGeneral.Attributes["onMouseDown"] = "this.src='../img/r7GpsButtonIcons/r7GpsGeneral03.jpg';";  //滑鼠按下時
            gpsGeneral.Attributes["onMouseUp "] = "this.src='../img/r7GpsButtonIcons/r7GpsGeneral02.jpg';";  //滑鼠按下後放開時
            //刪除按鈕
            gpsDelete.Attributes["onmouseout"] = "this.src='../img/r7GpsButtonIcons/r7GpsDelete01.jpg';"; //滑鼠離開時
            gpsDelete.Attributes["onmouseover"] = "this.src='../img/r7GpsButtonIcons/r7GpsDelete02.jpg';";  //滑鼠重疊時
            gpsDelete.Attributes["onMouseDown"] = "this.src='../img/r7GpsButtonIcons/r7GpsDelete03.jpg';";  //滑鼠按下時
            gpsDelete.Attributes["onMouseUp "] = "this.src='../img/r7GpsButtonIcons/r7GpsDelete02.jpg';";  //滑鼠按下後放開時
            //矩形模式按鈕
            gpsRect.Attributes["onmouseout"] = "this.src='../img/r7GpsButtonIcons/r7GpsRect01.jpg';"; //滑鼠離開時
            gpsRect.Attributes["onmouseover"] = "this.src='../img/r7GpsButtonIcons/r7GpsRect02.jpg';";  //滑鼠重疊時
            gpsRect.Attributes["onMouseDown"] = "this.src='../img/r7GpsButtonIcons/r7GpsRect03.jpg';";  //滑鼠按下時
            gpsRect.Attributes["onMouseUp "] = "this.src='../img/r7GpsButtonIcons/r7GpsRect02.jpg';";  //滑鼠按下後放開時
            //儲存按鈕
            gpsSave.Attributes["onmouseout"] = "this.src='../img/r7GpsButtonIcons/r7GpsSave01.jpg';"; //滑鼠離開時
            gpsSave.Attributes["onmouseover"] = "this.src='../img/r7GpsButtonIcons/r7GpsSave02.jpg';";  //滑鼠重疊時
            gpsSave.Attributes["onMouseDown"] = "this.src='../img/r7GpsButtonIcons/r7GpsSave03.jpg';";  //滑鼠按下時
            gpsSave.Attributes["onMouseUp "] = "this.src='../img/r7GpsButtonIcons/r7GpsSave02.jpg';";  //滑鼠按下後放開時
            //全部刪除按鈕
            gpsAllDel.Attributes["onmouseout"] = "this.src='../img/r7GpsButtonIcons/r7gpsAllDel01.jpg';"; //滑鼠離開時
            gpsAllDel.Attributes["onmouseover"] = "this.src='../img/r7GpsButtonIcons/r7gpsAllDel02.jpg';";  //滑鼠重疊時
            gpsAllDel.Attributes["onMouseDown"] = "this.src='../img/r7GpsButtonIcons/r7gpsAllDel03.jpg';";  //滑鼠按下時
            gpsAllDel.Attributes["onMouseUp "] = "this.src='../img/r7GpsButtonIcons/r7gpsAllDel02.jpg';";  //滑鼠按下後放開時
            //警報按鈕
            gpsNotice.Attributes["onmouseout"] = "this.src='../img/r7GpsButtonIcons/r7gpsNotice01.jpg';"; //滑鼠離開時
            gpsNotice.Attributes["onmouseover"] = "this.src='../img/r7GpsButtonIcons/r7gpsNotice02.jpg';";  //滑鼠重疊時
            gpsNotice.Attributes["onMouseDown"] = "this.src='../img/r7GpsButtonIcons/r7gpsNotice03.jpg';";  //滑鼠按下時
            gpsNotice.Attributes["onMouseUp "] = "this.src='../img/r7GpsButtonIcons/r7gpsNotice02.jpg';";  //滑鼠按下後放開時
        }//gps按鈕特效

        protected void sqlDataLoad() {

            JArray sqlRectDatas = new JArray();  // 宣言一個json格式的陣列

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
            string sql = "select neLng,neLat,swLng,swLat from Security where O_id = "+initOid;
            conn.Open();  //開啟連結資料庫
            SqlCommand cmd = new SqlCommand(sql, conn);  //命令內容
            SqlDataReader reader = cmd.ExecuteReader();  //reader執行sql命令  
            int frequency = 0; //迴圈跑得次數
            while (reader.Read() == true)  //如果讀入
             {
                JObject sqlRectData = new JObject() {
                { "neLng", "value" },
                { "neLat", "value" },
                { "swLng", "value" },
                { "swLat", "value" } };//建立json物件並給予格式

                sqlRectData["neLng"] = (reader["neLng"].ToString());
                sqlRectData["neLat"] = (reader["neLat"].ToString());
                sqlRectData["swLng"] = (reader["swLng"].ToString());
                sqlRectData["swLat"] = (reader["swLat"].ToString());
                frequency++;
                sqlRectDatas.Add(sqlRectData);
             }
            Response.Write("<script>console.log(" + frequency + ")</script>");
            Response.Write("<script>console.log(" + sqlRectDatas + ")</script>");
            csJsonsData = sqlRectDatas.ToString();
            amount = frequency.ToString();

            conn.Close();  //關閉連結資料庫


        }//載入多組已存矩形資料並以json傳出
        
        protected void sqlGPSLocation() {

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
            string sql = "select TOP 1 x_axis,y_axis from GPS where O_id="+ initOid + " ORDER BY G_Time DESC ";
            conn.Open();  //開啟連結資料庫
            SqlCommand cmd = new SqlCommand(sql, conn);  //命令內容
            SqlDataReader reader = cmd.ExecuteReader();  //reader執行sql命令
            int IntAmountL = 0;
            if (reader.Read() == true)  //如果讀入
            {
                xLocation = (reader["x_axis"].ToString());
                yLocation = (reader["y_axis"].ToString());
                IntAmountL++;
            }
            amountL = IntAmountL.ToString();
            Response.Write("<script>console.log(" + xLocation + ")</script>");
            Response.Write("<script>console.log(" + yLocation + ")</script>");
            Response.Write("<script>console.log(" + amountL + ")</script>");
            conn.Close();  //關閉連結資料庫
        }//載入老人位置

        protected void gpsAllDel_Click(object sender, ImageClickEventArgs e)
        {
            SqlDataSource sql = new SqlDataSource();
            sql.ConnectionString =
                @"Data Source=yachiheng.database.windows.net;" +
                "Initial Catalog=Guardian_Angel-20190409084017;"+
                "Persist Security Info=False;"+
                "User ID=yachiheng;"+
                "Password=A2xuioiji;"+
                "MultipleActiveResultSets=False;"+
                "Encrypt=false;"+
                "TrustServerCertificate=False;"+
                "Connection Timeout=30";

            string strSql = "delete from Security where O_id = " + initOid;
            sql.InsertCommand = strSql;
            sql.Insert();
        }//全部刪除鈕
        
    }
}