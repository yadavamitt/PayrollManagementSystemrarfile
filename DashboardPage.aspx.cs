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

public partial class Admin_DashboardPage : System.Web.UI.Page
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
            User();
            Employee();
            Designation();
            City();
            Section();
            Project();
        }
    }

    private void User()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from UserTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblUser.Text = rdr.GetValue(0).ToString();
        else
            lblUser.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void Employee()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from EmployeeTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblEmployee.Text = rdr.GetValue(0).ToString();
        else
            lblEmployee.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void City()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from CityTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblCity.Text = rdr.GetValue(0).ToString();
        else
            lblCity.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void Designation()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from DesignationTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblDesignation.Text = rdr.GetValue(0).ToString();
        else
            lblDesignation.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void Section()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from SectionTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblSection.Text = rdr.GetValue(0).ToString();
        else
            lblSection.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void Project()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from ProjectTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblProject.Text = rdr.GetValue(0).ToString();
        else
            lblProject.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
        con.Close();
    }

}