using System;
using System. Collections. Generic;
using System. Data;
using System.Drawing;
using System. Linq;
using System. Web;
using System. Web. UI;
using System. Web. UI. WebControls;

namespace WebPro. web. mPurpose_master
{
    public partial class OldMedicine_AddPill : System.Web.UI.Page
    {
        int nid;
        //int count;
        int uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            nid = Convert.ToInt32(Session["nId"]);
            uid = Convert.ToInt32(Session["uId"]);
            if (uid == 0)
            {
                Server.Transfer("Login.aspx");

            }
            else
            {
                btnOK.Attributes["OnClick"] = "return confirm('你確定要新增這些資料嗎?')";
                btnOK.Enabled = false;
                lblMessage.Visible = false;
                //隱藏藥品編號
                for (int i = 0; i < GridView2.Rows.Count; i++)
                {
                    Label myID = (Label)GridView2.Rows[i].FindControl("Label1");
                    myID.Visible = false;
                }

                if (!this.IsPostBack)
                {
                    GridView2.Visible = false;
                }
                GridView2.AllowPaging = false;
                for (int i = 0; i < GridView2.Rows.Count; i++)
                {
                    Label pid = (Label)GridView2.Rows[i].FindControl("Label1");
                    for (int j = 0; j < GridView1.Rows.Count; j++)
                    {
                        if (pid.Text.Equals(GridView1.Rows[j].Cells[0].Text))
                        {
                            GridView2.Rows[i].Visible = false;
                        }
                    }
                }
                GridView1.Visible = false;
                GridView2Style();
            }
            
        }
        private void GridView2Style()
        {
            GridView2.Font.Bold = true;

            //GridView
            GridView2.BorderColor = Color.White;
            GridView2.BorderWidth = 5;
            GridView2.RowStyle.Font.Size = 13;
            GridView2.RowStyle.Font.Name = "微軟正黑體";
            GridView2.CellSpacing = 5;

            //標題列
            GridView2.HeaderStyle.ForeColor = Color.Black;
            GridView2.HeaderStyle.Height = 40;
            GridView2.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView2.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
        }



        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            int count = 0;
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView2.Rows[i].FindControl("CheckBox1");
                if (myCheckBox.Checked == true) count++;
            }
            if (count > 0) btnOK.Enabled = true;
            else btnOK.Enabled = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int count = 0;
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                if (GridView2.Rows[i].Cells[2].Text.Contains(tbxSearch.Text))
                {
                    GridView2.Rows[i].Visible = true;
                    count++;
                }
                else
                {
                    GridView2.Rows[i].Visible = false;
                }
            }

            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                Label pid = (Label)GridView2.Rows[i].FindControl("Label1");
                for (int j = 0; j < GridView1.Rows.Count; j++)
                {
                    if (pid.Text.Equals(GridView1.Rows[j].Cells[0].Text))
                    {
                        GridView2.Rows[i].Visible = false;
                    }
                }
            }

            if (count == 0)
            {
                lblMessage.Visible = true;
                GridView2.Visible = false;
                lblMessage.Text = "沒有符合條件的資料!";
            }
            else
            {
                lblMessage.Visible = false;
                GridView2.Visible = true;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            tbxSearch.Text = "";
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            string myMessage = null;
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView2.Rows[i].FindControl("CheckBox1");
                Label pid = (Label)GridView2.Rows[i].FindControl("Label1");
                DropDownList quantity = (DropDownList)GridView2.Rows[i].FindControl("dropDownList1");
                if (myCheckBox.Checked == true)
                {
                    myMessage = myMessage + "(" + pid.Text + "," + nid + "," + quantity.SelectedValue + ")" + ",";
                }
            }
            myMessage = myMessage.TrimEnd(',');
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            sds.InsertCommand = "insert [dbo].[NPGrouping]([P_id],[N_id],[P_number]) values" + myMessage;
            sds.Insert();
            Session["nId"] = nid;
            Response.Redirect(Request.Url.ToString());
        }
    }
}