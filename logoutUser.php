<?php
session_start();
if (isset($_SESSION['username'])) {
    // Hapus session
    session_unset();
    session_destroy();
}


// Arahkan kembali ke halaman index.php
header("Location: index.php");
exit(); // Pastikan untuk keluar setelah mengarahkan header
