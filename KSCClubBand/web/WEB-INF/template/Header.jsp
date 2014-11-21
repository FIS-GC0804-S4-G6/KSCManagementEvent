<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Xenon Boostrap Admin Panel" />
        <meta name="author" content="" />

        <title>${param.title}</title>

        <!-- <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic"> -->
        <link rel="stylesheet" href="xenon/assets/css/fonts/linecons/css/linecons.css">
        <link rel="stylesheet" href="xenon/assets/css/fonts/fontawesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="xenon/assets/css/bootstrap.css">
        <link rel="stylesheet" href="xenon/assets/css/xenon-core.css">
        <link rel="stylesheet" href="xenon/assets/css/xenon-forms.css">
        <link rel="stylesheet" href="xenon/assets/css/xenon-components.css">
        <link rel="stylesheet" href="xenon/assets/css/xenon-skins.css">
        <link rel="stylesheet" href="xenon/assets/css/custom.css">

        <script src="xenon/assets/js/jquery-1.11.1.min.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
                <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


    </head>
    <body class="page-body ${param.pageName}">

        <div class="settings-pane">

            <a href="#" data-toggle="settings-pane" data-animate="true">
                &times;
            </a>

            <div class="settings-pane-inner">

                <div class="row">

                    <div class="col-md-4">

                        <div class="user-info">

                            <div class="user-image">
                                <a href="extra-profile.html">
                                    <img src="xenon/assets/images/user-2.png" class="img-responsive img-circle" />
                                </a>
                            </div>

                            <div class="user-details">

                                <h3>
                                    <a href="extra-profile.html">Steve Nguyen</a>

                                    <!-- Available statuses: is-online, is-idle, is-busy and is-offline -->
                                    <span class="user-status is-online"></span>
                                </h3>

                                <p class="user-title">Web Developer</p>

                                <div class="user-links">
                                    <a href="extra-profile.html" class="btn btn-primary">Edit Profile</a>
                                    <a href="extra-profile.html" class="btn btn-success">Upgrade</a>
                                </div>

                            </div>

                        </div>

                    </div>

                    <div class="col-md-8 link-blocks-env">

                        <div class="links-block left-sep">
                            <h4>
                                <span>Notifications</span>
                            </h4>

                            <ul class="list-unstyled">
                                <li>
                                    <input type="checkbox" class="cbr cbr-primary" checked="checked" id="sp-chk1" />
                                    <label for="sp-chk1">Messages</label>
                                </li>
                                <li>
                                    <input type="checkbox" class="cbr cbr-primary" checked="checked" id="sp-chk2" />
                                    <label for="sp-chk2">Events</label>
                                </li>
                                <li>
                                    <input type="checkbox" class="cbr cbr-primary" checked="checked" id="sp-chk3" />
                                    <label for="sp-chk3">Updates</label>
                                </li>
                                <li>
                                    <input type="checkbox" class="cbr cbr-primary" checked="checked" id="sp-chk4" />
                                    <label for="sp-chk4">Server Uptime</label>
                                </li>
                            </ul>
                        </div>

                        <div class="links-block left-sep">
                            <h4>
                                <a href="#">
                                    <span>Help Desk</span>
                                </a>
                            </h4>

                            <ul class="list-unstyled">
                                <li>
                                    <a href="#">
                                        <i class="fa-angle-right"></i>
                                        Support Center
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa-angle-right"></i>
                                        Submit a Ticket
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa-angle-right"></i>
                                        Domains Protocol
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa-angle-right"></i>
                                        Terms of Service
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div>

                </div>

            </div>

        </div>

        <div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

            <!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
            <!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
            <!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->
            <div class="sidebar-menu toggle-others fixed collapsed">

                <div class="sidebar-menu-inner">

                    <header class="logo-env">

                        <!-- logo -->
                        <div class="logo">
                            <a href="dashboard-1.html" class="logo-expanded">
                                <img src="xenon/assets/images/logo@2x.png" width="80" alt="" />
                            </a>

                            <a href="dashboard-1.html" class="logo-collapsed">
                                <img src="xenon/assets/images/logo-collapsed@2x.png" width="40" alt="" />
                            </a>
                        </div>

                        <!-- This will toggle the mobile menu and will be visible only on mobile devices -->
                        <div class="mobile-menu-toggle visible-xs">
                            <a href="#" data-toggle="user-info-menu">
                                <i class="fa-bell-o"></i>
                                <span class="badge badge-success">7</span>
                            </a>

                            <a href="#" data-toggle="mobile-menu">
                                <i class="fa-bars"></i>
                            </a>
                        </div>

                        <!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
                        <div class="settings-icon">
                            <a href="#" data-toggle="settings-pane" data-animate="true">
                                <i class="linecons-cog"></i>
                            </a>
                        </div>


                    </header>



                    <ul id="main-menu" class="main-menu">
                        <!-- add class "multiple-expanded" to allow multiple submenus to open -->
                        <!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
                        <li>
                            <a href="dashboard-1.html">
                                <i class="linecons-cog"></i>
                                <span class="title">Event</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="JSPEventSelecting">
                                        <span class="title">Filter Events</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="JSPEventCreating">
                                        <span class="title">Creating Event</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="layout-variants.html">
                                <i class="linecons-desktop"></i>
                                <span class="title">Statistic</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="JSPSumPriceEveryMonthOfYear">
                                        <span class="title">Statistic</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                </div>

            </div>

            <div class="main-content">

                <!-- User Info, Notifications and Menu Bar -->
                <nav class="navbar user-info-navbar" role="navigation">

                    <!-- Left links for user info navbar -->
                    <ul class="user-info-menu left-links list-inline list-unstyled">

                        <li class="hidden-sm hidden-xs">
                            <a href="#" data-toggle="sidebar">
                                <i class="fa-bars"></i>
                            </a>
                        </li>

                        <li class="dropdown hover-line">
                            <a href="#" data-toggle="dropdown">
                                <i class="fa-envelope-o"></i>
                                <span class="badge badge-green">15</span>
                            </a>

                            <ul class="dropdown-menu messages">
                                <li>

                                    <ul class="dropdown-menu-list list-unstyled ps-scrollbar">

                                        <li class="active"><!-- "active" class means message is unread -->
                                            <a href="#">
                                                <span class="line">
                                                    <strong>Luc Chartier</strong>
                                                    <span class="light small">- yesterday</span>
                                                </span>

                                                <span class="line desc small">
                                                    This ain?t our first item, it is the best of the rest.
                                                </span>
                                            </a>
                                        </li>

                                        <li class="active">
                                            <a href="#">
                                                <span class="line">
                                                    <strong>Salma Nyberg</strong>
                                                    <span class="light small">- 2 days ago</span>
                                                </span>

                                                <span class="line desc small">
                                                    Oh he decisively impression attachment friendship so if everything.
                                                </span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <span class="line">
                                                    Hayden Cartwright
                                                    <span class="light small">- a week ago</span>
                                                </span>

                                                <span class="line desc small">
                                                    Whose her enjoy chief new young. Felicity if ye required likewise so doubtful.
                                                </span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <span class="line">
                                                    Sandra Eberhardt
                                                    <span class="light small">- 16 days ago</span>
                                                </span>

                                                <span class="line desc small">
                                                    On so attention necessary at by provision otherwise existence direction.
                                                </span>
                                            </a>
                                        </li>

                                        <!-- Repeated -->

                                        <li class="active"><!-- "active" class means message is unread -->
                                            <a href="#">
                                                <span class="line">
                                                    <strong>Luc Chartier</strong>
                                                    <span class="light small">- yesterday</span>
                                                </span>

                                                <span class="line desc small">
                                                    This ain?t our first item, it is the best of the rest.
                                                </span>
                                            </a>
                                        </li>

                                        <li class="active">
                                            <a href="#">
                                                <span class="line">
                                                    <strong>Salma Nyberg</strong>
                                                    <span class="light small">- 2 days ago</span>
                                                </span>

                                                <span class="line desc small">
                                                    Oh he decisively impression attachment friendship so if everything.
                                                </span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <span class="line">
                                                    Hayden Cartwright
                                                    <span class="light small">- a week ago</span>
                                                </span>

                                                <span class="line desc small">
                                                    Whose her enjoy chief new young. Felicity if ye required likewise so doubtful.
                                                </span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <span class="line">
                                                    Sandra Eberhardt
                                                    <span class="light small">- 16 days ago</span>
                                                </span>

                                                <span class="line desc small">
                                                    On so attention necessary at by provision otherwise existence direction.
                                                </span>
                                            </a>
                                        </li>

                                    </ul>

                                </li>

                                <li class="external">
                                    <a href="blank-sidebar.html">
                                        <span>All Messages</span>
                                        <i class="fa-link-ext"></i>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown hover-line">
                            <a href="#" data-toggle="dropdown">
                                <i class="fa-bell-o"></i>
                                <span class="badge badge-purple">7</span>
                            </a>

                            <ul class="dropdown-menu notifications">
                                <li class="top">
                                    <p class="small">
                                        <a href="#" class="pull-right">Mark all Read</a>
                                        You have <strong>3</strong> new notifications.
                                    </p>
                                </li>

                                <li>
                                    <ul class="dropdown-menu-list list-unstyled ps-scrollbar">
                                        <li class="active notification-success">
                                            <a href="#">
                                                <i class="fa-user"></i>

                                                <span class="line">
                                                    <strong>New user registered</strong>
                                                </span>

                                                <span class="line small time">
                                                    30 seconds ago
                                                </span>
                                            </a>
                                        </li>

                                        <li class="active notification-secondary">
                                            <a href="#">
                                                <i class="fa-lock"></i>

                                                <span class="line">
                                                    <strong>Privacy settings have been changed</strong>
                                                </span>

                                                <span class="line small time">
                                                    3 hours ago
                                                </span>
                                            </a>
                                        </li>

                                        <li class="notification-primary">
                                            <a href="#">
                                                <i class="fa-thumbs-up"></i>

                                                <span class="line">
                                                    <strong>Someone special liked this</strong>
                                                </span>

                                                <span class="line small time">
                                                    2 minutes ago
                                                </span>
                                            </a>
                                        </li>

                                        <li class="notification-danger">
                                            <a href="#">
                                                <i class="fa-calendar"></i>

                                                <span class="line">
                                                    John cancelled the event
                                                </span>

                                                <span class="line small time">
                                                    9 hours ago
                                                </span>
                                            </a>
                                        </li>

                                        <li class="notification-info">
                                            <a href="#">
                                                <i class="fa-database"></i>

                                                <span class="line">
                                                    The server is status is stable
                                                </span>

                                                <span class="line small time">
                                                    yesterday at 10:30am
                                                </span>
                                            </a>
                                        </li>

                                        <li class="notification-warning">
                                            <a href="#">
                                                <i class="fa-envelope-o"></i>

                                                <span class="line">
                                                    New comments waiting approval
                                                </span>

                                                <span class="line small time">
                                                    last week
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>

                                <li class="external">
                                    <a href="#">
                                        <span>View all notifications</span>
                                        <i class="fa-link-ext"></i>
                                    </a>
                                </li>
                            </ul>
                        </li>

                    </ul>


                    <!-- Right links for user info navbar -->
                    <ul class="user-info-menu right-links list-inline list-unstyled">

                        <li class="search-form"><!-- You can add "always-visible" to show make the search input visible -->

                            <form method="get" action="extra-search.html">
                                <input type="text" name="s" class="form-control search-field" placeholder="Type to search..." />

                                <button type="submit" class="btn btn-link">
                                    <i class="linecons-search"></i>
                                </button>
                            </form>

                        </li>

                        <li class="dropdown user-profile">
                            <a href="#" data-toggle="dropdown">
                                <img src="xenon/assets/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32" width="28" />
                                <span>
                                    ${param.fullName}
                                    <i class="fa-angle-down"></i>
                                </span>
                            </a>

                            <ul class="dropdown-menu user-profile-menu list-unstyled">
                                <li class="last">
                                    <a href="extra-lockscreen.html">
                                        <i class="fa-lock"></i>
                                        Logout
                                    </a>
                                </li>
                            </ul>
                        </li>

                    </ul>

                </nav>
                <div class="page-title">

                    <div class="title-env">
                        <h1 class="title">${param.heading}</h1>
                        <p class="description">${param.headingNote}</p>
                    </div>

                    <div class="breadcrumb-env">

                        <ol class="breadcrumb bc-1">
                            <li>
                                <a href="JSPEventSelecting"><i class="fa-home"></i>Home</a>
                            </li>
                            <li>

                                <a href="tables-basic.html">${param.step1}</a>
                            </li>
                            <li class="active">

                                <strong>${param.step2}</strong>
                            </li>
                        </ol>

                    </div>

                </div>
