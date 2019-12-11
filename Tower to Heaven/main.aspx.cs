using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserName.Text = Session["get_username"].ToString();
        UserID.Text = Session["get_id"].ToString();
    }


    protected void user_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignIn.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}

