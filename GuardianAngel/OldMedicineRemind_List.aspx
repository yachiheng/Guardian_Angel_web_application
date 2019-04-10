<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldMedicineRemind_List.aspx.cs" Inherits="WebPro.web.mPurpose_master.OldMedicineRemind_List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GuardianAngel 用藥提醒</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width"/>
<!--css-->
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
    <link rel="stylesheet" href="css/OldMedicineRemind_List.css"/>
    <link rel="stylesheet" href="css/JCSS.css"/>
    

</head>
<body >
  <!-- Navigation導覽列 -->
  <form id="careForm" runat="server" >
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
                  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                      <ContentTemplate>
                          <asp:Timer ID="Timer1" runat="server" Enabled="true" Interval="5000" OnTick="Timer1_Tick" ></asp:Timer>
                          <asp:Label ID="lblBell" runat="server" CssClass="fas fa-bell" style=" color:crimson; "></asp:Label>
                      </ContentTemplate>
                  </asp:UpdatePanel>
                  異常紀錄</a>
            </li>
            
            <li class="nav-item nav-item dropdown">
              <a class="nav-link dropdown-toggle"  href="GaCare.aspx" id="navbarDropdownMenuLink"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">守護對象 <!-- <i class="test fas fa-bell" id="test"></i> <asp:Label ID="Label1" runat="server" class="test fas fa-bell"></asp:Label>--></a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
                       <a class="dropdown-item" href="GaCare.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';" >被照護者資料</a>
                      
                      <a class="dropdown-item" href="Consolution.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';">回診時間</a>
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
            <h2 class="section-heading text-uppercase">今 日 用 藥 提 醒</h2>
            <h3 class="section-subheading text-muted">Use Medicine Today To Remind</h3>
          </div>
        </div>
       </div>      
    </section>
  


        <div style="margin-top:-160px;"> 
                        <span class="auto-style31"/>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Guardian_Angel %>" SelectCommand="SELECT a.O_id,a.O_name as 照護對象 , b.N_name as 藥包名稱, c.T_time AS 用藥時間 FROM Oldman_Data AS a INNER JOIN Notice AS b INNER JOIN Time AS c ON b.N_id = c.N_id ON a.O_id = b.O_id 
                                               WHERE  getdate() between [N_startdate] and [N_enddate] and (U_id=@U_id)
                                               ORDER BY c.T_time">
                            <SelectParameters>
                                <asp:SessionParameter Name="U_id" SessionField="uId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Guardian_Angel %>" SelectCommand="SELECT [O_name] FROM [Oldman_Data] A join [dbo].[User_Data] B on A.U_id=B.U_id where (A.U_id=@U_id)">
                            <SelectParameters>
                                <asp:SessionParameter Name="U_id" SessionField="uId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                 </span>
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
            <td class="auto-style6">
                        <span class="auto-style31"/>
     <div align="center">
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
                        <span class="auto-style31"/>
                        &nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="O_name" DataValueField="O_name" Font-Size="Medium" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">                
                   <asp:ListItem Value="0">全選</asp:ListItem>
                 </asp:DropDownList>
                     <br/>
                        <br />
                 <asp:GridView ID="GridView1" style="font-size: medium;background: rgba(90%,90%,90%,0.7);" runat="server" AutoGenerateColumns="False" CaptionAlign="Bottom" CssClass="j-table" DataKeyNames="O_id" DataSourceID="SqlDataSource1" HorizontalAlign="Center" ViewStateMode="Enabled" Height="95%">
                     <Columns>
                         <asp:BoundField DataField="照護對象" HeaderText="照護對象" SortExpression="照護對象" >
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:TemplateField HeaderText="藥包名稱" SortExpression="藥包名稱">
                             <ItemTemplate>

                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("藥包名稱") %>'>

                                 </asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:BoundField DataField="用藥時間" HeaderText="用藥時間" ReadOnly="True" SortExpression="用藥時間">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                     </Columns>
                     <EditRowStyle HorizontalAlign="Center" />
                     <EmptyDataRowStyle Font-Size="Large" />
                     <EmptyDataTemplate>
                         目前無任何資料!
                     </EmptyDataTemplate>
                     <HeaderStyle Height="50px" BackColor="#A2CD5A" ForeColor="Black" />
                     <PagerSettings FirstPageText="第一頁" LastPageText="最終頁" NextPageText="下一頁" PreviousPageText="上一頁" />
                     <RowStyle Font-Size="1em" Height="35px" ForeColor="Black" />
                 </asp:GridView>
              <span/>
                        </span></span>
             </ContentTemplate>
         </asp:UpdatePanel>
      </div>
        </tr>
    </table>
   </div>
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
