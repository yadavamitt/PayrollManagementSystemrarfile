<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ProjectPage.aspx.cs" Inherits="Admin_ProjectPage" EnableEventValidation="false" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xl-6">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>Project
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
                                    <label class="form-label" for="validationDefault01">Project Id</label><asp:Label ID="lblProjectId"
                                        runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtProjectId" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtProjectId" runat="server" Enabled ="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Project Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtProjectName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtProjectName" runat="server" placeholder="Project Name" CssClass="form-control"></asp:TextBox>
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
                    <h2>Project<span class="fw-300"><i>Records</i></span>
                    </h2>
                </div>
                <div class="panel-container show">
                    <div class="panel-content">
                        <asp:Repeater ID="RepeaterProject" runat="server">
                            <HeaderTemplate>
                                <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                    <thead class="bg-warning-200">
                                        <tr>
                                            <th>Action</th>
                                            <th>#</th>
                                            <th>Project&nbsp;Name</th>
                                            <th>Remarks</th>
                                            <th>CreatedBy</th>
                                            <th>CreatedOn</th>
                                            <th>CreatedOn</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><a class="btn btn-danger btn-sm" href="DeleteProjectPage.aspx?Id=<%# Eval("ProjectId")%>">
                                        <i class="fal fa-trash"></i>Delete</a></td>
                                    <td><%# Eval("ProjectId")%></td>
                                    <td><%# Eval("ProjectName")%></td>
                                    <td><%# Eval("Remarks")%></td>
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

