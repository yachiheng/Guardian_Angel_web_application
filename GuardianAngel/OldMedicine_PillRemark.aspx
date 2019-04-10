<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldMedicine_PillRemark.aspx.cs" Inherits="WebPro.GA.less.OldMedicine_PillRemark" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GuardianAngel 用藥提醒</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" /><!-- 網站描述 -->
    <meta name="author" content="" /><!-- 網站作者 -->
<!--基礎css連結new-->
    <link rel="stylesheet" href="assets/css/fancybox/jquery.fancybox.css"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/bootstrap-theme.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/slippry.css"/>
    <link href="assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/color/default.css"/>
  
   <style>
    body {
        background-color: #A2CD5A;
    }

    div {
        position: absolute;
        top: 50%;
        left: 50%;
        margin-right: -50%;
        transform: translate(-50%, -50%);
    }
   </style>

</head>

<body>
    <form id="form1" runat="server">
    <!--主頁內容-->
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Guardian_Angel %>" SelectCommand="SELECT [P_remark] FROM [Pill] WHERE ([P_id] = @P_id)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="P_id" QueryStringField="pid" Type="Int32" DefaultValue="1" />
                                     </SelectParameters>
                                 </asp:SqlDataSource>
                
            <div >


<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" GroupItemCount="3">
                            <AlternatingItemTemplate>
                                <td runat="server" style="">
                                    <asp:Label ID="P_remarkLabel" runat="server" Text='<%# Eval("P_remark") %>' />
                                    </td>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <td runat="server" style="">P_remark:
                                    <asp:TextBox ID="P_remarkTextBox" runat="server" Text='<%# Bind("P_remark") %>' />
                                    
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                                   
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                                    </td>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>未傳回資料。</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <EmptyItemTemplate>
                       <td runat="server" />
                            </EmptyItemTemplate>
                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server">
                                    <td id="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <InsertItemTemplate>
                                <td runat="server" style="">P_remark:
                                    <asp:TextBox ID="P_remarkTextBox" runat="server" Text='<%# Bind("P_remark") %>' />
                                    
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                                    
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                                    </td>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <td runat="server" style="">&nbsp;<asp:Label ID="P_remarkLabel" runat="server" Text='<%# Eval("P_remark") %>' />
                                   </td>
                            </ItemTemplate>
                            <LayoutTemplate  >
                                <table runat="server" border="0" style="font-size:large;font-family:'Microsoft JhengHei';text-align:left;color:#000;background-color:#A2CD5A">
                                    <tr runat="server">
                                        <td runat="server" >
                                            <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                                <tr id="groupPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style=""></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <td runat="server" style="">
                                    <asp:Label ID="P_remarkLabel" runat="server" Text='<%# Eval("P_remark") %>' />
                                    </td>
                            </SelectedItemTemplate>
                        </asp:ListView>
            </div>  
    </form>
</body>
</html>
