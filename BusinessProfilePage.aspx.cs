using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;

public partial class Admin_BusinessProfilePage : System.Web.UI.Page
{
    SqlCommand com;
    string str;
    SqlCommand cmd;
    SqlConnection con;
    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
    SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindbusiness();   
        }
    }

    private void bindbusiness()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from BusinessTable order By Id asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {

                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    RepeaterBusiness.DataSource = dtBrands;
                    RepeaterBusiness.DataBind();
                }

            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string filePath = FileUpload1.PostedFile.FileName;
        string filename = Path.GetFileName(filePath);
        string ext = Path.GetExtension(filename);
        string contenttype = String.Empty;
        switch (ext)
        {
            case ".jpg":
                contenttype = "image/jpg";
                break;
            case ".png":
                contenttype = "image/png";
                break;
        }
        if (contenttype != String.Empty)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlConnection con1 = new SqlConnection(CS);
                con1.Open();
                str = "select count(*)from BusinessTable Having COUNT(*) >= 1";
                com = new SqlCommand(str, con1);
                int count = Convert.ToInt32(com.ExecuteScalar());
                if (count > 0)
                {
                    string message = "Business Details Already Exits";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    Clear();
                    return;
                }
                else
                {
                    Stream fs = FileUpload1.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string strQuery = "insert into BusinessTable(BusinessName,OwnerName,GSTNumber,MobileNo,Mail,Websites,Address,Remark,BusinessLogo,ContentType,EnterBy,EnterOn) values (@BusinessName,@OwnerName,@GSTNumber,@MobileNo,@Mail,@Websites,@Address,@Remark,@BusinessLogo,@ContentType,@EnterBy,@EnterOn)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.Add("@BusinessName", SqlDbType.VarChar).Value = txtBusinessName.Text;
                    cmd.Parameters.Add("@OwnerName", SqlDbType.NVarChar).Value = txtOwnerName.Text;
                    cmd.Parameters.Add("@GSTNumber", SqlDbType.NVarChar).Value = txtGST.Text;
                    cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = txtMobileNo.Text;
                    cmd.Parameters.Add("@Mail", SqlDbType.NVarChar).Value = txtEmail.Text;
                    cmd.Parameters.Add("@Websites", SqlDbType.NVarChar).Value = txtWebsites.Text;
                    cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = txtAddress.Text;
                    cmd.Parameters.Add("@Remark", SqlDbType.NVarChar).Value = ttxRemark.Text;
                    cmd.Parameters.Add("@BusinessLogo", SqlDbType.Binary).Value = bytes;
                    cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contenttype;
                    cmd.Parameters.Add("@EnterBy", SqlDbType.VarChar).Value = "RJ Developer";
                    cmd.Parameters.Add("@EnterOn", SqlDbType.DateTime).Value = System.DateTime.Now.ToString();
                    InsertUpdateData(cmd);
                    Clear();
                    string message = "Business Details Added Successfully!!";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                }
            }
        }
        string formatError = "File format not recognised. Upload Image formats";
        System.Text.StringBuilder sb1 = new System.Text.StringBuilder();
        sb1.Append("<script type = 'text/javascript'>");
        sb1.Append("window.onload=function(){");
        sb1.Append("alert('");
        sb1.Append(formatError);
        sb1.Append("')};");
        sb1.Append("</script>");
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb1.ToString());
    }

    private Boolean InsertUpdateData(SqlCommand cmd)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    private void Clear()
    {
        txtAddress.Text = "";
        txtBusinessName.Text = "";
        txtEmail.Text = "";
        txtGST.Text = "";
        txtMobileNo.Text = "";
        txtOwnerName.Text = "";
        txtWebsites.Text = "";
        ttxRemark.Text = "";
    }
}