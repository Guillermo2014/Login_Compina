<?php
    include ("../Conexion/conexion.php");
    session_start();
    $_SESSION['usuario'] = "-1";

    $usuario=$_POST['usuario'];
    $password=md5($_POST['password']);

    $sql = "SELECT * FROM users where user_login = '$usuario' and password = '$password'";
    $result = mysqli_query($conexion,$sql);

    while($datos = mysqli_fetch_array($result)){
        $_SESSION['usuario'] = $datos['id_people'];
        $_SESSION['type'] = $datos['type_user'];
    }

    if(!isset($_SESSION['type'])){
        //header('Location: ../Hola');
        echo "Hola";
    }else{
        if($_SESSION['usuario'] != "-1"){
            header('Location: ../Hola');
        }
    }

    if($_SESSION['usuario'] != "-1" && $_SESSION['type'] == "Administrador"){
        header("Location: ../Cliente");
    }
    else{
        header("Location: ../Login/?mensaje=Datos incorrectos");
    }

    
    
?>