using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class messagereply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sno"] == null)
        {
            Label1.Text = "请先登录再回复！";
            Label1.Visible = true;
            TextBox1.Text = "";
            TextBox1.ReadOnly = true;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(Session["sno"] == null)
        {
            Response.Redirect("Addliuyan.aspx");
        }

        else if (TextBox1.Text == "")
            Response.Write("<script>alert('回复不能为空!')</script>");
        else
        {
            string id = Request.QueryString["Msg_ID"].ToString();

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
            SqlDataAdapter sqld = new SqlDataAdapter("select * from Messages", sqlconn);
            //自己定义Update命令，其中@NAME，@NO是两个参数

            SqlCommandBuilder cb = new SqlCommandBuilder(sqld);

            //用Fill方法返回的数据，填充DataSet，数据表取名为“tabstudent”
            sqld.Fill(ds, "tabstudent");
            //将数据表tabstudent的数据复制到DataTable对象
            dtable = ds.Tables["tabstudent"];
            //用DataRowCollection对象获取这个数据表的所有数据行
            coldrow = dtable.Rows;
            //修改操作，逐行遍历，取出各行的数据
            for (int inti = 0; inti < coldrow.Count; inti++)
            {

                drow = coldrow[inti];
                //给每位学生姓名后加上字母A
                if (id.Equals(drow[0].ToString()))
                {

                    drow[5] = TextBox1.Text;
                    drow[6] = System.DateTime.Now.ToString();

                }// Label1.Text = drow[0];
            }
            //提交更新
            sqld.Update(ds, "tabstudent");

            sqlconn.Close();
            sqlconn = null;
            Response.Redirect("Addliuyan.aspx");
        }
    }
}