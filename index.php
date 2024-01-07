<?php
session_start();
include_once("koneksi.php");
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>POLIKLINIK</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

    <!-- Header -->
    <header id="header" class="fixed-top d-flex align-items-center">
        <div class="container">
            <div class="header-container d-flex align-items-center justify-content-between">
                <div class="logo">
                    <h1 class="text-light"><a href="index.php"><span>POLIKLINIK</span></a></h1>
                </div>
                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="nav-link scrollto" href="index.php">Home</a></li>
                        <li><a class="nav-link scrollto" href="index.php?page=daftarpasien">Daftar Pasien</a></li>
                        <?php
                        if (isset($_SESSION['username'])) {
                            // Menu master jika pengguna sudah login
                        ?>
                            <li><a class="nav-link scrollto" href="index.php?page=obat">Obat</a></li>
                            <li><a class="nav-link scrollto " href="index.php?page=dokter">Dokter</a></li>
                            <li><a class="nav-link scrollto" href="index.php?page=poli">Poli</a></li>
                            <li><a class="nav-link scrollto" href="index.php?page=pasien">Pasien</a></li>
                        <?php
                        }
                        if (!isset($_SESSION['username'])) {
                            // Tombol "Get Started" hanya ditampilkan jika pengguna belum login
                        ?>
                            <li><a class="getstarted scrollto" href="#cta">Get Started</a></li>
                        <?php
                        }
                        ?>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                    <?php
                    if (isset($_SESSION['username'])) {
                        // Jika pengguna sudah login, tampilkan tombol "Logout"
                    ?>
                        <ul class="navbar-nav ms-auto">
                            <li>
                                <a class="getstarted scrollto" href="logoutUser.php">Logout (<?php echo $_SESSION['username'] ?>)</a>
                            </li>
                        </ul>
                    <?php
                    }
                    ?>
                </nav><!-- .navbar -->

            </div><!-- End Header Container -->
        </div>
    </header>

    <!-- Main Content -->
    <main role="main" class="container">
        <?php
        if (isset($_GET['page'])) {
            include($_GET['page'] . ".php");
        } else {
            if (isset($_SESSION['username'])) {
                // Jika sudah login, tampilkan pesan selamat datang dengan username
                echo '
            <section id="hero" class="d-flex align-items-center">
                <div class="container text-center position-relative" data-aos="fade-in" data-aos-delay="200">
                    <h1>Selamat Datang di Sistem Informasi Poliklinik</h1>
                    <h2>Halo, ' . $_SESSION['username'] . '</h2>
                </div>
            </section>';
            } else {
                // Jika belum login, tampilkan pesan selamat datang tanpa username
                echo '
            <section id="hero" class="d-flex align-items-center">
                <div class="container text-center position-relative" data-aos="fade-in" data-aos-delay="200">
                    <h1>Selamat Datang di Sistem Informasi Poliklinik</h1>
                    <h2>Silakan Login untuk menggunakan sistem.</h2>
                    <a href="#services" class="btn-get-started scrollto">Get Started</a>
                </div>
            </section>
            <section id="services" class="services section-bg">
                <div class="container">

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="section-title" data-aos="fade-right">
                                <h2>Login</h2>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col-md-6 d-flex align-items-stretch">
                                    <div class="icon-box" data-aos="zoom-in" data-aos-delay="100">
                                        <div class="icon"><i class="bx bxl-dribbble"></i></div>
                                        <h4><a href="index.php?page=loginUser" class="btn-get-started scrollto">Admin</a></h4>
                                        <p>Silahkan Login sebagai Admin</p>
                                    </div>
                                </div>

                                <div class="col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
                                    <div class="icon-box" data-aos="zoom-in" data-aos-delay="200">
                                        <div class="icon"><i class="bx bx-file"></i></div>
                                        <h4><a href="index.php?page=loginDokter" class="btn-get-started scrollto">Dokter</a></h4>
                                        <p>Silahkan Login sebagai Dokter</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
        
            <section id="cta" class="cta">
                <div class="container">
                    <div class="text-center" data-aos="zoom-in">
                        <h3>Poliklinik</h3>
                        <p> Poliklinik adalah tempat pelayanan yang mempunyai tugas untuk melakukan pemeriksaan kepada pasien secara umum dengan mengetahui indikasi atau gejala yang diderita oleh pasien.</p>
                    </div>
                </div>
            </section>';
            }
        }
        ?>
    </main>

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

</body>

</html>