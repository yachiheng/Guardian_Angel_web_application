using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class rectAllDelAPI : System.Web.UI.Page
    {
        string initUid = ""; //字串 初始使用者id Session用
        string initOid = ""; //字串 初始守護對象id Session用

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Uid"] = 1;  //正式使用時刪除
            Session["Oid"] = 1;  //正式使用時刪除
            initUid = Session["Uid"].ToString();
            initOid = Session["Oid"].ToString();
            sqlDataAllDelete();            
        }
        protected void sqlDataAllDelete() {
            SqlDataSource sql = new SqlDataSource();
            sql.ConnectionString = @"Data Source=yachiheng.database.windows.net; Initial Catalog=Guardian_Angel-20190409084017;Persist Security Info=False;User ID=yachiheng;Password=A2xuioiji;MultipleActiveResultSets=False;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30";
            string strSql = "delete from Security where O_id = " + initOid;
            sql.InsertCommand = strSql;
            sql.Insert();


        }
    }
}