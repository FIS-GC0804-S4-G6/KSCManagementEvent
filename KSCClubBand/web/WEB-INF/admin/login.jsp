<%-- 
    Document   : login
    Created on : 20-Nov-2014, 02:07:11
    Author     : Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Xenon Boostrap Admin Panel" />
        <meta name="author" content="" />

        <title>Login</title>

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
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
    <body class="page-body login-page">
        <div class="login-container">
            <div class="row">
                <div class="col-sm-6">
                    <script type="text/javascript">
                        jQuery(document).ready(function ($)
                        {
                            // Reveal Login form
                            setTimeout(function () {
                                $(".fade-in-effect").addClass('in');
                            }, 1);
                            // Set Form focus
                            $("form#login .form-group:has(.form-control):first .form-control").focus();
                        });
                    </script>
                    <!-- Errors container -->
                    <div class="errors-container">
                    </div>

                    <!--                    <form class="login" method="post" action="Customer">
                                            <input type="email" placeholder="email" name="email" wi/><br/>
                                            <input type="password" placeholder="password" name="password" /><br/>
                                            <select name="persistent">
                                                <option value="Don't Remember">Don't Remember</option>
                                                <option value="Remember me">Remember me</option>
                                            </select>
                                            <input type="submit" value="Login" />
                                        </form> -->

                    <form method="post" action="Customer" id="login" class="login-form fade-in-effect">
                        <div class="login-header">
                            <a href="" class="logo">
                                <h1>KSC Management log in</h1>
                            </a>
                            <p>Dear user, log in to access the admin area!</p>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="username">Email</label>
                            <input type="email" class="form-control input-dark" name="email" id="username" autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="passwd">Password</label>
                            <input type="password" class="form-control input-dark" name="password" id="passwd" autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <select name="persistent" class="form-control input-dark">
                                <option value="Don't Remember">Don't Remember</option>
                                <option value="Remember me">Remember me</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Login" class="btn btn-dark  btn-block text-left"/>
                            <c:if test="${!empty(msgR)}" >
                                <h5 style="color:red;">${msgR}</h5>
                            </c:if>
                        </div>
                        <div class="login-footer">						
                            <div class="info-links">
                                <a href="#">&copy;</a> -
                                <a href="#">KSC Management</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Bottom Scripts -->
        <script src="xenon/assets/js/bootstrap.min.js"></script>
        <script src="xenon/assets/js/TweenMax.min.js"></script>
        <script src="xenon/assets/js/resizeable.js"></script>
        <script src="xenon/assets/js/joinable.js"></script>
        <script src="xenon/assets/js/xenon-api.js"></script>
        <script src="xenon/assets/js/xenon-toggles.js"></script>
        <script src="xenon/assets/js/jquery-validate/jquery.validate.min.js"></script>
        <script src="xenon/assets/js/toastr/toastr.min.js"></script>
        <!-- JavaScripts initializations and stuff -->
        <script src="xenon/assets/js/xenon-custom.js"></script>
    </body>
</html>