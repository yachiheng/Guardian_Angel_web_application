<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GuardianAngel.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<meta name="description" content=""/>
<meta name="author" content=""/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title>GuardianAngel登入</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'/> <!--標題字-->
    <!--icon-->
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'/>
    <link href="css/navgater.min.css" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet" media="all"/>
    <link rel="stylesheet" type="text/css" href="css/registered.css"/>

</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg  fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand " href="index.aspx">Guardian Angel</a>
          <a href="index.aspx">
             <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
             <i class="fas fa-home"></i>
             </button>
          </a>
        <div class="collapse  navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav  ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="index.aspx">回首頁</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <section>
        <div class="container">
            <!--<div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">-->
            <div class="wrapper wrapper--w780">
                <div class="card-3">
                    <div class="card-body">
                        <h2 class="title">歡迎登入<br/>Guardian Angel</h2>
                        <form id="form1" runat="server" method="post">
                            <div class="field-wrap">
                                <label>
                                    Account :
                                </label>
                                <span class="link">
                                    <asp:Label ID="lblErrow" CssClass=""  runat="server" Text="此帳號尚未註冊"></asp:Label>
                                </span>    
                                <br/><br/>              
                                <div class="input-group">
                                     <asp:TextBox ID="txtEmail" class="input--style-3" TextMode="Email" placeholder="電子信箱" required="true" runat="server" ></asp:TextBox>                 
                                </div>
                            </div> 
                            <div class="field-wrap">
                                <label>
                                    Password :
                                </label>
                                <span class="link">
                                    <asp:Label ID="lblPerro" CssClass=""  runat="server" Text="密碼錯誤"></asp:Label>
                                </span>   
                                <br/><br/>                      
                                <div class="input-group">
                                    <asp:TextBox ID="txtPassword" class="input--style-3" TextMode="Password" placeholder="密碼" required="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <span class="link">   
                            <a href="#">忘記密碼?</a>
                            </span>
                            <div class="p-t-10">
                                <asp:Button ID="btnLogin" class="btn btn--pill btn--green" runat="server" Text="登入" OnClick="btnLogin_Click" />
                            </div>
                        </form>
                        <br/>
                        <hr class="new1" />
                        <p class="linked">還沒有帳號? &nbsp;<a href="SignUp.aspx">註冊</a></p>
                     </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Bootstrap core JavaScript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>
</body>
</html>
