using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPro.web.mPurpose_master
{
    public partial class GaCare_Update : System.Web.UI.Page
    {
        string photoO = "", photoN = "", photoUpdate = "",uId=""; 


        int intId = 0; int[] arrayQrid = new int[6]; //qrid亂數
        int intuId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            search();
            if ( Session["photoUpdate"] != null)
            photoUpdate = Session["photoUpdate"].ToString();

            intId = Convert.ToInt32(Session["oId"]); //暫存主頁傳來的id值            
            //intId = 3; //測試用(可刪)
            lblId.Text = intId.ToString();
            intuId = Convert.ToInt32(Session["Uid"]); //暫存主頁傳來的id值  

            if ((intId == 0) && (intuId == 0))
            {
                Server.Transfer("Login.aspx");
            }
            else
            {
                btnOK.Attributes["OnClick"] = "return confirm('確定要修改嗎?')";
            }

            if(!IsPostBack)
            { dbLoad(); }
        }

        protected void dbLoad() //load資料
        {

            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            sds.SelectCommand = "select O_name, O_birthday, O_phone, O_blood, O_disease, O_address," +
                " O_qrcode, O_photo from Oldman_Data where O_id =" + intId;
            DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;
            //讀值代入表格
            //tbxId.Text = intId.ToString();
            tbxName.Text = dv.Table.Rows[0]["O_name"].ToString();
            tbxBirth.Text = dv.Table.Rows[0]["O_birthday"].ToString();
            tbxPhone.Text = dv.Table.Rows[0]["O_phone"].ToString();
            DdBlood.Text = dv.Table.Rows[0]["O_blood"].ToString();
            tbxDisease.Text = dv.Table.Rows[0]["O_disease"].ToString();
            tbxAddress.Text = dv.Table.Rows[0]["O_address"].ToString();
            imgQrcode.ImageUrl = dv.Table.Rows[0]["O_qrcode"].ToString();
            if (dv.Table.Rows[0]["O_photo"].ToString().Equals(""))
            {
                Image1.ImageUrl = "~/img/sample.png";
            }
            else
            {
                Image1.ImageUrl = "~/img/" + dv.Table.Rows[0]["O_photo"].ToString();
            }
            lblOld.Text = tbxName.Text;
            photoO = dv.Table.Rows[0]["O_photo"].ToString();
            //photoUpdate = photoO;
            Label1.Text = photoO;
            Session["Oldname"] = tbxName.Text;
        }

        protected void btnBack_Click1(object sender, EventArgs e)
        {
            Response.Redirect("GaCare.aspx");
        }

        protected void btnOK_Click1(object sender, EventArgs e)
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            sds.UpdateCommand = "Update Oldman_Data set O_name=@O_name, O_birthday=@O_birthday, " +
                "O_phone=@O_phone, O_blood=@O_blood, O_disease=@O_disease, " +
                "O_address=@O_address, O_photo=@O_photo where O_id =" + intId;

            photoO = photoN;

            if (tbxName.Text == null)
                sds.UpdateParameters.Add("O_name", "");
            else
                sds.UpdateParameters.Add("O_name", tbxName.Text);

            if (tbxBirth.Text == null)
                sds.UpdateParameters.Add("O_birthday", "");
            else
                sds.UpdateParameters.Add("O_birthday", tbxBirth.Text);

            if (tbxPhone.Text == null)
                sds.UpdateParameters.Add("O_phone", "");
            else
                sds.UpdateParameters.Add("O_phone", tbxPhone.Text);

            if (DdBlood.Text == null)
                sds.UpdateParameters.Add("O_blood", "");
            else
                sds.UpdateParameters.Add("O_blood", DdBlood.SelectedValue);

            if (tbxDisease.Text == null)
                sds.UpdateParameters.Add("O_disease", "");
            else
                sds.UpdateParameters.Add("O_disease", tbxDisease.Text);

            if (tbxAddress.Text == null)
                sds.UpdateParameters.Add("O_address", "");
            else
                sds.UpdateParameters.Add("O_address", tbxAddress.Text);
            if (photoUpdate == null)
                photoO = photoUpdate;
            else
                photoN = photoUpdate;
            sds.UpdateParameters.Add("O_photo", photoUpdate);
            

            sds.Update();
            Session["photoUpdate"] = "";
            Label1.Text = Session["photoUpdate"].ToString();

        }
     
        protected void btnC_Click(object sender, EventArgs e)
        {
            //Calendar1. Visible = true;
        }

      
        protected void btnGM_Click(object sender, EventArgs e)
        {
            Session["oId"] = intId;
            Server.Transfer("Gps.aspx");
        }

        protected void btnGill_Click(object sender, EventArgs e)
        {
            Session["oId"] = intId;
            Server.Transfer("OldMedicine_List.aspx");
        }

        protected void btnEvent_Click(object sender, EventArgs e)
        {
            Session["oId"] = intId;
            Server.Transfer("respond_oldV3.aspx");
        }

        protected void btnHospital_Click(object sender, EventArgs e)
        {
            Session["oId"] = intId;
            Server.Transfer("Consolution.aspx");
        }

        protected void btnChangePic_Click(object sender, EventArgs e)
        {
            
            if (FileUpload1.HasFile)
            {
                string fileName = FileUpload1.FileName;
                string savepath;
                if (fileName.EndsWith(".jpg") || fileName.EndsWith(".png"))
                {
                    savepath = Server.MapPath("~/img/") + fileName;
                    FileUpload1.SaveAs(savepath);

                    //用來暫存確試是否有檔名重複時用
                    //string tempFileName = "";

                    //偵測是否有同樣檔名的檔案
                    //if (System.IO.File.Exists(saveResult))
                    //{
                    //    tempFileName = "(new)" + photoN;
                    //    saveResult = savePath + tempFileName;
                    //    photoN = tempFileName;
                    //}
                    Image1.ImageUrl = "~/img/" + fileName;
                    Label1.Text = "上傳成功!檔名：" + fileName;
                    SqlDataSource sds = new SqlDataSource();
                    sds.ConnectionString = @"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
                    sds.UpdateCommand = "update Oldman_Data set O_photo = '" + fileName + "' where [O_id]  = " + intId;
                    sds.Update();
                }
                else
                {
                    Label1.Text = "只有.jpg或是.png附檔名的檔案,方能上傳";
                }
            }
            else
            {
                Label1.Text = "請先選擇檔案之後,再來上傳";
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

        protected void btnCancelPic_Click(object sender, EventArgs e)
        {
            Label1.Text = "取消上傳";
            return;
        }

        protected void btnEC_Click(object sender, EventArgs e)
        {
            Session["oId"] = intId;
            Server.Transfer("EmergencyContact.aspx");
        }
    }

}