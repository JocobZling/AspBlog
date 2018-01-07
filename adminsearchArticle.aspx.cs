using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminsearchArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        Label2.Text = "";
        HyperLink1.Text = " ";
        String s = TextBox1.Text;
        string sqlconnstr = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcmd = new SqlCommand();
        sqlcmd.Connection = sqlconn;
        sqlconn.Open();
        sqlcmd.CommandText = "select ArticleID,Title,PublishedTime,Tag_ID,ViewNum,imgUrl from Article where Title=@Title";
        sqlcmd.Parameters.AddWithValue("@Title", s);
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
        else
        {
            HyperLink1.Text = "";
            Label1.Text += "查不到该标题文章！请输入完整的标题名！";
        }
        sqlcmd = null;
        sqlconn.Close();
        sqlconn = null;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        int intDelectCount;
        int ArticleID=Convert.ToInt32(Request.Params["ArticleID"]);
        string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcmd = new SqlCommand();
        sqlcmd.Connection = sqlconn;
        sqlcmd.CommandText = "delete from Article where ArticleID=@ArticleID";
        ArticleID=(Int32)Session["ArticleID"];
        sqlcmd.Parameters.AddWithValue("@ArticleID", ArticleID);
        try
        {
            sqlconn.Open();
            intDelectCount = sqlcmd.ExecuteNonQuery();
            if (intDelectCount > 0)
                Label3.Text = "文章已删除";
            else
                Label3.Text = "文章不存在";
        }
        catch (Exception ex)
        {
            Label3.Text = "错误原因：" + ex.Message;
        }
        finally {
            sqlcmd = null;
            sqlconn.Close();
            sqlconn = null;
        }

    }
}