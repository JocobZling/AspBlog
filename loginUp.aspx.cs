using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class loginUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label4.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool boolReturnValue = false;
        string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "Select * From zhuce";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        SqlDataReader Dr;
        Connection.Open();
        Dr = command.ExecuteReader();
        while (Dr.Read())
        {
            if ((TextBox1.Text == Dr["ID"].ToString()) & (GetMD5(TextBox2.Text.ToString()) == Dr["password"].ToString()))
            {
                Session["sno"] = TextBox1.Text;
                
                Session["password"] = TextBox2.Text;
                Session["use"] = "用户";
                Response.Redirect("~/index.aspx");
                boolReturnValue = true;
            }
        }
        Dr.Close();
      
        String strSQL2 = "Select * From Admins";
        SqlCommand command2 = new SqlCommand(strSQL2, Connection);
        SqlDataReader Dr2;
     
        Dr2 = command2.ExecuteReader();
        while (Dr2.Read())
        {
            if ((TextBox1.Text == Dr2["AdminID"].ToString()) & (GetMD5(TextBox2.Text.ToString()) == Dr2["password"].ToString()))
            {
                Session["sno"] = TextBox1.Text;
                Session["password"] = TextBox2.Text;
                Session["use"] = "管理员";
                Response.Redirect("~/manageIndex.aspx");
                boolReturnValue = true;
            }
        }
        Dr2.Close();
        Connection.Close();
        if (!boolReturnValue)
        {
            Label4.Text = "登录名或密码不正确!请重新登陆";
            Label4.Visible = true;
        }
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/loginIn.aspx");
    }
    public static string GetMD5(string str)
    {
        byte[] b = System.Text.Encoding.Default.GetBytes(str);
        b = new System.Security.Cryptography.MD5CryptoServiceProvider().ComputeHash(b);
        string ret = " ";
        for (int i = 0; i < b.Length; i++)
        {
            ret += b[i].ToString("x").PadLeft(2, '0');
        }
        return ret;
    }
    
}