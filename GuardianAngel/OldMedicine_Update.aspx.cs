using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class OldMedicine_Update : System.Web.UI.Page
    {
        string uId = "";
        int nid;
        int oid;
        int count;
        int uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            oid = Convert.ToInt32(Session["oId"]);
            nid = Convert.ToInt32(Session["nId"]);
            uid = Convert.ToInt32(Session["uId"]);
            if (uid == 0)
            {
                Server.Transfer("Login.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    dbLoad();
                    txtName.Enabled = false;
                    btnSure.Enabled = false;
                }
            }
        }

        //load資料
        protected void dbLoad()
        {
            SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True;");
            con.Open();
            btnDelete.Attributes["OnClick"] = "return confirm('再一次確認,你確定要刪除這些資料嗎?')";
            string strSQL = "select O_name,N_name,[N_startdate],[N_enddate]" +
                            " from [dbo].[Oldman_Data] a join [dbo].[Notice] b " +
                            " on a.O_id = b.O_id where b.N_id = " + nid;

            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read() == true)
            {
                txtName.Text = string.Format("{0}", reader["O_name"]);
                txtMedicineName.Text = string.Format("{0}", reader["N_name"]);
                txtStartDate.Text = string.Format("{0}", reader["N_startdate"]);
                txtEndDate.Text = string.Format("{0}", reader["N_enddate"]);
            }
            reader.Close();
            string strSQL2 = "select T_time from [dbo].[Time] where N_id ="+ nid;
            SqlCommand cmd2 = new SqlCommand(strSQL2, con);
            reader = cmd2.ExecuteReader();
            String strMsg="";
            if (reader.Read() == true)
            {
                strMsg += string.Format("{0}", reader["T_time"]);
                //if (txtTime1.Text.Equals(""))
                //    txtTime1.Text = string.Format("{0}", reader["T_time"]);
                //else
                //else if (txtTime2.Text.Equals(""))
                //txtTime2.Text = string.Format("{0}", reader["T_time"]);
                //else if (txtTime3.Text.Equals(""))
                //    txtTime3.Text = string.Format("{0}", reader["T_time"]);
                //else if (txtTime4.Text.Equals(""))
                //    txtTime4.Text = string.Format("{0}", reader["T_time"]);
                //else if (txtTime5.Text.Equals(""))
                //    txtTime5.Text = string.Format("{0}", reader["T_time"]);
                //else
                //    return;
            }
            Label2.Text = strMsg;
            reader.Close();
            cmd.Cancel();
            con.Close();
        }
    }
}