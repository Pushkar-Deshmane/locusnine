<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userDetails.aspx.cs" Inherits="UserDetails1.userDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>User Details</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">  
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <form id="form1" runat="server">
        <div class="wrapper">
            <asp:ScriptManager ID="ScriptManagerMain" runat="server"></asp:ScriptManager>
            <asp:Button runat="server" ID="btnClick" ClientIDMode="Static" Style="display: none" OnClick="btnAddUser_Click" />
            <asp:HiddenField ID="hidName" Value="name" runat="server" />
            <asp:HiddenField ID="hidEmail" Value="email" runat="server" />
            <asp:HiddenField ID="hidStatus" Value="status" runat="server" />
            <asp:HiddenField ID="hidRole" Value="role" runat="server" />
            <asp:HiddenField ID="hidMobile" Value="mobile" runat="server" />

            <style type="text/css">
                div.dataTables_length,
                div.dataTables_filter {
                    padding-top: 0.55em;
                }

                div.dataTables_paginate {
                    margin-right: 2em;
                }

                .align {
                    text-align: center;
                }

                .row {
                    display: inline-block;
                }

                .space {
                    padding-right: 5px;
                }

                .space1 {
                    padding-right: 10px;
                }

                .rbl input[type="radio"] {
                    margin-right: 2px;
                }

                .cssPager td {
                    padding-left: 4px;
                    padding-right: 4px;
                }

                .gvPagerCss span {
                    background-color: #1c2f33;
                    font-size: 20px;
                    padding: 0px 5px 0px 5px;
                }

                tr.group {
                    text-align: left;
                    background-color: #95c9d4 !important;
                }

                    tr.group:hover {
                        background-color: #61A2B0 !important;
                        color: White !important;
                    }

                .space {
                    padding-right: 5px;
                }

                .rbl input[type="radio"] {
                    margin-right: 2px;
                }
            </style>

            <!--Header-->
            <header class="main-header">
                <!-- Logo -->
                <a href="../../index2.html" class="logo">
                    <img src="images/Logo.svg" alt="Logo" />
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->

                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">

                            <!-- Notifications: style can be found in dropdown.less -->
                            <li class="dropdown notifications-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-bell-o"></i>
                                    <span class="label label-warning">10</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have 10 notifications</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-users text-aqua"></i>5 new members joined today
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-warning text-yellow"></i>Very long description here that may not fit into the
                                                            page and may cause design problems
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-users text-red"></i>5 new members joined
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-shopping-cart text-green"></i>25 sales made
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-user text-red"></i>You changed your username
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="footer"><a href="#">View all</a></li>
                                </ul>
                            </li>

                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="images/ico_user.svg" class="user-image" alt="User Image">
                                    <span class="hidden-xs">John Smith</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="images/ico_user.svg" class="img-circle" alt="User Image">

                                        <p>
                                            John Smith - Web Developer
                 
                                            <small>Member since Nov. 2012</small>
                                        </p>
                                    </li>

                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-info btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="#" class="btn btn-danger btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </nav>
            </header>

            <!-- Side Menu -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="images/ico_user.svg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>John Smith</p>
                        </div>
                    </div>
                    <hr style="margin: 0px" />
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">

                        <li>
                            <a href="#">
                                <i class="fa fa-dashboard"></i><span>Dashboard</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="userDetails.aspx">
                                <i class="fa fa-users"></i><span>Users</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-green">new</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-gear"></i><span>Session Manager</span>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Body -->
            <asp:UpdatePanel runat="server" ID="upList">
                <ContentTemplate>
                    <div class="content-wrapper">
                        <!-- Content Header (Page header) -->
                        <section class="content-header">
                            <h1>Users
                                    <small>users details</small>
                            </h1>
                        </section>

                        <!-- Main content -->
                        <section class="content">
                            <div class="col-md-12 row">
                                <!-- left column -->
                                <div class="col-md-12">
                                    <!-- general form elements -->
                                    <div class="box box-primary">
                                        <div class="box-header with-border">
                                            <img src="images/ico_users.svg" alt="Users" />
                                            <h3 class="box-title">Users</h3>
                                            <a onclick="return callModal();" class="btn btn-warning form-control btn-sm pull-right" style="width: 120px"><span class="fa fa-plus" style="margin-right: 5px"></span>&nbsp; Add User</a>
                                        </div>
                                        <!-- /.box-header -->
                                        <!-- form start -->
                                        <div class="col-lg-12" runat="server" id="divEmpty" visible="false" style="margin-top: 10px">
                                            <div class="callout callout-info">
                                                <h4>No Users</h4>
                                                <p>Currently there are no Users Available</p>
                                            </div>
                                        </div>
                                        <div class="box-body">
                                            <asp:HiddenField runat="server" ID="hidNTColumn" ClientIDMode="Static" />

                                            <asp:GridView ID="grd_LeadList" HorizontalAlign="Center" AutoGenerateColumns="False" CssClass="display grid table table-hover table-striped table-bordered" runat="server" DataKeyNames="id" OnRowCommand="grd_RowCommand">
                                                <%--OnPageIndexChanging="grdView_PageIndexChanging" EnableViewState="true"  AllowPaging="true" PageSize="20"--%>
                                                <Columns>
                                                    <asp:BoundField HeaderText="id" DataField="id" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Small" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide" />
                                                    <asp:BoundField HeaderText="Name" DataField="name" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="Small" HeaderStyle-CssClass="align" HeaderStyle-Width="20%" />
                                                    <asp:BoundField HeaderText="Email" DataField="email" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="Small" HeaderStyle-CssClass="align" HeaderStyle-Width="20%" />
                                                    <asp:BoundField HeaderText="Role Type" DataField="role" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="Small" HeaderStyle-CssClass="align" HeaderStyle-Width="10%" />
                                                    <asp:BoundField HeaderText="Mobile" DataField="mobile" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="Small" HeaderStyle-CssClass="align" HeaderStyle-Width="20%" />
                                                    <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="align" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="Small" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="20%">
                                                        <ItemTemplate>
                                                            <asp:Image ID="ImageActive" CssClass="pull-left" ClientIDMode="Static" runat="server" ImageUrl="~/images/ico_active.svg" Visible='<%#Eval("status").ToString()=="Active"?true:false%>' Style="width: 10px" />
                                                            <asp:Image ID="ImagePending" CssClass="pull-left" ClientIDMode="Static" runat="server" ImageUrl="~/images/ico_pending.svg" Visible='<%#Eval("status").ToString()=="Pending"?true:false%>' Style="width: 10px" />
                                                            <asp:Image ID="ImageInactive" CssClass="pull-left" ClientIDMode="Static" runat="server" ImageUrl="~/images/ico_inactive.svg" Visible='<%#Eval("status").ToString()=="Inactive"?true:false%>' Style="width: 10px" />
                                                            &nbsp;&nbsp;<asp:Label ID="lblStatus" runat="server" ClientIDMode="Static" Text='<%# Bind("status") %>' CommandArgument='<%# Eval("status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField  ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-CssClass="align" HeaderStyle-Width="5%">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnEdit" Text="Edit" runat="server" CssClass="btn btn-info btn-xs" CommandName="EditRecord" OnClientClick="return callModal()" CommandArgument="<%# Container.DataItemIndex %>" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField  ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-CssClass="align" HeaderStyle-Width="5%">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnDelete" Text="Delete" runat="server" CssClass="btn btn-danger btn-xs" CommandName="DeleteRecord" CommandArgument="<%# Container.DataItemIndex %>" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <EditRowStyle BackColor="#999999" />
                                                <FooterStyle BackColor="#61A2B0" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#61A2B0" Font-Bold="True" ForeColor="White" Font-Size="X-Small" />
                                                <PagerStyle BackColor="#61A2B0" ForeColor="White" CssClass="gvwCasesPager pager cssPager gvPagerCss" />
                                                <RowStyle BackColor="White" ForeColor="#333333" Font-Size="Small" />
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <!-- /.box -->
                                </div>
                                <!--/.col (left) -->
                                <!-- right column -->

                            </div>
                            <!-- /.row -->
                        </section>
                        <!-- /.content -->
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="control-sidebar-bg"></div>
        </div>

        <a href="#" id="modalIniCA" class="btn btn-default" data-toggle="modal" data-keyboard="false" data-backdrop="static" data-target="#modalCA" style="display: none"></a>

        <div class="modal fade bs-example-modal-lg" id="modalCA" runat="server" tabindex="-1" data-keyboard="false" data-backdrop="static" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog" style="width: 30%">
                <div class="modal-content">

                    <div class="modal-header" style="text-align: left;">
                        <h3 class="col-md-10 modal-title" id="H6"><span class="fa fa-plus" style="font-size: 15pt; color: #464646"></span>
                            <asp:Label runat="server" ID="lblCAHeader" ClientIDMode="Static" Style="color: #808080" Text="Add User"></asp:Label>
                        </h3>
                        <div class="col-md-2" style="text-align: left">
                            <button class="pull-right" data-dismiss="modal" onclick="return clearUserForm()">X</button>
                        </div>

                        <%--Validation message block --%>
                        <div class="col-lg-12 alert alert-danger alert-dismissible" role="alert" runat="server" id="failValidation" style="display: none; margin-top: 10px">
                            <asp:Label runat="server" ID="lblValidation" Font-Bold="true"></asp:Label>
                        </div>
                        <%--Add User--%>
                        <asp:UpdatePanel runat="server" ID="up1">
                            <ContentTemplate>

                                <div class="row col-lg-12" style="width: 100%;">
                                    <div class="row col-lg-12" style="padding: 20px; margin-left: 10px">
                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <asp:HiddenField runat="server" ID="hidID" ClientIDMode="Static" />
                                                <asp:TextBox runat="server" ID="txtName" ClientIDMode="Static" CssClass="form-control" placeholder="Name *" MaxLength="50"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-12" style="margin-top: 10px;">
                                                <asp:TextBox runat="server" ID="txtEmail" ClientIDMode="Static" CssClass="form-control" placeholder="Email *" MaxLength="50"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-12" style="margin-top: 10px;">
                                                <asp:RadioButtonList runat="server" ID="rblRole" ClientIDMode="Static" RepeatDirection="Horizontal" CssClass="form-control">
                                                    <asp:ListItem Value="Admin" class="space rbl" Selected="True">Admin</asp:ListItem>
                                                    <asp:ListItem Value="Customer Executive" class="space rbl">Customer Executive</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="col-lg-12" style="margin-top: 10px">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlStatus" ClientIDMode="Static">
                                                    <asp:ListItem Value="Select">Select Status *</asp:ListItem>
                                                    <asp:ListItem Value="1">Active</asp:ListItem>
                                                    <asp:ListItem Value="2">Pending</asp:ListItem>
                                                    <asp:ListItem Value="0">Inactive</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-12" style="margin-top: 10px">
                                                <asp:TextBox runat="server" ID="txtMobile" ClientIDMode="Static" CssClass="form-control" MaxLength="10" placeholder="Mobile Number (Optional)" onkeypress="return checkSpcialChar(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <div class="modal-footer">
                        <div class="col-md-12" style="text-align: right">
                            <asp:Button runat="server" ID="btnAddUser" ClientIDMode="Static" CssClass="form-control btn btn-warning btn-sm" Style="width: 100%" Text="Add User" OnClientClick="return validateUserForm()" OnClick="btnAddUser_Click"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
       <!-- Datatable -->
    <script type="text/javascript" src="Scripts/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="Scripts/highcharts.js"></script>
    <script type="text/javascript" src="Scripts/exporting.js"></script>
    <script type="text/javascript">
        function callModal() {
            document.getElementById('modalIniCA').click();
        }

        function clearUserForm() {
            document.getElementById("<%=txtName.ClientID%>").value = "";
            document.getElementById("<%=txtEmail.ClientID%>").value = "";
            document.getElementById("<%=ddlStatus.ClientID%>").selectedIndex = 0;
            document.getElementById("<%=txtMobile.ClientID%>").value = "";

            var rb = document.getElementById("<%=rblRole.ClientID%>");
            var radio = rb.getElementsByTagName("input");
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    radio[i].checked = false;
                }
            }
            return false;
        }

        function validateUserForm() {
            if (document.getElementById("<%=txtName.ClientID%>").value == "") {
                document.getElementById("<%=failValidation.ClientID%>").style.display = 'block';
                document.getElementById("<%=lblValidation.ClientID%>").innerHTML = "Enter Name";
                setTimeout(function () { document.getElementById("<%=failValidation.ClientID%>").style.display = 'none'; }, 3000);
                setTimeout(function () { document.getElementById("<%=txtName.ClientID%>").focus(); }, 3000);
                return false;
            }
            if (document.getElementById("<%=txtEmail.ClientID%>").value == "") {
                document.getElementById("<%=failValidation.ClientID%>").style.display = 'block';
                document.getElementById("<%=lblValidation.ClientID%>").innerHTML = "Enter Email";
                setTimeout(function () { document.getElementById("<%=failValidation.ClientID%>").style.display = 'none'; }, 3000);
                setTimeout(function () { document.getElementById("<%=txtEmail.ClientID%>").focus(); }, 3000);
                return false;
            }
            if (document.getElementById("<%=txtEmail.ClientID%>").value != "") {
                var value = document.getElementById("<%=txtEmail.ClientID%>").value;
                var seperator = ",";

                if (value != '') {
                    var result = value.split(seperator);
                    for (var i = 0; i < result.length; i++) {
                        if (result[i] != '') {
                            if (!validateEmail(result[i])) {
                                var msg = "Please check, '" + result[i] + "' email address is not valid!";
                                document.getElementById("<%=failValidation.ClientID%>").style.display = 'block';
                                document.getElementById("<%=lblValidation.ClientID%>").innerHTML = msg;
                                setTimeout(function () { document.getElementById("<%=failValidation.ClientID%>").style.display = 'none'; }, 4000);
                                setTimeout(function () { document.getElementById("<%=txtEmail.ClientID%>").focus(); }, 3000);
                                return false;
                            }
                        }
                    }
                }
            }
            if (document.getElementById("<%=ddlStatus.ClientID%>").selectedIndex == 0) {
                document.getElementById("<%=failValidation.ClientID%>").style.display = 'block';
                document.getElementById("<%=lblValidation.ClientID%>").innerHTML = "Select status";
                setTimeout(function () { document.getElementById("<%=failValidation.ClientID%>").style.display = 'none'; }, 3000);
                setTimeout(function () { document.getElementById("<%=lblValidation.ClientID%>").focus(); }, 3000);
                return false;
            }

            var rb = document.getElementById("<%=rblRole.ClientID%>");
            var radio = rb.getElementsByTagName("input");
            var isChecked = false;
            var rbl = 0;
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    rbl = i;
                    break;
                }
            }

            document.getElementById("<%=hidName.ClientID%>").value = document.getElementById("<%=txtName.ClientID%>").value;
            document.getElementById("<%=hidEmail.ClientID%>").value = document.getElementById("<%=txtEmail.ClientID%>").value;
            document.getElementById("<%=hidStatus.ClientID%>").value = document.getElementById("<%=ddlStatus.ClientID%>").selectedIndex;
            document.getElementById("<%=hidRole.ClientID%>").value = rbl;
            document.getElementById("<%=hidMobile.ClientID%>").value = document.getElementById("<%=txtMobile.ClientID%>").value;
            document.getElementById("<%=btnClick.ClientID%>").click();
            return false;
        }

        //function to validate email
        function validateEmail(field) {
            var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$/;
            return (regex.test(field)) ? true : false;
        }

        function checkSpcialChar(event) {
            evt = (event) ? event : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;

        }
    </script>
 
    <!-- jQuery 2.2.3 -->
    <script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../../plugins/fastclick/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../../dist/js/demo.js"></script>
</body>
</html>
