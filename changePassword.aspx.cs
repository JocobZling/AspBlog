using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class changePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Session["use"] == null)
             Response.Redirect("~/loginUp.aspx");
     
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
            string pw1, pw2;
            pw1 = TextBox1.Text;
            pw2 = TextBox2.Text;
            if (Session["password"].ToString() == pw1)
            {
                Session["password"] = pw1;
                string strConnection2 = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
                SqlConnection Connection2 = new SqlConnection(strConnection2);
                Connection2.Open();
                if (Session["use"] == "用户")
                {
                    string sql = "update zhuce set password='" + GetMD5(pw2) + "' where ID='" + Session["sno"] + "'";
                    SqlCommand command2 = new SqlCommand(sql, Connection2);
                    command2.ExecuteNonQuery();
                }
                else if (Session["use"] == "管理员")
                {
                    string sql = "update Admins set password='" + GetMD5(pw2) + "' where AdminID='" + Session["sno"] + "'";
                    SqlCommand command2 = new SqlCommand(sql, Connection2);
                    command2.ExecuteNonQuery();
                }
                Connection2.Close();
                Response.Write("<script>alert('修改密码成功！请重新登录后查看。');location.href='loginUp.aspx';</script>");
            }

            else
            {
                Response.Write("<script language=javascript>alert('原密码不对，请重新输入!');</script>");
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
        if(Session["use"]=="用户")
        {
            Response.Redirect("index.aspx");
        }
        else if (Session["use"] == "管理员")
        {
            Response.Redirect("index.aspx");
        }
    }
}