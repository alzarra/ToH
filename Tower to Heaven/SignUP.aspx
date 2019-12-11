<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 76px;
            font-size: x-large;
        }
        .auto-style4 {
            width: 76px;
            text-align: right;
            font-size: x-large;
        }
        .auto-style5 {
            width: 186px;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            text-align: left;
        }
        .auto-style8 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            Sign Up</div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style4">Username</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style8" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="auto-style8" ErrorMessage="Please Enter username" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Password</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style8" TextMode="Password" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="auto-style8" ErrorMessage="Please Enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Email</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style8" TextMode="Email" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" CssClass="auto-style8" ErrorMessage="Please Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="Button1" runat="server" CssClass="auto-style8" OnClick="Button1_Click" Text="Sign Up" Width="121px" />
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
        </table>
        <p class="auto-style7">
            <asp:Label ID="Label3" runat="server" CssClass="auto-style8" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style8" TextMode="Password"></asp:TextBox>
        </p>
        <div class="auto-style6">
            <BotDetect:WebFormsCaptcha ID="ExampleCaptcha" runat="server" />
        </div>
        <p class="auto-style7">
            <BotDetect:CaptchaValidator ID="ExampleCaptchaValidator" runat="server" CaptchaControl="ExampleCaptcha" ControlToValidate="TextBox2" CssClass="auto-style8" EnableClientScript="true" ErrorMessage="Retype the characters exactly as they appear in the picture" SetFocusOnError="true">
            Incorrect CAPTCHA code
        </BotDetect:CaptchaValidator>
            &nbsp;</p>
    </form>
</body>
</html>
