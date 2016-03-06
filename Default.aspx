<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
            </td>
            <td>
                小镇进销存系统
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="Test" onclick="javascript: location.href = '/Pages/Test.aspx'"/>
            </td>
        </tr>
    </table>
    </div>
        <asp:Label ID="Lable1" runat="server" onClick="Label1_Click" Text="Test"/>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>

