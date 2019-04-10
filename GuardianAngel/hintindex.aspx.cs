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
    public partial class hintindex : System.Web.UI.Page
    {
        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        int intuId = 0;
        string uId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            intuId = Convert.ToInt32(Session["Uid"]);
            search();
            if (intuId == 0)
            {
                Server.Transfer("Login.aspx");

            }
            else
            {
                if (!IsPostBack)
                {
                    //LinkButton.Attributes["OnClick"] = "return confirm('確定要刪除嗎?')";
                    intuId = Convert.ToInt32(Session["Uid"]);
                    dbLoad();


                }
            }

        }
        protected void dbLoad() //load資料
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
                sds.ConnectionString = @"Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
                sds.SelectCommand = "SELECT * FROM Message INNER JOIN Oldman_Data ON Message.O_Id = Oldman_Data.O_Id where U_id = " + intuId + " ORDER BY M_date DESC";
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
        protected void dbLoad2() //load資料
        {
            intuId = Convert.ToInt32(Session["Uid"]);
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            sds.SelectCommand = "SELECT * FROM Message INNER JOIN Oldman_Data ON Message.O_Id = Oldman_Data.O_Id where U_id = " + intuId + " ORDER BY M_date DESC";
            GridView1.DataSource = sds.Select(DataSourceSelectArguments.Empty);

            GridView1.Font.Bold = true;
            //GridView
            GridView1.BorderColor = Color.Blue;
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("hintadd.aspx");
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            intuId = Convert.ToInt32(Session["Uid"]);
            string in_put = DropDownList1.SelectedValue;
            if (in_put == "0")
            {
                string strsql = "SELECT * FROM Message INNER JOIN Oldman_Data ON Message.O_Id = Oldman_Data.O_Id where U_id = " + intuId + " ORDER BY M_date DESC";
                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();
                GridView1.DataKeyNames = new string[] { "M_id" };

                DropDownList1.ClearSelection();

            }
            else
            {
                try
                {

                    string strsql = "SELECT * FROM Message INNER JOIN Oldman_Data ON Message.O_Id = Oldman_Data.O_Id where U_id = " + intuId + " and Message.O_id = " + in_put + " ORDER BY M_date DESC";

                    SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "test1");

                    GridView1.DataSource = ds.Tables["test1"].DefaultView;
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    GridView1.Columns.Clear();
                    GridView1.DataBind();
                }
            }



        }

        protected void GridView1_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Bdelete")
            {
                SqlConnection conn = new SqlConnection("Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
                conn.Open();

                SqlCommand cmd = new SqlCommand("Delete From Message Where M_id=@ID", conn);
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = e.CommandArgument;
                cmd.ExecuteNonQuery();


                cmd.Cancel();
                cmd.Dispose();
                conn.Close();

                dbLoad2();
            }

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