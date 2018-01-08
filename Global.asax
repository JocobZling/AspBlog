<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.Configuration" %>
<script runat="server">
 
  /*  void Application_Start(object sender, EventArgs e)
    {
    string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "select ViewNum from Articles where ArticleID=@ArticleID";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        command.Parameters.AddWithValue("@ArticleID", 3);

        Connection.Open();
        int count = (int)command.ExecuteScalar();
        Console.Write("%d", count);
        Application["total"] = count;
        Application["onLine"] = 0;

    }

    void Application_End(object sender, EventArgs e)
    {
        string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "Update Articles set ViewNum=@count where ArticleID=@ArticleID";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        command.Parameters.AddWithValue("@ArticleID", 3);
        Connection.Open();
        command.Parameters.Add(new SqlParameter("@count", Application["total"]));
        command.ExecuteNonQuery();
        Connection.Close();

    }

    void Application_Error(object sender, EventArgs e)
    {
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e)
    {
        Application.Lock();                                     //锁定Application
        Application["total"] = (int)Application["total"] + 1;     //总访问量加1
        Application.UnLock();									  //解除锁定

    }

    void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer
        // 或 SQLServer，则不引发该事件。
    }*/

</script>
