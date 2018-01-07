using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class activate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
            SqlConnection Connection = new SqlConnection(strConnection);
            Connection.Open();
            String strSQL2 = "insert into zhuce(ID,username,password,e_mail,image) values('" + Session["ID"] + "','" + Session["name"] + "','" + Session["pw"] + "','" + Session["e_mail"] + "','~/Fileupimage/moren.jpg')";
            SqlCommand command2 = new SqlCommand(strSQL2, Connection);
            command2.ExecuteNonQuery();
            Session.Remove("ID");
            Session.Remove("name");
            Session.Remove("pw");
            Session.Remove("e_mail");
            Connection.Close();
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('该账号已被激活');location.href='loginUp.aspx';</script>");
        }
    }
}