using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class mycomment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string aid = Session["articleID"].ToString();
        Label1.Text = aid;


    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string aid = "111";//Session["ArticleID"].ToString();
        string name = "111";//Session["UserName"].ToString();



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
            n = coldrow.Count;
            drow = coldrow[n - 1];
            String Cmtid = (Convert.ToInt32(drow[0]) + 1).ToString();
            drow = ds.Tables["tabstudent"].NewRow();
            drow[0] = Cmtid;
            drow[1] = TextBox1.Text;
            drow[2] = name;
            drow[3] = System.DateTime.Now.ToString();
            drow[4] = aid;


            ds.Tables["tabstudent"].Rows.Add(drow);

            //提交更新
            sqld.Update(ds, "tabstudent");

            sqlconn.Close();
            sqlconn = null;
            Response.Redirect("mycomment.aspx");

        }

    }
}