<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Loan.aspx.cs" Inherits="Admin_Loan" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xl-12">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>Loan
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
                                    <label class="form-label" for="validationDefault01">Employee Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmployeeName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtEmployeeName" runat="server" placeholder="Employee Name" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Payment</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPayment" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtPayment" runat="server" placeholder="Payment" ClientIDMode="Inherit" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Intallment</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtIntallment" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtIntallment" runat="server" placeholder="Intallment" onkeypress="SUM();" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">EMI</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEMI" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtEMI" runat="server" placeholder="EMI" ClientIDMode="Inherit" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="panel-content border-faded border-left-0 border-right-0 border-bottom-0 d-flex flex-row">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-default ml-auto" CausesValidation="true" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div id="panel-4" class="panel">
                        <div class="panel-hdr">
                            <h2>Loan Details <span class="fw-300"><i>Records</i></span>
                            </h2>
                        </div>
                        <div class="panel-container show">
                            <div class="panel-content">
                                <asp:Repeater ID="RepeaterLoan" runat="server">
                                    <HeaderTemplate>
                                        <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                            <thead class="bg-warning-200">
                                                <tr>
                                                    <th>Action</th>
                                                    <th>#</th>
                                                    <th>EmployeeId</th>
                                                    <th>EmployeeName</th>
                                                    <th>Payment</th>
                                                    <th>Intallment</th>
                                                    <th>EMI</th>
                                                    <th>Balance</th>
                                                    <th>Loan&nbsp;Date</th>
                                                      <th>Balance</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><a class="btn btn-danger btn-sm" href="DeleteCity & Province.aspx?Id=<%# Eval("Id")%>">
                                                <i class="fal fa-trash"></i>Delete</a></td>
                                            <td><%# Eval("Id")%></td>
                                            <td><%# Eval("EmployeeId")%></td>
                                            <td><%# Eval("EmployeeName")%></td>
                                            <td><%# Eval("Payment")%></td>
                                            <td><%# Eval("Intallment")%></td>
                                            <td><%# Eval("EMI")%></td>
                                            <td><%# Eval("Balance")%></td>
                                            <td><%# Eval("LoanDate")%></td>
                                            <td><%# Eval("Balance")%></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                     </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function SUM() {
            var num1 = $('input[id=<%=txtIntallment.ClientID%>]').val();
            var num2 = $('input[id=<%=txtPayment.ClientID%>]').val();
            var result = parseInt(num2) / parseInt(num1);
            if (!isNaN(result)) {
                document.getElementById('<%=txtEMI.ClientID %>').value = result;
            }
        }
    </script>
</asp:Content>

