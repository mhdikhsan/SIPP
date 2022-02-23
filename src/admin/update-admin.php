<?php
include "../conn.php";
$user_id       = $_POST['nip_pegawai'];
$username      = $_POST['username'];
$password      = $_POST['password'];
$fullname      = $_POST['nama_pegawai'];
$telp     		 = $_POST['telp_pegawai'];
$email     		= $_POST['email_pegawai'];

$query = mysql_query("UPDATE admin SET username='$username', password='$password', nama_pegawai='$fullname',telp_pegawai='$telp',email_pegawai='$email' WHERE nip_pegawai='$user_id'")or die(mysql_error());
if ($query){
echo "<script>alert('Data Pegawai di perbaharui , Silahkan Login Ulang Untuk Memuat Data Baru!',document.location.href='index.php')</script>";
} else {
	echo "<script>alert('Proses gagal ',document.location.href='index.php')</script>";
    }
?>