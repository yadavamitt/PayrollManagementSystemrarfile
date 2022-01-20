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

public partial class Admin_ProjectPage : System.Web.UI.Page
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
            auto();
            BindProjectRptr();
        }
    }

    private void auto()
    {
        int Num = 0;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString);
        con.Open();
        string sql = "SELECT MAX(ID+1) FROM ProjectTable";
        cmd = new SqlCommand(sql);
        cmd.Connection = con;
        if (Convert.IsDBNull(cmd.ExecuteScalar()))
        {
            Num = 1;
            lblProjectId.Text = Convert.ToString(Num);
            txtProjectId.Text = Convert.ToString("PRO-" + Num);
        }
        else
        {
            Num = (int)(cmd.ExecuteScalar());
            lblProjectId.Text = Convert.ToString(Num);
            txtProjectId.Text = Convert.ToString("PRO-" + Num);
        }
        cmd.Dispose();
        con.Close();
        con.Dispose();
    }

    private void BindProjectRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from ProjectTable order By Id asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {

                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    RepeaterProject.DataSource = dtBrands;
                    RepeaterProject.DataBind();
                }

            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlConnection con1 = new SqlConnection(CS);
            con1.Open();
            str = "select count(*)from ProjectTable where ProjectName='" + txtProjectName.Text + "'";
            com = new SqlCommand(str, con1);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string message = "Project Name Already Exist";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                return;
            }
            else
            {
                string strQuery = "insert into ProjectTable(ProjectId,ProjectName,Remarks,CreatedBy,CreatedOn) values (@ProjectId,@ProjectName,@Remarks,@CreatedBy,@CreatedOn)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@ProjectId", SqlDbType.VarChar).Value = txtProjectId.Text;
                cmd.Parameters.Add("@ProjectName", SqlDbType.VarChar).Value = txtProjectName.Text;
                cmd.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = txtRemark.Text;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = "RJ Developer";
                cmd.Parameters.Add("@CreatedOn", SqlDbType.DateTime).Value = System.DateTime.Now.Date.TimeOfDay.ToString();
                InsertUpdateData(cmd);
                string message = "Project Added Successfully!!";
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
            BindProjectRptr();
            Clear();
            auto();
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
        txtProjectName.Text = "";
        txtRemark.Text = "";
    }
}