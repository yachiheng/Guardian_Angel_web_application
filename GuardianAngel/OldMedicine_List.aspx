<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldMedicine_List.aspx.cs" Inherits="WebPro.web.mPurpose_master.OldMedicine_List" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>GuardianAngel 用藥提醒</title>
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
    <link href="css/OldMedicine_List.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/JCSS.css"/>


</head>
<body>
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
              <a class="nav-link js-scroll-trigger" href="hintindex.aspx">溫馨小語</a>
            </li>          
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  href="respondindexV3.aspx">
                  <asp:UpdatePanel ID="UpdatePanel2" runat="server" style="display:inline;">
                      <ContentTemplate>
                          <asp:Timer ID="Timer1" runat="server" Enabled="true" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                          <asp:Label ID="lblBell" runat="server"  CssClass="fas fa-bell" style=" color:crimson; "></asp:Label>
                      </ContentTemplate>
                  </asp:UpdatePanel>
                  異常紀錄</a>
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
            <h2 class="section-heading text-uppercase">藥 包 列 表</h2>
            <h3 class="section-subheading text-muted">Medicine Package List</h3>
          </div>
        </div>
       </div>      
    </section>

   <div class="rwd bsstyle">

       <%-- <!--主頁內容-->
        <!-- Javascripts -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js"></script>

        <script>
        	$('.show-tooltip').tooltip();
        </script>       --%>
        <div class="j-title" style="margin-top:-10px;"></div>
         <table class="nav-justified">          
        <tr>
             <td class="text-center" style="text-align:'center';">
    
        &nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <span class="auto-style31"/>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Guardian_Angel %>" SelectCommand="SELECT [N_id], [N_name], [O_id] FROM [Notice]"></asp:SqlDataSource>
                        <asp:GridView ID="GridView1" CssClass="j-table" style="font-size: medium;" runat="server" AllowPaging="True" AutoGenerateColumns="False" CaptionAlign="Bottom" DataKeyNames="N_id" DataSourceID="SqlDataSource1" Height="90%" HorizontalAlign="Center" ViewStateMode="Enabled">
                            <Columns>
                                <asp:TemplateField HeaderText="刪除" InsertVisible="False" SortExpression="N_id">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("N_id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        &nbsp;<asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                        &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("N_id") %>' Visible="False"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="修改">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >
                                            <asp:Image ID="Image2" height="20px"  width="20px" runat="server" ImageUrl="img\edit2.png"  />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="N_name" HeaderText="藥包名稱" SortExpression="N_name">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle HorizontalAlign="Center" />
                            <EmptyDataRowStyle Font-Size="Large" />
                            <HeaderStyle BackColor="#A2CD5A" Font-Bold="True" Font-Size="Large" />
                            <PagerSettings FirstPageText="第一頁" LastPageText="最終頁" NextPageText="下一頁" PreviousPageText="上一頁" />
                            <RowStyle ForeColor="Black" Font-Size="1em" Height="35px" />
                        </asp:GridView>
                        </span>
                        <br />
                        <span class="auto-style31">
                        <asp:Button ID="btnDelete" runat="server" CssClass="gillButton" Font-Bold="True" Font-Names="微軟正黑體"  Font-Size="Medium"  OnClick="btnDelete_Click" Text="刪除" ToolTip="刪除藥包" Height="40px" Width="80px"/>
                         &nbsp; &nbsp;
                        <asp:Button ID="btnAdd" runat="server" CssClass="gillButton" Font-Bold="True" Font-Names="微軟正黑體"  Font-Size="Medium"  OnClick="btnAdd_Click" PostBackUrl="OldMedicine_Add.aspx" Text="新增" ToolTip="新增藥包" Height="40px" Width="80px"/>
                       
                        </span>
                    </ContentTemplate>
                </asp:UpdatePanel>
                 </td>
        </tr>
    </table>
       </div>
           </form>
    <br/><br/>
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
