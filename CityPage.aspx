<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CityPage.aspx.cs" Inherits="Admin_CityPage" EnableEventValidation="false" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xl-6">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>City & Province
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
                                    <label class="form-label" for="validationDefault01">City ID</label><asp:Label ID="lblCityId"
                                        runat="server" Text="" Visible="false"></asp:Label>
                                     <asp:TextBox ID="txtCityId" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">City Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCity" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtCity" runat="server" placeholder="City Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Province</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtProvince" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtProvince" runat="server" placeholder="Province" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="panel-content border-faded border-left-0 border-right-0 border-bottom-0 d-flex flex-row">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                CssClass="btn btn-default ml-auto" CausesValidation="true" 
                                onclick="btnSubmit_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-6">
            <div id="panel-4" class="panel">
                <div class="panel-hdr">
                    <h2>City & Province <span class="fw-300"><i>Records</i></span>
                    </h2>
                </div>
                <div class="panel-container show">
                    <div class="panel-content">
                        <asp:Repeater ID="RepeaterCity" runat="server">
                            <HeaderTemplate>
                                <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                    <thead class="bg-warning-200">
                                        <tr>
                                            <th>Action</th>
                                            <th>#</th>
                                            <th>City&nbsp;Name</th>
                                            <th>Province</th>
                                            <th>CreatedBy</th>
                                            <th>CreatedOn</th>
                                             <th>CreatedOn</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><a class="btn btn-danger btn-sm" href="DeleteCityPage.aspx?Id=<%# Eval("CityId")%>">
                                        <i class="fal fa-trash"></i>Delete</a></td>
                                    <td><%# Eval("CityId")%></td>
                                    <td><%# Eval("CityName")%></td>
                                    <td><%# Eval("Province")%></td>
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

