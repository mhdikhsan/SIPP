<?php
$namafolder="gambar_anggota/"; //tempat menyimpan file

include "../conn.php";

if (!empty($_FILES["nama_file"]["tmp_name"]))
{
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
		
	if($jenis_gambar=="image/jpeg" || $jenis_gambar=="image/jpg" || $jenis_gambar=="image/gif" || $jenis_gambar=="image/x-png")
	{			
		$gambar = $namafolder . basename($_FILES['nama_file']['name']);		
		if (move_uploaded_file($_FILES['nama_file']['tmp_name'], $gambar)) {
			$sql="INSERT INTO data_anggota(id_anggota,nama,jenis_kelamin,status,masa_berlaku,no_telp,tempat_lahir,tgl_lahir,alamat,foto) VALUES
            ('$id_anggota','$nama','$jk','$status','$mb','$telp','$tl','$tgl','$alamat','$gambar')";
			$res=mysql_query($sql) or die (mysql_error());
			
			echo "<script>alert('Gambar berhasil di upload !',document.location.href='anggota.php')</script>";
		} else {
		  echo "<script>alert('Gambar gagal di upload !',document.location.href='input-anggota.php')</script>";
		}
   } else {
		 echo "<script>alert('Jenis Gambar salah (jpeg,jpg,gif,x-png) !',document.location.href='input-anggota.php')</script>";
   }
} else {
	echo "<script>alert('Gambar belum dipilih untuk diupload !',document.location.href='input-anggota.php')</script>";
}

?>