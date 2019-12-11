using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = TextBox1.Text;
        string password = TextBox2.Text;
        string email = TextBox3.Text;

        string myConnectionsString = "Data Source=(local);Initial Catalog=TOH;User ID=adminAli;Password=AliAli";
        SqlConnection myconnection = new SqlConnection(myConnectionsString);
        myconnection.Open();

        Methods myMethods = new Methods();
        myMethods.SignUp(username, password, email);

        Response.Redirect("SignIn.aspx");


    }
}