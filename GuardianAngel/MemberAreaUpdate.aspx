<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberAreaUpdate.aspx.cs" Inherits="GuardianAngel.MemberAreaUpdate" %>

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
          .auto-style4 {
              display: block;
              width: 100%;
              height: calc(2.25rem + 2px);
              font-size: x-large;
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
              <a class="nav-link js-scroll-trigger" style="color:#c95555;" href="#page-top">資料修改</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <section id="r7MemberArea1">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">資 料 修 改</h2>
            <h3 class="section-subheading text-muted">Information Modification</h3>
          </div>
        </div>
          <div class="col-lg-12">
              <form id="contactForm" runat="server">
              <div class="row">
                <div class="" style="margin: 0px auto;">
                    <!--所屬機構-->
                  <div class="form-group">
                    <h3 class="section-r7style text-muted">Organization：</h3>

                      <table class="w-100">
                          <tr>
                              <td class="text-right">
                                  <asp:TextBox ID="tbOrganization" runat="server" CssClass="auto-style4" Font-Bold="True"></asp:TextBox>
                              </td>
                          </tr>
                      </table>
                  </div>
                  <!--名字-->
                  <div class="form-group">
                    <h3 class="section-r7style text-muted">First Name：</h3>                   
                      <table class="w-100">
                          <tr>
                              <td class="text-right">
                                  <strong>
                                  <asp:TextBox ID="tbFname" runat="server" CssClass="auto-style3" Wrap="False" Font-Bold="True"></asp:TextBox>
                                  </strong>
                              </td>
                          </tr>
                      </table>
                  </div>
                  <!--姓氏-->
                  <div class="form-group">
                      <table class="w-100">
                          <tr>
                              <td class="text-right">
                    <h3 class="section-r7style text-muted" style="text-align: left !important">Last Name：</h3>                   
                                  <strong>                   
                                  <asp:TextBox ID="tbLname" runat="server" CssClass="auto-style3" Font-Bold="True"></asp:TextBox>
                                  </strong>
                              </td>
                          </tr>
                      </table>
                  </div>
                  <!--信箱帳號-->
                  <div class="form-group">
                    <h3 class="section-r7style text-muted">Email(Account)：</h3>
                      <table class="w-100">
                          <tr>
                              <td>
                                  <strong>
                                  <asp:TextBox ID="tbEmail" runat="server" CssClass="auto-style3" BackColor="Gray" Enabled="False" Font-Bold="True"></asp:TextBox>
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
                              <td class="text-right">
                                  <strong>
                                  <asp:TextBox ID="tbPhone" runat="server" CssClass="auto-style3" Font-Bold="True" MaxLength="10"></asp:TextBox>
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
                              <td class="text-right">
                                  <asp:TextBox ID="tbAddress" runat="server" CssClass="auto-style4" Font-Bold="True"></asp:TextBox>
                              </td>
                          </tr>
                      </table>
                  </div>
                    
                </div>
                <div class="col-lg-12 text-center">
                    <div style="width:200px; height:80px; display:inline-block;" class="text-center">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary btn-xl text-uppercase" PostBackUrl="~/MemberArea.aspx" OnClick="lbtnSend_Click" Width="170px" ForeColor="Black" style="font-family: 微軟正黑體">取消</asp:LinkButton>
                    </div>
                    <div style="width:200px; height:80px; display:inline-block;" class="text-center">
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary btn-xl text-uppercase" PostBackUrl="~/MemberAreaUpdate.aspx" OnClick="lbtnSend_Click" Width="170px" ForeColor="Black" style="font-family: 微軟正黑體">送出修改</asp:LinkButton>
                    </div>
                </div>
              </div>
              </form>
          </div>
        </div>      
    </section>

   `
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