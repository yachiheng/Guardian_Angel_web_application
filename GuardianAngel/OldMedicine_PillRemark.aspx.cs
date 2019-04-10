using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPro.GA.less
{
    public partial class OldMedicine_PillRemark : System.Web.UI.Page
    {
        int uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            uid = Convert.ToInt32(Session["uId"]);
            if (uid == 0)
            {
                Server.Transfer("Login.aspx");
            }
        }
    }
}