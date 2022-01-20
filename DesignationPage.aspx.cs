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

public partial class Admin_DesignationPage : System.Web.UI.Page
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
            BindDesignationRptr();
        }
    }

    private void BindDesignationRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from DesignationTable order By Id asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {

                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    RepeaterDesignation.DataSource = dtBrands;
                    RepeaterDesignation.DataBind();
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
            str = "select count(*)from DesignationTable where Designation='" + txtDesignation.Text + "' And AnualLeaves='" + txtAnualLean.Text + "' And AnualBonus='"+ txtAnualBonus.Text +"'";
            com = new SqlCommand(str, con1);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string message = "Designation, AnualLeaves And AnualBonus Already Exist";
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
                string strQuery = "insert into DesignationTable(Designation,AnualLeaves,AnualBonus,Remark,CreatedBy,CreatedOn) values (@Designation,@AnualLeaves,@AnualBonus,@Remark,@CreatedBy,@CreatedOn)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@Designation", SqlDbType.VarChar).Value = txtDesignation.Text;
                cmd.Parameters.Add("@AnualLeaves", SqlDbType.VarChar).Value = txtAnualLean.Text;
                cmd.Parameters.Add("@AnualBonus", SqlDbType.VarChar).Value = txtAnualBonus.Text;
                cmd.Parameters.Add("@Remark", SqlDbType.VarChar).Value = txtRemark.Text;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = "RJ Developer";
                cmd.Parameters.Add("@CreatedOn", SqlDbType.DateTime).Value = System.DateTime.Now.Date.TimeOfDay.ToString();
                InsertUpdateData(cmd);
                string message = "Designation Added Successfully!!";
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
            BindDesignationRptr();
            Clear();
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
        txtAnualBonus.Text = "";
        txtAnualLean.Text = "";
        txtDesignation.Text = "";
        txtRemark.Text = "";
    }
}