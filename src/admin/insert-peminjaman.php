<?php
include "../conn.php";


        $id= $_POST['id_peminjaman'];
		$id_anggota= $_POST['id_anggota'];
		$kode_buku=$_POST['id_buku'];
        $tglpinjam= $_POST['tgl_peminjaman'];
		$tglkembali = date('d F Y', strtotime('+7 days', strtotime($tglpinjam)));
		
        			
	$query = "INSERT INTO peminjaman VALUES('$id','$id_anggota','$kode_buku','$tglpinjam','$tglkembali')";
	$sql = mysql_query ($query) or die (mysql_error());
	if ($sql) {
			echo"<script>alert('Peminjaman telah berhasil dilakukan !',document.location.href='transaksi-peminjaman.php')</script>";
	} else {
			echo"<script>alert('Peminjaman gagal !',document.location.href='transaksi-peminjaman.php')</script>";
	}

?>