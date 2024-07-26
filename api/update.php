<?php
header("Content-Type: application/json");
include 'connection.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $data = json_decode(file_get_contents("php://input"), true);

    $nama_barang = $data['nama_barang'];
    $kategori_id = $data['kategori_id'];
    $stok = $data['stok'];
    $kelompok_barang = $data['kelompok_barang'];
    $harga = $data['harga'];

    $sql = "UPDATE barang SET nama_barang='$nama_barang', kategori_id=$kategori_id, stok=$stok, kelompok_barang='$kelompok_barang', harga=$harga WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(['message' => 'Product updated successfully']);
    } else {
        echo json_encode(['message' => 'Product update failed', 'error' => $conn->error]);
    }
} else {
    echo json_encode(['message' => 'Product ID not provided']);
}

$conn->close();
?>
