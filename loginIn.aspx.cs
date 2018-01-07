using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class loginIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool boolReturnValue=false;
        string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "Select * From zhuce";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        SqlDataReader Dr;
        Connection.Open();
        Dr = command.ExecuteReader();
        while (Dr.Read())
        {
            if(TextBox1.Text == Dr["ID"].ToString())
            {
                boolReturnValue = true;
                Response.Write("<script language=javascript>alert('注册失败，已有该账号!');</script>");
            }
        }
        Dr.Close();
        String strSQL2 = "Select * From Admins";
        SqlCommand command2 = new SqlCommand(strSQL2, Connection);
        SqlDataReader Dr2;
       
        Dr2 = command2.ExecuteReader();
        while (Dr2.Read())
        {
            if (TextBox1.Text == Dr2["AdminID"].ToString())
            {
                boolReturnValue = true;
                Response.Write("<script language=javascript>alert('注册失败，已有该账号!');</script>");
            }
        }
        Dr2.Close();
        Connection.Close();
        if(!boolReturnValue)
        {
            if (Send())
            {
                Session["ID"] =TextBox1.Text;
                Session["name"] = TextBox2.Text;
                Session["pw"] = GetMD5(TextBox3.Text.ToString());          
                Session["e_mail"] = TextBox5.Text;
                Label13.Text = "请打开邮箱进行激活！";
                Label13.Visible = true;
            }           
        } 
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("loginUp.aspx");
    }
    public bool Send()
    {
        bool IsSent;
        SmtpClient client = new SmtpClient("smtp.163.com", 25);
        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential("x1596638165@163.com", "xqqx09487");
        client.EnableSsl = false;
        MailAddress from = new MailAddress("x1596638165@163.com", "徐青青");
        MailAddress to = new MailAddress(TextBox5.Text);
        MailMessage message = new MailMessage(from, to);
        message.Subject = "激活账号";
        Session.Timeout = 3;
        message.Body = "亲爱的用户:" + TextBox1.Text + " 您好!激活账号访问以下链接:'http://localhost:49437/activate.aspx' 请您务必在3分钟内激活该帐号，否则该激活链接将失效。";
        message.IsBodyHtml = true;//是否以HTML格式发送          
        try
        {
            client.Send(message);//发送
            IsSent = true;
        }
        catch
        {
            IsSent = false;
        }
        return IsSent;
    }
}