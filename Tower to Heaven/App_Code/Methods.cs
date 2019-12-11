using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public class Methods
{
    public Methods()
    {

    }
    // Encruption 
    public Byte[] encrypt(string unencryptedString)
    {
        // encrypt password before inserted..
        Byte[] hashedDataBytes = null;
        UTF8Encoding encoder = new UTF8Encoding();

        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();

        hashedDataBytes = md5Hasher.ComputeHash(encoder.GetBytes(unencryptedString));

        return hashedDataBytes;
    }

    // Sign Up
    public void SignUp(string Username, string Password, string Email)
    {
        string myConnectionString = "Data Source=(local);Initial Catalog=TOH;User ID=adminAli;Password=AliAli";
        SqlConnection myConnection = new SqlConnection(myConnectionString);
        myConnection.Open();

        string myQuery = "spSignUp";
        //string myQuery2 = "spInsertTower_att";

        DataSet myDataSet = new DataSet();
        SqlCommand myCommand = new SqlCommand(myQuery);
        // SqlCommand myCommand2 = new SqlCommand(myQuery2);
        myCommand.Connection = myConnection;
        myCommand.CommandType = CommandType.StoredProcedure;
        // myCommand2.Connection = myConnection;
        //myCommand2.CommandType = CommandType.StoredProcedure;

        SqlParameter[] myParameters = new SqlParameter[3];
        myParameters[0] = new SqlParameter("username", Username);
        myParameters[1] = new SqlParameter("password", Password);
        myParameters[2] = new SqlParameter("email", Email);




        myCommand.Parameters.AddRange(myParameters);
        //myCommand.Parameters.AddRange(myParameters2);
        myCommand.ExecuteNonQuery();

        myConnection.Close();
    }

    // checkpassword
    public void SignIn(string userName, string Password)
    {
        string myConnectionString = "Data Source=(local);Initial Catalog=TOH;User ID=adminAli;Password=AliAli";
        SqlConnection myConnection = new SqlConnection(myConnectionString);
        myConnection.Open();


        string myQuery = "CheckPassword";

        DataSet myDataSet = new DataSet();
        SqlCommand myCommand = new SqlCommand(myQuery);
        myCommand.Connection = myConnection;
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter[] myParameters = new SqlParameter[2];
        myParameters[0] = new SqlParameter("userName", userName);
        myParameters[1] = new SqlParameter("password", encrypt(Password));


        myCommand.Parameters.AddRange(myParameters);
        myCommand.ExecuteNonQuery();


    }

    // save //
    public void save_att(int gold, int th, int bh, int u1, int u2, int u3, int u4)
    {

    }

}


