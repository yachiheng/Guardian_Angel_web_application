﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberArea.aspx.cs" Inherits="GuardianAngel.MemberData" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GuardianAngel會員資料</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/agency_inside.css" rel="stylesheet">
    <link href="css/r7style.css" rel="stylesheet" type="text/css" />
   
  </head>

  <body id="page-top">

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
            
            <li class="nav-item nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="GaCare.aspx" id="navbarDropdownMenuLink1"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">照護對象</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" > 
                <a class="dropdown-item" href="GaCare.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';" >被照護者列表</a>
                <a class="dropdown-item" href="OldMedicineRemind_List.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';" >用藥提醒</a>
                <a class="dropdown-item" href="Consolution.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';">回診時間</a>
            </div>
            </li> 
            </li>
               <li class="nav-item">
              <a class="nav-link js-scroll-trigger" style="color:#c95555" href="#page-top">會員資料</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="index.aspx">登出</a> 
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <section id="testR7">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">會 員 資 料</h2>
            <h3 class="section-subheading text-muted">Member Area</h3>
          </div>
        </div>
          <div class="col-lg-12">
              <form id="contactForm" runat="server">
              <div class="row">
                <div class="" style="margin: 0px auto; margin-top:-30px;">
                    <!--機構-->
                  <div class="form-group">
                    <h3 class="section-r7style text-muted">Organization：</h3>
                      <table class="w-100">
                          <tr>
                              <td><strong>
                                  <asp:Label ID="lblNaOfAs" runat="server" CssClass="section-heading text-uppercase" style="font-size: x-large; font-family: 微軟正黑體" Text="機構名稱"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
                      </table>
                  </div>
                    <!--姓名-->
                  <div class="form-group">
                    <h3 class="section-r7style text-muted">Name：</h3>                   
                      <table class="w-100">
                          <tr>
                              <td>
                                  <strong>
                                  <asp:Label ID="lblLname" runat="server" Text="姓氏" CssClass="section-heading text-uppercase" style="font-size: x-large; font-family: 微軟正黑體"></asp:Label>
                                  <asp:Label ID="lblFname" runat="server" Text="名字" CssClass="section-heading text-uppercase" style="font-family: 微軟正黑體; font-size: x-large"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
                      </table>
                  </div>
                  <div class="form-group">
                    <h3 class="section-r7style text-muted">Email(Account)：</h3>
                      <table class="w-100">
                          <tr>
                              <td>
                                  <strong>
                                  <asp:Label ID="lblEmail" runat="server" Text="信箱(帳號)" CssClass="section-heading " style="font-size: x-large; font-family: 微軟正黑體"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
                      </table>
                  </div>
                  <!--密碼-->
                  <div class="form-group">
                    <h3 class="section-r7style text-muted">Password：</h3>
                      <table class="w-100">
                          <tr>
                              <td>
                                  <strong>
                                  <asp:Label ID="lblPassword" runat="server" Text="密碼" CssClass="section-heading " style="font-size: x-large; font-family: 微軟正黑體"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
                      </table>
                  </div>
                  <!--電話-->
                  <div class="form-group">
                    <h3 class="section-r7style text-muted">Phone：</h3>
                      <table class="w-100">
                          <tr>
                              <td><strong>
                                  <asp:Label ID="lblPhone" runat="server" CssClass="section-heading text-uppercase" style="font-size: x-large; font-family: 微軟正黑體" Text="電話"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
                      </table>
                  </div>
                  <!--地址-->
                  <div class="form-group">
                    <h3 class="section-r7style text-muted">Address：</h3>

                      <table class="w-100">
                          <tr>
                              <td><strong>
                                  <asp:Label ID="lblAddress" runat="server" CssClass="section-heading text-uppercase" style="font-size: x-large; font-family: 微軟正黑體" Text="地址(尚未填寫)"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
                      </table>
                  </div>
                    
                </div>
                <div class="clearfix" ></div>
                <div class="col-lg-12 text-center">
                    <div style="width:200px; height:80px; display:inline-block; margin-top:20px;" class="text-center">
                        <asp:LinkButton ID="lbtnUpdate" runat="server" CssClass="btn btn-primary btn-xl text-uppercase" PostBackUrl="~/MemberAreaUpdate.aspx" ForeColor="Black" style="font-size: large; font-family: 微軟正黑體">資料修改</asp:LinkButton>
                    </div>
                    <div style="width:200px; height:80px; display:inline-block; margin-top:20px;" class="text-center">
                        <asp:LinkButton ID="lbtnPassUpdare" runat="server" CssClass="btn btn-primary btn-xl text-uppercase" PostBackUrl="~/MemPasUpd01.aspx" ForeColor="Black" style="font-size: large; font-family: 微軟正黑體">變更密碼</asp:LinkButton>
                    </div>
                </div>
              </div>
              </form>
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
    <script src="js/contact_me.js"></script>
    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>

  </body>

</html>