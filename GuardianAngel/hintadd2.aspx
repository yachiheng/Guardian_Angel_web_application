<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hintadd2.aspx.cs" Inherits="GuardianAngel.hintadd2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>    
<title>Guardian Angel 守護對象資料</title> <!--分頁標題-->
<meta name="description" content=""/>
<meta name="viewport" content="width=device-width"/>
  
    <!-- Bootstrap core CSS -->
     <link href="css/bootstrap.min.css" rel="stylesheet"/>
     <link href="css/bootstrap_02.css" rel="stylesheet"/>

    <!-- Custom fonts for this template -->
    <link href="css/GaCare.css" rel="stylesheet" type="text/css"/>
    <link href="css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'/>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="css/agency_inside.css" rel="stylesheet"/>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/> 
    <link rel="stylesheet" href="css/JCSS2.css"/>


<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="jquery-ui-1.11.2/datepicker-zh-TW.js"></script>
<script src="js/JJS2.js"></script>



<style>
.tableFont{
            width:600px;
            border:3px solid #FFFFFF;
            padding:3px;
            margin:0 auto;            
        }


.rwd{
             overflow-x: auto;
        }
.row {
            margin:0px auto;
} 
.auto-style5 {
            margin-top:10px;
            font-family: 微軟正黑體;
            text-align: center;
            font-size: 350%;
            color: #888888;
            font-weight: bold;
            color: #131314; 
}
.gdstyle{
    text-align:center;
    align-items: center;
}
</style>


</head>

<body >
  <!-- Navigation導覽列 -->
  <form id="Form1" runat="server" class="rwd">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="Homepage.aspx">Guardian Angel</a>
         <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">         
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="hintindex.aspx">溫馨小語</a>
            </li>          
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  href="respondindexV3.aspx">
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="display:inline;">
                      <ContentTemplate>
                          <asp:Timer ID="Timer1" runat="server" Enabled="true" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                          <asp:Label ID="lblBell" runat="server" CssClass="fas fa-bell" style=" color:crimson; "></asp:Label>
                      </ContentTemplate>
                  </asp:UpdatePanel>
                  異常紀錄</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  href="GaCare.aspx">守護對象資料</a>
            </li>
             <li class="nav-item nav-item dropdown">
              <a class="nav-link dropdown-toggle"  href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%Response.Write(Session["Uname"]);%>您好</a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
                      <a class="dropdown-item" href="MemberArea.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';" >會員資料</a>
                      <a class="dropdown-item" href="MemPasUpd01.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';">更改密碼</a>
                      <a class="dropdown-item" href="index.aspx" onclick="signOut()" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';">登出</a>
                  </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>

     <!-- 請輸入自己的 -->
    <section id="testR7">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">新增溫馨小語</h2>
            <h3 class="section-subheading text-muted">Add The Hospital Return Visit</h3>
          </div>
        </div>
       </div>      
    </section>

   <div class="rwd" style=" margin-top: -160px;">               
    <table class="j-table21">      
        <tr>
            <td class="tableTitleFont">請選擇被照護人</td>
            <td align="left">           
            &nbsp&nbsp&nbsp&nbsp
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" Font-Size="X-Large" AppendDataBoundItems="true">
                 <asp:ListItem >請選擇被照護人</asp:ListItem>
            </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="tableTitleFont">發送內容</td>
            <td class="tableCFont">
                <asp:TextBox ID="tbxmessage" runat="server" Height="90%" Width="95%" Font-Size="150%" ForeColor="Black"></asp:TextBox>
            </td>
        </tr>                  
        <tr>
            <td class="tableTitleFont">日期</td>
            <td class="tableCFont">                           
                <asp:TextBox ID="txtConDate" runat="server" Height="90%" Width="95%" Font-Size="150%" ForeColor="Black" OnFocus="javascript:if(this.value=='') this.value='若手動輸入，格式範例：2019/02/22'}" OnBlur="javascript:if(this.value==''){this.value='若手動輸入，格式範例：2019/02/22'}"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="tableCFont"> 
                <asp:Button ID="Button1" CssClass="hospitalButton" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium"  Height="30px" OnClick="btnOK_Click" Text="確定" Width="80px"  />
                <asp:Button ID="Button2" CssClass="hospitalButton" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium"  Height="30px" OnClick="btnCancel_Click" Text="取消" Width="80px"  />
            </td>
        </tr>                        
    </table>
    <p>
        <strong>
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False" CssClass="auto-style1"  Font-Names="微軟正黑體"></asp:Label>
        </strong>
    </p>
  </div>
</form>



    <!--主頁END-->
     <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; 2018 Guardian Angel</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="service list-inline-item ">
                 服務電話 : 07-351-2345 (10AM-6PM)
              </li>               
            </ul>
          </div>
        </div>
      </div>
    </footer>
      <!-- Bootstrap core JavaScript -->
    
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>
</body>
</html>
