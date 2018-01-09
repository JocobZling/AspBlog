using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

public partial class userSearch2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "Select * From Articles where Tag_ID=2";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        Connection.Open();
        SqlDataReader sqlDataReader = command.ExecuteReader();
        while (sqlDataReader.Read())
        {
            int id = sqlDataReader.GetInt32(0);
            String title = sqlDataReader.GetString(1);
            String content = sqlDataReader.GetString(2);
            String publishTime = sqlDataReader.GetString(3);
            int num = sqlDataReader.GetInt32(4);
            String type = getType(num);
            int viewNum = sqlDataReader.GetInt32(5);

            Label label1 = new Label();
            Label label2 = new Label();
            Label label3 = new Label();
            Label label4 = new Label();
            HtmlGenericControl a = new HtmlGenericControl("a");
            HtmlGenericControl br = new HtmlGenericControl("br");
            HtmlGenericControl br1 = new HtmlGenericControl("br");
            HtmlGenericControl br2 = new HtmlGenericControl("br");
            HtmlGenericControl hr = new HtmlGenericControl("hr");
            String url = "articleDetail.aspx?id=" + id;
            a.Attributes.Add("href", string.Format("articleDetail.aspx?id={0}", id.ToString()));
            a.InnerText = String.Format("{0}", title.ToString());
            a.Style["font-size"] = "20px";
            a.Style["color"] = "Black";
            a.Style["text-decoration"] = "none";
            label1.Text = getCotent(content);
            label2.Text = "发表日期:" + publishTime.ToString();
            label3.Text = "类型:" + type.ToString();
            label4.Text = "             浏览量:" + viewNum.ToString();
            label2.Style["color"] = "grey";
            label3.Style["color"] = "grey";
            label4.Style["color"] = "grey";
            Panel1.Controls.Add(label2);
            Panel1.Controls.Add(br1);
            Panel1.Controls.Add(a);
            Panel1.Controls.Add(br2);
            Panel1.Controls.Add(label1);
            Panel1.Controls.Add(br);
            Panel1.Controls.Add(label3);
            Panel1.Controls.Add(label4);
            Panel1.Controls.Add(hr);
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        this.Panel1.Controls.Clear();
        String search = TextBox1.Text;
        string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "Select * From Articles where Title like '%" + search + "%'";
        SqlCommand command = new SqlCommand(strSQL, Connection);

        //command.Parameters.AddWithValue("@Title", "你好");

        Connection.Open();
        SqlDataReader sqlDataReader = command.ExecuteReader();
        while (sqlDataReader.Read())
        {
            int id = sqlDataReader.GetInt32(0);
            String title = sqlDataReader.GetString(1);
            String content = sqlDataReader.GetString(2);
            String publishTime = sqlDataReader.GetString(3);
            int num = sqlDataReader.GetInt32(4);
            String type = getType(num);
            int viewNum = sqlDataReader.GetInt32(5);
            String str = id.ToString() + "," + title + "," + content + "," + publishTime + "," + num + "," + type + "," + viewNum.ToString();

            Label label1 = new Label();
            Label label2 = new Label();
            Label label3 = new Label();
            Label label4 = new Label();
            HtmlGenericControl a = new HtmlGenericControl("a");
            HtmlGenericControl br = new HtmlGenericControl("br");
            HtmlGenericControl br1 = new HtmlGenericControl("br");
            HtmlGenericControl br2 = new HtmlGenericControl("br");
            HtmlGenericControl hr = new HtmlGenericControl("hr");
            String url = "articleDetail.aspx?id=" + id;
            a.Attributes.Add("href", string.Format("articleDetail.aspx?id={0}", id.ToString()));
            a.InnerText = String.Format("{0}", title.ToString());
            a.Style["font-size"] = "20px";
            a.Style["color"] = "Black";
            a.Style["text-decoration"] = "none";
            label1.Text = getCotent(content);
            label2.Text = "发表日期:" + publishTime.ToString();
            label3.Text = "类型:" + type.ToString();
            label4.Text = "             浏览量:" + viewNum.ToString();
            label2.Style["color"] = "grey";
            label3.Style["color"] = "grey";
            label4.Style["color"] = "grey";
            Panel1.Controls.Add(label2);
            Panel1.Controls.Add(br1);
            Panel1.Controls.Add(a);
            Panel1.Controls.Add(br2);
            Panel1.Controls.Add(label1);
            Panel1.Controls.Add(br);
            Panel1.Controls.Add(label3);
            Panel1.Controls.Add(label4);
            Panel1.Controls.Add(hr);
        }
    }
    public String getType(int num)
    {
        String type = "";
        if (num == 1)
        {
            type = "科技";
        }
        else if (num == 2)
        {
            type = "情感";
        }
        else if (num == 3)
        {
            type = "生活";
        }
        return type;
    }
    //匹配出p标签的内容
    public String getCotent(String contentHtml)
    {
        string pattern = "<p>[^<]*</p>";
        string result = "";
        foreach (Match match in Regex.Matches(contentHtml, pattern))
            result += match.Value;
        Regex replaceSpace = new Regex(@"</?[p|P][^>]*>", RegexOptions.IgnoreCase);
        result = replaceSpace.Replace(result, "");
        string Result = result.Replace("<p>", "").Replace("<p></p>", "<span>").Replace("&nbsp;", "");
        if (Result.Length > 200)
            return Result.Substring(0, 200) + "......";
        else
            return Result;
    }
}