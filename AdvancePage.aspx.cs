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

public partial class Admin_AdvancePage : System.Web.UI.Page
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
            BindAdvance();
        }
    }

    private void BindEmployee()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select EmployeeId from EmployeeTable Where NetSalary Is Not Null", con);
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

    private void BindAdvance()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from AdvanceTable order By Id asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {

                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    RepeaterAdvance.DataSource = dtBrands;
                    RepeaterAdvance.DataBind();
                }

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
        txtEmployeeName.Text = dt.Rows[0]["FirstName"].ToString();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlConnection con1 = new SqlConnection(CS);
            con1.Open();
            str = "SELECT count(*) FROM AdvanceTable WHERE EmployeeId='" + ddlEmployeeId.Text + "' And DATEPART(MONTH, AdvanceDate)= DATEPART(MONTH,'" + DateTime.Today.ToString() + "') AND DATEPART(YEAR, AdvanceDate) = DATEPART(YEAR,'" + DateTime.Today.ToString() + "')";
            com = new SqlCommand(str, con1);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string message = "the employee already take advance";
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
                string strQuery = "insert into AdvanceTable(EmployeeId,EmployeeName,Advance,AdvanceDate) values (@EmployeeId,@EmployeeName,@Advance,@AdvanceDate)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@EmployeeId", SqlDbType.VarChar).Value = ddlEmployeeId.Text;
                cmd.Parameters.Add("@EmployeeName", SqlDbType.NVarChar).Value = txtEmployeeName.Text;
                cmd.Parameters.Add("@Advance", SqlDbType.NVarChar).Value = txtAdvance.Text;
                cmd.Parameters.Add("@AdvanceDate", SqlDbType.Date).Value = System.DateTime.Now.Date.TimeOfDay.ToString();
                InsertUpdateData(cmd);
                Clear();
                string message = "Employee Advance added successfully!!";
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
            Clear();
            BindEmployee();
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
        txtEmployeeName.Text = "";
        txtAdvance.Text = "";
    }
}