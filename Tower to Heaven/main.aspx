<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<!DOCTYPE html>
<script>
    var height = 0;
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
    <title>Tower to Heaven</title>

<style type="text/css">
        .auto-style1 {
            width: 36px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="grid-container">
            <div class="item1">
                <asp:Button ID="user" runat="server" Text="Login \ Signin" />
                

                <asp:Label ID="header" runat="server" Text="TOWER OF HEAVEN" ></asp:Label>
                

            </div>
            <div class="item2">
                <asp:Label ID="heightLbl" runat="server" Text="Height:"></asp:Label>
                <br />
                <asp:TextBox ID="text" runat="server" disabled style= text-aligned:center></asp:TextBox>
            </div>
         <div class="item3" >

            &nbsp;<br /><br />

            <div class="block"><a href=# onclick="build()"><img src="block.png"/></a></div>

         </div>
            </div>
    </form>
    <script>
        function build() {
            height = height + 1;
            document.getElementById('text').value = height;
        }
    </script>
</body>
</html>


