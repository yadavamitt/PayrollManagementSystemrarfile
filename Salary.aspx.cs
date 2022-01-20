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

public partial class Admin_Salary : System.Web.UI.Page
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
            BindProject();
            auto();
            txtMothYear.Text = DateTime.Today.ToString("yyyy-MM");
            DateTime dt = DateTime.Now;
            DateTime LastdayDate = dt.AddMonths(1);
            DateTime FristDate = dt.AddMonths(1);
            FristDate = FristDate.AddDays(+(FristDate.Day));
            LastdayDate = LastdayDate.AddDays(-(LastdayDate.Day));
            txtMonthLastdate.Text = LastdayDate.ToString("yyyy-MM-dd");
        }
    }

    private void auto()
    {
        int Num = 0;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString);
        con.Open();
        string sql = "SELECT MAX(ID+1) FROM SalaryTable";
        cmd = new SqlCommand(sql);
        cmd.Connection = con;
        if (Convert.IsDBNull(cmd.ExecuteScalar()))
        {
            Num = 1;
            lblSlipNo.Text = Convert.ToString(Num);
            txtSlipNo.Text = Convert.ToString("SLP/" + DateTime.Today.ToString("yyyy-MM") + "/" + Num);
        }
        else
        {
            Num = (int)(cmd.ExecuteScalar());
            lblSlipNo.Text = Convert.ToString(Num);
            txtSlipNo.Text = Convert.ToString("SLP/" + DateTime.Today.ToString("yyyy-MM") + "/" + Num);
        }
        cmd.Dispose();
        con.Close();
        con.Dispose();
    }

    private void BindEmployee()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
                SqlCommand cmd = new SqlCommand("Select EmployeeId from EmployeeTable Where Project='" + ddlProject.Text + "'", con);
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
        txtEmployeeName.Text = dt.Rows[0]["Tittle"].ToString() + " " + dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();
        txtCurrentSalary.Text = dt.Rows[0]["CurrentlySalary"].ToString();
        txtConveyance.Text = dt.Rows[0]["Conveyance"].ToString();
        txtMedical.Text = dt.Rows[0]["Medical"].ToString();
        txtAccommodation.Text = dt.Rows[0]["Accommodation"].ToString();
        txtOtherAllowances.Text = dt.Rows[0]["OtherAllowances"].ToString();
        txtEOBI.Text = dt.Rows[0]["EOBI"].ToString();
        txtSESSI.Text = dt.Rows[0]["SESSI"].ToString();
        txtIncomeTax.Text = dt.Rows[0]["IncomeTax"].ToString();
        txtOtherDeducation.Text = dt.Rows[0]["OtherDeducation"].ToString();
        txtSalaryType.Text = dt.Rows[0]["SalaryType"].ToString();
        totaldeducation();
        totalAllowances();
        totalAbsent();
        totalPersent();
        totalWorkHour();
        totalOverTime();
        advance();
        loan();
        total();
    }

    private void totalAllowances()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "select SUM(Conveyance+Medical+Accommodation+OtherAllowances) from EmployeeTable Where EmployeeId='"+ ddlEmployeeId.Text +"'";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            txtTotalAllowance.Text = rdr.GetValue(0).ToString();
        else
            txtTotalAllowance.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void totaldeducation()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "select SUM(EOBI+SESSI+IncomeTax+OtherDeducation) from EmployeeTable Where EmployeeId='"+ ddlEmployeeId.Text +"'";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            txtTotalDeduction.Text = rdr.GetValue(0).ToString();
        else
            txtTotalDeduction.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void totalAbsent()
    {
        DateTime dt = DateTime.Now;

        DateTime dtFirst = dt.AddMonths(1);
        dtFirst = new DateTime(dtFirst.Year, dtFirst.Month - 1, 1);

        DateTime LastdayDate = dt.AddMonths(1);
        LastdayDate = LastdayDate.AddDays(-(LastdayDate.Day));

        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "select COUNT(*) from AttendanceTable Where EmployeeId='" + ddlEmployeeId.Text + "' and Attendance='A' And AttendanceDate between  '" + dtFirst.ToString("yyyy-MM-dd") + "' and '" + LastdayDate.ToString("yyyy-MM-dd") + "'";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            txtAbsents.Text = rdr.GetValue(0).ToString();
        else
            txtAbsents.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void totalPersent()
    {
        DateTime dt = DateTime.Now;

        DateTime dtFirst = dt.AddMonths(1);
        dtFirst = new DateTime(dtFirst.Year, dtFirst.Month - 1, 1);

        DateTime LastdayDate = dt.AddMonths(1);
        LastdayDate = LastdayDate.AddDays(-(LastdayDate.Day));
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "select COUNT(*) from AttendanceTable Where EmployeeId='" + ddlEmployeeId.Text + "' and Attendance='P' And AttendanceDate between  '" + dtFirst.ToString("yyyy-MM-dd") + "' and '" + LastdayDate.ToString("yyyy-MM-dd") + "'";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            txtPersents.Text = rdr.GetValue(0).ToString();
        else
            txtPersents.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();  
    }

    private void totalWorkHour()
    {
        DateTime dt = DateTime.Now;

        DateTime dtFirst = dt.AddMonths(1);
        dtFirst = new DateTime(dtFirst.Year, dtFirst.Month - 1, 1);

        DateTime LastdayDate = dt.AddMonths(1);
        LastdayDate = LastdayDate.AddDays(-(LastdayDate.Day));

        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "select Sum(WorkHours) from AttendanceTable Where EmployeeId='" + ddlEmployeeId.Text + "' And AttendanceDate between  '" + dtFirst.ToString("yyyy-MM-dd") + "' and '" + LastdayDate.ToString("yyyy-MM-dd") + "'";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            txtWorkHours.Text = rdr.GetValue(0).ToString();
        else
            txtWorkHours.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void totalOverTime()
    {
        DateTime dt = DateTime.Now;

        DateTime dtFirst = dt.AddMonths(1);
        dtFirst = new DateTime(dtFirst.Year, dtFirst.Month - 1, 1);

        DateTime LastdayDate = dt.AddMonths(1);
        LastdayDate = LastdayDate.AddDays(-(LastdayDate.Day));

        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "select Sum(OverTimeHours) from AttendanceTable Where EmployeeId='" + ddlEmployeeId.Text + "' And AttendanceDate between  '" + dtFirst.ToString("yyyy-MM-dd") + "' and '" + LastdayDate.ToString("yyyy-MM-dd") + "'";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            txtOverTime.Text = rdr.GetValue(0).ToString();
        else
            txtOverTime.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void advance()
    { 
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            DateTime dat = DateTime.Now;
            DateTime LastdayDate = dat.AddMonths(1);
            LastdayDate = LastdayDate.AddDays(-(LastdayDate.Day));
            SqlConnection con1 = new SqlConnection(CS);
            con1.Open();
            str = "select count(*)from AdvanceTable Where EmployeeId = '" + ddlEmployeeId.Text + "' and  DATEPART(MONTH, AdvanceDate)= DATEPART(MONTH, '" + LastdayDate.ToString("yyyy-MM-dd") + "') And DATEPART(YEAR, AdvanceDate) = DATEPART(YEAR, '" + LastdayDate.ToString("yyyy-MM-dd") + "')";
            com = new SqlCommand(str, con1);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string sql = "select Advance from AdvanceTable Where EmployeeId = '" + ddlEmployeeId.Text + "'  and  DATEPART(MONTH, AdvanceDate)= DATEPART(MONTH, '" + LastdayDate.ToString("yyyy-MM-dd") + "') And DATEPART(YEAR, AdvanceDate) = DATEPART(YEAR, '" + LastdayDate.ToString("yyyy-MM-dd") + "')";
                SqlConnection con5 = new SqlConnection();
                con5.ConnectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
                SqlDataAdapter adpt1 = new SqlDataAdapter(sql, con5.ConnectionString);
                DataTable dt1 = new DataTable();
                adpt1.Fill(dt1);
                txtAdvance.Text = dt1.Rows[0]["Advance"].ToString();
            }
            else
            {
                txtAdvance.Text = "0";
            }
        }

    }

    private void loan()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlConnection con1 = new SqlConnection(CS);
            con1.Open();
            str = "select count(*)from LoanTable Where EmployeeId = '" + ddlEmployeeId.Text + "'";
            com = new SqlCommand(str, con1);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string sql = "select EMI from LoanTable Where EmployeeId = '" + ddlEmployeeId.Text + "'  and Balance >='0' ";
                SqlConnection con2 = new SqlConnection();
                con2.ConnectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
                SqlDataAdapter adpt = new SqlDataAdapter(sql, con2.ConnectionString);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                txtLoan.Text = dt.Rows[0]["EMI"].ToString();
            }
            else
            {
                txtLoan.Text = "0";
            }
        }
    }

    private void total()
    {
        if (txtSalaryType.Text == "Per Days")
        {
            int num1, num2, num3, num4, num5, num6, num7, num8, result1, result2, result3, result4 = 0;
            
            num2 = 1 * Convert.ToInt32(txtCurrentSalary.Text);

            num3 = 1 * Convert.ToInt32(txtPersents.Text);


            num5 = 1 * Convert.ToInt32(txtTotalAllowance.Text);

            num6 = 1 * Convert.ToInt32(txtAdvance.Text);

            num7 = 1 * Convert.ToInt32(txtTotalDeduction.Text);

            num8 = 1 * Convert.ToInt32(txtLoan.Text);

            result1 = num2 * num3;
            txtGrossSalary.Text = result1.ToString();
            num1 = 1 * Convert.ToInt32(txtGrossSalary.Text);

            result2 = num1 + num5;
            txtNetSalary.Text = result2.ToString();
            num4 = 1 * Convert.ToInt32(txtNetSalary.Text);

            result3 = num4 - num7;
            result4 = result3 - num6 - num8;
            txtSalaryPayable.Text = result4.ToString();

        }

        else if (txtSalaryType.Text == "Per Hours")
        {
            double num1, num2, num3, num4, num5, num6, num7, num8, result1, result2, result3, result4 = 0;
          
            num2 = 1 * Convert.ToInt32(txtCurrentSalary.Text);
            num3 = 1 * Convert.ToInt32(txtWorkHours.Text);
            num5 = 1 * Convert.ToInt32(txtTotalAllowance.Text);
            num6 = 1 * Convert.ToInt32(txtAdvance.Text);
            num7 = 1 * Convert.ToInt32(txtTotalDeduction.Text);
            num8 = 1 * Convert.ToInt32(txtLoan.Text);
            result1 = num2 * num3;
            txtGrossSalary.Text = result1.ToString();
            num1 = 1 * Convert.ToInt32(txtGrossSalary.Text);

            result2 = num1 + num5;
            txtNetSalary.Text = result2.ToString();
            num4 = 1 * Convert.ToInt32(txtNetSalary.Text);

            result3 = num4 - num7;
            result4 = result3 - num6 - num8;
            txtSalaryPayable.Text = result4.ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlConnection con1 = new SqlConnection(CS);
            con1.Open();
            str = "select count(*) from SalaryTable where EmployeeId='" + ddlEmployeeId.Text + "' And SalaryDate='" + txtMonthLastdate.Text + "'";
            com = new SqlCommand(str, con1);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string message = "Employee Salary already genrated.";
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
                string strQuery = "insert into SalaryTable(SalarySlipNo,SalaryDate,MonthYear,Project,EmployeeId,EmployeeName,CurrentSalary,SalaryType,WorkHours,Absents,Persents,GrossSalary,OverTimeHours,NetSalary,SalaryPayable,Conveyance,Medical,Accommodation,OtherAllowances,TotalAllowances,EOBI,SESSI,IncomeTax,OtherDeducation,TotalDeducation,Loan,Advance) values (@SalarySlipNo,@SalaryDate,@MonthYear,@Project,@EmployeeId,@EmployeeName,@CurrentSalary,@SalaryType,@WorkHours,@Absents,@Persents,@GrossSalary,@OverTimeHours,@NetSalary,@SalaryPayable,@Conveyance,@Medical,@Accommodation,@OtherAllowances,@TotalAllowances,@EOBI,@SESSI,@IncomeTax,@OtherDeducation,@TotalDeducation,@Loan,@Advance)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@SalarySlipNo", SqlDbType.VarChar).Value = txtSlipNo.Text;
                cmd.Parameters.Add("@SalaryDate", SqlDbType.Date).Value = txtMonthLastdate.Text;
                cmd.Parameters.Add("@MonthYear", SqlDbType.Date).Value = txtMothYear.Text;
                cmd.Parameters.Add("@Project", SqlDbType.NVarChar).Value = ddlProject.Text;
                cmd.Parameters.Add("@EmployeeId", SqlDbType.NVarChar).Value = ddlEmployeeId.Text;
                cmd.Parameters.Add("@EmployeeName", SqlDbType.NVarChar).Value = txtEmployeeName.Text;
                cmd.Parameters.Add("@CurrentSalary", SqlDbType.NVarChar).Value = txtCurrentSalary.Text;
                cmd.Parameters.Add("@SalaryType", SqlDbType.NVarChar).Value = txtSalaryType.Text;
                cmd.Parameters.Add("@WorkHours", SqlDbType.NVarChar).Value = txtWorkHours.Text;
                cmd.Parameters.Add("@Absents", SqlDbType.VarChar).Value = txtAbsents.Text;
                cmd.Parameters.Add("@Persents", SqlDbType.VarChar).Value = txtPersents.Text;
                cmd.Parameters.Add("@GrossSalary", SqlDbType.VarChar).Value = txtGrossSalary.Text;
                cmd.Parameters.Add("@OverTimeHours", SqlDbType.VarChar).Value = txtOverTime.Text;
                cmd.Parameters.Add("@NetSalary", SqlDbType.NVarChar).Value = txtNetSalary.Text;
                cmd.Parameters.Add("@SalaryPayable", SqlDbType.NVarChar).Value = txtSalaryPayable.Text;
                cmd.Parameters.Add("@Conveyance", SqlDbType.NVarChar).Value = txtConveyance.Text;
                cmd.Parameters.Add("@Medical", SqlDbType.NVarChar).Value = txtMedical.Text;
                cmd.Parameters.Add("@Accommodation", SqlDbType.NVarChar).Value = txtAccommodation.Text;
                cmd.Parameters.Add("@OtherAllowances", SqlDbType.NVarChar).Value = txtOtherAllowances.Text;
                cmd.Parameters.Add("@TotalAllowances", SqlDbType.NVarChar).Value = txtTotalAllowance.Text;
                cmd.Parameters.Add("@EOBI", SqlDbType.NVarChar).Value = txtEOBI.Text;
                cmd.Parameters.Add("@SESSI", SqlDbType.NVarChar).Value = txtSESSI.Text;
                cmd.Parameters.Add("@IncomeTax", SqlDbType.NVarChar).Value = txtIncomeTax.Text;
                cmd.Parameters.Add("@OtherDeducation", SqlDbType.NVarChar).Value = txtOtherDeducation.Text;
                cmd.Parameters.Add("@TotalDeducation", SqlDbType.NVarChar).Value = txtTotalDeduction.Text;
                cmd.Parameters.Add("@Loan", SqlDbType.NVarChar).Value = txtLoan.Text;
                cmd.Parameters.Add("@Advance", SqlDbType.NVarChar).Value = txtAdvance.Text;
                InsertUpdateData(cmd);

                string message = "Employee Genrated successfully!!";
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
            UpdateLoan();
            Clear();
            BindProject();
            BindEmployee();
            auto();
            txtMothYear.Text = DateTime.Today.ToString("yyyy-MM");
            DateTime dt = DateTime.Now;
            DateTime LastdayDate = dt.AddMonths(1);
            DateTime FristDate = dt.AddMonths(1);
            FristDate = FristDate.AddDays(+(FristDate.Day));
            LastdayDate = LastdayDate.AddDays(-(LastdayDate.Day));
            txtMonthLastdate.Text = LastdayDate.ToString("yyyy-MM-dd");
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

     private void UpdateLoan()
     { 
         String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
         using (SqlConnection con = new SqlConnection(CS))
         {
             SqlConnection con1 = new SqlConnection(CS);
             con1.Open();
             str = "select count(*)from LoanTable Where EmployeeId = '" + ddlEmployeeId.Text + "'";
             com = new SqlCommand(str, con1);
             int count = Convert.ToInt32(com.ExecuteScalar());
             if (count > 0)
             {
                 string strQuery = "Update LoanTable Set Balance = Balance - '" + txtLoan.Text + "' Where EmployeeId='" + ddlEmployeeId.Text + "'";
                 SqlCommand cmd1 = new SqlCommand(strQuery);
                 InsertUpdateLoan(cmd1);
             }
             else
             {
                 return;
             }
         }
     }

     private Boolean InsertUpdateLoan(SqlCommand cmd1)
     {
         String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
         SqlConnection con1 = new SqlConnection(strConnString);
         cmd1.CommandType = CommandType.Text;
         cmd1.Connection = con1;
         try
         {
             con1.Open();
             cmd1.ExecuteNonQuery();
             return true;
         }
         catch (Exception ex)
         {
             Response.Write(ex.Message);
             return false;
         }
         finally
         {
             con1.Close();
             con1.Dispose();
         }
     }

     private void Clear()
     {
         txtAbsents.Text = "";
         txtAccommodation.Text = "";
         txtAdvance.Text = "";
         txtConveyance.Text = "";
         txtCurrentSalary.Text = "";
         txtEmployeeName.Text = "";
         txtEOBI.Text = "";
         txtGrossSalary.Text = "";
         txtIncomeTax.Text = "";
         txtLoan.Text = "";
         txtMedical.Text = "";
         txtNetSalary.Text = "";
         txtOtherAllowances.Text = "";
         txtOtherDeducation.Text = "";
         txtOverTime.Text = "";
         txtPersents.Text = "";
         txtSalaryPayable.Text = "";
         txtSalaryType.Text = "";
         txtSESSI.Text = "";
         txtTotalAllowance.Text = "";
         txtTotalDeduction.Text = "";
         txtWorkHours.Text = "";
     }
}