using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class Homepage : System.Web.UI.Page
    {
        string Uid ;
    
        protected  void  Page_Load(object sender, EventArgs e)
        {
            lblBell.Visible = false;
            Uid = Session["Uid"].ToString();
            search();
         
        }

        protected void search() {
            SqlConnection conn = new SqlConnection("Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
            SqlCommand cmd = null;
            string sql = "SELECT a.A_status FROM Accident as a INNER JOIN Oldman_Data as o ON a.O_id = o.O_id WHERE o.U_id =" + Uid + "AND a.A_status = 1";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read() == true)
            {
                Response.Write("<script>alert('偵測到新異常紀錄！');</script>");
                lblBell.Visible = true;
            }
            else {
                lblBell.Visible = false;
            }
            reader.Close();
            conn.Close();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
            SqlCommand cmd = null;
            string sql = "SELECT a.A_status FROM Accident as a INNER JOIN Oldman_Data as o ON a.O_id = o.O_id WHERE o.U_id =" + Uid + "AND a.A_status = 1";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() == true)
            {
               lblBell.Visible = true;
                Session["accident"] = "true";
            }
            else
            {
               lblBell.Visible = false;
                Session["accident"] = "false";
            }
            reader.Close();
            conn.Close();
        }
    }
}