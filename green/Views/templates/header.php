<!DOCTYPE HTML>
<html>

<head>
    <base href="<?= base_url('static/green/'); ?>/" />
    <title>技术学习页（Learn）</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="assets/css/main.css" />
    <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>

<body>

    <div id="page-wrapper">

        <!-- Header -->
        <header id="header">
            <h1 id="logo"><a href="<?= site_url() ?>">Elapse.date 【消逝年華】</a></h1>
            <!-- <h1 id="logo"><a href="javascript:void(0)">流逝年华 【Elapse.date】</a></h1> -->
            <nav id="nav">
                <ul>
                    <li><a href="<?= site_url() ?>">Home</a></li>
                    <li>
                        <a href="javascript:;">服务器</a>
                        <ul>
                            <li><a href="left-sidebar.html">Windows</a></li>
                            <li>
                                <a href="<?= site_url('article') ?>">Linux</a>
                                <ul>
                                    <li><a href="javascript:;">Debian</a></li>
                                    <li><a href="javascript:;">Ubuntu</a></li>
                                    <li><a href="javascript:;">CentOS</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="<?= site_url('article') ?>" class="button">Linux</a></li>
                    <li><a href="javascript:;">PHP</a></li>
                    <li><a href="javascript:;">登錄</a></li>
                </ul>
            </nav>
        </header>