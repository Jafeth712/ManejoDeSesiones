<?php
// Database connection|Configuracion de la conexion de la base de datos.
    $host = "localhost";              // Hostname|Nombre del servidor de la base de datos
    $user = "Stevie";                 // Database username|Nombre de usuario de la base de datos
    $passwordd = "th3b3stbluesm4n";    // Database password|Contraseña de la base de datos
    $database = "veterinaria";             // Databse name|Nombre de la base de datos

    // Create connection|Crear conexion
    $conexion=new mysqli($host, $user, $passwordd, $database, 3307);

    // Check connection|Verificar conexion
    if($conexion->connect_error){
        die("Connection failed: ". $conexion->connect_error);
    }

    // Set database connection|Establecer la conexion con la base de datos
    $conexion->set_charset("utf8mb4");  // Set character set to UTF-8|Establecer conjunto de caracteres a UTF-8

    //echo "Connected successfully to the database|La conexion se ha establecido correctamente.";  // Connection successful message|Mensaje de conexion exitosa
?>
