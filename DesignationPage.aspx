<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DesignationPage.aspx.cs" Inherits="Admin_DesignationPage" EnableEventValidation="false" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xl-6">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>Designation
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
                                    <label class="form-label" for="validationDefault01">Designation</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDesignation" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtDesignation" runat="server" placeholder="Designation Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Anual Leaves</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAnualLean" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAnualLean" runat="server" placeholder="Anual Leaves" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Anual Bonus</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAnualBonus" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAnualBonus" runat="server" placeholder="Anual Bonus" CssClass="form-control"></asp:TextBox>
                                </div>
                         
                                 <div class="col-md-12 mb-3">
                                    <label class="form-label" for="validationDefault01">Remark</label>
                                    <asp:TextBox ID="txtRemark" runat="server" placeholder="Remark" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
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
        <div class="col-xl-6">
            <div id="panel-4" class="panel">
                <div class="panel-hdr">
                    <h2>Designation<span class="fw-300"><i>Records</i></span>
                    </h2>
                </div>
                <div class="panel-container show">
                    <div class="panel-content">
                        <asp:Repeater ID="RepeaterDesignation" runat="server">
                            <HeaderTemplate>
                                <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                    <thead class="bg-warning-200">
                                        <tr>
                                            <th>Action</th>
                                            <th>Designation</th>
                                            <th>AnualLeaves</th>
                                            <th>AnualBonus</th>
                                            <th>Remark</th>
                                            <th>CreatedBy</th>
                                            <th>CreatedOn</th>
                                            <th>CreatedOn</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><a class="btn btn-danger btn-sm" href="DeleteDesignationPage.aspx?Id=<%# Eval("Id")%>">
                                        <i class="fal fa-trash"></i>Delete</a></td>
                                    <td><%# Eval("Designation")%></td>
                                    <td><%# Eval("AnualLeaves")%></td>
                                    <td><%# Eval("AnualBonus")%></td>
                                    <td><%# Eval("Remark")%></td>
                                    <td><%# Eval("CreatedBy")%></td>
                                    <td><%# Eval("CreatedOn")%></td>
                                    <td><%# Eval("CreatedOn")%></td>
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
</asp:Content>

