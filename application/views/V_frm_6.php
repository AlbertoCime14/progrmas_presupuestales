<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
<?php
include 'application/views/masterpage/navegacion.php';
?>
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Fomento al empleo</h1>
            <ol class="breadcrumb">
                <li>
                    <a href="index.html">
                        <i class="fa fa-fw ti-home"></i> Dashboard
                    </a>
                </li>
                <li> Pages</li>
                <li class="active">
                    <a href="blank.html">Blank</a>
                </li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
		<!---Aqui va el contenido de la pagina :v-->
      
     
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class="fa fa-fw ti-move"></i> General Elements
                            </h3>
                            <span class="pull-right">
                                    <i class="fa fa-fw ti-angle-up clickable"></i>
                                    <i class="fa fa-fw ti-close removepanel clickable"></i>
                                </span>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label for="input-text" class="col-sm-2 control-label">Input text</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="input-text"
                                               placeholder="Input text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword" class="col-sm-2 control-label">Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="inputPassword"
                                               placeholder="Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="input-text-disabled" class="col-sm-2 control-label">Disabled</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="input-text-disabled"
                                               placeholder="Input text" disabled>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label m-t-ng-8">Radio Buttons</label>
                                    <div class="col-sm-10">
                                        <div class="iradio">
                                            <label>
                                                <input type="radio" name="optionsRadios" id="optionsRadios1"
                                                       value="option1"> Radio Button 1
                                            </label>
                                        </div>
                                        <div class="iradio">
                                            <label>
                                                <input type="radio" name="optionsRadios" id="optionsRadios2"
                                                       value="option2"> Radio Button 2
                                            </label>
                                        </div>
                                        <div class="iradio">
                                            <label>
                                                <input type="radio" name="optionsRadios" id="optionsRadios3"
                                                       value="option2"> Radio Button 3
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label m-t-ng-8">Checkbox</label>
                                    <div class="col-sm-10">
                                        <div>
                                            <label>
                                                <input type="checkbox" name="c1" id="c1" value=""> Checkbox 1
                                            </label>
                                        </div>
                                        <div>
                                            <label>
                                                <input type="checkbox" name="c1" id="c2" value=""> Checkbox 2
                                            </label>
                                        </div>
                                        <div>
                                            <label>
                                                <input type="checkbox" name="c1" id="c3" value=""> Checkbox 3
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        Inline Radio Buttons
                                    </label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline iradio">
                                            <input type="radio" id="inlineradio1" name="inlineRadios" value="option1">
                                            Inline Radio Button 1
                                        </label>
                                        <label class="radio-inline iradio">
                                            <input type="radio" id="inlineradio2" name="inlineRadios" value="option2">
                                            Inline Radio Button 2
                                        </label>
                                        <label class="radio-inline iradio">
                                            <input type="radio" id="inlineradio3" name="inlineRadios" value="option3">
                                            Inline Radio Button 3
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        Inline Checkbox
                                    </label>
                                    <div class="col-sm-10">
                                        <label class="checkbox-inline icheckbox">
                                            <input type="checkbox" id="inlineCheckbox1" value="option1"> Inline checkbox
                                            1
                                        </label>
                                        <label class="checkbox-inline icheckbox">
                                            <input type="checkbox" id="inlineCheckbox2" value="option2"> Inline checkbox
                                            2
                                        </label>
                                        <label class="checkbox-inline icheckbox">
                                            <input type="checkbox" id="inlineCheckbox3" value="option3"> Inline checkbox
                                            3
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group has-success">
                                    <label for="input-text-has-success" class="col-sm-2 control-label">
                                        Input Success
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="input-text-has-success">
                                    </div>
                                </div>
                                <div class="form-group has-warning">
                                    <label for="input-text-has-warning" class="col-sm-2 control-label">
                                        Input Warning
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="input-text-has-warning">
                                    </div>
                                </div>
                                <div class="form-group has-error">
                                    <label for="input-text-has-error" class="col-sm-2 control-label">
                                        Input Error
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="input-text-has-error">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Input Size</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control input-sm" placeholder="input-sm">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" placeholder="input-md">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control input-lg" placeholder="input-lg">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        Input Group
                                    </label>
                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon">@</span>
                                            <input type="text" class="form-control" placeholder="Username">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Currency">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon">$</span>
                                            <input type="text" class="form-control" placeholder="Currency">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-md-6 m-b-10">
                                                <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <input type="checkbox">
                                                        </span>
                                                    <input type="text" class="form-control">
                                                </div>
                                                <!-- /input-group -->
                                            </div>
                                            <!-- /.col-lg-6 -->
                                            <div class="col-md-6 m-b-10">
                                                <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <input type="radio">
                                                        </span>
                                                    <input type="text" class="form-control">
                                                </div>
                                                <!-- /input-group -->
                                            </div>
                                            <!-- /.col-lg-6 -->
                                        </div>
                                        <!-- /.row -->
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-lg-6 m-b-10">
                                                <div class="input-group">
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-warning" type="button">Go!</button>
                                                        </span>
                                                    <input type="text" class="form-control">
                                                </div>
                                                <!-- /input-group -->
                                            </div>
                                            <!-- /.col-lg-6 -->
                                            <div class="col-lg-6 m-b-10">
                                                <div class="input-group">
                                                    <input type="text" class="form-control">
                                                    <span class="input-group-btn">
                                                            <button class="btn btn-warning" type="button">Go!</button>
                                                        </span>
                                                </div>
                                                <!-- /input-group -->
                                            </div>
                                            <!-- /.col-lg-6 -->
                                        </div>
                                        <!-- /.row -->
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-lg-6 m-b-10">
                                                <div class="input-group">
                                                    <div class="input-group-btn">
                                                        <button type="button" class="btn btn-info dropdown-toggle"
                                                                data-toggle="dropdown">
                                                            Action
                                                            <span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu">
                                                            <li>
                                                                <a href="#">Action</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    Another action
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    Something else here
                                                                </a>
                                                            </li>
                                                            <li class="divider"></li>
                                                            <li>
                                                                <a href="#">
                                                                    Separated link
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- /btn-group -->
                                                    <input type="text" class="form-control">
                                                </div>
                                                <!-- /input-group -->
                                            </div>
                                            <!-- /.col-lg-6 -->
                                            <div class="col-lg-6 m-b-10">
                                                <div class="input-group">
                                                    <input type="text" class="form-control">
                                                    <div class="input-group-btn">
                                                        <button type="button" class="btn btn-info dropdown-toggle"
                                                                data-toggle="dropdown">
                                                            Action
                                                            <span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu pull-right">
                                                            <li>
                                                                <a href="#">Action</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    Another action
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">
                                                                    Something else here
                                                                </a>
                                                            </li>
                                                            <li class="divider"></li>
                                                            <li>
                                                                <a href="#">
                                                                    Separated link
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- /btn-group -->
                                                </div>
                                                <!-- /input-group -->
                                            </div>
                                            <!-- /.col-lg-6 -->
                                        </div>
                                        <!-- /.row -->
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        Text Area
                                    </label>
                                    <div class="col-sm-10 col-md-10">
                                        <textarea rows="4" class="form-control resize_vertical"
                                                  placeholder="Basic"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                    </label>
                                    <div class="col-sm-10 col-md-10">
                                        <textarea rows="4" class="form-control resize_vertical" disabled></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                    </label>
                                    <div class="col-sm-10 col-md-10">
                                        <textarea rows="4" class="form-control noresize"
                                                  placeholder="No resize"></textarea>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel ">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class="fa fa-fw ti-download"></i> Advanced File Input
                            </h3>
                            <span class="pull-right">
                                    <i class="fa fa-fw ti-angle-up clickable"></i>
                                    <i class="fa fa-fw ti-close removepanel clickable"></i>
                                </span>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-8">
                                    <label class="control-label">
                                        Select File
                                    </label>
                                    <input id="input-20" type="file" class="file-loading">
                                </div>
                                <div class="col-sm-4">
                                    <div class="alert alert-info small m-t-10">
                                        Display the widget as a single block button
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-8">
                                    <label class="control-label">
                                        Select File
                                    </label>
                                    <input id="input-21" type="file" accept="image/*" class="file-loading">
                                </div>
                                <div class="col-sm-4">
                                    <div class="alert alert-info small m-t-10">
                                        Show only image files for selection & preview. Control button labels, styles,
                                        and icons for the Pick Image, upload, and delete buttons.
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-8">
                                    <label class="control-label">
                                        Select File
                                    </label>
                                    <input id="input-22" type="file" class="file" accept="text/plain"
                                           data-preview-file-type="text" data-preview-class="bg-warning">
                                </div>
                                <div class="col-sm-4">
                                    <div class="alert alert-info small m-t-10">
                                        Preview section control. Change preview background and display only text files
                                        content within the preview window.
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-8 ">
                                    <label class="control-label">
                                        Select File
                                    </label>
                                    <input id="input-23" type="file" class="file-loading" data-show-preview="false">
                                </div>
                                <div class="col-sm-4">
                                    <div class="alert alert-info small m-t-10">
                                        Advanced customization using templates. For example, Hide file preview
                                        thumbnails.
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-8">
                                    <label class="control-label">
                                        Select File
                                    </label>
                                    <input id="input-40" type="file" class="file">
                                    <br>
                                    <button type="button" class="btn btn-warning btn-modify">Modify</button>
                                </div>
                                <div class="col-sm-4">
                                    <div class="alert alert-info small m-t-10">
                                        Using plugin methods to alter input at runtime. For example, click the Modify
                                        button to disable the plugin and change plugin options.
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-8">
                                    <label class="control-label">
                                        Select File
                                    </label>
                                    <input id="input-41" type="file" class="file-loading">
                                </div>
                                <div class="col-sm-4">
                                    <div class="alert alert-info small m-t-10">
                                        Allow only image and video file types to be uploaded. You can configure the
                                        condition for validating the file types using
                                        <code>fileTypeSettings</code> .
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-8">
                                    <label class="control-label">
                                        Select File
                                    </label>
                                    <input id="input-42" type="file" class="file-loading">
                                </div>
                                <div class="col-sm-4">
                                    <div class="alert alert-info small m-t-10">
                                        Allow only specific( jpg, gif, png, txt ) file extensions.
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-8">
                                    <label class="control-label">
                                        Select File
                                    </label>
                                    <input id="input-43" type="file" class="file-loading">
                                    <div id="errorBlock43" class="help-block"></div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="alert alert-info small m-t-10">
                                        Disable preview and customize your own error container and messages.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--main content-->
            <!--rightside bar -->
            <div id="right">
                <div id="right-slim">
                    <div class="rightsidebar-right">
                        <div class="rightsidebar-right-content">
                            <div class="panel-tabs">
                                <ul class="nav nav-tabs nav-float" role="tablist">
                                    <li class="active text-center">
                                        <a href="#r_tab1" role="tab" data-toggle="tab"><i
                                                class="fa fa-fw ti-comments"></i></a>
                                    </li>
                                    <li class="text-center">
                                        <a href="#r_tab2" role="tab" data-toggle="tab"><i class="fa fa-fw ti-bell"></i></a>
                                    </li>
                                    <li class="text-center">
                                        <a href="#r_tab3" role="tab" data-toggle="tab"><i
                                                class="fa fa-fw ti-settings"></i></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="r_tab1">
                                    <div id="slim_t1">
                                        <h5 class="rightsidebar-right-heading text-uppercase text-xs">
                                            <i class="menu-icon  fa fa-fw ti-user"></i>
                                            Contacts
                                        </h5>
                                        <ul class="list-unstyled margin-none">
                                            <li class="rightsidebar-contact-wrapper">
                                                <a class="rightsidebar-contact" href="#">
                                                    <img src="img/authors/avatar6.jpg"
                                                         class="img-circle pull-right" alt="avatar-image">
                                                    <i class="fa fa-circle text-xs text-primary"></i>
                                                    Annette
                                                </a>
                                            </li>
                                            <li class="rightsidebar-contact-wrapper">
                                                <a class="rightsidebar-contact" href="#">
                                                    <img src="img/authors/avatar.jpg"
                                                         class="img-circle pull-right" alt="avatar-image">
                                                    <i class="fa fa-circle text-xs text-primary"></i>
                                                    Jordan
                                                </a>
                                            </li>
                                            <li class="rightsidebar-contact-wrapper">
                                                <a class="rightsidebar-contact" href="#">
                                                    <img src="img/authors/avatar2.jpg"
                                                         class="img-circle pull-right" alt="avatar-image">
                                                    <i class="fa fa-circle text-xs text-primary"></i>
                                                    Stewart
                                                </a>
                                            </li>
                                            <li class="rightsidebar-contact-wrapper">
                                                <a class="rightsidebar-contact" href="#">
                                                    <img src="img/authors/avatar3.jpg"
                                                         class="img-circle pull-right" alt="avatar-image">
                                                    <i class="fa fa-circle text-xs text-warning"></i>
                                                    Alfred
                                                </a>
                                            </li>
                                            <li class="rightsidebar-contact-wrapper">
                                                <a class="rightsidebar-contact" href="#">
                                                    <img src="img/authors/avatar4.jpg"
                                                         class="img-circle pull-right" alt="avatar-image">
                                                    <i class="fa fa-circle text-xs text-danger"></i>
                                                    Eileen
                                                </a>
                                            </li>
                                            <li class="rightsidebar-contact-wrapper">
                                                <a class="rightsidebar-contact" href="#">
                                                    <img src="img/authors/avatar5.jpg"
                                                         class="img-circle pull-right" alt="avatar-image">
                                                    <i class="fa fa-circle text-xs text-muted"></i>
                                                    Robert
                                                </a>
                                            </li>
                                            <li class="rightsidebar-contact-wrapper">
                                                <a class="rightsidebar-contact" href="#">
                                                    <img src="img/authors/avatar7.jpg"
                                                         class="img-circle pull-right" alt="avatar-image">
                                                    <i class="fa fa-circle text-xs text-muted"></i>
                                                    Cassandra
                                                </a>
                                            </li>
                                        </ul>

                                        <h5 class="rightsidebar-right-heading text-uppercase text-xs">
                                            <i class="fa fa-fw ti-export"></i>
                                            Recent Updates
                                        </h5>
                                        <div>
                                            <ul class="list-unstyled">
                                                <li class="rightsidebar-notification">
                                                    <a href="#">
                                                        <i class="fa ti-comments-smiley fa-fw text-primary"></i>
                                                        New Comment
                                                    </a>
                                                </li>
                                                <li class="rightsidebar-notification">
                                                    <a href="#">
                                                        <i class="fa ti-twitter-alt fa-fw text-success"></i>
                                                        3 New Followers
                                                    </a>
                                                </li>
                                                <li class="rightsidebar-notification">
                                                    <a href="#">
                                                        <i class="fa ti-email fa-fw text-info"></i>
                                                        Message Sent
                                                    </a>
                                                </li>
                                                <li class="rightsidebar-notification">
                                                    <a href="#">
                                                        <i class="fa ti-write fa-fw text-warning"></i>
                                                        New Task
                                                    </a>
                                                </li>
                                                <li class="rightsidebar-notification">
                                                    <a href="#">
                                                        <i class="fa ti-export fa-fw text-danger"></i>
                                                        Server Rebooted
                                                    </a>
                                                </li>
                                                <li class="rightsidebar-notification">
                                                    <a href="#">
                                                        <i class="fa ti-info-alt fa-fw text-primary"></i>
                                                        Server Not Responding
                                                    </a>
                                                </li>
                                                <li class="rightsidebar-notification">
                                                    <a href="#">
                                                        <i class="fa ti-shopping-cart fa-fw text-success"></i>
                                                        New Order Placed
                                                    </a>
                                                </li>
                                                <li class="rightsidebar-notification">
                                                    <a href="#">
                                                        <i class="fa ti-money fa-fw text-info"></i>
                                                        Payment Received
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="r_tab2">
                                    <div id="slim_t2">
                                        <h5 class="rightsidebar-right-heading text-uppercase text-xs">
                                            <i class="fa fa-fw ti-bell"></i>
                                            Notifications
                                        </h5>
                                        <ul class="list-unstyled m-t-15 notifications">
                                            <li>
                                                <a href="" class="message icon-not striped-col">
                                                    <img class="message-image img-circle"
                                                         src="img/authors/avatar3.jpg" alt="avatar-image">

                                                    <div class="message-body">
                                                        <strong>John Doe</strong>
                                                        <br>
                                                        5 members joined today
                                                        <br>
                                                        <small class="noti-date">Just now</small>
                                                    </div>

                                                </a>
                                            </li>
                                            <li>
                                                <a href="" class="message icon-not">
                                                    <img class="message-image img-circle"
                                                         src="img/authors/avatar.jpg" alt="avatar-image">
                                                    <div class="message-body">
                                                        <strong>Tony</strong>
                                                        <br>
                                                        likes a photo of you
                                                        <br>
                                                        <small class="noti-date">5 min</small>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" class="message icon-not striped-col">
                                                    <img class="message-image img-circle"
                                                         src="img/authors/avatar6.jpg" alt="avatar-image">

                                                    <div class="message-body">
                                                        <strong>John</strong>
                                                        <br>
                                                        Dont forgot to call...
                                                        <br>
                                                        <small class="noti-date">11 min</small>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" class="message icon-not">
                                                    <img class="message-image img-circle"
                                                         src="img/authors/avatar1.jpg" alt="avatar-image">
                                                    <div class="message-body">
                                                        <strong>Jenny Kerry</strong>
                                                        <br>
                                                        Done with it...
                                                        <br>
                                                        <small class="noti-date">1 Hour</small>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" class="message icon-not striped-col">
                                                    <img class="message-image img-circle"
                                                         src="img/authors/avatar7.jpg" alt="avatar-image">

                                                    <div class="message-body">
                                                        <strong>Ernest Kerry</strong>
                                                        <br>
                                                        2 members joined today
                                                        <br>
                                                        <small class="noti-date">3 Days</small>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="text-right noti-footer"><a href="#">View All Notifications <i
                                                    class="ti-arrow-right"></i></a></li>
                                        </ul>
                                        <h5 class="rightsidebar-right-heading text-uppercase text-xs">
                                            <i class="fa fa-fw ti-check-box"></i>
                                            Tasks
                                        </h5>
                                        <ul class="list-unstyled m-t-15">
                                            <li>
                                                <div>
                                                    <p>
                                                        <span>Button Design</span>
                                                        <small class="pull-right text-muted">40%</small>
                                                    </p>
                                                    <div class="progress progress-xs progress-striped active">
                                                        <div class="progress-bar progress-bar-success"
                                                             role="progressbar"
                                                             aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                                             style="width: 40%">
                                                            <span class="sr-only">40% Complete (success)</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div>
                                                    <p>
                                                        <span>Theme Creation</span>
                                                        <small class="pull-right text-muted">20%</small>
                                                    </p>
                                                    <div class="progress progress-xs progress-striped active">
                                                        <div class="progress-bar progress-bar-info" role="progressbar"
                                                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
                                                             style="width: 20%">
                                                            <span class="sr-only">20% Complete</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div>
                                                    <p>
                                                        <span>XYZ Task To Do</span>
                                                        <small class="pull-right text-muted">60%</small>
                                                    </p>
                                                    <div class="progress progress-xs progress-striped active">
                                                        <div class="progress-bar progress-bar-warning"
                                                             role="progressbar"
                                                             aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                                             style="width: 60%">
                                                            <span class="sr-only">60% Complete (warning)</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div>
                                                    <p>
                                                        <span>Transitions Creation</span>
                                                        <small class="pull-right text-muted">80%</small>
                                                    </p>
                                                    <div class="progress progress-xs progress-striped active">
                                                        <div class="progress-bar progress-bar-danger" role="progressbar"
                                                             aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
                                                             style="width: 80%">
                                                            <span class="sr-only">80% Complete (danger)</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="text-right"><a href="#">View All Tasks <i
                                                    class="ti-arrow-right"></i></a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>
                                <div class="tab-pane fade" id="r_tab3">
                                    <div id="slim_t3">
                                        <h5 class="rightsidebar-right-heading text-uppercase text-xs">
                                            <i class="fa fa-fw ti-layers"></i>
                                            Skins
                                        </h5>
                                        <ul>
                                            <li class="setting-color">
                                                <label class="active-color">
                                                    <input name='skins' type='radio'
                                                           onchange='change_skin("skin-default");'
                                                           checked='checked'/>
                                                    <span class='split'>
                                            <span class='color bg-default-clear'></span>
                                            <span class='color bg-default-light'></span>
                                        </span>
                                                    <span class='color l-m-bg'></span>
                                                </label>
                                                <label>
                                                    <input name='skins' type='radio'
                                                           onchange='change_skin("skin-mint");'/>
                                                    <span class='split'>
                                                <span class='color bg-mint'></span>
                                                <span class='color bg-mint-light'></span>
                                            </span>
                                                    <span class='color l-m-bg'></span>
                                                </label>
                                                <label>
                                                    <input name='skins' type='radio'
                                                           onchange='change_skin("skin-grape");'/>
                                                    <span class='split'>
                                                <span class='color bg-grape'></span>
                                                <span class='color bg-grape-light'></span>
                                            </span>
                                                    <span class='color l-m-bg'></span>
                                                </label>
                                            </li>
                                            <li class="setting-color">
                                                <label>
                                                    <input name='skins' type='radio'
                                                           onchange='change_skin("skin-lavender");'/>
                                                    <span class='split'>
                                                <span class='color bg-lavender'></span>
                                                <span class='color bg-lavender-light'></span>
                                            </span>
                                                    <span class='color l-m-bg'></span>
                                                </label>

                                                <label>
                                                    <input name='skins' type='radio'
                                                           onchange='change_skin("skin-pink");'/>
                                                    <span class='split'>
                                                <span class='color bg-pink'></span>
                                                <span class='color bg-pink-light'></span>
                                            </span>
                                                    <span class='color l-m-bg'></span>
                                                </label>
                                                <label>
                                                    <input name='skins' type='radio'
                                                           onchange='change_skin("skin-sunflower");'/>
                                                    <span class='split'>
                                                <span class='color bg-sunflower'></span>
                                                <span class='color bg-sunflower-light'></span>
                                            </span>
                                                    <span class='color l-m-bg'></span>
                                                </label>
                                            </li>
                                        </ul>
                                        <h5 class="rightsidebar-right-heading text-uppercase gen-sett-m-t text-xs">
                                            <i class="fa fa-fw ti-settings"></i>
                                            General
                                        </h5>
                                        <ul class="list-unstyled settings-list m-t-10">
                                            <li>
                                                <label for="status">Available</label>
                                                <span class="pull-right">
                                            <input type="checkbox" id="status" name="my-checkbox" checked>
                                        </span>
                                            </li>
                                            <li>
                                                <label for="email-auth">Login with Email</label>
                                                <span class="pull-right">
                                            <input type="checkbox" id="email-auth" name="my-checkbox">
                                        </span>
                                            </li>
                                            <li>
                                                <label for="update">Auto Update</label>
                                                <span class="pull-right">
                                            <input type="checkbox" id="update" name="my-checkbox">
                                        </span>
                                            </li>

                                        </ul>
                                        <h5 class="rightsidebar-right-heading text-uppercase text-xs">
                                            <i class="fa fa-fw ti-volume"></i>
                                            Sound & Notification
                                        </h5>
                                        <ul class="list-unstyled settings-list m-t-10">
                                            <li>
                                                <label for="chat-sound">Chat Sound</label>
                                                <span class="pull-right">
                                            <input type="checkbox" id="chat-sound" name="my-checkbox" checked>
                                        </span>
                                            </li>
                                            <li>
                                                <label for="noti-sound">Notification Sound</label>
                                                <span class="pull-right">
                                            <input type="checkbox" id="noti-sound" name="my-checkbox">
                                        </span>
                                            </li>
                                            <li>
                                                <label for="remain">Remainder </label>
                                                <span class="pull-right">
                                            <input type="checkbox" id="remain" name="my-checkbox" checked>
                                        </span>

                                            </li>
                                            <li>
                                                <label for="vol">Volume</label>
                                                <input type="range" id="vol" min="0" max="100" value="15">
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--main content ends-->
            <div class="background-overlay"></div>
        </section>
        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
</div>