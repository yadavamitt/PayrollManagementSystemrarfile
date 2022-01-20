<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdvancePage.aspx.cs" Inherits="Admin_AdvancePage" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xl-12">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>Advance
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
                                    <asp:TextBox ID="txtEmployeeName" runat="server" placeholder="Employee Name" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Advance</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAdvance" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAdvance" runat="server" placeholder="Advance" CssClass="form-control"></asp:TextBox>
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
                            <h2>Advance Details <span class="fw-300"><i>Records</i></span>
                            </h2>
                        </div>
                        <div class="panel-container show">
                            <div class="panel-content">
                                <asp:Repeater ID="RepeaterAdvance" runat="server">
                                    <HeaderTemplate>
                                        <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                            <thead class="bg-warning-200">
                                                <tr>
                                                    <th>Action</th>
                                                    <th>#</th>
                                                    <th>Employee&nbsp;Id</th>
                                                    <th>Employee&nbsp;Name</th>
                                                    <th>Advance</th>
                                                    <th>Advance&nbsp;Date</th>
                                                    <th>AdvanceDate</th>
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
                                            <td><%# Eval("Advance")%></td>
                                            <td><%# Eval("AdvanceDate")%></td>
                                            <td><%# Eval("AdvanceDate")%></td>
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
</asp:Content>

