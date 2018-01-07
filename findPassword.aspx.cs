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

public partial class findPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool flag = true;
        string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "Select * From zhuce where ID='" + TextBox1.Text + "'";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        SqlDataReader Dr;
        Connection.Open();
        Dr = command.ExecuteReader();
        while (Dr.Read())
        {
            if (TextBox2.Text == Dr["e_mail"].ToString())
            {
                Session["no"] = TextBox1.Text;
                if (Send())
                {
                    Label3.Text = "新设密码的链接已经发送到你的注册邮箱，请去注册邮箱点击链接以完成新设密码！ ";
                    Label3.Visible = true;
                    Session["gai"] = "用户";
                    flag = false;
                }
            }
            else
                Response.Write("<script language=javascript>alert('账号与邮箱不匹配!');</script>");
        }
        Dr.Close();
        String strSQL2 = "Select * From Admins where AdminID='" + TextBox1.Text + "'";
        SqlCommand command2 = new SqlCommand(strSQL2, Connection);
        SqlDataReader Dr2;   
        Dr2 = command2.ExecuteReader();
        while (Dr2.Read())
        {
            if (TextBox2.Text == Dr2["e_mail"].ToString())
            {
                Session["no"] = TextBox1.Text;
                if (Send())
                {
                    Label3.Text = "新设密码的链接已经发送到你的注册邮箱，请去注册邮箱点击链接以完成新设密码！ ";
                    Label3.Visible = true;
                    Session["gai"] = "管理员";
                    flag = false;
                    //Response.Redirect("~/找回密码提示.aspx");
                }
            }
            else
                Response.Write("<script language=javascript>alert('账号与邮箱不匹配!');</script>");
        }
        Dr2.Close();
        Connection.Close();
        if(flag)
        {
            Response.Write("<script language=javascript>alert('没有该账号!');</script>");
        }
    }
    public bool Send()
    {
        bool IsSent;
        SmtpClient client = new SmtpClient("smtp.163.com", 25);
        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential("x1596638165@163.com", "xqqx09487");
        client.EnableSsl = false;
        MailAddress from = new MailAddress("x1596638165@163.com", "徐青青");
        MailAddress to = new MailAddress(TextBox2.Text);
        MailMessage message = new MailMessage(from, to);
        message.Subject = "找回密码";
        Session.Timeout = 3;
        message.Body = "亲爱的用户:" + TextBox1.Text + " 您好!重新设置密码请访问以下链接:'http://localhost:49437/resetPassword.aspx' 请您务必在3分钟内激活该帐号，否则该激活链接将失效。";
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/loginUp.aspx");
    }
}