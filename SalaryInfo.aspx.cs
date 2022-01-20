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

public partial class Admin_SalaryInfo : System.Web.UI.Page
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
            BindProject();
            BindDesignation();
            BindSection();
        }
    }

    private void BindEmployee()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select EmployeeId from EmployeeTable Where Project Is Null", con);
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

    private void BindProject()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from ProjectTable", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlProject.DataSource = dt;
                ddlProject.DataTextField = "ProjectName";
                ddlProject.DataValueField = "ProjectName";
                ddlProject.DataBind();
                ddlProject.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlProject.Items.Clear();
            }
        }
    }

    private void BindSection()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from SectionTable", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlSection.DataSource = dt;
                ddlSection.DataTextField = "SectionName";
                ddlSection.DataValueField = "SectionName";
                ddlSection.DataBind();
                ddlSection.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlSection.Items.Clear();
            }
        }
    }

    private void BindDesignation()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from DesignationTable", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlDesignation.DataSource = dt;
                ddlDesignation.DataTextField = "Designation";
                ddlDesignation.DataValueField = "Designation";
                ddlDesignation.DataBind();
                ddlDesignation.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlDesignation.Items.Clear();
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
                string strQuery = "Update EmployeeTable Set Project=@Project,SalaryType=@SalaryType,Section=@Section,Designation=@Designation,BasicSalary=@BasicSalary,CurrentlySalary=@CurrentlySalary,AnnualBounces=@AnnualBounces,AnnualLeaves=@AnnualLeaves,DailyHours=@DailyHours Where EmployeeId=@EmployeeId";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@EmployeeId", SqlDbType.VarChar).Value = ddlEmployeeId.Text;
                cmd.Parameters.Add("@Project", SqlDbType.NVarChar).Value = ddlProject.Text;
                cmd.Parameters.Add("@SalaryType", SqlDbType.NVarChar).Value = ddlSalaryType.Text;
                cmd.Parameters.Add("@Section", SqlDbType.NVarChar).Value = ddlSection.Text;
                cmd.Parameters.Add("@Designation", SqlDbType.NVarChar).Value = ddlDesignation.Text;
                cmd.Parameters.Add("@BasicSalary", SqlDbType.NVarChar).Value = txtBasicSalary.Text;
                cmd.Parameters.Add("@CurrentlySalary", SqlDbType.NVarChar).Value = txtCurrentlySalary.Text;
                cmd.Parameters.Add("@AnnualBounces", SqlDbType.NVarChar).Value = txtAnnualBounces.Text;
                cmd.Parameters.Add("@AnnualLeaves", SqlDbType.VarChar).Value = txtAnnualLeaves.Text;
                cmd.Parameters.Add("@DailyHours", SqlDbType.VarChar).Value = txtDailyHours.Text;
                InsertUpdateData(cmd);
                Clear();
                string message = "Salary info update successfully!!";
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
            BindProject();
            BindDesignation();
            BindSection();
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
         txtAnnualBounces.Text = "";
         txtAnnualLeaves.Text = "";
         txtBasicSalary.Text = "";
         txtCurrentlySalary.Text = "";
         txtDailyHours.Text = "";
     }

     protected void ddlDesignation_SelectedIndexChanged(object sender, EventArgs e)
     {
         string sql = "select * from DesignationTable Where Designation = '" + ddlDesignation.Text + "'";
         SqlConnection con = new SqlConnection();
         con.ConnectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
         SqlDataAdapter adpt = new SqlDataAdapter(sql, con.ConnectionString);
         DataTable dt = new DataTable();
         adpt.Fill(dt);
         txtAnnualBounces.Text = dt.Rows[0]["AnualBonus"].ToString();
         txtAnnualLeaves.Text = dt.Rows[0]["AnualLeaves"].ToString();
     }
}