using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Web.UI.HtmlControls;
public partial class articleDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["use"] != null)
        {
            if (Session["use"].ToString() == "用户")
            {
                LinkButton1.Text = Session["sno"].ToString();
                LinkButton2.PostBackUrl = "~/userIndex.aspx";
                LinkButton2.Text = "个人信息";
                LinkButton3.Visible = true;
                LinkButton4.Visible = true;
                LinkButton6.Visible = false;
            }
            else if (Session["use"].ToString() == "管理员")
            {
                LinkButton1.Text = Session["sno"].ToString();
                LinkButton2.PostBackUrl = "~/userIndex.aspx";
                LinkButton2.Text = "个人信息";
                LinkButton3.Visible = true;
                LinkButton4.Visible = true;
                LinkButton5.Visible = true;
                LinkButton6.Visible = true;
                LinkButton6.PostBackUrl = "~/updateArticle.aspx?id="+ Session["articleID"];
            }
        }
        string strConnection = WebConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "select * from Articles where ArticleID=@ArticleID";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        string id = getUrl();
        command.Parameters.AddWithValue("@ArticleID", id);

 Session["articleID"] = id;
            Label6.Text = id;

        Connection.Open();
        SqlDataReader sqlDataReader = command.ExecuteReader();

        while (sqlDataReader.Read())
        {
            int num = sqlDataReader.GetInt32(4);
            String type = getType(num);
            Label1.Text = sqlDataReader.GetString(1) + "";
            Label2.Text = "zl";
            Label3.Text = type + "";
            Label4.Text = sqlDataReader.GetString(3) + "";
            Label5.Text = "浏览量：0";
            Literal innerHtml = new Literal();
            innerHtml.Text = sqlDataReader.GetString(2) + "";
            Panel1.Controls.Add(innerHtml);
        }

    }
    //获取类型
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
    //获取url的id
    public String getUrl()
    {
        string url = Request.Url.Query;
        string[] urlArr = url.Split('=');
        string id = urlArr[1];
        return id;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Session.Remove("use");
        Session.Remove("sno");
        Session.Remove("password");
        LinkButton5.Visible = false;
        LinkButton1.Text = "未登录";
        LinkButton2.Text = "登录";
        LinkButton2.PostBackUrl = "~/loginUp.aspx";
        LinkButton3.Visible = false;
        LinkButton4.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string aid =Session["articleID"].ToString();
        string name =Session["sno"].ToString();
        



        if (TextBox1.Text == "")
            Response.Write("<script>alert('评论不能为空!')</script>");
        else
        {



            string sqlconnstr = ConfigurationManager.ConnectionStrings["BlogConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            //建立DataSet对象
            DataSet ds = new DataSet();
            //建立DataTable对象
            DataTable dtable;
            //建立DataRowCollection对象
            DataRowCollection coldrow;
            //建立DataRow对象
            DataRow drow;
            //打开连接
            sqlconn.Open();
            //建立DataAdapter对象
            SqlDataAdapter sqld = new SqlDataAdapter("select * from Comments", sqlconn);
            //自己定义Update命令，其中@NAME，@NO是两个参数

            SqlCommandBuilder cb = new SqlCommandBuilder(sqld);

            //用Fill方法返回的数据，填充DataSet，数据表取名为“tabstudent”
            sqld.Fill(ds, "tabstudent");
            //将数据表tabstudent的数据复制到DataTable对象
            dtable = ds.Tables["tabstudent"];
            //用DataRowCollection对象获取这个数据表的所有数据行
            coldrow = dtable.Rows;
            //修改操作，逐行遍历，取出各行的数据
            int n;
            int Cmtid;
            n = coldrow.Count;
            if (n >= 1)
            {
                drow = coldrow[n - 1];
                Cmtid = (Convert.ToInt32(drow[0]) + 1);
            }
            else
                Cmtid = 1;
            drow = ds.Tables["tabstudent"].NewRow();
            drow[0] = Cmtid;
            drow[1] = TextBox1.Text;
            drow[2] = name;
            drow[3] = System.DateTime.Now.ToString();
            drow[4] = aid;


            ds.Tables["tabstudent"].Rows.Add(drow);

            //提交更新
            sqld.Update(ds, "tabstudent");
            TextBox1.Text = "";
            GridView1.DataBind();

            sqlconn.Close();
            sqlconn = null;
           // Response.Redirect("articleDetail.aspx");
            HtmlGenericControl a = new HtmlGenericControl("a");
            String id = Session["articleID"].ToString();
            String url = "articleDetail.aspx?id=" + id;
            a.Attributes.Add("href", string.Format("articleDetail.aspx?id={0}", id.ToString()));


            
        }
    }
}