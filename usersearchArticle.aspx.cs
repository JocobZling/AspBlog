using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class searchAriticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        Label2.Text = "";
        String s = TextBox1.Text;
        string sqlconnstr = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcmd = new SqlCommand();
        sqlcmd.Connection = sqlconn;
        sqlconn.Open();
        sqlcmd.CommandText = "select ArticleID,Title,PublishedTime,Tag_ID,ViewNum,imgUrl from Articles where Title=@Title";
        sqlcmd.Parameters.AddWithValue("@Title",s);
        SqlDataReader reader = sqlcmd.ExecuteReader();
        if (reader.Read() == true)
        {
            Session["ArticleID"] = reader.GetInt32(0);
            HyperLink1.Text = reader.GetString(1);
            HyperLink1.NavigateUrl = "~/Article.aspx?ArticleID=" + reader.GetString(1);
            Label1.Text += "文章编号：" + reader.GetInt32(0) + " ";
            HyperLink1.Text = "文章标题：" + reader.GetString(1) + " ";
            Label2.Text += "发布日期：" + reader.GetString(3) + " ";
            Label2.Text += "阅览人数：" + reader.GetInt32(4) + " <br /> ";
        }
        else {
            HyperLink1.Text = "";
            Label1.Text += "查不到该标题文章！请输入完整的标题名！";
        }
        sqlcmd = null;
        sqlconn.Close();
        sqlconn = null;

    }
}