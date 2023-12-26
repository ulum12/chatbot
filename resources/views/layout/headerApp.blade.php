<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Chat Bot</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesdesign" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="{{ asset('ladun/apaxy/') }}/images/bot.png">

    <!-- slick css -->
    <link href="{{ asset('ladun/apaxy/') }}/libs/slick-slider/slick/slick.css" rel="stylesheet" type="text/css" />
    <link href="{{ asset('ladun/apaxy/') }}/libs/slick-slider/slick/slick-theme.css" rel="stylesheet" type="text/css" />

    <!-- jvectormap -->
    <link href="{{ asset('ladun/apaxy/') }}/libs/jqvmap/jqvmap.min.css" rel="stylesheet" />

    <!-- Bootstrap Css -->
    <link href="{{ asset('ladun/apaxy/') }}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <!-- DataTables -->
    <link href="{{ asset('ladun/apaxy/') }}/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ asset('ladun/apaxy/') }}/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />

    <!-- Responsive datatable examples -->
    <link href="{{ asset('ladun/apaxy/') }}/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

    <!-- Icons Css -->
    <link href="{{ asset('ladun/apaxy/') }}/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="{{ asset('ladun/apaxy/') }}/css/app.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ asset('ladun/apaxy/') }}/css/custom.css" rel="stylesheet" type="text/css" />
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body data-topbar="dark" data-layout="horizontal">

    <!-- Begin page -->
    <div id="layout-wrapper">


        <header id="page-topbar">
            <div class="navbar-header">
                <div class="d-flex">
                    <!-- LOGO -->
                    <div class="navbar-brand-box">
                        <a href="/" class="logo logo-dark">
                            <span class="text-white logo-sm">
                                CB
                            </span>
                            <span class="text-white logo-lg">
                                Chat Bot
                            </span>
                        </a>

                        <a href="/" class="logo text-white logo-light">
                            <span class="text-white logo-sm">
                                CB
                            </span>
                            <span class="text-white logo-lg">
                                Chat Bot
                            </span>
                        </a>
                    </div>

                    <button type="button" class="btn btn-sm mr-2 font-size-16 d-lg-none header-item waves-effect waves-light" data-toggle="collapse" data-target="#topnav-menu-content">
                        <i class="fa fa-fw fa-bars"></i>
                    </button>
                </div>

                <div class="d-flex">
                    <div class="dropdown d-inline-block d-lg-none ml-2">
                        <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="mdi mdi-magnify"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0" aria-labelledby="page-header-search-dropdown">

                            <form class="p-3">
                                <div class="form-group m-0">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>



                    <div class="dropdown d-inline-block">
                        <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="rounded-circle header-profile-user" src="{{ asset('ladun/apaxy/') }}/images/users/avatar-1.jpg" alt="Header Avatar">
                            <span class="d-none d-sm-inline-block ml-1"><?php echo auth()->user()->username ?></span>
                            <i class="mdi mdi-chevron-down d-none d-sm-inline-block"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <!-- item-->

                            <a class="dropdown-item" href="{{ url('/auth/logout') }}"><i class="mdi mdi-logout font-size-16 align-middle mr-1"></i> Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="topnav bg-dark">
            <div class="container-fluid">
                <nav class="navbar navbar-light navbar-expand-lg topnav-menu">
                    <div class="collapse navbar-collapse pull-right">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link text-white" href="javascript:void(0)" onclick="renderPage('dashboard/beranda', 'Dashboard')">
                                    <i class="mdi mdi-storefront mr-2"></i>Dashboard
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="javascript:void(0)" onclick="renderPage('app/laporan/data', 'Laporan')">
                                    <i class="mdi mdi-file-document-box-search mr-2"></i>Laporan
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link text-white dropdown-toggle arrow-none" href="javascript:void(0)" id="topnav-layout" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="mdi mdi-database mr-2"></i>Data Master<div class="arrow-down"></div>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="topnav-layout">
                                    <a href="javascript:void(0)" onclick="renderPage('app/produk/data', 'Master Data Produk')" class="dropdown-item">Data Produk</a>
                                    <a href="javascript:void(0)" onclick="renderPage('app/chatbot/data', 'Master Data Chatbot')" class="dropdown-item">Data Chat Bot</a>
                                </div>
                            </li>
                            
                            <?php if (auth()->user()->role === 'ADMIN'): ?>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="javascript:void(0)" onclick="renderPage('app/user/data', 'Data User')">
                                        <i class="mdi mdi-account mr-2"></i>User
                                    </a>
                                </li>
                            <?php endif ?>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>