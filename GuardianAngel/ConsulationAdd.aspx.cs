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
    public partial class ConsulationAdd : System.Web.UI.Page
    {
        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        int intuId = 0;
        string uId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            search();
            tbTime.Text = "18:00";
            tbTime.Attributes.Add("onFocus", "this.value=''");

            intuId = Convert.ToInt32(Session["Uid"]);

            if (intuId == 0)
            {
                Server.Transfer("sign_in.aspx");

            }
            else
            {
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
                }
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        protected void btnOK_Click(object sender, EventArgs e)
        {

            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30;";

            sds.InsertCommand = getInsertSql();
            sds.Insert();

            lblMsg.Visible = true;
            lblMsg.Text = "新預約【" + tbxClinic.Text + "】資料新增成功！";
            btnOK.Enabled = false;

        }

        private string getInsertSql()
        {
            string strSql = "";
            strSql += "Insert into Consulation(C_name,C_address,C_date,C_phone,C_number,C_time,O_id) values(";

            int i = Int32.Parse(DropDownList1.SelectedValue);
            strSql += "'" + tbxClinic.Text + "',";
            strSql += "'" + tbxAddress.Text + "',";
            strSql += "'" + txtConDate.Text + "',";
            strSql += "'" + TextBox1.Text + "',";
            strSql += "'" + TextBox2.Text + "',";
            strSql += "'" + tbTime.Text + "',";
            strSql += "'" + DropDownList1.SelectedValue + "')";
            return (strSql);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ini();
            return;
        }

        protected void ini()
        {
            tbxClinic.Text = "";
            tbxAddress.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            tbTime.Text = "";

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Consolution.aspx");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            btnOK.Enabled = true;
            ini();
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