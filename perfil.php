<?php
session_start();

if (!isset($_SESSION['usuario'])) {
    header("Location: login.php");
    exit;
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
        <h2>Bienvenido, <?php echo htmlspecialchars($_SESSION['usuario']); ?></h2>
        <a href="session/closesession.php">Cerrar sesión</a>
    </div>
</body>
</html>