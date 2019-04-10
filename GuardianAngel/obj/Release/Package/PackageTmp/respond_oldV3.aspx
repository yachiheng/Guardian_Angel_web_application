<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="respond_oldV3.aspx.cs" Inherits="GuardianAngel.respond_oldV3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>    
<title>Guardian Angel 守護對象資料</title> <!--分頁標題-->
<meta name="description" content=""/>
<meta name="viewport" content="width=device-width"/>
<!--css連結old-->
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
    <link href="css/respond_old.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/JCSS.css"/>


</head>

<body >
 <!-- Navigation導覽列 -->
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
              <a class="nav-link js-scroll-trigger"  href="respondindexV3.aspx">異常紀錄</a>
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

     <!-- 請輸入自己的 -->
    <section id="testR7">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">異 常 紀 錄</h2>
            <h3 class="section-subheading text-muted">Anomalous event record</h3>
          </div>
        </div>
       </div>      
    </section>


    <div class="rwd btp">
         
    <form id="careForm" runat="server">
		

    <!--主頁內容-->
              <!-- Javascripts -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js"></script>
       <script>
        	$('.show-tooltip').tooltip();
        </script>       
		
        
        



    <!--主頁內容-->
        <!-- Javascripts -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js"></script>

        <script>
        	$('.show-tooltip').tooltip();
        </script>       
        
         <table class="nav-justified">        
        <tr>
            <td class="text-center">&nbsp;
                
                <asp:GridView CssClass="j-table"   ID="GridView1" runat="server" AllowPaging="True" CaptionAlign="Bottom" HorizontalAlign="Center" 
                  Width="90%" Height ="95%" ViewStateMode="Enabled" DefaultCellStyle="true" AutoGenerateColumns="false" BorderColor="#E14E4C"
                    HeaderText="修改" ItemStyle-HorizontalAlign="Center" PageIndexChanging="GridView1_PageIndexChanging" RowDataBound="GridView1_RowDataBound" > 
               
                    <EditRowStyle HorizontalAlign="Center" />
                    <EmptyDataRowStyle Font-Size="100%" />
                    <HeaderStyle Font-Bold="True" Font-Overline="False" HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="#131314" BackColor="#FBA28E" />
                    <PagerSettings FirstPageText="第一頁" LastPageText="最終頁" NextPageText="下一頁" PreviousPageText="上一頁" />
                    <RowStyle Font-Size="1em" Height="35px" />

                     <Columns>
                     <asp:BoundField DataField="O_name" HeaderText="姓名" SortExpression="O_name"/>                
<asp:BoundField DataField="A_date" HeaderText="日期" SortExpression="A_date"></asp:BoundField>
<asp:BoundField DataField="J_text" HeaderText="類型" SortExpression="J_text"></asp:BoundField>
                     </Columns>
                     </asp:GridView>
                        
             </td>
        </tr>
      
    </table>

        <table align ="center" style="width:70%;">
            <tr>
                <td><asp:Label ID="Label5" runat="server" Text="緊急聯絡異常"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor=""></asp:Label></td>
                <td align="left"><asp:Label ID="Label6" runat="server" Text=":被照護者端有發出緊急聯絡通訊狀況"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor="#FF3300" ></asp:Label></td>
            </tr>
            <tr>
                <td align:"right"><asp:Label ID="Label7" runat="server" Text="跌倒意外"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor=""></asp:Label></td>
                <td align="left"><asp:Label ID="Label8" runat="server" Text=":被照護者有發生摔倒或是受到超出安全範圍的加速度"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor="#FF3300"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label9" runat="server" Text="超出安全範圍"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor=""></asp:Label></td>
                <td align="left"><asp:Label ID="Label10" runat="server" Text=":被照護者有離開所劃定的安全範圍"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor="#FF3300"></asp:Label></td>
            </tr>
            <tr>
                <td align:"right"><asp:Label ID="Label11" runat="server" Text="未按時服藥"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor=""></asp:Label></td>
                <td align="left"><asp:Label ID="Label12" runat="server" Text=":被照護者沒有在時間內點取服藥按鈕"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor="#FF3300"></asp:Label></td>
            </tr>
        </table>


    </form>
    </div>
    <br/><br/>   <br/><br/>
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
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>
</body>
</html>
