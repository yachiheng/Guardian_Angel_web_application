using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPro.GA.less
{
    public partial class OldMedicine_Add : System.Web.UI.Page
    {
        int oid;
        int uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            oid = Convert.ToInt32(Session["oId"]);
            uid = Convert.ToInt32(Session["uId"]);
            if (uid == 0)
            {
                Server.Transfer("Login.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    dbLoad();
                }
            }
        }

        protected void dbLoad()
        {
            SqlConnection con = new SqlConnection(@"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30");
            con.Open();
            string strSQL = "select [O_name] from [dbo].[Oldman_Data] where O_id=" + oid;
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataReader reader = cmd.ExecuteReader();
            string strMsg = "";
            while (reader.Read() == true)
            {
                strMsg += string.Format("{0}", reader["O_name"]);
            }
            lblOlderName.Text = strMsg;
            reader.Close();
            con.Close();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            //訊息提示框
            if (tbNname.Text.Equals("")) { btnOK.Attributes["OnClick"] = "return confirm('請填寫藥包名稱')"; return; }
            if (txtTime1.Text.Equals("") && txtTime2.Text.Equals("") && txtTime3.Text.Equals("") && txtTime4.Text.Equals("") && txtTime5.Text.Equals(""))
            {
                btnOK.Attributes["OnClick"] = "return confirm('請只少設定一組用藥時間')"; return;
            }
            if (txtStartDate.Text.Equals("")) { btnOK.Attributes["OnClick"] = "return confirm('請選擇服藥日期')"; return; }
            if (txtEndDate.Text.Equals("")) { btnOK.Attributes["OnClick"] = "return confirm('請選擇服藥日期')"; return; }

            string myMessage = "";
            string myStr = "";
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=yachiheng.database.windows.net;Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            myMessage += oid + ",";
            myMessage += "'" + tbNname.Text + "',";
            myMessage += "'" + txtStartDate.Text + "',";
            myMessage += "'" + txtEndDate.Text + "')";

            if (!txtTime1.Text.Equals(""))
            {
                myStr += "('" + txtTime1.Text + "',@i),";
            }

            if (!txtTime2.Text.Equals(""))
            {
                myStr += "('" + txtTime2.Text + "',@i),";
            }

            if (!txtTime3.Text.Equals(""))
            {
                myStr += "('" + txtTime3.Text + "',@i),";
            }

            if (!txtTime4.Text.Equals(""))
            {
                myStr += "('" + txtTime4.Text + "',@i),";
            }

            if (!txtTime5.Text.Equals(""))
            {
                myStr += "('" + txtTime5.Text + "',@i),";
            }

            myStr = myStr.Substring(0, myStr.Length - 1);


            sds.InsertCommand = "insert into [dbo].[Notice]([O_id],[N_name],[N_startdate],[N_enddate])values(" + myMessage +
                                ";declare @i int; select @i = max([N_id]) from[dbo].[Notice]; insert into Time(T_time, N_id) values" + myStr;

            sds.Insert();
            Response.Redirect("OldMedicine_List.aspx");
        }
        
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("OldMedicine_List.aspx");
        }
        protected void ini()
        {
            tbNname.Text = "";
            txtStartDate.Text = "";
            txtEndDate.Text = "";
        }
    }
}