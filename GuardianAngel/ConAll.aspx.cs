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
    public partial class ConAll : System.Web.UI.Page
    {
        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        string Cname = "",uId="";
        string Oname = "";
        int intuId = 0;


        protected void Page_Load(object sender, EventArgs e)
        {

            Cname = Session["Cname"].ToString();
            Oname = Session["Oname"].ToString();
            intuId = Convert.ToInt32(Session["Uid"]);
            search();

            if (intuId == 0)
            {
                Server.Transfer("Login.aspx");

            }
            else
            {
                dbLoad();
            }
            btnDelete.Attributes["OnClick"] = "return confirm('確定要刪除嗎?')";

        }

        protected void dbLoad() //load資料
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString);

            SqlCommand cmd = new SqlCommand("SELECT C_name as '診所', C_date as '日期', C_address as '地址',C_phone as '電話',C_number as '診號', O_name as '被照護者' FROM Consulation INNER JOIN Oldman_Data ON Oldman_Data.O_Id = Consulation.O_id where C_name = '" + Cname + "' and O_name = '" + Oname + "' and U_id = " + intuId + " and C_date >= GETDATE() ORDER BY O_name DESC", conn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            conn.Open();

            da.Fill(dt);

            conn.Close();



            DataTable showTB = new DataTable();

            showTB.Columns.Add("內容");

            showTB.Columns.Add("回診資訊");

            //針對Column轉向處理

            for (int i = 0; i < dt.Columns.Count; i++)

            {

                DataRow dr = showTB.NewRow();

                dr["內容"] = dt.Columns[i].Caption;

                dr["回診資訊"] = dt.Rows[0][i].ToString();

                showTB.Rows.Add(dr);

            }

            GridView1.Font.Bold = true;


            GridView1.BorderWidth = 2;
            GridView1.RowStyle.Font.Size = 13;
            GridView1.RowStyle.Font.Name = "微軟正黑體";
            GridView1.Style.Add("word-break", "keep-all");

            GridView1.HeaderStyle.Height = 40;
            GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;

            GridView1.DataSource = showTB;

            GridView1.DataBind();


        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            string sql = "";
            //刪除
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30;";

            sql += "delete  from Consulation where C_name= '" + GridView1.Rows[0].Cells[1].Text + "' and C_number = " + GridView1.Rows[4].Cells[1].Text;

            sds.DeleteCommand = sql;
            sds.Delete();
            Response.Redirect("Consolution.aspx");




        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           
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