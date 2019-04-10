using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class Consolution : System.Web.UI.Page
    {

        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        int intuId = 0;
        string uId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            search();
            dbLoad();

        }
        protected void dbLoad() //load資料
        {

            intuId = Convert.ToInt32(Session["Uid"]);
            if (intuId == 0)
            {
                Server.Transfer("Login.aspx");

            }
            else
            {
                if (!IsPostBack)
                {

                    intuId = Convert.ToInt32(Session["Uid"]);
                    SqlConnection conn = new SqlConnection(connstr);
                    string strsql = "SELECT * FROM Oldman_Data WHERE U_id = " + intuId;

                    SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "test");

                    DropDownList1.DataTextField = "O_name";
                    DropDownList1.DataValueField = "O_id";

                    DropDownList1.DataSource = ds.Tables["test"].DefaultView;
                    DropDownList1.DataBind();


                    SqlDataSource sds = new SqlDataSource();
                    sds.ConnectionString = @"Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30;";
                    sds.SelectCommand = "SELECT C_name as '醫院', C_date as '日期', C_number as '診號', O_name as '被照護者' FROM Consulation INNER JOIN Oldman_Data ON Oldman_Data.O_Id = Consulation.O_id where U_id = " + intuId + " and C_date >= GETDATE() ORDER BY C_date ASC";
                    GridView1.DataSource = sds.Select(DataSourceSelectArguments.Empty);

                    GridView1.Font.Bold = true;

                    //GridView
                    //GridView1.BorderColor = Color.Blue;
                    GridView1.BorderWidth = 2;
                    GridView1.RowStyle.Font.Size = 13;
                    GridView1.RowStyle.Font.Name = "微軟正黑體";
                    GridView1.Style.Add("word-break", "keep-all");
                    //標題列
                    GridView1.ForeColor = Color.Black;
                    GridView1.HeaderStyle.Height = 40;
                    GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
                    GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;

                    GridView1.DataBind();

                }
            }

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsulationAdd.aspx");
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                string in_put = DropDownList1.SelectedValue;
                if (in_put == "0")
                {
                    string strsql1 = "SELECT C_name as '醫院', C_date as '日期', C_number as '診號', O_name as '被照護者' FROM Consulation INNER JOIN Oldman_Data ON Oldman_Data.O_Id = Consulation.O_id where U_id = " + intuId + " and  C_date >= GETDATE() ORDER BY C_date ASC";
                    SqlDataAdapter da1 = new SqlDataAdapter(strsql1, connstr);
                    DataSet ds1 = new DataSet();
                    da1.Fill(ds1, "test1");

                    GridView1.DataSource = ds1.Tables["test1"].DefaultView;
                    GridView1.DataBind();

                }
                else
                {
                    string strsql = "SELECT C_name as '醫院', C_date as '日期', C_number as '診號', O_name as '被照護者' FROM Consulation INNER JOIN Oldman_Data ON Oldman_Data.O_Id = Consulation.O_id where U_id = " + intuId + " and Consulation.O_id = " + in_put + " and C_date >= GETDATE() ORDER BY C_date ASC";


                    SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "test1");

                    GridView1.DataSource = ds.Tables["test1"].DefaultView;
                    GridView1.DataBind();
                }

            }
            catch (Exception ex)
            {
                GridView1.Columns.Clear();
                GridView1.DataBind();
            }

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int strCurrentRowIndex = row.RowIndex;
            var Cname = GridView1.Rows[strCurrentRowIndex].Cells[1].Text;
            var Oname = GridView1.Rows[strCurrentRowIndex].Cells[4].Text;

            //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "test", "alert('"+id+"');",true);       
            Session["Cname"] = Cname;
            Session["Oname"] = Oname;

            Response.Redirect("ConAll.aspx");
        }

        private void gridView1Style()
        {
            GridView1.Font.Bold = true;

            //GridView
            GridView1.BorderColor = Color.White;
            GridView1.BorderWidth = 2;
            GridView1.RowStyle.Font.Size = 13;
            GridView1.RowStyle.Font.Name = "微軟正黑體";

            //標題列
            GridView1.HeaderStyle.ForeColor = Color.White;
            GridView1.HeaderStyle.Height = 40;
            GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
        }
        
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

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
    }
}