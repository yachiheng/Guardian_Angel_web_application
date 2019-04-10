using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class hintadd2 : System.Web.UI.Page
    {
        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        int intuId = 0;
        string uId = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            search();
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
                    string strsql = "SELECT * FROM Oldman_Data WHERE U_id = "+ intuId;

                    SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "test");

                    DropDownList2.DataTextField = "O_name";
                    DropDownList2.DataValueField = "O_id";

                    DropDownList2.DataSource = ds.Tables["test"].DefaultView;
                    DropDownList2.DataBind();


                }
            }
        }



        protected void btnOK_Click(object sender, EventArgs e)
        {
            string in_put = DropDownList2.SelectedValue;

            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";

            sds.InsertCommand = getInsertSql();
            sds.Insert();
            Response.Redirect("hintindex.aspx");


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("hintindex.aspx");
        }

        private string getInsertSql()
        {


            string strSql = "";
            strSql += "Insert into Message(M_message,M_date,O_id) values(";




            int i = Int32.Parse(DropDownList2.SelectedValue);
            //strSql += "'" + path + "',";
            strSql += "'" + tbxmessage.Text + "',";
            strSql += "'" + txtConDate.Text + "',";
            strSql += "'" + DropDownList2.SelectedValue + "')";
            return (strSql);
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