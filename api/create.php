<?php
    header("Content-Type: application/json");
    include 'connection.php';

    $data = json_decode(file_get_contents("php://input"), true);

    $nama_barang = $data['nama_barang'];
    $kategori_id = $data['kategori_id'];
    $stok = $data['stok'];
    $kelompok_barang = $data['kelompok_barang'];
    $harga = $data['harga'];

    $sql = "INSERT INTO barang (nama_barang, kategori_id, stok, kelompok_barang, harga) VALUES ('$nama_barang', $kategori_id, $stok, '$kelompok_barang', $harga)";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(['message' => 'Product created successfully']);
    } else {
        echo json_encode(['message' => 'Product creation failed', 'error' => $conn->error]);
    }

    $conn->close();
?>
