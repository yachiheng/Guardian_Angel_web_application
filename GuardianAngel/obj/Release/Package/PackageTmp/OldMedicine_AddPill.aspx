<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldMedicine_AddPill.aspx.cs" Inherits="WebPro.web.mPurpose_master.OldMedicine_AddPill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Guardian Angel 用藥提醒</title>
    <!--分頁標題-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <!-- 網站描述 -->
    <meta name="author" content="" />
    <!-- 網站作者 -->

    <!--css連結old-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- //導航列中的bootstrap版面 -->
    <link href="css2/agency_inside.css" rel="stylesheet" />
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous' />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- 影響導航列版面跑左邊，讓表個致中-->
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/OldMedicine_AddPill.css" />
    <link rel="stylesheet" href="css/JCSS.css" />


    <!--圖片放大顯示-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.fancybox.js"></script>
    <link href="css/jquery.fancybox.css" rel="stylesheet" />
    <script type="text/javascript">

        $(".forPopup").fancybox({
            'openEffect': 'elastic',
            'closeEffect': 'elastic',
            'helpers': {
                'title': { 'type': 'inside' },
                'overlay': {
                    'css': { 'background': 'rgba(238,238,238)' }
                }
            }
        });

        $(document).ready(function () {
            $(".various").fancybox({
                maxWidth: 400,
                maxHeight: 300,
                fitToView: false,
                width: '70%',
                height: '70%',
                autoSize: false,
                closeClick: false,
                openEffect: 'none',
                closeEffect: 'none'
            });
        });
    </script>

    <!--圖片放大顯示END-->

    <!--搜尋關鍵字提示功能-->
    <link href="css/jquery-ui.css" rel="stylesheet" />
    <script src="js/jquery-ui.js"></script>
    <script>
        $(function () {
            var availableTags = [

                "喜癒痔軟膏",
                "喜癒痔栓劑",
                "樂瑪可",
                "保可淨散劑",
                "寬心持續性藥效錠",
                "普樂心寧",
                "心達舒錠",
                "亞培心美力盼納補膜衣錠",
                "斯莫克必恩中心靜脈輸注液",
                "心寧美持續性藥效錠",
                "摩舒胃清",
                "安適胃寧液",
                "艾胃逆服咀嚼錠",
                "喜克潰",
                "克林達黴素",
                "愛克樂眼藥水",
                "理冒伯樂止痛錠",
                "寧神平",
                "舒神",
                "神寧健",
                "阿腸克",
                "膚克健",
                "舒膚通膠液",
                "克庖疹錠",
                "汰膚斑乳膏",
                "克流感",
                "千憂解30毫克克",
                "卡貝滋錠",
                "保蓓人類乳突病毒第16/18型疫苗",
                "速汰滋內服液劑",
                "普膚乳膏",
                "膚友錠",
                "安立復30毫克",
                "胃立舒泰",
                "欣胃立康錠",
                "克流感膠囊",
                "易剋冒"
            ];
            $("#tbxSearch").autocomplete({
                source: availableTags
            });
        });
  </script>
    <!--搜尋關鍵字提示功能END-->

    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>

</head>

