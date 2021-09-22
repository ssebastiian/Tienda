<?php
session_start();
$mensaje="";

if(isset($_POST['btnAccion'])){

    switch($_POST['btnAccion']){

        case 'Agregar':
            if(is_numeric(openssl_decrypt($_POST['id'],COD,KEY))){
                $id=openssl_decrypt($_POST['id'],COD,KEY);
                $mensaje.="Perfecto ".$id;
            }else{
                $mensaje.="Algo salio mal".$id;
            }
            if(is_string(openssl_decrypt($_POST['nombre'],COD,KEY))){
                $nombre=openssl_decrypt($_POST['nombre'],COD,KEY);
                $mensaje.="Perfecto ".$nombre;
            }else{
                $mensaje.="Algo salio mal".$nombre;
            }
            if(is_numeric(openssl_decrypt($_POST['cantidad'],COD,KEY))){
                $cantidad=openssl_decrypt($_POST['cantidad'],COD,KEY);
                $mensaje.="Perfecto ".$cantidad;
            }else{
                $mensaje.="Algo salio mal".$cantidad;
            }
            if(is_numeric(openssl_decrypt($_POST['precio'],COD,KEY))){
                $precio=openssl_decrypt($_POST['precio'],COD,KEY);
                $mensaje.="Perfecto ".$precio;
            }else{
                $mensaje.="Algo salio mal".$precio;
            }

        if(!isset($_SESSION['CARRITO'])){
            $producto=array(
                'id_producto'=>$id,
                'nombre'=>$nombre,
                'cantidad'=>$cantidad,
                'precio'=>$precio
            );
            $_SESSION['CARRITO'][0]=$producto;
            $mensaje= "Producto Agregado al Carrito";
        }else{

            $idProductos=array_column($_SESSION['CARRITO'],"id_producto");
            if(in_array($id,$idProductos)){
                echo "<script>alert('El producto ya esta seleccionado');</script>";
            }else{
                $numeroProductos=count($_SESSION['CARRITO']);
                $producto=array(
                    'id_producto'=>$id,
                    'nombre'=>$nombre,
                    'cantidad'=>$cantidad,
                    'precio'=>$precio                
                );
                $_SESSION['CARRITO'][$numeroProductos]=$producto;
                $mensaje= "Producto Agregado al Carrito";
            }
        }
       // $mensaje= print_r($_SESSION,true);
       $mensaje= "Producto Agregado al Carrito";
    break;

    case "Eliminar":
        if(is_numeric(openssl_decrypt($_POST['id'],COD,KEY))){
            $id=openssl_decrypt($_POST['id'],COD,KEY);

            foreach($_SESSION['CARRITO'] as $indice=>$producto){
                if($producto['id_producto']==$id){
                    unset($_SESSION['CARRITO'][$indice]);
                    echo "<script>alert('Elemento Borrado');</script>";

                }
            }
        }else{
            $mensaje.="Algo salio mal".$id;
        }

    break;


    }
}
?>