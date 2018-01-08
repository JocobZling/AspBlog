using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class manageIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e,GridViewSelectEventArgs g)
    {
        if (this.GridView1.SelectedRow != null)
        {
            string title = GridView1.Rows[g.NewSelectedIndex].Cells[0].Text;
        }
        string sqlconnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
        sqlconn.Open();
        sqlcommand.CommandText = "select ArticelID from Articles where Title=title";
        SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
        while (sqldatareader.Read())
        {
            Session["ArticleID"] = Convert.ToInt32(sqlcommand.CommandText);
        }
        sqlcommand = null;
        sqlconn.Close();
        sqlconn = null;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Remove("use");
        Session.Remove("sno");
        Response.Redirect("~/index.aspx");           
    }
}