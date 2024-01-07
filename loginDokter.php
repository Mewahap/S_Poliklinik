<?php
if (!isset($_SESSION)) {
    session_start();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nama = $_POST['nama'];
    $no_hp = $_POST['no_hp'];

    $query = "SELECT * FROM dokter WHERE nama = '$nama'";
    $result = $mysqli->query($query);

    if (!$result) {
        die("Query error: " . $mysqli->error);
    }

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        if (($no_hp == $row['no_hp'])) {
            $_SESSION['nama'] = $nama;
            $_SESSION['id'] = $row['id'];
            header("Location: berandaDokter.php");
        } else {
            $error = "Password salah";
        }
    } else {
        $error = "Dokter tidak ditemukan";
    }
}
?>

<section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center" style="font-weight: bold; font-size: 32px; background-color: #A9A9A9;">Login Dokter</div>
                    <div class="card-body">
                        <form method="POST" action="index.php?page=loginDokter">
                            <?php
                            if (isset($error)) {
                                echo '<div class="alert alert-danger">' . $error . '
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>';
                            }
                            ?>
                            <div class="form-group">
                                <label for="nama">Nama</label>
                                <input type="text" name="nama" class="form-control" required placeholder="Masukkan nama anda">
                            </div>
                            <div class="form-group">
                                <label for="no_hp">Password</label>
                                <input type="number" name="no_hp" class="form-control" required placeholder="Masukkan password anda">
                            </div>
                            <div class="form-group">
                                <div class="col-12 pt-2 d-flex justify-content-center">
                                    <button class="btn btn-primary" type="submit">Login</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>