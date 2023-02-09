<? php
 
$db = mysql_connect("localhost", "root","password");
 
mysql_select_db("mydb",$db); //connects to our mybuddy database
 
//replace the above two string's with your database specific values
 
if (isset($binary_File) && $binary_File != "none")
 
{
 
  $data = addslashes(fread(fopen($binary_File, "r"), filesize($binary_File)));
 
  $strDescription = addslashes($file_description);
 
  $sql = "INSERT INTO binary_data_files ";
 
  $sql .= "(description, bin_data, filename, filesize, filetype) ";
 
  $sql .= "VALUES ('$strDescription', '$data', ";
 
  $sql .= "'$binary_File_name', '$binary_File_size', '$binary_File_type')";
 
  $result = mysql_query($sql, $db);
 
 echo "<font face=verdana size=2>The file was successfully added to our database.<P>";
 
 echo "<P><B>File Name: </B>". $binary_File_name;
 
echo "<BR><B>File Size: </B>". $binary_File_size ." bytes  (approx ". ($binary_File_size/1024) ." KB)";
 
echo "<P><B>File Type: </B>". $binary_File_type;
 
}
 
mysql_close();
 
?>