<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Admin_MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xl-12">
            <div id="panel-6" class="panel">
                <div class="panel-hdr">
                    <h2>My Profile
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
                                         <label class="form-label" for="validationDefault01">Employee Id</label>
                                        <asp:TextBox ID="txtEmployeeId" runat="server" placeholder="Employee Id" Enabled="false" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    <div class="col-md-4 mb-3">
                                        <label class="form-label" for="validationDefault01">First Name</label>
                                        <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" Enabled="false" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label class="form-label" for="validationDefault02">Last Name</label>
                                        <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name" Enabled="false" CssClass="form-control"></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

