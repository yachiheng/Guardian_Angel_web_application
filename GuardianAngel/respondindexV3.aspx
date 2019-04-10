<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="respondindexV3.aspx.cs" Inherits="GuardianAngel.respondindexV3" %>

<!DOCTYPE html>
<html lang="zh-tw">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>    
<title>Guardian Angel 守護對象資料</title> <!--分頁標題-->
<meta name="description" content=""/>
<meta name="viewport" content="width=device-width"/>

     <!-- Bootstrap core CSS -->
     <link href="css/bootstrap.min.css" rel="stylesheet">
     <link href="css/bootstrap_02.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="css/GaCare.css" rel="stylesheet" type="text/css">
    <link href="css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/agency_inside.css" rel="stylesheet">
    <link href="css/respond_old.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/JCSS2.css"/>

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
              <a class="nav-link js-scroll-trigger"  style="color:#c95555;"  href="respondindexV3.aspx">異常紀錄</a>
            </li>
            
            <li class="nav-item nav-item dropdown">
              <a class="nav-link dropdown-toggle"  href="GaCare.aspx" id="navbarDropdownMenuLink1"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">照護對象 </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
                       <a class="dropdown-item" href="GaCare.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';" >被照護者資料</a>
                      <a class="dropdown-item" href="OldMedicineRemind_List.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';" >用藥提醒</a>
                      
                  </div>
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
            <h2 class="section-heading text-uppercase">異 常 事 件 紀 錄</h2>
            <h3 class="section-subheading text-muted">Anomalous event record</h3>
          </div>
        </div>
       </div>      
    </section>
    <!-- 導覽列結束 end Navbar -->


    <div class="rwd" style=" margin-top: -160px;">
         
    <form id="careForm" runat="server">	

    <!--主頁內容-->
              <!-- Javascripts -->      		
        <div>
            <table>
                
                    <td class="auto-style52" align="center">
                        
                        <asp:DropDownList ID="DropDownList1" runat="server"          AutoPostBack="True" AppendDataBoundItems="True" Font-Size="X-Large" onselectedindexchanged="DropDownList1_SelectedIndexChanged" Font-Names="微軟正黑體"> 
                        <asp:ListItem Value="0">請選擇被照護人(全)</asp:ListItem>    
                         </asp:DropDownList>        
                                  
                         <asp:DropDownList ID="DropDownList2" runat="server"            AutoPostBack="True" AppendDataBoundItems="True" Font-Size="X-Large" onselectedindexchanged="DropDownList2_SelectedIndexChanged" Font-Names="微軟正黑體"> 
                        <asp:ListItem Value="0">請選擇事件類型(全)</asp:ListItem>
                         </asp:DropDownList>        
                                 
                         <asp:DropDownList ID="DropDownList3" runat="server"            AutoPostBack="True" AppendDataBoundItems="True" Font-Size="X-Large" onselectedindexchanged="DropDownList3_SelectedIndexChanged" Font-Names="微軟正黑體"> 
                        <asp:ListItem Value="0">請選擇時間期限(全)</asp:ListItem>
                        <asp:ListItem Value="1">顯示一個月</asp:ListItem>
                        <asp:ListItem Value="2">顯示半年</asp:ListItem>
                        <asp:ListItem Value="3">顯示一年資料</asp:ListItem>
                             
                        </asp:DropDownList>

                    </td>
                 
                </table>
        </div>
    <!--主頁內容-->

         <table class="nav-justified">        
        <tr>
            <td class="text-center">&nbsp;
                <asp:GridView CssClass="j-table"   ID="GridView1" runat="server" AllowPaging="True" CaptionAlign="Bottom" HorizontalAlign="Center" BorderColor="#E14E4C"
                  Width="90%" Height ="95%"  ViewStateMode="Enabled" DefaultCellStyle="true" HeaderText="修改" ItemStyle-HorizontalAlign="Center" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" RowDataBound="GridView1_RowDataBound">                   
                     <HeaderStyle Font-Bold="True"  Font-Overline="False" HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="#131314" BackColor="#fba28e"  />
                    <Columns>                 
                <asp:TemplateField HeaderText="狀態">
                <ItemTemplate>                    
                <asp:Image ID="img" runat="server" ImageUrl='<%# "~//img//"+ Eval("A_pic") %>' Height="60"  Width="70"></asp:Image>
                </ItemTemplate>
                </asp:TemplateField>    
                <asp:TemplateField HeaderText="被照護者">
                <ItemTemplate>
                 <asp:Label ID="lbl3" runat="server" Text='<%#Eval("O_name") %>' ></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                  
                <asp:TemplateField HeaderText="日期" >
                <ItemTemplate>
                <asp:Label ID="lbl2" runat="server" Text='<%#Eval("A_date") %>' ></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="類型">
                <ItemTemplate>
                 <asp:Label ID="lbl4" runat="server" Text='<%#Eval("J_text") %>' ></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                 
            </Columns>
                    <EditRowStyle HorizontalAlign="Center" />
                    <EmptyDataRowStyle Font-Size="Large" />
                    
                       
                </asp:GridView>
               
                <br />               
               
            </td>
            
        </tr>       
    </table>
        <table class="tbd">
            <tr>
                <td><asp:Label ID="Label5" runat="server" Text="緊急聯絡異常"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor=""></asp:Label></td>
                <td align="left"><asp:Label ID="Label6" runat="server" Text=":被照護者端有發出緊急聯絡通訊狀況"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor="#FF3300"></asp:Label></td>
            </tr>
            <tr>
                <td align:"right"><asp:Label ID="Label1" runat="server" Text="跌倒意外"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor=""></asp:Label></td>
                <td align="left"><asp:Label ID="Label7" runat="server" Text=":被照護者有發生摔倒或是受到超出安全範圍的加速度"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor="#FF3300"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="超出安全範圍"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor=""></asp:Label></td>
                <td align="left"><asp:Label ID="Label2" runat="server" Text=":被照護者有離開所劃定的安全範圍"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor="#FF3300"></asp:Label></td>
            </tr>
            <tr>
                <td align:"right"><asp:Label ID="Label4" runat="server" Text="未按時服藥"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor=""></asp:Label></td>
                <td align="left"><asp:Label ID="Label8" runat="server" Text=":被照護者沒有在時間內點取服藥按鈕"  CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="medium" ForeColor="#FF3300"></asp:Label></td>
            </tr>
        </table>

    </form>
    </div>
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
