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
                <asp:Label ID="heightLbl" runat="server" Text="Tower Height:"></asp:Label>
                <br />
                <asp:TextBox ID="text" runat="server" disabled style= text-aligned:center></asp:TextBox>
                <br />
                <asp:Label ID="blockLbl" runat="server" Text="Block Height:"></asp:Label>
                <br />
                <asp:TextBox ID="blocktext" runat="server" disabled style= text-aligned:center></asp:TextBox>

            </div>
         <div class="item3" href=# onclick="build()">

            <br /><br />

                <canvas id="myCanvas" height="500" width="500" ></canvas>

         </div>
            </div>
    </form>
    <script>
        var c = document.getElementById("myCanvas");
        var ctx = c.getContext("2d");
        var dtx = c.getContext("2d");
        towerHeight = 0;
        document.getElementById('text').value = towerHeight + "cm";
        document.getElementById('blocktext').value = 10 + "cm";
        newblock = 0;
        newblockcounter = 0;

        base_image = new Image();
        base_image.src = 'me.png';
        base_image.onload = function () {
            ctx.drawImage(base_image, 250, 230);
        }

        
        blockWidth = 150;
        offset = 0;
        width = 150;
        center = 0;

        ctx.rect(75, 400, blockWidth, 0);
        ctx.stroke();
        dtx.rect(0, 400, blockWdith, 10);
        dtx.stroke();

        function build() {
            towerHeight = towerHeight + 10;
            
            document.getElementById('text').value = towerHeight + "cm";

            if (towerHeight == 400) {
                clear();
                offset = 390;
                blockWidth = 75;
                center = 37
                document.getElementById('blocktext').value = 400 + "cm";
                newblock = newblock + 1;
                base_image = new Image();
                 base_image.src = 'BK.png';
                 base_image.onload = function () {
                    ctx.drawImage(base_image, 150, 80);
        }
            
                expand(towerHeight, offset);
            }
            if (towerHeight > 400)
            {
                newblockcounter = newblockcounter + 10;
                if (newblockcounter == 400) {
                    newblockcounter = 0;
                    newblock = newblock + 1;
                    ctx.beginPath();
                    ctx.rect(75+center, 400-(10*newblock), blockWidth, 10);
                    ctx.stroke();
                }
            }
            else {
                expand(towerHeight, offset);
            }
        }

        function expand(x, y) {
            ctx.beginPath();
            ctx.rect(75+center, 400 - x + y, blockWidth, 10);
            ctx.stroke();
        }

        function clear() {
            ctx.clearRect(0, 0, c.width, c.height);
        }
    </script>
</body>
</html>

