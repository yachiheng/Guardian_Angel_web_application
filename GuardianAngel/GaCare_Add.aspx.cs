using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPro.web.mPurpose_master
{
    public partial class GaCare_Add : System.Web.UI.Page
    {
        string photoO = "", photoN = "", photoUpdate = "";

        string strQR = ""; //暫存qrcode
        int[] arrayQrid = new int[6]; //qrid亂數
        string uId = "";
        int intuId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["photoUpdate"] != null)
                photoUpdate = Session["photoUpdate"].ToString();
            else
                photoUpdate = "~/img/noQR.png";

            search();
            uId = Session["uId"].ToString();
            intuId = Convert.ToInt32(Session["uId"]); //暫存主頁傳來的id值 
           // intuId = 15;//測試用

            if (intuId == 0)
            {
                Server.Transfer("Login.aspx");
            }
        }

        private void search()
        {
            uId = Session["Uid"].ToString();
            SqlConnection conn = new SqlConnection("Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
            SqlCommand cmd = null;
            string sql = "SELECT a.A_status FROM Accident as a INNER JOIN Oldman_Data as o ON a.O_id = o.O_id WHERE o.U_id =" + uId + "AND a.A_status = 1";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() == true)
            {
                lblBell.Visible = true;
            }
            else
            {
                lblBell.Visible = false;
            }
            reader.Close();
            conn.Close();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {

            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            sds.InsertCommand = getInsertSql();
            sds.Insert();

            photoO = photoN;
            Response.Write("<script language=javascript>alert('資料新增成功！');</script>");

            btnOK.Visible = false;
            btnNext.Visible = true;
        }

        private string getInsertSql()
        { //新增欄位讀取
            string strSql = "";

            //亂數取qrid
            String strRan = ""; //暫存亂數
            Random ran = new Random();
            for (int i = 0; i < 6; i++)
            {
                arrayQrid[i] = ran.Next(10);
                strRan += arrayQrid[i];
            }

            strSql += "Insert into Oldman_Data(O_name, O_birthday, O_phone,O_blood, O_disease, " +
                 "O_address, Ｏ_qrid, O_qrcode, O_photo, U_id) values(";
            strSql += "'" + tbxName.Text + "',";
            strSql += "'" + tbxBirth.Text + "',";
            strSql += "'" + tbxPhone.Text + "',";
            strSql += "'" + DdBlood.Text + "',";
            strSql += "'" + tbxDisease.Text + "',";
            strSql += "'" + tbxAddress.Text + "',";
            strSql += "'" + strRan + "',";
            strSql += "'https://chart.googleapis.com/chart?chs=120x120&cht=qr&chl='+'"
                + strRan + "'+'&choe=UTF-8&chld=M|2', ";            
            strSql += "'" + photoUpdate + "',";
            strSql += intuId + ")";

            strQR = "https://chart.googleapis.com/chart?chs=120x120&cht=qr&chl="
                   + strRan + "&choe=UTF-8&chld=M|2";
            imgQrcode. ImageUrl = strQR;
            return (strSql);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ini();
            return;
        }

        protected void ini()
        {
            tbxName.Text = "";
            tbxBirth.Text = "";
            tbxPhone.Text = "";
            tbxDisease.Text = "";
            DdBlood.Text = "";
            tbxAddress.Text = "";
            imgQrcode.ImageUrl = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("GaCare.aspx");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            btnOK.Visible = true;
            btnNext.Visible = false;
            ini();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            uId = Session["Uid"].ToString();
            SqlConnection conn = new SqlConnection("Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
            SqlCommand cmd = null;
            string sql = "SELECT a.A_status FROM Accident as a INNER JOIN Oldman_Data as o ON a.O_id = o.O_id WHERE o.U_id =" + uId + "AND a.A_status = 1";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() == true)
            {
                lblBell.Visible = true;
            }
            else
            {
                lblBell.Visible = false;
            }
            reader.Close();
            conn.Close();
        }

        protected void btnChangePic_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                photoN = FileUpload1.FileName;
                Label1.Text = photoN;

                String savePath = Server.MapPath("~/img/");
                string saveResult = savePath + photoN;

                //用來暫存確試是否有檔名重複時用
                string tempFileName = "";

                //偵測是否有同樣檔名的檔案
                if (System.IO.File.Exists(saveResult))
                {
                    tempFileName = "(new)" + photoN;
                    saveResult = savePath + tempFileName;
                    photoN = tempFileName;
                }

                FileUpload1.SaveAs(saveResult);
                // FileUpload1.PostedFile.SaveAs(saveResult);

                Label1.Text = "檔名：" + photoN;

                Image1.ImageUrl = "~/img/" + photoN;
                Session["photoUpdate"] = photoN;
                Label1.Text = "檔名：" + Session["photoUpdate"].ToString();

            }
            else
            {
                Label1.Text = "未選";
            }
        }

        protected void btnCancelPic_Click(object sender, EventArgs e)
        {
            return;
        }
    }
}