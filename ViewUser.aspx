<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewUser.aspx.cs" Inherits="Admin_ViewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <div id="panel-4" class="panel">
                <div class="panel-hdr">
                    <h2>User <span class="fw-300"><i>Records</i></span>
                    </h2>
                </div>
                <div class="panel-container show">
                    <div class="panel-content">
                        <asp:Repeater ID="RepeaterUser" runat="server">
                            <HeaderTemplate>
                                <table id="dt-basic-example" class="table table-bordered table-hover table-striped w-100">
                                    <thead class="bg-warning-200">
                                        <tr>
                                            <th>Action</th>
                                            <th>EmployeeId</th>
                                            <th>FirstName</th>
                                            <th>LastName</th>
                                            <th>UserRole</th>
                                            <th>UserRole</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><a class="btn btn-danger btn-sm" href="DeleteUser.aspx?Id=<%# Eval("EmployeeId")%>">
                                        <i class="fal fa-trash"></i>Delete</a></td>
                                    <td><%# Eval("EmployeeId")%></td>
                                    <td><%# Eval("FirstName")%></td>
                                    <td><%# Eval("LastName")%></td>
                                    <td><%# Eval("UserRole")%></td>
                                    <td><%# Eval("UserRole")%></td>
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

