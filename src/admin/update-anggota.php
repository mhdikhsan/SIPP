<?php
$namafolder="gambar_anggota/"; //tempat menyimpan file

include "../conn.php";

        $jenis_gambar=$_FILES['nama_file']['type'];
        $id_anggota = $_POST['id_anggota'];
		$nama= $_POST['nama'];
		$jk=$_POST['jenis_kelamin'];
        $status= $_POST['status'];
		$mb = $_POST ['masa_berlaku'];
		$telp = $_POST['no_telp'];
        $tl = $_POST['tempat_lahir'];
		$tgl = $_POST['tgl_lahir'];
        $alamat=$_POST['alamat'];				
		$gambar = $namafolder . basename($_FILES['nama_file']['name']);	
		
		if (move_uploaded_file($_FILES['nama_file']['tmp_name'], $gambar)) {
			$sql="UPDATE dosen SET nama='$nama', jenis_kelamin='$jk', status='$status', masa_berlaku='$mb', no_telp='$telp', tempat_lahir='$tl', tgl_lahir='$tgl', alamat='$alamat', foto='$gambar' WHERE id_anggota='$id_anggota'";
			$res=mysql_query($sql) or die (mysql_error());
			echo"<script>alert('Gambar berhasil di upload !',document.location.href='anggota.php')</script>";
            echo "<script>alert('Data Anggota di perbaharui!',document.location.href='anggota.php')</script>";	   
		} else {
		   echo "<script>alert('Data Anggota gagal diperbaharui !',document.location.href='anggota.php')</script>";
		}
 


?>