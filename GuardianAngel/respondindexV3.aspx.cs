using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class respondindexV3 : System.Web.UI.Page
    {
        string connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        
        int intuId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            intuId = Convert.ToInt32(Session["Uid"]);
            if (intuId == 0)
            {
                Server.Transfer("Login.aspx");


            }
            else
            {
                //load資料
                if (!this.IsPostBack)
                {
                    dbLoad();



                    if (!IsPostBack)
                    {
                        SqlConnection conn = new SqlConnection(connstr);
                        string strsql = "SELECT * FROM Oldman_Data WHERE U_id = " + intuId;

                        SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                        DataSet ds = new DataSet();
                        da.Fill(ds, "test");

                        DropDownList1.DataTextField = "O_name";
                        DropDownList1.DataValueField = "O_id";

                        DropDownList1.DataSource = ds.Tables["test"].DefaultView;
                        DropDownList1.DataBind();



                        SqlConnection conn2 = new SqlConnection(connstr);
                        string strsql2 = "select * from Juxtapose  ";

                        SqlDataAdapter da2 = new SqlDataAdapter(strsql2, connstr);
                        DataSet ds2 = new DataSet();
                        da2.Fill(ds2, "test");

                        DropDownList2.DataTextField = "J_text";
                        DropDownList2.DataValueField = "A_style";

                        DropDownList2.DataSource = ds2.Tables["test"].DefaultView;
                        DropDownList2.DataBind();

                    }
                }
            }

            changeStatus();
        }

        private void changeStatus()
        {
            SqlConnection con = new SqlConnection("Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
            SqlCommand cmdUpdate = new SqlCommand("UPDATE Accident SET A_status = 2 WHERE A_status = 1", con);
            con.Open();
            cmdUpdate.ExecuteNonQuery();
            con.Close();
        }

        protected void dbLoad() //load資料
        {
            //    SqlDataSource sds = new SqlDataSource();
            //    sds.ConnectionString = @"Data Source=13.76.157.247; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            //    sds.SelectCommand = "SELECT  * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id INNER JOIN Juxtapose  on Accident.A_style = Juxtapose.A_style inner join APic on APic.A_status=Accident.A_status where U_id = " + intuId + "   ORDER BY A_date DESC";
            //    GridView1.DataSource = sds.Select(DataSourceSelectArguments.Empty);


            SqlConnection conn = new SqlConnection
           (WebConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString);

            conn.Open();
            string str = "";
            str = "SELECT  * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id INNER JOIN Juxtapose  on Accident.A_style = Juxtapose.A_style inner join APic on APic.A_status=Accident.A_status where U_id = " + intuId + "   ORDER BY A_date DESC";
            SqlCommand cmd = new SqlCommand(str, conn);
            SqlDataReader sdr = cmd.ExecuteReader();

            DataTable dt = new DataTable(); //使用DataTable來儲存資料
            dt.Load(sdr);
            GridView1.DataSource = dt.AsDataView();
            GridView1.DataBind();

            cmd.Cancel();
            conn.Dispose();
            conn.Close();


            //conn.Open();
            //string str = "";
            //str = "select * from [TableName]";
            //SqlCommand cmd = new SqlCommand(str, conn);
            //SqlDataReader sdr = cmd.ExecuteReader();

            //DataTable dt = new DataTable(); //使用DataTable來儲存資料
            //dt.Load(sdr);
            //GridView1.DataSource = dt.AsDataView();
            //GridView1.DataBind();

            //cmd.Cancel();
            //conn.Dispose();
            //conn.Close();










            GridView1.Font.Bold = true;

            //GridView
            //GridView1.BorderColor = Color.Red;
            GridView1.BorderWidth = 2;
            GridView1.RowStyle.Font.Size = 13;
            GridView1.RowStyle.Font.Name = "微軟正黑體";
            GridView1.ForeColor = Color.Black;
            GridView1.Style.Add("word-break", "keep-all");




            //GridView1.Attributes.Add("style", "word-break:break-all;word-wrap:break-word");
            //標題列
            //GridView1.HeaderStyle.BackColor = Color.Blue;
            GridView1.HeaderStyle.Height = 40;
            GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;

            //GridView1.DataBind();


        }

        


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {


            try
            {
                string in_put = DropDownList1.SelectedValue;
                if (in_put == "0")
                {
                    string strsql1 = "SELECT  * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id INNER JOIN Juxtapose  on Accident.A_style = Juxtapose.A_style inner join APic on APic.A_status=Accident.A_status  where U_id = " + intuId;
                    SqlDataAdapter da1 = new SqlDataAdapter(strsql1, connstr);
                    DataSet ds1 = new DataSet();
                    da1.Fill(ds1, "test1");

                    GridView1.DataSource = ds1.Tables["test1"].DefaultView;
                    GridView1.DataBind();

                    DropDownList2.ClearSelection();
                    DropDownList3.ClearSelection();
                }
                else
                {
                    string strsql = "SELECT  * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id INNER JOIN Juxtapose  on Accident.A_style = Juxtapose.A_style inner join APic on APic.A_status=Accident.A_status where U_id = " + intuId + " and Oldman_Data.O_id = " + in_put + "  ORDER BY A_date DESC";
                    SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "test1");
                    GridView1.DataSource = ds.Tables["test1"].DefaultView;
                    GridView1.DataBind();
                    DropDownList2.ClearSelection();
                    DropDownList3.ClearSelection();
                }
            }
            catch (Exception ex)
            {
                GridView1.Columns.Clear();
                GridView1.DataBind();
            }



        }



        

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }





        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {


            try
            {
                string in_put = DropDownList2.SelectedValue;
                string strsql = "SELECT  * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id INNER JOIN Juxtapose  on Accident.A_style = Juxtapose.A_style inner join APic on APic.A_status=Accident.A_status AND U_id = " + intuId + " where Accident.A_style = " + in_put + " ORDER BY A_date DESC";

                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();

                if (in_put == "0")
                {
                    string strsql1 = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id INNER JOIN Juxtapose  on Accident.A_style = Juxtapose.A_style inner join APic on APic.A_status=Accident.A_status  where U_id = " + intuId;
                    SqlDataAdapter da1 = new SqlDataAdapter(strsql1, connstr);
                    DataSet ds1 = new DataSet();
                    da1.Fill(ds1, "test1");

                    GridView1.DataSource = ds1.Tables["test1"].DefaultView;
                    GridView1.DataBind();

                    DropDownList3.ClearSelection();
                    DropDownList1.ClearSelection();

                }



                DropDownList1.ClearSelection();
                DropDownList3.ClearSelection();
            }
            catch (Exception ex)
            {
                GridView1.Columns.Clear();
                GridView1.DataBind();
            }



        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

            string in_put = DropDownList3.SelectedValue;
            if (in_put == "1")
            {
                string strsql = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id INNER JOIN Juxtapose  on Accident.A_style = Juxtapose.A_style inner join APic on APic.A_status=Accident.A_status and U_id = " + intuId + " where A_date>=dateadd(mm, -1 , getdate()) ORDER BY A_date DESC";
                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();

                DropDownList2.ClearSelection();
                DropDownList1.ClearSelection();

            }
            else if (in_put == "2")
            {
                string strsql = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id INNER JOIN Juxtapose  on Accident.A_style = Juxtapose.A_style inner join APic on APic.A_status=Accident.A_status and U_id = " + intuId + " where A_date>=dateadd(mm, -6 , getdate()) ORDER BY A_date DESC";
                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();

                DropDownList2.ClearSelection();
                DropDownList1.ClearSelection();
            }
            else if (in_put == "3")
            {
                string strsql = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id INNER JOIN Juxtapose  on Accident.A_style = Juxtapose.A_style inner join APic on APic.A_status=Accident.A_status and U_id = " + intuId + " where  A_date>=dateadd(yy, -1 , getdate()) ORDER BY A_date DESC";
                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();

                DropDownList2.ClearSelection();
                DropDownList1.ClearSelection();
            }
            else if (in_put == "0")
            {
                if (in_put == "0")
                {
                    string strsql1 = "SELECT * FROM Oldman_Data INNER JOIN Accident on Oldman_Data.O_id = Accident.O_id INNER JOIN Juxtapose  on Accident.A_style = Juxtapose.A_style inner join APic on Apic.A_status=Accident.A_status where U_id = " + intuId;
                    SqlDataAdapter da1 = new SqlDataAdapter(strsql1, connstr);
                    DataSet ds1 = new DataSet();
                    da1.Fill(ds1, "test1");

                    GridView1.DataSource = ds1.Tables["test1"].DefaultView;
                    GridView1.DataBind();

                    DropDownList2.ClearSelection();
                    DropDownList1.ClearSelection();

                }
            }

        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();
            }
        }



    }
}