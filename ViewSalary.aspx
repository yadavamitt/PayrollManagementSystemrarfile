<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewSalary.aspx.cs" Inherits="Admin_ViewSalary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <div id="panel-4" class="panel">
                <div class="panel-hdr">
                    <h2>Salary <span class="fw-300"><i>Records</i></span>
                    </h2>
                </div>
                <div class="panel-container show">
                    <div class="panel-content">
                        <asp:Repeater ID="RepeaterEmployee" runat="server">
                            <HeaderTemplate>
                                <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                    <thead class="bg-warning-200">
                                        <tr>
                                            <th>SalarySlipNo</th>
                                            <th>SalaryDate</th>
                                            <th>MonthYear</th>
                                            <th>Project</th>
                                            <th>EmployeeId</th>
                                            <th>EmployeeName</th>
                                            <th>CurrentSalary</th>
                                            <th>SalaryType</th>
                                            <th>WorkHours</th>
                                            <th>Absents</th>
                                            <th>Persents</th>
                                            <th>GrossSalary</th>
                                            <th>OverTimeHours</th>
                                            <th>NetSalary</th>
                                            <th>SalaryPayable</th>
                                            <th>Conveyance</th>
                                            <th>Medical</th>
                                            <th>Accommodation</th>
                                            <th>OtherAllowances</th>
                                            <th>TotalAllowances</th>
                                            <th>EOBI</th>
                                            <th>SESSI</th>
                                            <th>IncomeTax</th>
                                            <th>OtherDeducation</th>
                                            <th>TotalDeducation</th>
                                            <th>Loan</th>
                                            <th>Advance</th>
                                            <th>Advance</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("SalarySlipNo")%></td>
                                    <td><%# Eval("SalaryDate")%></td>
                                    <td><%# Eval("MonthYear")%></td>
                                    <td><%# Eval("Project")%></td>
                                    <td><%# Eval("EmployeeId")%></td>
                                    <td><%# Eval("EmployeeName")%></td>
                                    <td><%# Eval("CurrentSalary")%></td>
                                    <td><%# Eval("SalaryType")%></td>
                                    <td><%# Eval("WorkHours")%></td>
                                    <td><%# Eval("Absents")%></td>
                                    <td><%# Eval("Persents")%></td>
                                    <td><%# Eval("GrossSalary")%></td>
                                    <td><%# Eval("OverTimeHours")%></td>
                                    <td><%# Eval("NetSalary")%></td>
                                    <td><%# Eval("SalaryPayable")%></td>
                                    <td><%# Eval("Conveyance")%></td>
                                    <td><%# Eval("Medical")%></td>
                                    <td><%# Eval("Accommodation")%></td>
                                    <td><%# Eval("OtherAllowances")%></td>
                                    <td><%# Eval("TotalAllowances")%></td>
                                    <td><%# Eval("EOBI")%></td>
                                    <td><%# Eval("SESSI")%></td>
                                    <td><%# Eval("IncomeTax")%></td>
                                    <td><%# Eval("OtherDeducation")%></td>
                                    <td><%# Eval("TotalDeducation")%></td>
                                    <td><%# Eval("Loan")%></td>
                                    <td><%# Eval("Advance")%></td>
                                    <td><%# Eval("Advance")%></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                     </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <!-- datatable end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

