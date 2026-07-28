<!DOCTYPE html> <!-- Declaracion que indica al navegador que el documento debe interpretarse usando el estandar HTML5 -->
<html lang="es"> <!-- Elemento raiz del documento HTML. El atributo lang="es" indica que el 
    contenido esta en español, lo que mejora la accesibilidad y ayuda a los navegadores
    y motores de busqueda -->

<head> <!-- Contiene los metadatos de la pagina, como la codificacion de caracteres, el diseño
    adaptable (responsive), el titulo y los enlaces a recursos externos como hojas de
    estilo y fuentes. -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión — Veterinaria</title>

    <!-- rel indica el tipo de relacion con el recurso y href especifica
     su ubicacion. En este caso preparan las conexiones y se cargan las 
     fuentes y estilos CSS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="estilo.css">
</head>

<body class="login-wrap"> <!-- Contiene todo el contenido visible con el que interactúa el usuario en la interfaz de la página. -->
    <div class="wrap"> <!-- Contenedor genérico que agrupa elementos HTML para organizarlos y aplicar estilos con CSS o manipularlos mediante JavaScript. -->
        <img src="images/yorkie_mascota.svg" alt="AnimalCareWeb" style="width:110px; margin-bottom:8px;">

        <h1 class="brand">Veterinaria</h1> <!-- Encabezado -->
        <p class="tagline">Panel de ingreso</p> <!-- Texto en forma de parrafo -->

        <div class="card">
            <form action="controlLogin.php" method="post"> <!-- Formulario que recopila los datos del usuario y los envía a controlLogin.php mediante el método POST cuando se presiona el botón de envío. -->
                <div class="field">
                    <label for="nombre">Usuario</label>
                    <input type="text" name="nombre" id="nombre" required placeholder="Tu usuario" autocomplete="username">
                </div>
                <div class="field">
                    <label for="contrasena">Contraseña</label>
                    <input type="password" name="contrasena" id="contrasena" required placeholder="Tu contraseña" autocomplete="current-password">
                </div>
                <button type="submit">Iniciar sesión</button> <!-- Botón de tipo submit que envía el formulario al servidor. -->
            </form>
        </div>

        <p class="foot">¿Olvidaste tu contraseña? <a href="recuperarContrasena.php">Recupérala aquí</a></p> <!-- Enlace que dirige al usuario a la página de recuperación de contraseña. -->
        <p class="foot">¿Eres cliente nuevo? <a href="RegistroCliente.php">Regístrate aquí</a></p><!-- Enlace que dirige al formulario de registro de nuevos clientes. -->
    </div>
</body>
</html>