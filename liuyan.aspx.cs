using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class liuyan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id = "11";//session[UserID]
        Label1.Text = id;

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddLiuyan.aspx");
    }
}