<?php
session_start();

if (!isset($_SESSION['usuario'])) {
    header("Location: login.php");
    exit;
}

include 'connection.example.php';

$nombre_usuario = $_SESSION['usuario'];
$carpeta = "images/";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES["foto"])) {
    $nombre_original = basename($_FILES['foto']['name']);
    $extension = pathinfo($nombre_original, PATHINFO_EXTENSION);
    $nombre = preg_replace('/[^a-zA-Z0-9_-]/', '_', $nombre_usuario) . '_' . time() . '.' . $extension;
    $rutadestino = $carpeta . $nombre;

    if (!file_exists($carpeta)) {
        mkdir($carpeta, 0777, true);
    }

    if (move_uploaded_file($_FILES['foto']["tmp_name"], $rutadestino)) {
        echo "<p style='color: green;'>Foto subida al servidor correctamente.</p>"; 
        
        $sql_update = "UPDATE usuarios SET imagen = ? WHERE Nombre = ?"; 
        $stmt_update = $conexion->prepare($sql_update);
        
        $stmt_update->bind_param("ss", $rutadestino, $nombre_usuario);
        
        if ($stmt_update->execute()) {
            echo "<p style='color: blue;'>Base de datos actualizada con éxito.</p>";
        } else {
            echo "<p style='color: red;'>Error al actualizar la base de datos.</p>";
        }
        $stmt_update->close();
        
    } else {
        echo "<p style='color: red;'>Error al mover la imagen subida.</p>";
    }
}

while($conexion->more_results() && $conexion->next_result()) {
    $extraResult = $conexion->use_result();
    if($extraResult instanceof mysqli_result){
        $extraResult->free();
    }
}

$sql = "CALL obtener_perfil_usuario(?)"; 

$stmt = $conexion->prepare($sql);
$stmt->bind_param("s", $nombre_usuario);
$stmt->execute();
$resultado = $stmt->get_result();

$imagen_usuario = "images/default.jpg";

if ($resultado && $fila = $resultado->fetch_assoc()) {
    $rol_correcto = $fila['rol'];
    
    if (!empty($fila['imagen_tipo'])) {
        $imagen_tipo = $fila['imagen_tipo']; 
    }

    if (!empty($fila['imagen'])) {
        $imagen_usuario = $fila['imagen']; 
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="estilo.css">
    <title>Perfil</title>
</head>
<body>
    <div class="container">
        <?php
        echo '<div class="avatar-frame perfil">
        <img src="' . htmlspecialchars($imagen_usuario) . '" alt="Foto de perfil">
        <span class="avatar-label">Mi Foto</span>
      </div>';
      ?>
        <h2>Bienvenido, <?php echo htmlspecialchars($_SESSION['usuario']); ?></h2>
        <a href="session/closesession.php">Cerrar sesión</a>
    </div>
</body>
</html>