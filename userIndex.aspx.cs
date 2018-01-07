using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;  
using System.Web.UI.WebControls.WebParts;  
using System.Web.UI.HtmlControls;  
using System.IO;  
public partial class userIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            /*Calendar1.Visible = false;*/
           
                string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
                SqlConnection Connection = new SqlConnection(strConnection);
                Connection.Open();
            if(Session["use"]=="用户")
            {
                String strSQL = "Select * From zhuce where ID='" + Session["sno"] + "'";
                SqlCommand command = new SqlCommand(strSQL, Connection);
                SqlDataReader Dr;
                Dr = command.ExecuteReader();
                while (Dr.Read())
                {
                    Image1.ImageUrl = Dr["image"].ToString(); 
                    Label1.Text = Dr["ID"].ToString();
                    Label2.Text = Dr["username"].ToString();
                    TextBox7.Text = Dr["sex"].ToString();
                    TextBox1.Text = Dr["e_mail"].ToString();
                    TextBox2.Text = Dr["birthday"].ToString();
                    TextBox3.Text = Dr["jop"].ToString();
                    TextBox4.Text = Dr["address"].ToString();
                    TextBox5.Text = Dr["hobby"].ToString();
                    TextBox6.Text = Dr["bloodtype"].ToString();

                }
                Dr.Close();                          
            }
            else if(Session["use"]=="管理员")
            {
                String strSQL2 = "Select * From Admins where AdminID='" + Session["sno"] + "'";
                SqlCommand command2 = new SqlCommand(strSQL2, Connection);
                SqlDataReader Dr2;
                Dr2 = command2.ExecuteReader();
                while (Dr2.Read())
                {
                    Image1.ImageUrl = Dr2["image"].ToString(); 
                    Label1.Text = Dr2["AdminID"].ToString();
                    Label2.Text = Dr2["Adminname"].ToString();
                    TextBox7.Text = Dr2["sex"].ToString();
                    TextBox1.Text = Dr2["e_mail"].ToString();
                    TextBox2.Text = Dr2["birthday"].ToString();
                    TextBox3.Text = Dr2["job"].ToString();
                    TextBox4.Text = Dr2["address"].ToString();
                    TextBox5.Text = Dr2["hobby"].ToString();
                    TextBox6.Text = Dr2["bloodtype"].ToString();

                }
                Dr2.Close();
            }            
                Connection.Close();
           
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (images())
        {
            string strConnection = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString.ToString();
            SqlConnection Connection = new SqlConnection(strConnection);
            Connection.Open();
            if (Session["use"] == "用户")
            {
                string strSQL = "update zhuce set image=@imag,e_mail=@mail,birthday=@birth,jop=@jo,address=@addre,hobby=@hobb,bloodtype=@blood,sex=@se where ID='" + Session["sno"] + "'";
                SqlCommand command = new SqlCommand(strSQL, Connection);
                command.Parameters.AddWithValue("@imag", Image1.ImageUrl);
                command.Parameters.AddWithValue("@mail", TextBox1.Text);
                command.Parameters.AddWithValue("@birth", TextBox2.Text);
                command.Parameters.AddWithValue("@addre", TextBox3.Text);
                command.Parameters.AddWithValue("@jo", TextBox4.Text);
                command.Parameters.AddWithValue("@hobb", TextBox5.Text);
                command.Parameters.AddWithValue("@blood", TextBox6.Text);
                command.Parameters.AddWithValue("@se", TextBox7.Text);
                command.ExecuteNonQuery();
            }
            else if (Session["use"] == "管理员")
            {
                string strSQL = "update Admins set image=@imag,e_mail=@mail,birthday=@birth,job=@jo,address=@addre,hobby=@hobb,bloodtype=@blood,sex=@se where AdminID='" + Session["sno"] + "'";
                SqlCommand command = new SqlCommand(strSQL, Connection);
                command.Parameters.AddWithValue("@imag", Image1.ImageUrl);
                command.Parameters.AddWithValue("@mail", TextBox1.Text);
                command.Parameters.AddWithValue("@birth", TextBox2.Text);
                command.Parameters.AddWithValue("@addre", TextBox3.Text);
                command.Parameters.AddWithValue("@jo", TextBox4.Text);
                command.Parameters.AddWithValue("@hobb", TextBox5.Text);
                command.Parameters.AddWithValue("@blood", TextBox6.Text);
                command.Parameters.AddWithValue("@se", TextBox7.Text);
                command.ExecuteNonQuery();
            }

            Connection.Close();
            Response.Write("<script language=javascript>alert('修改成功!');</script>");
        }
        else

            Response.Write("<script language=javascript>alert('上传头像格式不正确,修改失败!');</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["use"] == "用户")
        {
            Response.Redirect("index.aspx");
        }
        else if (Session["use"] == "用户")
        {
            Response.Redirect("manageIndex.aspx");
        }
    }
    public bool images()
    {
        bool flag = false;
        if (FileUpimage.HasFile == true)
        {
            string fType = FileUpimage.PostedFile.ContentType;//获取图像的类型  
            if (fType == "image/bmp" || fType == "image/gif" || fType == "image/pjpeg" || fType == "image/jpeg" || fType == "image/x-png")
            {
                //获取文件信息  
                FileInfo file = new FileInfo(FileUpimage.PostedFile.FileName);
                ///随机数据  
                Guid guid = Guid.NewGuid();
                string stamp = guid.ToString("N");
                //生成随机数  
                Random aa = new Random();
                string number = aa.Next(10000).ToString();
                //原始图片保存路径  
                string path = "~/Fileupimage/" + stamp + ".gif";
                //缩略图保存路径  
                string spath = "~/Fileupimage/" + number + ".gif";           
                    //原始图片保存  
                    FileUpimage.SaveAs(Server.MapPath(path));
                    //缩略图保存  
                    MakeThumbImage(Server.MapPath(path), Server.MapPath(spath), 100, 100);
                    //给隐藏的图片控件赋值并显示  
                    Image1.Visible = true;
                    Image1.ImageUrl = spath;
                    flag = true;              
            }                                     
        }
        else
        {
            flag = true;
        }
        return flag;
    }
    private void MakeThumbImage(string sPath, string stPath, int nWidth, int nHeight)
    {
        System.Drawing.Image sImage = System.Drawing.Image.FromFile(sPath);
        int tw = nWidth;
        int th = nHeight;
        ///原始图片的宽度和高度  
        int sw = sImage.Width;
        int sh = sImage.Height;
        if (sw > tw)
        {
            sw = tw;
        }
        if (sh > th)
        {
            sh = th;
        }
        System.Drawing.Bitmap objPic, objNewPic;
        objPic = new System.Drawing.Bitmap(sPath);
        objNewPic = new System.Drawing.Bitmap(objPic, sw, sh);
        objNewPic.Save(stPath);
        sImage.Dispose();
        objPic.Dispose();
        objNewPic.Dispose();
    }  
}