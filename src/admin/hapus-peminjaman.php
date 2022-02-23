<?php
include "../conn.php";
$id = $_GET['kd'];

$query = mysql_query("DELETE FROM peminjaman WHERE id_peminjaman='$id'");
if ($query){
	echo "<script>alert('Data Berhasil dihapus!'); window.location = 'detail-peminjaman.php'</script>";	
} else {
	echo "<script>alert('Data Gagal dihapus!'); window.location = 'detail-peminjaman.php'</script>";	
}
?>