<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mercury</title>
    <!-- Style links -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/custom.css" rel="stylesheet">
    <link href="../css/query.css" rel="stylesheet">
    <link rel="shortcut icon" href="../images/icon.ico" type="image/x-icon">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="header_wrapper">
        <nav class="navbar navbar-inverse not-margin navbar-custom">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse text-center" id="bs-example-navbar-collapse-2">
                    <ul class="nav navbar-nav">
                        <li><a href="#networks">Supported networks</a></li>
                        <li><a href="#achievements">Achievements</a></li>
                        <li><a href="#applying">Applying</a></li>
                        <li><a href="#team">Our team</a></li>
                        <li><a href="#github">GitHub</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <section>
        <div class="initial parallax-window-introduction" data-parallax="scroll">
            <div class="container-fluid text-center">
                <div class="row-fluid">
                    <img src="../images/logo-large.svg" alt="logo" class="logo">
                </div>
                <div class="row-fluid">
                <!--    <% Object user_id = session.getAttribute("user_id");
                        if(user_id != null) { %>

                    <a href="login.jsp" style="margin-right: 20px;"><button class="btn nav-item">Log in</button></a>
                    <a href="signup.jsp" style="margin-left: 20px;"><button class="btn nav-item">Sign up</button></a>

                    <% } else { %>

                    <a href="Controller?logic=logout" style="margin-left: 20px;"><button class="btn nav-item">Log out</button></a>

                    <% }%>
