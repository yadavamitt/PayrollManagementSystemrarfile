<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="PersonalInfo.aspx.cs" Inherits="Admin_PersonalInfo" EnableEventValidation="false" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-xl-12">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>Employee Form - Personal Info
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmployeeId" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtEmployeeId" runat="server" placeholder="Employee Id" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Tittle</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtTittle" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtTittle" runat="server" placeholder="Mr./Mrs." CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">First Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFirstName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Last Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtLastName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Fathers Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFathersName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtFathersName" runat="server" placeholder="Fathers Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">CNIC</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCNIC" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtCNIC" runat="server" placeholder="CNIC" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Adhar Card</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAdharId" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAdharId" runat="server" placeholder="Adhar Card" CssClass="form-control"></asp:TextBox>
                                </div>
                                  <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">PAN Card</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPANId" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtPANId" runat="server" placeholder="PAN Id" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Date Of Birth</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDOB" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <label class="form-label" for="validationDefault01">Age</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAge" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                  <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Qualificattion</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtQualificattion" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtQualificattion" runat="server" placeholder="Qualificattion" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault02">Mail</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ForeColor="Red" Display="Dynamic" ErrorMessage="Invalid email address"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault02">Mobile No</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMobileNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Mobile No" CssClass="form-control"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Mobile Number.Please Enter Mobile Number" ControlToValidate="txtMobileNo" ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12 mb-3">
                                    <label class="form-label" for="validationDefaultUsername">Address</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefaultUsername">Date Of Join</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDateOfJoin" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtDateOfJoin" runat="server" placeholder="mm-dd-yyyy" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Province ID</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlProvinceID" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddlProvinceID" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                  <div class="col-md-4 mb-3">
                                    <label class="form-label" for="validationDefault01">Status</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlStatus" Display="Dynamic"></asp:RequiredFieldValidator>
                                     <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                         <asp:ListItem>Active</asp:ListItem>
                                         <asp:ListItem>Inactive</asp:ListItem>
                                     </asp:DropDownList>
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

