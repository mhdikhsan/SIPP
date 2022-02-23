<?php
include "../conn.php";


        $id= $_POST['id_buku'];
		$judul= $_POST['judul'];
		$kategori=$_POST['kategori'];
        $pengarang= $_POST['pengarang'];
		$th_terbit = $_POST ['th_terbit'];
		$penerbit = $_POST['penerbit'];
        $isbn = $_POST['isbn'];
		$jumlah = $_POST['jumlah_buku'];
        			
			$query = "INSERT INTO data_buku VALUES('$id','$judul','$pengarang','$th_terbit','$penerbit','$isbn','$kategori','$jumlah')";
	$sql = mysql_query ($query) or die (mysql_error());
	if ($sql) {
			echo"<script>alert('Data Buku telah berhasil ditambahkan !',document.location.href='buku.php')</script>";
	} else {
			echo"<script>alert('Data Buku gagal ditambahkan !',document.location.href='buku.php')</script>";
	}

?>