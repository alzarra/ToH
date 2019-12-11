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
                <asp:Label ID="UserID" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="UserName" runat="server" Visible="False"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                

                <asp:Label ID="header" runat="server" Text="TOWER TO HEAVEN" ></asp:Label>
                

                <asp:Button ID="user" runat="server" Text="Load / Sign Up" OnClick="user_Click" />
                

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
                <br />
                _____________
                <br />
                <asp:Label ID="trucks" runat="server" Text="Trucks (-)"></asp:Label>
                <br />
                <asp:Label ID="trucksStat" runat="server"  style="color:black;font-size:15px;font-weight:bold"></asp:Label>
                <button type="button" onclick="upgradeTwo()">Hire</button>
                <br />
                _____________
                <br />
                <asp:Label ID="cranes" runat="server" Text="Cranes (-)"></asp:Label>
                <br />
                <asp:Label ID="cranesStat" runat="server"  style="color:black;font-size:15px;font-weight:bold"></asp:Label>
                <button type="button" onclick="upgradeThree()">Hire</button>


            </div>
            </div>
    </form>
    <script>
        var c = document.getElementById("myCanvas");
        var ctx = c.getContext("2d");
        var dtx = c.getContext("2d");
        towerHeight = 0; //FOR ALI!!!! THIS ONE
        var gameStage = 1;
        document.getElementById('text').value = towerHeight + "cm";
        document.getElementById('blocktext').value = 20 + "cm";

        var blockHeight = 20;
        var currentBlockHeight = 0;
        var heightStage = 0;

        base_image = new Image();
        base_image.src = 'Stage1.png';
        base_image.onload = function () {
            dtx.drawImage(base_image, 0, 0);
        }

        //Gold Variable
        var gold = 0; //FOR ALI!!!! THIS ONE
        setInterval(runGold, 1000);
        document.getElementById('goldtext').value = gold;

        //Upgrade One: Workers
        var upgradeOneLevel = 0; //FOR ALI!!!! THIS ONE
        var upgradeOneCost = 50;
        document.getElementById('workers').textContent = "Workers (" + upgradeOneLevel + ")";
        document.getElementById('workersStat').textContent = upgradeOneCost + " gold | 10cm";

        //Upgrade Two: Trucks
        var upgradeTwoLevel = 0; //FOR ALI!!!! THIS ONE
        var upgradeTwoCost = 300;
        document.getElementById('trucks').textContent = "Trucks (" + upgradeTwoLevel + ")";
        document.getElementById('trucksStat').textContent = upgradeTwoCost + " gold | 350cm";

        //Upgrade Three: Cranes
        var upgradeThreeLevel = 0; //FOR ALI!!!! THIS ONE
        var upgradeThreeCost = 1000;
        document.getElementById('cranes').textContent = "Cranes (" + upgradeThreeLevel + ")";
        document.getElementById('cranesStat').textContent = upgradeThreeCost + " gold | 1000cm";

        //Height Restrictions
        var passBK = false;

        //Give Gold based on height every Second
        function runGold() {
            if (upgradeOneLevel > 0) {
                build(upgradeOneLevel * 10 + upgradeTwoLevel * 350 + upgradeThreeLevel*1000);
            }
            gold += Math.floor(towerHeight/100);
            document.getElementById('goldtext').value = gold;
        }

        //Add height
        function build(num) {
            towerHeight += num;
            currentBlockHeight += num;

            document.getElementById('text').value = towerHeight + "cm";

            expand(230, towerHeight);
        }

        //Draw Blocks
        function expand(x, y) {
            while (currentBlockHeight >= blockHeight) {
                currentBlockHeight -= blockHeight;
                heightStage += 1;
                base_image = new Image();
                base_image.src = 'blockSmall.png';

                if (gameStage == 1) {
                    base_image.onload = function () {
                        ctx.drawImage(base_image, 45, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 65, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 85, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 105, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 125, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 145, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 165, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 185, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 205, 495 - (20 * heightStage));
                    }
                }

                else if (gameStage == 2) {
                    base_image.onload = function () {
                        ctx.drawImage(base_image, 51, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 71, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 91, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 111, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 131, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 151, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 171, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 191, 495 - (20 * heightStage));

                    }
                }
                else if (gameStage == 3) {
                    base_image.onload = function () {
                        ctx.drawImage(base_image, 21, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 41, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 61, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 81, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 101, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 121, 495 - (20 * heightStage));
                        ctx.drawImage(base_image, 141, 495 - (20 * heightStage));


                    }
                }

                if (heightStage >= 24) {
                    if (gameStage == 1) {
                        heightStage = 2;
                        blockHeight = 240;
                        gameStage = 2;
                        document.getElementById('blocktext').value = blockHeight + "cm";

                        base_image = new Image();
                        base_image.src = 'Stage2.png';
                        base_image.onload = function () {
                            ctx.drawImage(base_image, 0, 0);
                        }
                    }
                    else if (gameStage == 2) {
                        heightStage = 2;
                        blockHeight = 2880;
                        gameStage = 3;
                        document.getElementById('blocktext').value = blockHeight + "cm";

                        base_image = new Image();
                        base_image.src = 'Stage3.png';
                        base_image.onload = function () {
                            ctx.drawImage(base_image, 0, 0);
                        }
                    }



                }


            }
        }



        function clear() {
            ctx.clearRect(0, 0, c.width, c.height);
        }

        function upgradeOne() {
            if (gold >= upgradeOneCost) {
                gold -= upgradeOneCost;
                upgradeOneLevel += 1;
                upgradeOneCost = Math.floor(upgradeOneCost * (upgradeOneLevel * 1.2));
                document.getElementById('goldtext').value = gold;
                document.getElementById('workers').textContent = "Workers (" + upgradeOneLevel + ")";
                document.getElementById('workersStat').textContent = upgradeOneCost + " gold | 10cm";
            }
        }

        function upgradeTwo() {
            if (gold >= upgradeTwoCost) {
                gold -= upgradeTwoCost;
                upgradeTwoLevel += 1;
                upgradeTwoCost = Math.floor(upgradeTwoCost * (upgradeTwoLevel*1.4));
                document.getElementById('goldtext').value = gold;
                document.getElementById('trucks').textContent = "Trucks (" + upgradeTwoLevel + ")";
                document.getElementById('trucksStat').textContent = upgradeTwoCost + " gold | 350cm";
            }
        }

        function upgradeThree() {
            if (gold >= upgradeThreeCost) {
                gold -= upgradeThreeCost;
                upgradeThreeLevel += 1;
                upgradeThreeCost = Math.floor(upgradeThreeCost * (upgradeThreeLevel*1.6));
                document.getElementById('goldtext').value = gold;
                document.getElementById('cranes').textContent = "Cranes (" + upgradeThreeLevel + ")";
                document.getElementById('cranesStat').textContent = upgradeThreeCost + " gold | 1000cm";
            }
        }



    </script>
</body>
</html>




