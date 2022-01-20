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
public partial class Admin_Attendance : System.Web.UI.Page
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
            Project();
            txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
        }
    }

    private void Project()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select ProjectName from ProjectTable", con);
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

    private void BindEmployee()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select EmployeeId from EmployeeTable Where Project='"+ ddlProject.Text +"'", con);
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
    protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindEmployee();
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
        txtSalaryType.Text = dt.Rows[0]["SalaryType"].ToString();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlConnection con1 = new SqlConnection(CS);
            con1.Open();
            str = "select count(*) from AttendanceTable where AttendanceDate='"+ txtDate.Text +"' and EmployeeId='"+ ddlEmployeeId.Text +"'";
            com = new SqlCommand(str, con1);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string message = "Employee attendance already exits today";
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
                string strQuery = "insert into AttendanceTable(AttendanceDate,Project,SalaryType,EmployeeId,EmployeeName,Shift,OverTimeHours,WorkHours,Remark,Attendance) values (@AttendanceDate,@Project,@SalaryType,@EmployeeId,@EmployeeName,@Shift,@OverTimeHours,@WorkHours,@Remark,@Attendance)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@AttendanceDate", SqlDbType.Date).Value = txtDate.Text;
                cmd.Parameters.Add("@Project", SqlDbType.NVarChar).Value = ddlProject.Text;
                cmd.Parameters.Add("@SalaryType", SqlDbType.NVarChar).Value = txtSalaryType.Text;
                cmd.Parameters.Add("@EmployeeId", SqlDbType.NVarChar).Value = ddlEmployeeId.Text;
                cmd.Parameters.Add("@EmployeeName", SqlDbType.NVarChar).Value = txtEmployeeName.Text;
                cmd.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = ddlShift.Text;
                cmd.Parameters.Add("@OverTimeHours", SqlDbType.NVarChar).Value = txtOverTimeHours.Text;
                cmd.Parameters.Add("@WorkHours", SqlDbType.NVarChar).Value = txtWorkHours.Text;
                cmd.Parameters.Add("@Remark", SqlDbType.VarChar).Value = txtRemark.Text;
                cmd.Parameters.Add("@Attendance",SqlDbType.VarChar).Value = ddlAttendance.Text;
                InsertUpdateData(cmd);
                Clear();
                string message = "Attendance added successfully!!";
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
            Project();
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
        txtDate.Text = "";
        txtEmployeeName.Text = "";
        txtOverTimeHours.Text = "";
        txtRemark.Text = "";
        txtWorkHours.Text = "";
        txtSalaryType.Text = "";
        txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
    }
    protected void ddlAttendance_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlAttendance.Text == "A")
        {
            txtWorkHours.Text = "0";
            txtOverTimeHours.Text = "0";
        }
        else if (ddlAttendance.Text == "P")
        {
            txtWorkHours.Text = "";
            txtOverTimeHours.Text = "";
        }
    }
}