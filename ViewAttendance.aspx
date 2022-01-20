<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewAttendance.aspx.cs" Inherits="Admin_ViewAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <div id="panel-4" class="panel">
                <div class="panel-hdr">
                    <h2>Attendance <span class="fw-300"><i>Records</i></span>
                    </h2>
                </div>
                <div class="panel-container show">
                    <div class="panel-content">
                        <asp:Repeater ID="RepeaterEmployee" runat="server">
                            <HeaderTemplate>
                                <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                    <thead class="bg-warning-200">
                                        <tr>
                                            <th>AttendanceDate</th>
                                            <th>Project</th>
                                            <th>EmployeeId</th>
                                            <th>EmployeeName</th>
                                            <th>SalaryType</th>
                                            <th>Attendance</th>
                                            <th>Shift</th>
                                            <th>WorkHours</th>
                                            <th>OverTimeHours</th>
                                            <th>Remark</th>
                                            <th>Remark</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("AttendanceDate")%></td>
                                    <td><%# Eval("Project")%></td>
                                    <td><%# Eval("EmployeeId")%></td>
                                    <td><%# Eval("EmployeeName")%></td>
                                    <td><%# Eval("SalaryType")%></td>
                                    <td><%# Eval("Attendance")%></td>
                                    <td><%# Eval("Shift")%></td>
                                    <td><%# Eval("WorkHours")%></td>
                                    <td><%# Eval("OverTimeHours")%></td>
                                    <td><%# Eval("Remark")%></td>
                                    <td><%# Eval("Remark")%></td>
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

