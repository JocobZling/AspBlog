using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class articleDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "select * from Articles where ArticleID=@ArticleID";
        SqlCommand command = new SqlCommand(strSQL, Connection);

        command.Parameters.AddWithValue("@ArticleID", 3);
        Connection.Open();
        SqlDataReader sqlDataReader = command.ExecuteReader();

        while (sqlDataReader.Read())
        {
            int num = sqlDataReader.GetInt32(4);
            String type = getType(num);
            Label1.Text += sqlDataReader.GetString(1) + "";
            Label2.Text += "zl";
            Label3.Text += type + "";
            Label4.Text += sqlDataReader.GetString(3) + "";
            Label5.Text += Application["total"].ToString() + "";
            Literal innerHtml = new Literal();
            innerHtml.Text = sqlDataReader.GetString(2) + "";
            Panel1.Controls.Add(innerHtml);
        }
    }
    //获取类型
    public String getType(int num)
    {
        String type="";
        if (num == 1)
        {
            type = "科技";
        }
        else if(num ==2)
        {
            type = "情感";
        }
        else if(num ==3)
        {
            type = "生活";
        }
        return type;
    }
}