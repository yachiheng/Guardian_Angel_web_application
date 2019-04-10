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
    public partial class OldMedicineRemind_List : System.Web.UI.Page
    {
        string uId = "";
        int uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            uid = Convert.ToInt32(Session["uId"]);          
            if (uid == 0)
            {
                Server.Transfer("Login.aspx");
            }
            else
            {
                search();
                if (!this.IsPostBack)
                {
                    GridView1Style();
                }
            }
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

            
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value.Equals("0"))
            {
                for (int j = 0; j < GridView1.Rows.Count; j++)
                    GridView1.Rows[j].Visible = true;
            }
            else
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    if (GridView1.Rows[i].Cells[0].Text.Contains(DropDownList1.SelectedValue))
                    {
                        GridView1.Rows[i].Visible = true;
                    }
                    else
                    {
                        GridView1.Rows[i].Visible = false;
                    }
                }
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
    }
}