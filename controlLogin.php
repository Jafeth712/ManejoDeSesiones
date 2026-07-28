<?php /* Indica al servidor que a partir de este punto comenzara
a interpretar codigo PHP */

    require_once 'connection.php'; /* Esta declaracion
    comprueba si el archivo ya ha sido incluido previamente,
    si si, no lo incluye de nuevo*/

    /* Verifica que la petición provenga de un formulario 
    enviado mediante POST y no de una solicitud 
    GET escribiendo la URL. */
    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $usuario=$_POST['nombre']; /* $_POST es un arreglo 
        superglobal que contiene todos los datos enviados mediante 
        el método POST.

        Almacena el valor del <input name="nombre"> en la
        variable $usuario*/ 

        $contrasena=$_POST['contrasena']; /* $_POST es un arreglo 
        superglobal que contiene todos los datos enviados mediante 
        el método POST.
        
        Almacena el valor del <input name="contrasena"> en la
        variable $contrasena*/

        // Prepara una sentencia SQL antes de ejecutarla
        /* Las consultas preparadas ayudan a prevenir
        ataques de SQL Injection, ya que los datos del 
        usuario no se concatenan directamente dentro de la consulta. */
        $stmt=$conexion->prepare("SELECT * FROM usuarios WHERE Nombre = ?");

        // Indica el tipo de dato y el dato que se pasara
        $stmt->bind_param("s", $usuario);

        // Ejecuta la consulta preparada con el parametro previamente asociado
        $stmt->execute();

        /* La variable $resultado almacena los resultados
        de la consulta */
        $resultado=$stmt->get_result();

        // Se verifica si hay minimo 1 registro en la consulta
        if($resultado->num_rows > 0){

            /* Extrae los datos de esa fila que vienen en
            una matriz asociativa */
            $fila=$resultado->fetch_assoc();

            /* Verificacion de que la contraseña 
            coincida con el hash almacenado en la BD*/
            if(password_verify($_POST['contrasena'], $fila['Contrasena'])){
                session_start(); /* Inicia una sesión o recupera 
                una sesión existente para almacenar información 
                del usuario entre diferentes páginas. */

                // Se almacena quien inicio sesion.
                /* $_SESSION es un arreglo superglobal
                que almacena información del usuario
                durante toda la sesión. */
                $_SESSION['usuario'] = $fila['Nombre'];
                header("Location: perfil.php"); /* Envía una 
                cabecera HTTP para redireccionar al usuario 
                hacia index.php. */
                
                exit; /* "Finaliza inmediatamente la 
                ejecución del script para evitar que se 
                siga ejecutando código después del redireccionamiento." */
            }else{
                echo "Contraseña incorrecta";
            }
        }else{
            echo "Usuario no encontrado";
        }

        /* Libera los recursos utilizados por 
        la consulta y cierra la conexión con la
         base de datos. */
        $stmt->close();
        $conexion->close(); 
    }

    /* Muestra este mensaje en caso de entrar
    con URL directo y no desde login.php (POST) */
    else{
        echo "Acceso no autorizado.";
    }
?>