using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class updateArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //     if (Session["use"] == null)
        //       Response.Redirect("~/loginUp.aspx");
        if (!IsPostBack)
        {
            string strConnection = WebConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString.ToString();
            SqlConnection Connection = new SqlConnection(strConnection);
            String strSQL = "select * from Articles where ArticleID=@ArticleID";
            SqlCommand command = new SqlCommand(strSQL, Connection);
            string id = getUrl();
            command.Parameters.AddWithValue("@ArticleID", id);
            Connection.Open();
            SqlDataReader sqlDataReader = command.ExecuteReader();
            while (sqlDataReader.Read())
            {
                TextBox3.Text = sqlDataReader.GetString(1);
                TextBox1.Text = sqlDataReader.GetString(2);
            }
        }
    }
    //获取url的id
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Remove("use");
        Session.Remove("sno");
        Response.Redirect("~/index.aspx");
    }
    public String getUrl()
    {
        string url = Request.Url.Query;
        string[] urlArr = url.Split('=');
        string id = urlArr[1];
      
        return id;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "update Articles set Title=@Title,A_Content=@A_Content,PublishedTime=@PublishedTime,Tag_ID=@Tag_ID,imgUrl=@imgUrl " +
            "where ArticleID=@ArticleID";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        string ArticleID = getUrl();
        command.Parameters.AddWithValue("@ArticleID", ArticleID);

        String str = TextBox1.Text.ToString();
        String time = getTime();
        int id = getTagID();
        command.Parameters.AddWithValue("@Title", TextBox3.Text);
        command.Parameters.AddWithValue("@A_Content", str);
        command.Parameters.AddWithValue("@PublishedTime", time);
        command.Parameters.AddWithValue("@Tag_ID", id);
        command.Parameters.AddWithValue("@imgUrl", "");
        Connection.Open();
        command.ExecuteNonQuery();
        Response.Write("<script language=javascript>alert('修改成功!');</script>");
        Response.Write("<script language = javascript>window.location.href = document.URL;</script>");
        String url = "articleDetail.aspx?id=" + ArticleID;
        Response.Redirect(string.Format("{0}", url.ToString()));
    }
    //获得当前时间
    public String getTime()
    {
        String day = DateTime.Now.ToString("yyyyMMdd");
        return day;
    }
    //获取当前TagID
    public int getTagID()
    {
        int id = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
        return id;
    }

}