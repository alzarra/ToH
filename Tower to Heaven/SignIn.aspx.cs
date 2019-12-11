using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SingIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("main.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
       
            Response.Redirect("SignUp.aspx");
       
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string myConnectionsString = "Data Source=(local);Initial Catalog=TOH;User ID=adminAli;Password=AliAli";
        SqlConnection myConnection = new SqlConnection(myConnectionsString);
        myConnection.Open();

        string checkuser = "select count (*) from users where username = '" + TextBox1.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, myConnection);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        myConnection.Close();
        if(temp == 1)
        {
            myConnection.Open();
            string checkPasswordQuery = "select password from users where username = '" + TextBox1.Text + "'";
            SqlCommand passComm = new SqlCommand(checkPasswordQuery, myConnection);
            string password = passComm.ExecuteScalar().ToString().Replace(" ","");
            if (password == TextBox2.Text)
            {
                
                Response.Write("Password is correct ");
                Session["get_username"] = TextBox1.Text;
                Session["get_id"] = TextBox2.Text;
                Response.Redirect("main.aspx");
            }
            else
            {
                Response.Write("Password is Wrong");
            }
        }
        else
        {
            Response.Write("Password is Not Correct");
        }
    }
}