<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gps.aspx.cs" Inherits="GuardianAngel.maptest" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GuardianAngel gps設定</title>
    
 
   <!-- Bootstrap core CSS -->
     <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="css/GaCare.css" rel="stylesheet" type="text/css">
    <link href="css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/agency_inside.css" rel="stylesheet">
    <link href="css/r7style.css" rel="stylesheet" type="text/css" />

    <!-- GoogleMap的css -->
    <link href="css/r7Map.css" rel="stylesheet" type="text/css" />


</head>
<body id="page-top">
    
    <form id="form1" runat="server">
    <!-- Navigation導覽列 -->
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
              <a class="nav-link js-scroll-trigger"  href="GaCare.aspx">被照護者列表</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  href="GaCare_Update.aspx"><% Response.Write(Session["Oldname"].ToString());%>資料</a>
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

    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">GPS 定 位</h2>
            <h3 class="section-subheading text-muted">GPS Positioning</h3>
          </div>
        </div>
          <div style="float:left; margin-right:10px;">
              <table class="w-100">
                  <tr>
                      <td class="text-left">
                          <strong>
                          <asp:Label ID="Label1" runat="server" Text="保護對象名稱：" CssClass="auto-style2" style="font-family: 微軟正黑體; font-size: x-large"></asp:Label>
                          <asp:Label ID="lbName" runat="server" Text="名字" CssClass="auto-style2" style="font-size: x-large; font-family: 微軟正黑體"></asp:Label>
                          </strong>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-left">
                          <strong>
                          <asp:Label ID="Label2" runat="server" Text="保護對象狀態：" CssClass="auto-style2" style="font-family: 微軟正黑體; font-size: x-large"></asp:Label>
                          <asp:Label ID="lbStatus" runat="server" Text="尚未開啟偵測功能" CssClass="auto-style2" style="font-size: x-large; font-family: 微軟正黑體"></asp:Label>
                          </strong>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-left">
                          <strong>
                          <input id="pac-input" placeholder="輸入地點" type="text"onkeypress="if(event.keyCode==13) return false" style="width:60%;"/>
                          </strong>
                      </td>
                  </tr>

              </table>
          </div>
          <div id="map" class="r7MapStyle1"></div>
          <div id="gpsButtons" style="border-width:3px;border-style:outset;border-color:#DDDDDD; padding:5px; background-color:#FFFFFF;">                 
              <asp:ImageButton ID="gpsGeneral" runat="server" ImageUrl="~/img/r7GpsButtonIcons/r7GpsGeneral01.jpg" Width="30px" Height="30px"  OnClientClick="return false" ToolTip="切換為一般地圖模式"/>
              &nbsp
              <asp:ImageButton ID="gpsRect" runat="server" ImageUrl="~/img/r7GpsButtonIcons/r7GpsRect01.jpg" Width="30px" Height="30px" OnClientClick="return false" ToolTip="切換為安全區域選取模式" />
              &nbsp
              <asp:ImageButton ID="gpsSave"  runat="server" ImageUrl="~/img/r7GpsButtonIcons/r7GpsSave01.jpg" Width="30px" Height="30px"  OnClientClick="return false" ToolTip="儲存所有安全區域"  />
              &nbsp
              <asp:ImageButton ID="gpsDelete" runat="server" ImageUrl="~/img//r7GpsButtonIcons/r7GpsDelete01.jpg" Width="30px" Height="30px"  OnClientClick="return false" ToolTip="刪除所選安全區域"/>
              &nbsp
              <asp:ImageButton ID="gpsAllDel" runat="server" ImageUrl="~/img//r7GpsButtonIcons/r7GpsAlldel01.jpg" Width="30px" Height="30px"  ToolTip="刪除所有安全區域" OnClick="gpsAllDel_Click" />
              &nbsp
              <asp:ImageButton ID="gpsNotice" runat="server" ImageUrl="~/img//r7GpsButtonIcons/r7GpsNotice01.jpg" Width="30px" Height="30px"  OnClientClick="return false" ToolTip="啟動警示"/>
              
           </div>
          <!--提示窗內容-->
          <div id="infowindow-content">
            <img src="" width="16" height="16" id="place-icon">
            <span id="place-name" class="title"></span><br>
            <span id="place-address"></span>
          </div>
      </div>
    </section>

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
                 服務電話 : 07-351-2345 (10:00AM-18:00PM)
              </li>               
            </ul>
          </div>
        </div>
      </div>
    </footer>
        
        <script>
             //cs傳過來的值
            var amount =<%=amount%>;
            var amountL =<%=amountL%>;
            var csJsonsData =<%=csJsonsData%>;
            var xLocation =<%=xLocation%>;
            var yLocation =<%=yLocation%>;            
            var oldName = '<%= Session["test"].ToString() %>';
            var Uid = '<%= Session["Uid"].ToString() %>';
            var Oid = '<%= Session["Oid"].ToString() %>';
            
        </script>
      <!-- Bootstrap core JavaScript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>
    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>
        <!-- GoogleMap的js -->
    <script src="js/r7Map.js"></script>
    <script async defer 
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCtew4UfK3oV04WO5uExwq5aTvlkxhYi8Y&callback=initMap&libraries=places,drawing">
    </script>
        
    
    </form>
    
</body>
</html>
