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
		
			$sql="UPDATE data_buku SET judul='$judul', pengarang='$pengarang', th_terbit='$th_terbit', penerbit='$penerbit', isbn='$isbn', kategori='$kategori', jumlah_buku='$jumlah' WHERE id_buku='$id'";
			$res=mysql_query($sql) or die (mysql_error());
			if ($res) {
			echo"<script>alert('Data Buku telah berhasil diperbaharui !',document.location.href='buku.php')</script>";
	} else {
			echo"<script>alert('Data Buku gagal diperbaharui !',document.location.href='buku.php')</script>";
	}


?>