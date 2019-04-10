﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GaCare_Add.aspx.cs" Inherits="WebPro.web.mPurpose_master.GaCare_Add" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>    
<title>Guardian Angel 守護對象資料</title> <!--分頁標題-->
<meta name="description" content=""/>
<meta name="viewport" content="width=device-width"/>
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<!--css連結old-->
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

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/> 
<link rel="stylesheet" href="css/JCSS2.css"/>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="js/datepicker-zh-TW.js"></script>
<script src="js/JJS.js"></script>


</head>

<body style="font-family:'微軟正黑體';">
  <!-- Navigation導覽列 -->
     <form id="careForm" runat="server" class="rwd" >
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
                          <asp:Label ID="lblBell" runat="server" CssClass="fas fa-bell" style=" color:crimson; "></asp:Label>
                      </ContentTemplate>
                  </asp:UpdatePanel>     
                  異常紀錄</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  href="#">GPS</a>
            </li>
           <li class="nav-item nav-item dropdown">
              <a class="nav-link dropdown-toggle"  href="GaCare.aspx" id="navbarDropdownMenuLink1"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">照護對象</a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
                       <a class="dropdown-item" href="GaCare.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體'; " >被照護者資料</a>
                      <a class="dropdown-item" href="OldMedicineRemind_List.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';" >用藥提醒</a>
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
      <!-- 結束Navigation導覽列 -->
     <!-- 請輸入自己的 -->
    <section id="testR7">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">新 增 守 護 對 象</h2>
            <h3 class="section-subheading text-muted">Add protected person</h3>
          </div>
        </div>
       </div>      
    </section>


<!---------- GaCare_Add主頁開始 --------------->
   
                    <table class="j-table" style=" margin-top: -160px;" >
                        <tr>
                        <td colspan="2"  class="tableCFont">
                            <asp:Image ID="Image1" runat="server" CssClass="image" Width="20%" ImageAlign="Middle" ImageUrl="~/img/sample.png"/>                                                    
                            <br />
                       </td>
                    </tr>      
                     <tr>
                        <td class="tableTitleFont">選擇照片</td>
                        <td class="tableCFont"  style="text-align:left";>
                            <asp:FileUpload ID="FileUpload1" runat="server" BorderStyle="NotSet" Width="100%"/>
                            <br />
                            <asp:Button ID="btnChangePic" runat="server" Text="預覽" CssClass="btn-event" OnClick="btnChangePic_Click" />
                            　<asp:Button ID="btnCancelPic" runat="server" Text="取消" CssClass="btn-event" OnClick="btnCancelPic_Click" />

                            <asp:Label ID="Label1" runat="server" CssClass="tableMsg"></asp:Label>

                        </td>
                    </tr>       

                    <tr>
                        <td class="tableTitleFont">編號</td>
                        <td class="tableCFont">
                            <asp:TextBox ID="tbxId" runat="server" Width="100%" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>                    
                    <tr>
                        <td class="tableTitleFont">姓名</td>
                        <td  class="tableCFont">
                            <asp:TextBox ID="tbxName" runat="server" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                           <tr>
                        <td class="tableTitleFont">生日</td>
                        <td  class="tableCFont">
                            <asp:TextBox ID="tbxBirth" runat="server" Width="100%"
                             OnFocus="javascript:if(this.value=='') {this.value='若手動輸入，格式範例：2019/02/22'}"
                             OnBlur="javascript:if(this.value==''){this.value='若手動輸入，格式範例：2019/02/22'}"></asp:TextBox>
                        </td>
                    </tr>
                        <tr>
                        <td class="tableTitleFont">電話</td>
                        <td  class="tableCFont">
                            <asp:TextBox ID="tbxPhone" runat="server" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="tableTitleFont">血型</td>
                        <td class="tableCFont">
                            <asp:DropDownList ID="DdBlood" runat="server" Width="100%">
                                <asp:ListItem Value="A">A型</asp:ListItem>
                                <asp:ListItem Value="B">B型</asp:ListItem>
                                <asp:ListItem Value="O">O型</asp:ListItem>
                                <asp:ListItem Value="AB">AB型</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                         <tr>
                        <td class="tableTitleFont">疾病</td>
                        <td class="tableCFont">
                            <asp:TextBox ID="tbxDisease" runat="server" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="tableTitleFont">地址</td>
                        <td class="tableCFont">
                            <asp:TextBox ID="tbxAddress" runat="server" Width="100%" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                            <tr>
                        <td class="tableTitleFont">QRCODE</td>
                        <td  class="tableCFont">
                            <asp:Image ID="imgQrcode" runat="server" Height="150px" Width="150px" AlternateText="（新增後將產生QRCode）" ForeColor="#6600FF" BorderColor="#FF99CC" BorderWidth="2px" ImageUrl="~/img/noQR.png"  />
                        </td>
                    </tr>
                    <tr>
                       <td colspan="2" class="tableMsg">
                         *可利用被守護者手機，在app中掃瞄QRCODE，即可將被守護者資料自動登入
                           </td>   
                        </tr>
                   
                      <tr>
                       <td colspan="2" class="tableCFont"> 
                         <asp:Button ID="btnOK" runat="server" CssClass="btn-event"  Height="50px" Width="20%" OnClick="btnOK_Click" Text="確定"  /> 
                           <asp:Button ID="btnNext" runat="server" CssClass="btn-event" Height="50px" Width="20%" OnClick="btnNext_Click" Text="再新增" Visible="False" />
                         
                            &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="btn-event" Height="50px" Width="20%" OnClick="btnCancel_Click" Text="取消" />
                            &nbsp;<asp:Button ID="btnBack" runat="server" CssClass="btn-event" Height="50px" Width="20%" OnClick="btnBack_Click" Text="返回" />
                     
                           </td>
                          </tr>
              </table>
           
    </form>

<!---------- GaCare_Add主頁結束 --------------->

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
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>
</body>
</html>
