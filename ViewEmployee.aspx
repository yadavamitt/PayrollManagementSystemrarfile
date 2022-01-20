<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewEmployee.aspx.cs" Inherits="Admin_ViewEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <div id="panel-4" class="panel">
                <div class="panel-hdr">
                    <h2>Employee <span class="fw-300"><i>Records</i></span>
                    </h2>
                </div>
                <div class="panel-container show">
                    <div class="panel-content">
                        <asp:Repeater ID="RepeaterEmployee" runat="server">
                            <HeaderTemplate>
                                <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                    <thead class="bg-warning-200">
                                        <tr>
                                            <th>Action</th>
                                            <th>EmployeeId</th>
                                            <th>EmployeeName</th>
                                            <th>LastName</th>
                                            <th>FathersName</th>
                                            <th>CNIC</th>
                                            <th>AdharCard</th>
                                            <th>PANCard</th>
                                            <th>DateOfBirth</th>
                                            <th>Age</th>
                                            <th>Qualificattion</th>
                                            <th>Mail</th>
                                            <th>MobileNo</th>
                                            <th>Address</th>
                                            <th>DateOfJoin</th>
                                            <th>ProvinceId</th>
                                            <th>Status</th>
                                            <th>Project</th>
                                            <th>SalaryType</th>
                                            <th>Section</th>
                                            <th>Designation</th>
                                            <th>BasicSalary</th>
                                            <th>CurrentlySalary</th>
                                            <th>AnnualBounces</th>
                                            <th>AnnualLeaves</th>
                                            <th>DailyHours</th>
                                            <th>EOBI</th>
                                            <th>SESSI</th>
                                            <th>IncomeTax</th>
                                            <th>OtherDeducation</th>
                                            <th>Conveyance</th>
                                            <th>Medical</th>
                                            <th>Accommodation</th>
                                            <th>OtherAllowances</th>
                                            <th>NetSalary</th>
                                            <th>GrossSalary</th>
                                            <th>TotalDeduction</th>
                                             <th>TotalDeduction</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><a class="btn btn-danger btn-sm" href="DeleteEmployee.aspx?Id=<%# Eval("EmployeeId")%>">
                                        <i class="fal fa-trash"></i>Delete</a></td>
                                    <td><%# Eval("EmployeeId")%></td>
                                    <td><%# Eval("FirstName")%></td>
                                    <td><%# Eval("LastName")%></td>
                                    <td><%# Eval("FathersName")%></td>
                                    <td><%# Eval("CNIC")%></td>
                                    <td><%# Eval("AdharCard")%></td>
                                    <td><%# Eval("PANCard")%></td>
                                    <td><%# Eval("DateOfBirth")%></td>
                                    <td><%# Eval("Age")%></td>
                                    <td><%# Eval("Qualificattion")%></td>
                                    <td><%# Eval("Mail")%></td>
                                    <td><%# Eval("MobileNo")%></td>
                                    <td><%# Eval("Address")%></td>
                                    <td><%# Eval("DateOfJoin")%></td>
                                    <td><%# Eval("ProvinceId")%></td>
                                    <td><%# Eval("Status")%></td>
                                    <td><%# Eval("Project")%></td>
                                    <td><%# Eval("SalaryType")%></td>
                                    <td><%# Eval("Section")%></td>
                                    <td><%# Eval("Designation")%></td>
                                    <td><%# Eval("BasicSalary")%></td>
                                    <td><%# Eval("CurrentlySalary")%></td>
                                    <td><%# Eval("AnnualBounces")%></td>
                                    <td><%# Eval("AnnualLeaves")%></td>
                                    <td><%# Eval("DailyHours")%></td>
                                    <td><%# Eval("EOBI")%></td>
                                    <td><%# Eval("SESSI")%></td>
                                    <td><%# Eval("IncomeTax")%></td>
                                    <td><%# Eval("OtherDeducation")%></td>
                                    <td><%# Eval("Conveyance")%></td>
                                    <td><%# Eval("Medical")%></td>
                                    <td><%# Eval("Accommodation")%></td>
                                    <td><%# Eval("OtherAllowances")%></td>
                                    <td><%# Eval("NetSalary")%></td>
                                    <td><%# Eval("GrossSalary")%></td>
                                    <td><%# Eval("TotalDeduction")%></td>
                                    <td><%# Eval("Address")%></td>
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

