using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class OldMedicine_ViewAndUpdate : System.Web.UI.Page

    {
        string uId = "";
        int nid;
        int oid;
        //int count;
        int uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            oid = Convert.ToInt32(Session["oId"]);
            nid = Convert.ToInt32(Session["nId"]);
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
                    txtName.Enabled = false;
                    btnSure.Enabled = false;
                    btnDelete.Enabled = false;
                }
                //btnSendTime.Visible = false;
                //txtTime1.Visible = false;
            }
        }

        //load資料
        protected void dbLoad() 
        {
            SqlConnection con = new SqlConnection(@"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
            con.Open();
            btnDelete.Attributes["OnClick"] = "return confirm('再一次確認,你確定要刪除這些資料嗎?')";
            string strSQL = "select O_name,N_name,[N_startdate],[N_enddate]" +
                            " from [dbo].[Oldman_Data] a join [dbo].[Notice] b " +
                            " on a.O_id = b.O_id where b.N_id = " + nid;

            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read() == true)
            {
                txtName.Text = string.Format("{0}", reader["O_name"]);
                txtMedicineName.Text = string.Format("{0}", reader["N_name"]);
                txtStartDate.Text = string.Format("{0}", reader["N_startdate"]);
                txtEndDate.Text = string.Format("{0}", reader["N_enddate"]);
            }
            reader.Close();
            //strSQL = "select T_time from [dbo].[Time] where N_id =" + nid;
            //SqlCommand cmd2 = new SqlCommand(strSQL, con);
            //SqlDataReader reader2 = cmd2.ExecuteReader();
            //String strMsg = "";
            //while (reader2.Read() == true)
            //{
                //strMsg += string.Format("{0}", reader2["T_time"]);
                //if (txtTime1.Text.Equals(""))
                //    txtTime1.Text = string.Format("{0}", reader2["T_time"]);
                //else if (txtTime2.Text.Equals(""))
                //    txtTime2.Text = string.Format("{0}", reader2["T_time"]);
                //else if (txtTime3.Text.Equals(""))
                //    txtTime3.Text = string.Format("{0}", reader2["T_time"]);
                //else if (txtTime4.Text.Equals(""))
                //    txtTime4.Text = string.Format("{0}", reader2["T_time"]);
                //else if (txtTime5.Text.Equals(""))
                //    txtTime5.Text = string.Format("{0}", reader2["T_time"]);
                //else
                //    return;
            //}
            
            //cmd2.Cancel();
            //reader2.Close();
            cmd.Cancel();
            con.Close();
            //隱藏編號標籤,刪除欄位
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                Label myID = (Label)GridView1.Rows[i].Cells[0].FindControl("Label1");
                myID.Visible = false;
            }
        }

        //GridView樣式設定
        //private void GridView1Style()
        //{
        //    GridView1.Font.Bold = true;

        //    //GridView
        //    GridView1.BorderColor = Color.White;
        //    GridView1.BorderWidth = 1;
        //    GridView1.RowStyle.Font.Size = 13;
        //    GridView1.RowStyle.Font.Name = "微軟正黑體";
        //    GridView1.CellSpacing = 5;
        //    GridView2.BorderColor = Color.White;
        //    GridView2.BorderWidth = 1;
        //    GridView2.RowStyle.Font.Size = 13;
        //    GridView2.RowStyle.Font.Name = "微軟正黑體";
        //    GridView2.CellSpacing = 5;

        //    //標題列
        //    GridView1.HeaderStyle.ForeColor = Color.Black;
        //    GridView1.HeaderStyle.Height = 40;
        //    GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
        //    GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
        //    GridView2.HeaderStyle.ForeColor = Color.Black;
        //    GridView2.HeaderStyle.Height = 40;
        //    GridView2.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
        //    GridView2.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;

           
        //}

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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string myMessage = null;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                Label myID = (Label)GridView1.Rows[i].FindControl("Label1");
                if (myCheckBox.Checked == true)
                    myMessage = myMessage + myID.Text + ",";
            }
            myMessage = myMessage.Substring(0, myMessage.Length - 1);  //刪除最後1個字元
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            sds.DeleteCommand = "delete NPGrouping where [N_id]=" + nid + " and [P_id] in (" + myMessage + ")";
            sds.Delete();
            Response.Redirect(Request.Url.ToString());
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session["nId"] = nid;
            Response.Redirect("OldMedicine_AddPill.aspx");
        }
       
        protected void btnBack(object sender, EventArgs e)
        {
            Response.Redirect("OldMedicine_List.aspx");
        }

        protected void btnSure_Click(object sender, EventArgs e)
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            sds.UpdateCommand = "update [dbo].[Notice] set [N_name] = '" + txtMedicineName.Text + "' where [N_id] = " + nid + ";" +
                                "update[dbo].[Notice] set[N_startdate] = '" + txtStartDate.Text + "' where[N_id] = " + nid + ";" +
                                "update[dbo].[Notice] set[N_enddate] = '" + txtEndDate.Text + "' where[N_id] = " + nid;
            sds.Update();
            txtMedicineName.Enabled = false;
            txtStartDate.Enabled = false;
            txtEndDate.Enabled = false;
            btnEdit.Enabled = true;
        }



        //新增用藥時間
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "myInsert")
            {
                GridView2.DataSourceID = "";
            }
        }

        //新增用藥時間
        protected void SqlDataSource2_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView2.DataSourceID = "SqlDataSource2";
        }



        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtMedicineName.Enabled = true;
            txtStartDate.Enabled = true;
            txtEndDate.Enabled = true;
            btnSure.Enabled = true;
            //btnSendTime.Visible = true;
            //txtTime1.Visible = true;
            btnEdit.Enabled = false;
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

        //新增用藥時間
        protected void btnSendTime_Click(object sender, ImageClickEventArgs e)
        {
            if (txtTime1.Text=="")
            {
                return;
            }
            else
            {
                SqlDataSource sds = new SqlDataSource();
                sds.ConnectionString = @"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
                sds.InsertCommand = "insert [dbo].[Time] ([N_id],[T_time]) values (" + nid + ",'" + txtTime1.Text + "')";
                sds.Insert();
                Response.Redirect("OldMedicine_ViewAndUpdate.aspx");
                txtTime1.Text = "";
            }

        }
    }
}