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

public partial class Admin_AllowancesDeduction : System.Web.UI.Page
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
            BindEmployee();
        }
    }

    private void BindEmployee()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select EmployeeId from EmployeeTable Where NetSalary Is Null", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlEmployeeId.DataSource = dt;
                ddlEmployeeId.DataTextField = "EmployeeId";
                ddlEmployeeId.DataValueField = "EmployeeId";
                ddlEmployeeId.DataBind();
                ddlEmployeeId.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlEmployeeId.Items.Clear();
            }
        }
    }
    protected void ddlEmployeeId_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql = "select * from EmployeeTable Where EmployeeId = '" + ddlEmployeeId.Text + "'";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        SqlDataAdapter adpt = new SqlDataAdapter(sql, con.ConnectionString);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        txtCurrentlySalary.Text = dt.Rows[0]["CurrentlySalary"].ToString();
        txtGrossSalary.Text = dt.Rows[0]["CurrentlySalary"].ToString();
    }
    protected void txtOtherDeducation_TextChanged(object sender, EventArgs e)
    {
        //int val1 = Convert.ToInt32(txtGrossSalary.Text);
        //int val2 = Convert.ToInt32(txtTotalDeduction.Text);
        //int val3 = val1 - val2;
        //txtNetSalary.Text = val3.ToString();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string strQuery = "Update EmployeeTable Set EOBI=@EOBI,SESSI=@SESSI,IncomeTax=@IncomeTax,OtherDeducation=@OtherDeducation,Conveyance=@Conveyance,Medical=@Medical,Accommodation=@Accommodation,OtherAllowances=@OtherAllowances,NetSalary=@NetSalary,GrossSalary=@GrossSalary,TotalDeduction=@TotalDeduction Where EmployeeId=@EmployeeId";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@EmployeeId", SqlDbType.VarChar).Value = ddlEmployeeId.Text;
                cmd.Parameters.Add("@EOBI", SqlDbType.NVarChar).Value = txtEOBI.Text;
                cmd.Parameters.Add("@SESSI", SqlDbType.NVarChar).Value = txtSESSI.Text;
                cmd.Parameters.Add("@IncomeTax", SqlDbType.NVarChar).Value = txtIncomeTax.Text;
                cmd.Parameters.Add("@OtherDeducation", SqlDbType.NVarChar).Value = txtOtherDeducation.Text;
                cmd.Parameters.Add("@Conveyance", SqlDbType.NVarChar).Value = txtConveyance.Text;
                cmd.Parameters.Add("@Medical", SqlDbType.NVarChar).Value = txtMedical.Text;
                cmd.Parameters.Add("@Accommodation", SqlDbType.NVarChar).Value = txtAccommodation.Text;
                cmd.Parameters.Add("@OtherAllowances", SqlDbType.VarChar).Value = txtOtherAllowances.Text;
                cmd.Parameters.Add("@NetSalary", SqlDbType.VarChar).Value = txtNetSalary.Text;
                cmd.Parameters.Add("@GrossSalary", SqlDbType.VarChar).Value = txtGrossSalary.Text;
                cmd.Parameters.Add("@TotalDeduction", SqlDbType.VarChar).Value = txtTotalDeduction.Text;
                InsertUpdateData(cmd);
                string message = "Allowances and deduction update successfully!!";
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
            BindEmployee();
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
         txtEOBI.Text = "";
         txtAccommodation.Text = "";
         txtConveyance.Text = "";
         txtCurrentlySalary.Text = "";
         txtGrossSalary.Text = "";
         txtIncomeTax.Text = "";
         txtMedical.Text = "";
         txtNetSalary.Text = "";
         txtOtherAllowances.Text = "";
         txtOtherDeducation.Text = "";
         txtSESSI.Text = "";
         txtTotalDeduction.Text = "";
     }
}