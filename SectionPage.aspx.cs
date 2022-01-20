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

public partial class Admin_SectionPage : System.Web.UI.Page
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
            BindSectionRptr();
        }
    }

    private void auto()
    {
        int Num = 0;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString);
        con.Open();
        string sql = "SELECT MAX(ID+1) FROM SectionTable";
        cmd = new SqlCommand(sql);
        cmd.Connection = con;
        if (Convert.IsDBNull(cmd.ExecuteScalar()))
        {
            Num = 1;
            lblSectionId.Text = Convert.ToString(Num);
            txtSectionId.Text = Convert.ToString("SEC-" + Num);
        }
        else
        {
            Num = (int)(cmd.ExecuteScalar());
            lblSectionId.Text = Convert.ToString(Num);
            txtSectionId.Text = Convert.ToString("SEC-" + Num);
        }
        cmd.Dispose();
        con.Close();
        con.Dispose();
    }

    private void BindSectionRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from SectionTable order By Id asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {

                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    RepeaterSection.DataSource = dtBrands;
                    RepeaterSection.DataBind();
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
            str = "select count(*)from SectionTable where SectionName='" + txtSectionName.Text + "'";
            com = new SqlCommand(str, con1);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string message = "Section Name Already Exist";
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
                string strQuery = "insert into SectionTable(SectionId,SectionName,Remark,CreatedBy,CreatedOn) values (@SectionId,@SectionName,@Remark,@CreatedBy,@CreatedOn)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@SectionId", SqlDbType.VarChar).Value = txtSectionId.Text;
                cmd.Parameters.Add("@SectionName", SqlDbType.VarChar).Value = txtSectionName.Text;
                cmd.Parameters.Add("@Remark", SqlDbType.VarChar).Value = txtRemark.Text;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = "RJ Developer";
                cmd.Parameters.Add("@CreatedOn", SqlDbType.DateTime).Value = System.DateTime.Now.Date.TimeOfDay.ToString();
                InsertUpdateData(cmd);
                string message = "Section Added Successfully!!";
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
            BindSectionRptr();
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
        txtSectionName.Text ="";
        txtRemark.Text = "";
    }
}