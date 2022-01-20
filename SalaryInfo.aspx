<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SalaryInfo.aspx.cs" Inherits="Admin_SalaryInfo" EnableEventValidation="false" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xl-12">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>Employee Form - Salary Info
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
                                    <label class="form-label" for="validationDefault01">Employee Id</label><asp:Label ID="lblEmployeeId" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlEmployeeId" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddlEmployeeId" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Project</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlProject" Display="Dynamic"></asp:RequiredFieldValidator>
                                      <asp:DropDownList ID="ddlProject" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Salary Type</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlSalaryType" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddlSalaryType" runat="server" CssClass="form-control">
                                    <asp:ListItem>General</asp:ListItem>
                                    <asp:ListItem>Shift</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Section</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlSection" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                 <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Designation</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlDesignation" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDesignation_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Basic Salary</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtBasicSalary" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtBasicSalary" runat="server" placeholder="Basic Salary" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Currently Salary</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCurrentlySalary" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtCurrentlySalary" runat="server" placeholder="Currently Salary" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Annual Bounces</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAnnualBounces" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAnnualBounces" runat="server" placeholder="Annual Bounces" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                                  <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Annual Leaves</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAnnualLeaves" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAnnualLeaves" runat="server" placeholder="Annual Leaves" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <label class="form-label" for="validationDefault01">Daily Hours</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDailyHours" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtDailyHours" runat="server" CssClass="form-control" placeholder="Daily Hours"></asp:TextBox>
                                </div>
                            </div>
                        </div>  
                        <div class="panel-content border-faded border-left-0 border-right-0 border-bottom-0 d-flex flex-row">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                CssClass="btn btn-default ml-auto" CausesValidation="true" 
                                onclick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

