<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemPasUpd01.aspx.cs" Inherits="GuardianAngel.MemPasUpd01" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GuardianAngel會員資料</title>

  <!-- Bootstrap core CSS -->
    <link href="css2/bootstrap.min.css" rel="stylesheet">

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


      <style type="text/css">
          .auto-style3 {
              display: block;
              width: 100%;
              height: calc(2.25rem + 2px);
              font-size: x-large;
              font-weight: 400;
              line-height: 1.5;
              color: #495057;
              background-clip: padding-box;
              border-radius: .25rem;
              transition: none;
              border: 1px solid #ced4da;
              background-color: #fff;
              font-family: 微軟正黑體;
          }
          </style>


      </head>

  <body id="page-top">
    <!-- Navigation導覽列 -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Guardian Angel</a>
         <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="MemberArea.aspx">會員資料</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" style="color:#c95555;" href="#page-top">修改密碼</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <section id="r7MemberArea1">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">修 改 密 碼</h2>
            <h3 class="section-subheading text-muted">Password Replacement</h3>
          </div>
        </div>
          <div class="col-lg-12">
              <form id="contactForm" runat="server" defaultbutton="lbtnSend">
              <div class="row">
                <div class="" style="margin: 0px auto;">
                  <!--密碼-->
                  <div class="form-group">
                    <h3 class="section-heading" style="font-family: 微軟正黑體">請輸入原密碼：</h3>
                      <table class="w-100">
                          <tr>
                              <td class="text-right">
                                  <strong>
                                      <asp:TextBox ID="tbPassword" runat="server" CssClass="auto-style3" Font-Bold="True" TextMode="Password"></asp:TextBox>
                                  </strong>
                              </td>
                          </tr>
                      </table>
                      <table class="w-100">
                          <tr>
                              <td>
                                  <asp:Label ID="lblPassError" runat="server" ForeColor="#CC0000"></asp:Label>
                              </td>
                          </tr>
                      </table>
                  </div>
                </div>
                <div class="col-lg-12 text-center">
                    <div style="width:200px; height:80px; display:inline-block;" class="text-center">
                        <asp:LinkButton ID="lbtnCancel" runat="server" CssClass="btn btn-primary btn-xl text-uppercase" PostBackUrl="~/MemberArea.aspx" ForeColor="Black" style="font-size: large; font-family: 微軟正黑體">取消</asp:LinkButton>
                    </div>
                    <div style="width:200px; height:80px; display:inline-block;" class="text-center">
                        <asp:LinkButton ID="lbtnSend" runat="server" CssClass="btn btn-primary btn-xl text-uppercase" ForeColor="Black" style="font-size: large; font-family: 微軟正黑體" OnClick="lbtnSend_Click">確認</asp:LinkButton>
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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>
  </body>

</html>
