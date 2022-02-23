 <?php
include "../conn.php";

		
       $id_peminjaman = $_POST['id_peminjaman'];
		$bataspinjam= $_POST['batas_pinjam'];
		$tglkembali = $_POST ['tgl_kembali'];
		$id_anggota= $_POST['id_anggota'];
		$kode_buku=$_POST['id_buku'];
		
		$bts = strtotime($bataspinjam);
		$kmbl = strtotime ($tglkembali);
		
		$diff = $kmbl - $bts;
		
		$denda = floor($diff/(60 * 60 *24));
		
        			
	$query = "INSERT INTO `puswil`.`pengembalian` (`id`, `id_peminjaman`, `batas_pinjam`, `tgl_kembali`, `id_anggota`, `id_buku`, `denda`) 
	VALUES (' ', '$id_peminjaman', '$bataspinjam', '$tglkembali', '$id_anggota', '$kode_buku', '$denda')";
	$sql = mysql_query ($query) or die (mysql_error());
	if ($sql) {
			echo"<script>alert('Pengembalian telah berhasil dilakukan !',document.location.href='detail-pengembalian.php')</script>";
	} else {
			echo"<script>alert('Pengembalian gagal gagal !',document.location.href='transaksi-pengembalian.php')</script>";
	}

?>