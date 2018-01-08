using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class resetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["no"] != null)
        {
            Label4.Text = Session["no"].ToString();
            return;
        }
        else
        {
            Response.Write("<script>alert('会话已过期, 请重新发送邮件以修改密码!');location.href='loginUp.aspx';</script>");
 
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string pw1;
        pw1 = TextBox1.Text;
        string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);
        Connection.Open();
        if(Session["gai"]=="用户")
        {
            string sql = "update zhuce set password='" + GetMD5(pw1) + "' where ID='" + Session["no"] + "'";
            SqlCommand command = new SqlCommand(sql, Connection);
            command.ExecuteNonQuery();
        }
       if(Session["gai"]=="管理员")
       {
           string sql2 = "update Admins set password='" + GetMD5(pw1) + "' where AdminID='" + Session["no"] + "'";
           SqlCommand command2 = new SqlCommand(sql2, Connection);
           command2.ExecuteNonQuery();
       }
        Connection.Close();
        Session.Remove("no");
        Session.Remove("gai");
        Response.Write("<script>alert('重置密码成功！请重新登录。');location.href='loginUp.aspx';</script>");
    }

    // 加密算法函数 8.3
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