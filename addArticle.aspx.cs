using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class addArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);

        String strSQL = "insert into Articles(Title,A_Content,PublishedTime,Tag_ID,ViewNum,imgUrl)" +
            "values(@Title,@A_Content,@PublishedTime,@Tag_ID,@ViewNum,@imgUrl)";
        SqlCommand command = new SqlCommand(strSQL, Connection);

        String str = TextBox1.Text.ToString();
        String time = getTime();
        int id = getTagID();
        command.Parameters.AddWithValue("@Title", TextBox3.Text);
        command.Parameters.AddWithValue("@A_Content",str);
        command.Parameters.AddWithValue("@PublishedTime",time);
        command.Parameters.AddWithValue("@Tag_ID", id);
        command.Parameters.AddWithValue("@ViewNum", 0);
        command.Parameters.AddWithValue("@imgUrl","");
        Response.Write("<script language=javascript>alert('添加成功!');</script>");
        Connection.Open();
        command.ExecuteNonQuery();
        Response.Write("<script language = javascript>window.location.href = document.URL;</script>");
    }
    //获得当前时间
    public String getTime()
    {
        String day=DateTime.Now.ToString("yyyyMMdd");  
        return day;
    }
    //获取当前TagID
    public int getTagID()
    {
        int id = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
        return id;
    }
}