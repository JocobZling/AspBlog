﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;

public partial class manageIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["use"] == null)
        Response.Redirect("~/loginUp.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        Response.Redirect("~/articleDetail.aspx?="+this.GridView1.SelectedDataKey["ArticleID"].ToString());
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Remove("use");
        Session.Remove("sno");
        Response.Redirect("~/index.aspx");           
    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        int i;
        //执行循环，保证每条数据都可以更新
        for (i = 0; i < GridView1.Rows.Count + 1; i++)
        {
            //首先判断是否是数据行
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#006400'");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            }
        }
        PostBackOptions myPostBackOptions = new PostBackOptions(this);
        myPostBackOptions.AutoPostBack = false;
        myPostBackOptions.RequiresJavaScriptProtocol = true;
        myPostBackOptions.PerformValidation = false;
        String evt = Page.ClientScript.GetPostBackClientHyperlink(sender as GridView, "Select$" + e.Row.RowIndex.ToString());
        e.Row.Attributes.Add("onclick", evt);
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
        return Result.Substring(0, 200) + "......";
    }
}