<?php
    header("Content-Type: application/json");
    include 'connection.php';

    if (isset($_GET['id'])) {
        $id = $_GET['id'];

        $sql = "DELETE FROM barang WHERE id=$id";
        if ($conn->query($sql) === TRUE) {
            echo json_encode(['message' => 'Product deleted successfully']);
        } else {
            echo json_encode(['message' => 'Product deletion failed', 'error' => $conn->error]);
        }
    } else {
        echo json_encode(['message' => 'Product ID not provided']);
    }

    $conn->close();
?>