-->
                </div>
                <div class="row-fluid btn-intro-container">
                    <a href="#description"><button class="btn btn-lg learn-more-btn">Go to description</button></a>
                </div>
            </div>
        </div>
    </section>

    <section class="intro text-center section-padding" id="description">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h1 class="arrow">Description</h1>
                    <p class="introtext">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta nisi vitae adipisci animi inventore repellendus minima esse veniam consequuntur. Deserunt laboriosam incidunt alias architecto vitae vel dolore eligendi nemo esse?</p>
                </div>
            </div>
        </div>
    </section>

    <section class="text-center section-padding" id="networks" style="padding-bottom: 0">
        <div class="container-fluid">
            <div class="row">
                <h1 class="arrow">Supported networks</h1>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators carousel-indicators-numbers">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="item item-height active">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <img src="../images/vk.svg" alt="vk.com" class="img-responsive social-img">
                            </div>
                            <div class="col-md-5 col-sm-6 col-xs-12">
                                <h2>Vkontakte</h2>
                                <p class="introtext">VK is the largest European online social networking service. It is based in St. Petersburg. It is available in several languages, but is especially popular among Russian-speaking users. Like other social networks.</p>
                            </div>
                        </div>
                        <div class="item item-height">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <img src="../images/facebook.svg" alt="facebook.com" class="img-responsive social-img">
                            </div>
                            <div class="col-md-5 col-sm-6 col-xs-12">
                                <h2>Facebook</h2>
                                <p class="introtext">Facebook is a corporation and an online social networking service headquartered in Menlo Park, California, in the United States.</p>
                            </div>
                        </div>
                        <div class="item item-height">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <img src="../images/twitter.svg" alt="twitter.com" class="img-responsive  social-img">
                            </div>
                            <div class="col-md-5 col-sm-6 col-xs-12">
                                <h2>Twitter</h2>
                                <p class="introtext">Twitter is an online social networking service that enables users to send and read short 140-character messages called "tweets".Registered users can read and post tweets, but those who are unregistered can only read them. </p>
                            </div>
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <section class="intro text-center section-padding" id="achievements">
        <div class="container-fluid">
            <div class="row">
                <h1 class="arrow">Achievements</h1>
                <div class="col-md-4 col-sm-4">
                    <p class="counter spincrement1">3</p>
                    <p class="counter-description">Number of social networks</p>
                </div>
                <div class="col-md-4 col-sm-4">
                    <p class="counter spincrement2">1257</p>
                    <p class="counter-description">Entries was sent</p>
                </div>
                <div class="col-md-4 col-sm-4">
                    <p class="counter spincrement3">325</p>
                    <p class="counter-description">Number of users</p>
                </div>
            </div>
        </div>
    </section>

    <section class="section-padding" id="applying">
        <div class="container-fluid text-center" style="margin-bottom: 20px">
            <h1 class="arrow">Applying</h1>
        </div>
        <div class="container-fluid">
            <div class="row applying-margin">
                <div class="col-md-offset-6 col-md-5 col-sm-offset-6 col-sm-6">
                    <h3 class="applying-header">Lorem ipsum dolor sit amet</h3>
                    <p class="applying-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi, neque? Expedita sunt dolor dignissimos eum corporis quaerat placeat officia sit facere quo sint nostrum aut ab repellat neque, quibusdam aliquid!</p>
                </div>
            </div>
            <div class="row applying-margin">
                <div class="col-md-offset-1 col-md-5 col-sm-6">
                    <h3 class="applying-header">Lorem ipsum dolor sit amet</h3>
                    <p class="applying-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi, neque? Expedita sunt dolor dignissimos eum corporis quaerat placeat officia sit facere quo sint nostrum aut ab repellat neque, quibusdam aliquid!</p>
                </div>
            </div>
            <div class="row applying-margin">
                <div class="col-md-6"></div>
                <div class="col-md-offset-6 col-md-5 col-sm-offset-6 col-sm-6">
                    <h3 class="applying-header">Lorem ipsum dolor sit amet</h3>
                    <p class="applying-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi, neque? Expedita sunt dolor dignissimos eum corporis quaerat placeat officia sit facere quo sint nostrum aut ab repellat neque, quibusdam aliquid!</p>
                </div>
            </div>
        </div>
    </section>

    <section class="intro text-center section-padding" id="team">
        <div class="container-fluid">
            <div class="row">
                <h1 class="arrow margin-bottom-header">Our team</h1>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a href="https://vk.com/leftjoin"><img src="../images/dubinka.jpg" alt="dubinka" class="img-responsive img-circle dev-img"></a>
                    <!-- <p class="introtext">Yurii Dubinka</p> -->
                    <h2 class="introtext"><a href="https://vk.com/leftjoin">Yurii Dubinka</a></h2>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a href="https://vk.com/id345571845"><img src="../images/zulov.jpg" alt="zulov" class="img-responsive img-circle dev-img"></a>
                    <h2 class="introtext"><a href="https://vk.com/id345571845">Alexey Zhulyov</a></h2>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a href="https://vk.com/vinogradov97max"><img src="../images/vinogradov.jpg" alt="vinogradov" class="img-responsive img-circle dev-img"></a>
                    <h2 class="introtext"><a href="https://vk.com/vinogradov97max">Maxim Vinogradov</a></h2>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a href="https://vk.com/olegluk"><img src="../images/luk.jpg" alt="luk" class="img-responsive img-circle dev-img"></a>
                    <h2 class="introtext"><a href="https://vk.com/olegluk">Oleg Lukjyanykhin</a></h2>
                </div>
            </div>
        </div>
    </section>

    <section class="text-center section-padding" id="github">
        <div class="container-fluid">
            <div class="row">
                <h1 class="arrow margin-bottom-header">We on the GitHub</h1>
            </div>
            <div class="row col-md-offset-3 col-md-2 col-sm-offset-2 col-sm-3">
                <a href="https://github.com/MaxVinogradov/nc_edu_web_app"><img class="img-responsive img-circle github-logo" src="../images/github-social-logo.svg" alt="github"></a>
            </div>
            <div class="row col-md-offset-1 col-md-4 col-sm-offset-2 col-sm-5">
                <p class="applying-description" style="margin-top: 0;"><a href="https://github.com/MaxVinogradov/nc_edu_web_app">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat perspiciatis beatae laudantium autem vero magni deleniti ut, odio fugit dolores nulla hic fugiat laborum inventore labore quis omnis molestias dolore. Lorem ipsum dolor sit amet, consectetur adipisicing elit.</a></p>
            </div>
        </div>
    </section>

    <footer>
        <div class="row-fluid text-center">
            <p class="footer-text">2016</p>
        </div>
    </footer>
    <a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" title="Click to return on the top page" data-toggle="tooltip" data-placement="left"><span class="glyphicon glyphicon-chevron-up"></span></a>
    <!-- Scripts -->
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../lib/parallax.js/parallax.js"></script>
    <script type="text/javascript" src="../lib/spincrement.js/jquery.spincrement.min.js"></script>
    <script type="text/javascript" src="../js/index_custom.js"></script>
</body>
</html>
