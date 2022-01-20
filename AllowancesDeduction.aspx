<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AllowancesDeduction.aspx.cs" Inherits="Admin_AllowancesDeduction" EnableEventValidation="false" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xl-12">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>Employee Form - Allowances & Deductaion
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
                                    <asp:DropDownList ID="ddlEmployeeId" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployeeId_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                 <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Currently Salary</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCurrentlySalary" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtCurrentlySalary" runat="server" placeholder="Currently Salary" CssClass="form-control calculate" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Conveyance</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtConveyance" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtConveyance" runat="server" placeholder="Conveyance" CssClass="form-control calculate"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Medical</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMedical" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtMedical" runat="server" placeholder="Medical" CssClass="form-control calculate"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Accommodation</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAccommodation" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAccommodation" runat="server" placeholder="Accommodation" CssClass="form-control calculate"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Other Allowances</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtOtherAllowances" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtOtherAllowances" runat="server" placeholder="Other Allowances" CssClass="form-control calculate"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">EOBI</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEOBI" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtEOBI" runat="server" placeholder="EOBI" CssClass="form-control calculate calculateDeduction"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">SESSI</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSESSI" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtSESSI" runat="server" placeholder="SESSI" CssClass="form-control calculate calculateDeduction"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Income Tax</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtIncomeTax" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtIncomeTax" runat="server" placeholder="Income Tax" CssClass="form-control calculate calculateDeduction"></asp:TextBox>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label" for="validationDefault01">Other Deducation</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtOtherDeducation" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtOtherDeducation" runat="server" placeholder="Other Deducation" onkeypress="SUM();" CssClass="form-control calculate calculateDeduction" OnTextChanged="txtOtherDeducation_TextChanged"></asp:TextBox>
                                </div>
                                
                                 <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault05">Net Salary</label>
                                    <asp:TextBox ID="txtNetSalary" runat="server" CssClass="form-control"  ClientIDMode="Inherit" placeholder="Net Salary"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault03">Gross Salary</label>
                                    <asp:TextBox ID="txtGrossSalary" runat="server" CssClass="form-control" ClientIDMode="Inherit" placeholder="Gross Salary"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault04">Total Deduction</label>
                                    <asp:TextBox ID="txtTotalDeduction" runat="server" CssClass="form-control"  ClientIDMode="Static" placeholder="Total Deduction"></asp:TextBox>
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
    <script type="text/javascript">
        $(document).ready(function () {
            $(".calculate").each(function () {
                $(this).keyup(function () {
                    var total = 0;
                    $(".calculate").each(function () {
                        if (!isNaN(this.value) && this.value.length != 0) {
                            total += parseFloat(this.value);
                        }
                    });
                    $('#<%=txtGrossSalary.ClientID %>').val(total);
                 });
             });
         });
    </script>
    <script type="text/javascript">
        function SUM() {
            var num1 = $('input[id=<%=txtTotalDeduction.ClientID%>]').val();
            var num2 = $('input[id=<%=txtGrossSalary.ClientID%>]').val();
            var result = parseFloat(num2) - parseFloat(num1);
            if (!isNaN(result)) {
                document.getElementById('<%=txtNetSalary.ClientID %>').value = result;
            }
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".calculateDeduction").each(function () {
                $(this).keyup(function () {
                    var total = 0;
                    $(".calculateDeduction").each(function () {
                        if (!isNaN(this.value) && this.value.length != 0) {
                            total += parseFloat(this.value);
                        }
                    });
                    $('#<%=txtTotalDeduction.ClientID %>').val(total);
                });
            });
        });
    </script>
</asp:Content>

