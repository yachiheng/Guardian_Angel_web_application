<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hintindex.aspx.cs" Inherits="GuardianAngel.hintindex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GuardianAngel 溫馨小語</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" /><!-- 網站描述 -->
    <meta name="author" content="" /><!-- 網站作者 -->

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
     <link href="css/OldMedicine_List.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/JCSS2.css"/>
   
</head>
<body >
   <!-- Navigation導覽列 -->
   <form id="careForm" runat="server">
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
              <a class="nav-link js-scroll-trigger"  style="color:#c95555;" href="hintindex.aspx">溫馨小語</a>
            </li>          
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  href="respondindexV3.aspx">
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server" style=" display:inline; ">
                      <ContentTemplate>
                          <asp:Timer ID="Timer1" runat="server" Enabled="true" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                          <asp:Label ID="lblBell" runat="server" CssClass="fas fa-bell" style=" color:crimson;"></asp:Label>
                      </ContentTemplate>
                  </asp:UpdatePanel>
                  異常紀錄</a>
            </li>
            
            <li class="nav-item nav-item dropdown">
              <a class="nav-link dropdown-toggle"  href="GaCare.aspx" id="navbarDropdownMenuLink1"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">照護對象 <!-- <i class="test fas fa-bell" id="test"></i> <asp:Label ID="Label1" runat="server" class="test fas fa-bell"></asp:Label>--></a>
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
            <h2 class="section-heading text-uppercase">溫 馨 小 語</h2>
            <h3 class="section-subheading text-muted">Intimate Message</h3>
          </div>
        </div>
       </div>      
    </section>


		<div class="auto-style2"  style="margin-top:-190px;">
			&nbsp;<div class="coming-soon-subscribe container">
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3">
                      
                    </div>
                </div>
			</div>
		</div>
        <div>
           <div  style="text-align:center;">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" AppendDataBoundItems="True" Font-Size="X-Large" onselectedindexchanged="DropDownList1_SelectedIndexChanged"> 
                    <asp:ListItem Value="0">請選擇被照護人(全)</asp:ListItem>
                </asp:DropDownList>         
            </div>
        </div>

    <!--主頁內容-->
         <table class="nav-justified">        
        <tr>
            <td class="text-center">&nbsp;&nbsp;
                    <asp:GridView CssClass="j-table" border="#268aed" ID="GridView1" runat="server" AllowPaging="True" CaptionAlign="Bottom" HorizontalAlign="Center" BorderColor="#066BD0" BackColor="#FFF0F0"
                  Width="90%" Height ="95%"  ViewStateMode="Enabled" DefaultCellStyle="true" HeaderText="修改" ItemStyle-HorizontalAlign="Center" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" PageIndexChanging="GridView1_PageIndexChanging" RowDataBound="GridView1_RowDataBound">                   
                     <HeaderStyle Font-Bold="True"  Font-Overline="False" HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="#131314" BackColor="#99CCFF" /> 
                <Columns>                        
                <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Bdelete" Text="刪除" onclientclick="return confirm('確定要刪除嗎？')" CommandArgument='<%#Eval("M_id") %>' ></asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="編號"  visible="false">
                <ItemTemplate>
                <asp:Label ID="lbl1" runat="server" Text='<%#Eval("M_id") %>' ></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>                 
                <asp:TemplateField HeaderText="日期" >
                <ItemTemplate>
                <asp:Label ID="lbl2" runat="server" Text='<%#Eval("M_date") %>' ></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="被照護者">
                <ItemTemplate>
                 <asp:Label ID="lbl3" runat="server" Text='<%#Eval("O_name") %>' ></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="溫馨小語">
                <ItemTemplate>
                 <asp:Label ID="lbl4" runat="server" Text='<%#Eval("M_message") %>' ></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>         
                
            </Columns>
                    <EditRowStyle HorizontalAlign="Center" />
                    <EmptyDataRowStyle Font-Size="Large" />
                    <PagerSettings FirstPageText="第一頁" LastPageText="最終頁" NextPageText="下一頁" PreviousPageText="上一頁" />
                        
                </asp:GridView>
                <br />
                
                <br />
                 <asp:Button ID="btnAdd" CssClass="hospitalButton" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium"  Height="30px" OnClick="btnAdd_Click" Text="新增" Width="80px" PostBackUrl="hintadd2.aspx" />
                <br />
               
            </td>
            
        </tr>

        <tr>
            <td class="text-center">&nbsp;</td>
        </tr>
        <tr>
            <td class="text-center">&nbsp;</td>
        </tr>
    </table>



    </form>

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
