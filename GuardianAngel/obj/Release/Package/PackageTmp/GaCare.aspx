<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GaCare.aspx.cs" Inherits="WebPro.web.mPurpose_master.GaCare" %>

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
    <link href="css/r7style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/JCSS2.css"/>


</head>

<body >
   <!-- Navigation導覽列 -->
    <form runat="server">
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
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server" style=" display:inline;">
                      <ContentTemplate>
                          <asp:Timer ID="Timer1" runat="server" Enabled="true" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                          <asp:Label ID="lblBell" runat="server" CssClass="fas fa-bell" style=" color:crimson; " ></asp:Label>
                      </ContentTemplate>
                  </asp:UpdatePanel>                  
                  異常紀錄</a>
            </li>
            
            <li class="nav-item nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="GaCare.aspx" id="navbarDropdownMenuLink1"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">照護對象 <!-- <i class="test fas fa-bell" id="test"></i> <asp:Label ID="Label1" runat="server" class="test fas fa-bell"></asp:Label>--></a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >                      
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
            <h2 class="section-heading text-uppercase">被 照 護 者 資 料</h2>
            <h3 class="section-subheading text-muted">Protected Information</h3>
          </div>
        </div>
       </div>      
    </section>

<!---------- GaCare主頁開始 --------------->

<div class="rwd" style=" margin-top: -180px;">

        <div><br />
            <asp:TextBox ID="tbxSearch" class="j-search-font" runat="server" Text=" 輸入關鍵字查詢"
                OnFocus="javascript:if(this.value==' 輸入關鍵字查詢') {this.value=''}"
                OnBlur="javascript:if(this.value==''){this.value=' 輸入關鍵字查詢'}"></asp:TextBox> 
            <asp:Button ID="btnSearch" runat="server" class="btn-search" Text="查詢" OnClick="btnSearch_Click" />
        </div> <br /><br />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $('.show-tooltip').tooltip();
        </script>
        <asp:GridView CssClass="j-table" ID="GridView1" runat="server" AllowPaging="True" CaptionAlign="Bottom" HorizontalAlign="Center" 
                  Width="90%" Height ="95%" ViewStateMode="Enabled" OnPageIndexChanging="GridView1_PageIndexChanging" 
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    HeaderText="修改" ItemStyle-HorizontalAlign="Center" CellSpacing="5" > 
                   <Columns>
                         <asp:TemplateField HeaderText="刪除">
                             <EditItemTemplate>
                                 <asp:CheckBox ID="CheckBox1" runat="server" />
                             </EditItemTemplate>
                            <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:CommandField HeaderText="修改" SelectText="修改" ShowCancelButton="False" ShowSelectButton="True" ButtonType="Image" CancelImageUrl="~/img/edit.png" SelectImageUrl="~/img/edit2.png" ControlStyle-Width="20px" >
                            <ControlStyle Width="18px"></ControlStyle>

                         <HeaderStyle   HorizontalAlign="Center" VerticalAlign="Middle" />
                         <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                         </asp:CommandField>
                    </Columns>
                    <EditRowStyle HorizontalAlign="Center" />
                    <EmptyDataRowStyle Font-Size="100%" />
                    <HeaderStyle Font-Bold="True" Font-Overline="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#F8BECF" Font-Size="Large" Font-Underline="False" />
                    <PagerSettings FirstPageText="第一頁" LastPageText="最終頁" NextPageText="下一頁" PreviousPageText="上一頁" />
                    <RowStyle Font-Size="1em" Height="35px" />
                   </asp:GridView>
                <br /><br />
                <asp:Button ID="btnAdd" runat="server" CssClass="btn-event"  Font-Bold="True" OnClick="btnAdd_Click" Text="新增" PostBackUrl="GaCare_Add.aspx" />
                　<asp:Button ID="btnUpdate" runat="server"  OnClick="btnUpdate_Click" Text="修改" Visible="False" CssClass="btn-event" />
                　<asp:Button ID="btnDelete" runat="server"  OnClick="btnDelete_Click" Text="刪除" CssClass="btn-event"/>
              
                <asp:Label ID="lblMsg" runat="server" Text="Label" CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" ForeColor="#FF3300" Visible="False"></asp:Label>                     
        
    </div>

    </form>
<!---------- GaCare主頁結束 --------------->

    <br/><br/>

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
