<?php
include ("conn.php");
date_default_timezone_set('Asia/Jakarta');

session_start();

$username = $_POST['username'];
$password = $_POST['password'];

$username = mysql_real_escape_string($username);
$password = mysql_real_escape_string($password);

$q = mysql_query("select * from admin where username='$username' and password='$password'");
$row = mysql_fetch_array ($q);

if (mysql_num_rows($q) == 1) {
    $_SESSION['nip_pegawai'] = $row['nip_pegawai'];
	$_SESSION['username'] = $username;
	$_SESSION['nama_pegawai'] = $row['nama_pegawai'];
    $_SESSION['email_pegawai'] = $row['email_pegawai'];	

	header('location:admin/index.php');
} else {
	echo "<script>alert('Username atau Password Salah !',document.location.href='index.html')</script>";
	
	
}
?>