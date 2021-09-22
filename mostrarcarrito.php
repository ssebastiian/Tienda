<?php 
include 'global/config.php';
include 'carrito.php';
include 'templates/cabezara.php';
?>

<br>
<h3>Lista del carrito</h3>
<?php if(!empty($_SESSION['CARRITO'])) {?>
<table class="table table-light">
    <tbody>
        <tr>
            <th width="40%">Descripcion</th>
            <th width="15%">Cantidad</th>
            <th width="20%">Precio</th>
            <th width="20%">Total</th>
            <th width="5%">--</th>
        </tr>
        <?php $total=0;?>
        <?php foreach($_SESSION['CARRITO'] as $indice=>$producto){ ?>
        <tr>
            <td width="40%"><?php echo $producto['nombre']?></td>
            <td width="15%"><?php echo $producto['cantidad']?></td>
            <td width="20%"><?php echo $producto['precio']?></td>
            <td width="20%"><?php echo number_format($producto['precio']*$producto['cantidad'],2)?></td>
            <td width="5%">
            <form action="" method="post">
            <input type="hidden" name="id" id="id" value="<?php echo openssl_encrypt($producto['id_producto'],COD,KEY);?>">
            <button class="btn btn-danger" name="btnAccion" type="submit" value="Eliminar"> Eliminar </button>
            </form>
            </td>
        </tr>
        <?php $total=$total+($producto['precio']*$producto['cantidad']);?>
        <?php } ?>
        <tr>
            <td colspan="3" align="right"> <h3>Total</h3></td>
            <td align="right"><h3><?php echo number_format($total,2);?></h3></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="5">
                <form action="pagar.php" method="post">
                    <div class="alert alert-success">
                    <div class="form-group">
                        <label for="my-input">Correo de contacto</label>
                        <input id="email" name="email" type="text" placeholder="Digita el correo" required>
                    </div>
                    <small id="emailHelp" class="form-text text-muted">
                        se enviaran al correo
                    </small>
                    </div>
                    <button class="btn btn-primary btn-lg btn-block" type="submit" name="btnAccion" value="proceder"><< PAGAR >></button>
                </form>
            </td>
        </tr>
    </tbody>
</table>
<?php } else { ?>
    <div class="alert alert-success">
        no hay productos en el carrito 
    </div>
 <?php } ?>   
<?php
include 'templates/pie.php';
?>