<body>
    <%-- <p class="j-title"><strong>新增藥品</strong></p>--%>
    <form runat="server">
        <div class="row">
            <div class="col-md-8 col-sm-8 col-xs-12">
                <span>&nbsp</span>
                <asp:TextBox ID="tbxSearch" class="form-control" runat="server" Width="100%"
                    placeholder="輸入藥品關鍵字"
                    title="中文名 英文名 模糊搜尋"></asp:TextBox>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <asp:Button ID="btnSearch" runat="server" class="btn btn-info btn-block" Text="搜尋" OnClick="btnSearch_Click" ForeColor="Black" />

            </div>
            <div class="col-md-2 col-sm-2 col-xs-12">
                <asp:Button ID="btnClear" runat="server" class="btn btn-warning btn-block" Text="清除" OnClick="btnClear_Click" ForeColor="Black" />
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </div>
        <p></p>
        <!--主頁內容-->

        <table class="nav-justified">
            <tr>
                <td class="text-center">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Guardian_Angel %>" SelectCommand="SELECT [P_id], [P_name], [P_remark], [P_photo] FROM [Pill]"></asp:SqlDataSource>
                            <asp:Label ID="lblMessage" runat="server" Font-Size="Medium" ForeColor="Red" Text="Label"></asp:Label>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Guardian_Angel %>" SelectCommand="SELECT * FROM [NPGrouping] WHERE ([N_id] = @N_id)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="N_id" SessionField="nId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="5px" CaptionAlign="Bottom" CellPadding="3" DataKeyNames="P_id,N_id" DataSourceID="SqlDataSource2" HorizontalAlign="Center" ViewStateMode="Enabled">
                                <Columns>
                                    <asp:BoundField DataField="P_id" HeaderText="P_id" ReadOnly="True" SortExpression="P_id" />
                                    <asp:BoundField DataField="N_id" HeaderText="N_id" ReadOnly="True" SortExpression="N_id" />
                                    <asp:BoundField DataField="P_number" HeaderText="P_number" SortExpression="P_number" />
                                </Columns>
                                <EditRowStyle HorizontalAlign="Center" />
                                <EmptyDataRowStyle Font-Size="Large" />
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerSettings FirstPageText="第一頁" LastPageText="最終頁" NextPageText="下一頁" PreviousPageText="上一頁" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                            </asp:GridView>

                            <asp:GridView ID="GridView2" Style="background: rgba(90%,90%,90%,0.5);" runat="server" AutoGenerateColumns="False" CaptionAlign="Bottom" DataKeyNames="P_id" DataSourceID="SqlDataSource1" HorizontalAlign="Center" ViewStateMode="Enabled" CssClass="gdStyle" Width="90%">
                                <Columns>
                                    <asp:TemplateField HeaderText="新增" InsertVisible="False" SortExpression="P_id">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("P_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("P_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="數量">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" Width="48px">
                                                <asp:ListItem Value="1"></asp:ListItem>
                                                <asp:ListItem Value="2"></asp:ListItem>
                                                <asp:ListItem Value="3"></asp:ListItem>
                                                <asp:ListItem Value="4"></asp:ListItem>
                                                <asp:ListItem Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <ItemStyle ForeColor="#003300" Width="80px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="P_name" HeaderText="藥品名稱" SortExpression="P_name"></asp:BoundField>
                                    <asp:TemplateField HeaderText="詳細資訊">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" class="various fancybox.iframe" runat="server" NavigateUrl='<%# Eval("P_id", "OldMedicine_PillRemark.aspx?pid={0}") %>'>
                                               注意事項<br/>
                                           </asp:HyperLink>
                                            <asp:HyperLink ID="deal_VCUCSS" runat="server">
                                          <a id="ahrefclick" class="forPopup"  href="img/p/<%#Eval("P_photo")%>">
                                              <font color="#FF0000">顯示圖片</font>
                                          </a>
                                       </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle HorizontalAlign="Center" />
                                <EmptyDataRowStyle Font-Size="Large" />
                                <EmptyDataTemplate>
                                    <span class="auto-style1">抱歉!!!沒有找到任何紀錄~</span>
                                </EmptyDataTemplate>
                                <HeaderStyle BackColor="#A2CD5A" Font-Size="Medium" Font-Names="新細明體" />
                                <PagerSettings FirstPageText="第一頁" LastPageText="最終頁" NextPageText="下一頁" PreviousPageText="上一頁" />
                            </asp:GridView>
                            <br />
                            <strong>
                        <asp:Button ID="btnOK" CssClass="gillButton" runat="server" Font-Bold="True" Font-Size="Medium"  OnClick="btnOK_Click" Text="確定" Font-Names="微軟正黑體"  Height="40px" Width="80px" ToolTip="新增確定"/>
                        </strong>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </form>
    <!--主頁END-->
</body>
</html>
