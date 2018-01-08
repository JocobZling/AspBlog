using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
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
            }
            else if (Session["use"].ToString() == "管理员")
            {
                LinkButton1.Text = Session["sno"].ToString();
                LinkButton2.PostBackUrl = "~/userIndex.aspx";
                LinkButton2.Text = "个人信息";
                LinkButton3.Visible = true;
                LinkButton4.Visible = true;
                LinkButton5.Visible = true;
            }
        }
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
}