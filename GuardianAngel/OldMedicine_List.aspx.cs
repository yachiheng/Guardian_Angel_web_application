using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPro.web.mPurpose_master
{
    public partial class OldMedicine_List : System.Web.UI.Page
    {
        string uId = "";
        int oid;
        int nid;
        int uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            oid = Convert.ToInt32(Session["oId"]);
            uid = Convert.ToInt32(Session["uId"]);
            search();
            if (uid == 0)
            {
                Server.Transfer("Login.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    dbLoad();
                    GridView1Style();
                }
            }  
        }

        protected void dbLoad() //load資料
        {
            SqlDataSource1.SelectCommand = "select * from [dbo].[Notice] where [O_id]=" + oid;
            btnDelete.Attributes["OnClick"] = "return confirm('再一次確認,你確定要刪除這些資料嗎?')";
            btnDelete.Enabled = false;
            SqlConnection con = new SqlConnection(@"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
            //con.Open();
            //string strSQL = "select [O_name] from [Oldman_Data]  where O_id=" + oid;
            //SqlCommand cmd = new SqlCommand(strSQL, con);
            //SqlDataReader reader = cmd.ExecuteReader();
            //string strMsg = "";
            //while (reader.Read() == true)  //Read()代表讀資料,有讀到資料則會回傳true,執行到讀不到資料為止
            //{
            //    strMsg += string.Format("{0}", reader["O_name"]);
            //}
            //reader.Close();
            //cmd.Cancel();
            //con.Close();
        }

        //GridView樣式設定
        private void GridView1Style()
        {
            GridView1.Font.Bold = true;
            //GridView
            GridView1.BorderColor = Color.White;
            GridView1.BorderWidth = 5;
            GridView1.RowStyle.Font.Size = 13;
            GridView1.RowStyle.Font.Name = "微軟正黑體";
            GridView1.CellSpacing = 5;

            //標題列
            GridView1.HeaderStyle.ForeColor = Color.Black;
            GridView1.HeaderStyle.Height = 40;
            GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;

            ////隱藏編號
            //for (int i = 0; i < GridView1.Rows.Count; i++)
            //{
            //    Label myID = (Label)GridView1.Rows[i].FindControl("Label1");
            //    myID.Visible = false;
            //}
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string myMessage = null;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                Label myID = (Label)GridView1.Rows[i].FindControl("Label1");
                if (myCheckBox.Checked == true)
                    myMessage = myMessage + myID.Text + "or[N_id]=";
            }
            //刪除最後幾個字元(刪除最後面的or[P_id]=)
            myMessage = myMessage.Substring(0, myMessage.Length - 9);
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString= @"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            sds.DeleteCommand = "delete NPGrouping where [N_id]=" + myMessage +
                                "; delete [Time] where [N_id]=" + myMessage +
                                "; delete Notice where [N_id]=" + myMessage;
            sds.Delete();
            Response.Redirect(Request.Url.ToString());
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("OldMedicine_Add.aspx");
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            int count = 0;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (myCheckBox.Checked == true) count++;
            }
            if (count > 0) btnDelete.Enabled = true;
            else btnDelete.Enabled = false;
        }
        
        protected void LinkButton1_Click(object sender, EventArgs e)
        { 
            LinkButton LBtn = (LinkButton)sender;
            GridViewRow Row = (GridViewRow)LBtn.Parent.Parent;
            String NID = (Row.Cells[0].FindControl("Label1") as Label).Text;
            nid = Convert.ToInt32(NID);
            Session["nId"] = nid; //傳遞Session值到下一頁
            Session["oId"] = oid;
            Response.Redirect("OldMedicine_ViewAndUpdate.aspx");
        }

        private void search()
        {
            uId = Session["Uid"].ToString();
            SqlConnection conn = new SqlConnection("Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
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
    }
}