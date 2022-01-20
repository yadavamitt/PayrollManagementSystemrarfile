<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Admin_Attendance" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xl-12">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>Attendance
                    </h2>
                    <div class="panel-toolbar">
                        <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                        <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                        <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                    </div>
                </div>
                <div class="panel-container show">
                    <div class="panel-content p-0">
                        <div class="panel-content">
                            <div class="form-row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Date</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDate" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtDate" runat="server" placeholder="mm/dd/yyy" TextMode="Date" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Project</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlProject" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddlProject" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Employee Id</label><asp:Label ID="lblEmployeeId" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlEmployeeId" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddlEmployeeId" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployeeId_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Employee Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmployeeName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtEmployeeName" runat="server" placeholder="Employee Name" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Salary Type</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSalaryType" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtSalaryType" runat="server" placeholder="Employee Name" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Attendance</label>
                                    <asp:DropDownList ID="ddlAttendance" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlAttendance_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>P</asp:ListItem>
                                        <asp:ListItem>A</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-row">

                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Shift</label>
                                    <asp:DropDownList ID="ddlShift" runat="server" CssClass="form-control">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>1 Shift</asp:ListItem>
                                        <asp:ListItem>2 Shift</asp:ListItem>
                                        <asp:ListItem>3 Shift</asp:ListItem>
                                        <asp:ListItem>General</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Work Hours</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtWorkHours" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtWorkHours" runat="server" placeholder="Work Hours" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Over Time Hours</label>
                                    <asp:TextBox ID="txtOverTimeHours" runat="server" placeholder="Over Time Hours" CssClass="form-control"></asp:TextBox>
                                </div>

                                <div class="col-md-8 mb-3">
                                    <label class="form-label" for="validationDefault01">Remark</label>
                                    <asp:TextBox ID="txtRemark" runat="server" placeholder="Remark" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="panel-content border-faded border-left-0 border-right-0 border-bottom-0 d-flex flex-row">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-default ml-auto" CausesValidation="true" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

