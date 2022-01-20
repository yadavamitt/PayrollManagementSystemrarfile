<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="BusinessProfilePage.aspx.cs" Inherits="Admin_BusinessProfilePage" EnableEventValidation="false" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xl-12">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>Business Profile
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
                                    <label class="form-label" for="validationDefault01">Business Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtBusinessName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtBusinessName" runat="server" placeholder="Business Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Owner Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtOwnerName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtOwnerName" runat="server" placeholder="Owner Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault02">GST No</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtGST" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtGST" runat="server" placeholder="GST No" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault02">Mobile No</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMobileNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Mobile No" CssClass="form-control"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Mobile Number.Please Enter Mobile Number" ControlToValidate="txtMobileNo" ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault02">Mail</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Mail" CssClass="form-control"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ForeColor="Red" Display="Dynamic" ErrorMessage="Invalid email address"></asp:RegularExpressionValidator>
                                </div>
                                 <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault02">Websites</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtWebsites" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtWebsites" runat="server" placeholder="Websites" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-3">
                                <label class="form-label" for="validationDefaultUsername">Address</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Address"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row mb-2">
                            <div class="col-md-4 mb-3">
                                <label class="form-label" for="validationDefault03">Remark</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ttxRemark" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="ttxRemark" runat="server" CssClass="form-control" placeholder="Remark" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label" for="validationDefault05">Business Logo</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="FileUpload1" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
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
   <div class="row">
       <div class="col-xl-12">
            <div id="panel-4" class="panel">
                <div class="panel-hdr">
                    <h2>Business <span class="fw-300"><i>Details</i></span>
                    </h2>
                </div>
                <div class="panel-container show">
                    <div class="panel-content">
                        <asp:Repeater ID="RepeaterBusiness" runat="server">
                            <HeaderTemplate>
                                <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                    <thead class="bg-warning-200">
                                        <tr>
                                            <th>Business&nbsp;Name</th>
                                            <th>Owner&nbsp;Name</th>
                                            <th>GST&nbsp;Number</th>
                                            <th>Mobile&nbsp;No.</th>
                                            <th>Mail</th>
                                            <th>Websites</th>
                                            <th>Address</th>
                                            <th>Remark</th>
                                            <th>BusinessLogo</th>
                                            <th>EnterOn</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("BusinessName")%></td>
                                    <td><%# Eval("OwnerName")%></td>
                                    <td><%# Eval("GSTNumber")%></td>
                                    <td><%# Eval("MobileNo")%></td>
                                    <td><%# Eval("Mail")%></td>
                                    <td><%# Eval("Websites")%></td>
                                    <td><%# Eval("Address")%></td>
                                    <td><%# Eval("Remark")%></td>
                                    <td>
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <img src='data:<%#Eval("ContentType")%>;base64,<%# Eval("BusinessLogo") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("BusinessLogo")) : string.Empty %>' alt="" height="50px" width="50px" cssclass="table-avatar" />
                                            </li>
                                        </ul>
                                    </td>
                                    <td>
                                    </td>
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

