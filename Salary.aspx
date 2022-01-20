<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Salary.aspx.cs" Inherits="Admin_Salary" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xl-12">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>Generate Salary Form
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
                                <div class="col-md-2 mb-3">
                                    <label class="form-label" for="validationDefault01">Salary Slip No</label><asp:Label ID="lblSlipNo" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSlipNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtSlipNo" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <label class="form-label" for="validationDefault01">MONTH-YEAR</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMothYear" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtMothYear" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Month Last Date</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMonthLastdate" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtMonthLastdate" runat="server" placeholder="MM/dd/yyyy" CssClass="form-control" TextMode="Date" Enabled="false"></asp:TextBox>
                                </div>
                               
                                
                            </div>
                            <div class="form-row">
                                 <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Project</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlProject" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddlProject" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Employee Id</label><asp:Label ID="lblEmployeeId" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlEmployeeId" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddlEmployeeId" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployeeId_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Employee Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmployeeName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtEmployeeName" runat="server" placeholder="Employee Name" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="panel-hdr">
                                <h2>Calculations
                                </h2>
                            </div>
                            <div class="form-row">
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Current Salary</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCurrentSalary" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtCurrentSalary" runat="server" CssClass="form-control" Enabled="false" placeholder="Current Salary"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Salary Type</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSalaryType" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtSalaryType" runat="server" CssClass="form-control" Enabled="false" placeholder="Salary Type"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Work Hours</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtWorkHours" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtWorkHours" runat="server" placeholder="Work Hours" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Absents</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAbsents" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAbsents" runat="server" placeholder="Absents" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Persents</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPersents" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtPersents" runat="server" placeholder="Persents" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault03">Gross Salary</label>
                                    <asp:TextBox ID="txtGrossSalary" runat="server" CssClass="form-control" Enabled="false" ClientIDMode="Inherit" placeholder="Gross Salary"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Over Time Hours</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtOverTime" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtOverTime" runat="server" placeholder="Work Hours" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault05">Net Salary</label>
                                    <asp:TextBox ID="txtNetSalary" runat="server" CssClass="form-control" Enabled="false" ClientIDMode="Inherit" placeholder="Net Salary"></asp:TextBox>
                                </div>

                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault04">Salary Payable</label>
                                    <asp:TextBox ID="txtSalaryPayable" runat="server" CssClass="form-control" Enabled="false" ClientIDMode="Static" placeholder="Salary Payable"></asp:TextBox>
                                </div>
                            </div>
                             <div class="panel-hdr">
                                <h2>Allowances
                                </h2>
                            </div>
                            <div class="form-row">
                                 <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Conveyance</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtConveyance" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtConveyance" runat="server" placeholder="Conveyance" Enabled="false" CssClass="form-control calculate"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Medical</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMedical" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtMedical" runat="server" placeholder="Medical" Enabled="false" CssClass="form-control calculate"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Accommodation</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAccommodation" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAccommodation" runat="server" placeholder="Accommodation" Enabled="false" CssClass="form-control calculate"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Other Allowances</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtOtherAllowances" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtOtherAllowances" runat="server" placeholder="Other Allowances" Enabled="false" CssClass="form-control calculate"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Total Allowances</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtTotalAllowance" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtTotalAllowance" runat="server" placeholder="Total Allowances" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                             <div class="panel-hdr">
                                <h2>Deduction
                                </h2>
                            </div>
                            <div class="form-row">
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">EOBI</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEOBI" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtEOBI" runat="server" placeholder="EOBI" Enabled="false" CssClass="form-control calculate1"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">SESSI</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSESSI" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtSESSI" runat="server" placeholder="SESSI" Enabled="false" CssClass="form-control calculate1"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Income Tax</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtIncomeTax" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtIncomeTax" runat="server" placeholder="Income Tax" Enabled="false" CssClass="form-control calculate1"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Other Deducation</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtOtherDeducation" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtOtherDeducation" runat="server" placeholder="Other Deducation" Enabled="false" CssClass="form-control calculate1"></asp:TextBox>
                                </div>
                                 <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Total Deducation</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtTotalDeduction" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtTotalDeduction" runat="server" placeholder="Total Deducation" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="panel-hdr">
                                <h2>Advance and loan
                                </h2>
                            </div>
                            <div class="form-row">
                                  <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Loan</label>
                                    <asp:TextBox ID="txtLoan" runat="server" placeholder="Loan" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Advance</label>
                                    <asp:TextBox ID="txtAdvance" runat="server" placeholder="Advance" Enabled="false" CssClass="form-control"></asp:TextBox>
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
    <script src="js/jquery-1.2.1.min.js" type="text/javascript"></script>
</asp:Content>

