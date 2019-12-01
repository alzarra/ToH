<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<!DOCTYPE html>
<script>
    var height = 0;
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
    <title>Tower to Heaven</title>

</head>
<body>
    <form id="form1" runat="server">
        <div class="grid-container">
            <div class="item1">
                <asp:Button ID="user" runat="server" Text="Login \ Signin" />
                

                <asp:Label ID="header" runat="server" Text="TOWER TO HEAVEN" ></asp:Label>
                

            </div>
            <div class="item2">
                <asp:Label ID="heightLbl" runat="server" Text="Tower Height:"></asp:Label>
                <br />
                <asp:TextBox ID="text" runat="server" disabled style= text-aligned:center></asp:TextBox>
                <br />

                <asp:Label ID="blockLbl" runat="server" Text="Block Height:"></asp:Label>
                <br />
                <asp:TextBox ID="blocktext" runat="server" disabled style= text-aligned:center></asp:TextBox>
                <br />

                <asp:Label ID="goldLbl" runat="server" Text="GOLD:"></asp:Label>
                <br />
                <asp:TextBox ID="goldtext" runat="server" disabled style= text-aligned:center></asp:TextBox>

            </div>
         <div class="item3" href=# onclick="build(10)">

             <br />

                <canvas id="myCanvas" height="500" width="500" ></canvas>

         </div>

            <div class="item4">
          
                <asp:Label ID="workers" runat="server" Text="Workers (-)"></asp:Label>
                <br />
                <asp:Label ID="workersStat" runat="server"  style="color:black;font-size:15px;font-weight:bold"></asp:Label>


                <button type="button" onclick="upgradeOne()">Hire</button>


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
        //dtx.rect(0, 400, 0, 10);
        dtx.stroke();

        
        var gold = 0;
        setInterval(runGold, 1000);
        document.getElementById('goldtext').value = gold;

        //Upgrade One: Workers
        var upgradeOneLevel = 0;
        var upgradeOneCost = 50;
        document.getElementById('workers').textContent = "Workers (" + upgradeOneLevel + ")";
        document.getElementById('workersStat').textContent = upgradeOneCost + " gold | 10cm";

        //Height Restrictions
        var passBK = false;

        function runGold() {
            if (upgradeOneLevel > 0) {
                build(upgradeOneLevel*10);
            }
            gold += Math.floor(towerHeight/100);
            document.getElementById('goldtext').value = gold;
        }

        function build(num) {
            towerHeight = towerHeight + num;
            
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
            else if (towerHeight > 8000) {
                if (passBK == false) {
                    clear();
                    offset = 390 * 3;
                    passBK = true;
                    document.getElementById('blocktext').value = 4000 + "cm";
                    base_image = new Image();
                    base_image.src = 'EVE.png';
                    base_image.onload = function (){
                        ctx.drawImage(base_image, 0, 150);
                    }
                    expand(towerHeight, offset);
                }
                newblockcounter = newblockcounter + num;
                if (newblockcounter >= 4000) {
                    newblockcounter = 0;
                    newblock = newblock + 1;
                    ctx.beginPath();
                    ctx.rect(75+center, 400-(10*newblock), blockWidth, 10);
                    ctx.stroke();
                }

            }

            else if (towerHeight > 400){
                newblockcounter = newblockcounter + num;
                if (newblockcounter >= 400) {
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

        function upgradeOne() {
            if (gold >= upgradeOneCost) {
                gold -= upgradeOneCost;
                upgradeOneLevel += 1;
                upgradeOneCost = Math.floor(upgradeOneCost * 1.2);
                document.getElementById('goldtext').value = gold;
                document.getElementById('workers').textContent = "Workers (" + upgradeOneLevel + ")";
                document.getElementById('workersStat').textContent = upgradeOneCost + " gold | 10cm";
            }
        }


    </script>
</body>
</html>

