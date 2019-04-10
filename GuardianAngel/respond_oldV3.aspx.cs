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
    public partial class respond_oldV3 : System.Web.UI.Page
    {
        int intuId = 0;
        string oId = "";
        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            oId = Session["Oid"].ToString();
            intuId = Convert.ToInt32(Session["Uid"]);
            if (intuId == 0)
            {
                Server.Transfer("Login.aspx");

            }
            else
            {
                //load資料
                if (!IsPostBack)
                {
                    SqlConnection conn = new SqlConnection(connstr);
                    string strsql = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id INNER JOIN Juxtapose  on Accident.A_style = Juxtapose.A_style where U_id = " + intuId + " and Oldman_Data.O_id = " + oId + "  ORDER BY A_date DESC";



                    SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "test");


                    GridView1.Font.Bold = true;

                    //GridView
                    GridView1.BorderColor = Color.Red;
                    GridView1.BorderWidth = 2;
                    GridView1.RowStyle.Font.Size = 13;
                    GridView1.RowStyle.Font.Name = "微軟正黑體";
                    GridView1.ForeColor = Color.Black;
                    GridView1.Style.Add("word-break", "keep-all");

                    //標題列
                    //GridView1.HeaderStyle.ForeColor = Color.Black;
                    GridView1.HeaderStyle.Height = 40;
                    GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
                    GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;




                    GridView1.DataSource = ds.Tables["test"].DefaultView;
                    GridView1.DataBind();
                }
            }
        }
    }
    
}