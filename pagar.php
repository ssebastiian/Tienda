<?php 
include 'global/config.php';
include 'global/conexion.php';
include 'carrito.php';
include 'templates/cabezara.php';
?>
<br><br><br><br><br><br><br>
<?php
    if($_POST){
        $total=0;
        $SID=session_id();
        $Correo=$_POST['email'];
        foreach($_SESSION['CARRITO'] as $indice=>$producto){
            $total=$total+($producto['precio']*$producto['cantidad']);
        }

        $sentencia=$pdo->prepare("INSERT INTO `tbl_ventas` (`id_ventas`, `ClaveTrasaccion`, `paypaldatos`, `fecha`, `correo`, `total`, `status`) 
        VALUES (NULL, :ClaveTransaccion , '', NOW(), :Correo,:Total, 'pendiente');");
        
        $sentencia->bindParam(":ClaveTransaccion",$SID);
        $sentencia->bindParam(":Correo",$Correo);
        $sentencia->bindParam(":Total",$total);
        $sentencia->execute();
        $idventa=$pdo->lastInsertId();

        foreach($_SESSION['CARRITO'] as $indice=>$producto){
            $sentencia=$pdo->prepare("INSERT INTO `tbl_detalle_venta` (`id_detalle`, `idventa`, `idproducto`, `precio`, `cantidad`, `descargado`) 
            VALUES (NULL,:idventa,:idproducto,:precio,:cantidad, '0');");

            $sentencia->bindParam(":idventa",$idventa);
            $sentencia->bindParam(":idproducto",$producto['id_producto']);
            $sentencia->bindParam(":precio",$producto['precio']);
            $sentencia->bindParam(":cantidad",$producto['cantidad']);
            $sentencia->execute();
        }
        //echo $total;
    }
?>

<div class="jumbotron text-center">
    <h1 class="display-4">Felicidades por la compra</h1>
    <hr class="my-4">
    <p class="lead">Estas a punto de pagar con paypal :
    <h4><?php  echo number_format($total,2) ?></h4>
    </p>
        <p> te llegara una notificacion al correo del pago
            <strong> apara alguna duda : web@gmail.com</strong>
        </p>
        <div id="paypal-button-container"></div>
        <script src="https://www.paypal.com/sdk/js?client-id=test&currency=USD"></script>
        
        <script>
        // Render the PayPal button into #paypal-button-container
        paypal.Buttons({

            // Set up the transaction
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<?php echo $total;?>'
                        }
                    }]
                });
            },

            // Finalize the transaction
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(orderData) {
                    // Successful capture! For demo purposes:
                    console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
                    var transaction = orderData.purchase_units[0].payments.captures[0];
                    alert('Transaction '+ transaction.status + ': ' + transaction.id + '\n\nSee console for all available details');

                    // Replace the above to show a success message within this page, e.g.
                    // const element = document.getElementById('paypal-button-container');
                    // element.innerHTML = '';
                    // element.innerHTML = '<h3>Thank you for your payment!</h3>';
                    // Or go to another URL:  actions.redirect('thank_you.html');
                });
            }


        }).render('#paypal-button-container');
    </script>
</div>

<?php
include 'templates/pie.php';
?>