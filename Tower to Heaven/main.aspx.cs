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
        
        //orginal value for all is 0
        given_th.Value = "0"; 
        given_gold.Value = "0";
        given_u1.Value = "0";
        given_u2.Value = "0";
        given_u3.Value = "0"; 
    }


    protected void user_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignIn.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // save
        //int gold = int.Parse(goldtext.Text);
        //int gold;
        //bool result = int.TryParse(goldtext.Text, out gold);
        Response.Write(workers.Text);

        string username = UserName.Text;
        int th = Convert.ToInt32(text.Text);
        int gold = Convert.ToInt32(goldtext.Text);
        int u1 = Convert.ToInt32(workers.Text);
        int u2 = Convert.ToInt32(trucks.Text);
        int u3 = Convert.ToInt32(cranes.Text);

        Methods myMethod = new Methods();
        myMethod.save_att(username, gold, th, u1, u2, u3);
    }
}

