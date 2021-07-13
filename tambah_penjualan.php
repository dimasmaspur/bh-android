<?php
$response = array();
include 'koneksi.php';

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE);

if (isset($input['id'])) {

    $id_gejala = $input['id'];
    $status = empty($input['status1']) ? "" : $input['status1'];

    $q = "UPDATE datapengiriman SET
			status1='$status'
		WHERE id='$id_gejala'";
    mysqli_query($con, $q);

    $response["status"] = 0;
    $response["message"] = "Data berhasil disimpan";
} else {
    $response["status"] = 2;
    $response["message"] = "Parameter ada yang kosong";
}
echo json_encode($response);
