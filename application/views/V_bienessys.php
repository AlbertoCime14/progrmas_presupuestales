<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <?php
    $pag = 4;
    include 'application/views/masterpage/navagacionnavb.php';
    ?>
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <!--<h1>Formato 1</h1>-->
        </section>
        <!-- Main content -->
        <!---Aqui va el contenido de la pagina :v-->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                               Bienes y servicios
                            </h3>
                        </div>
                        <div class="panel-body">
                            <div class="row"> <!--Etiqueta de entrada del row-->
							<section>
							<div class="col-md-12">
							<div class="form-group">
							</div>
							</div>
							</section>
							<section>
							<div class="col-md-12">
							  <table class="table">
                                    <tr>
                                        <th>Bien o servicio</th>
                                        <th>Descripción de bien o servicio</th>
                                        <th>Cripterios de calidad</th>
                                        <th>Criterios para determinar la entrega oportuna</th>
                                        <th>Unidad de medida</th>
										<th>Opciones</th>
                                    </tr>
                                    <tbody>
                                    <tr>
                                        <td><input class="form-control" type="text"/></td>
                                        <td><input class="form-control" type="text"/></td>
                                        <td><input class="form-control" type="text"/></td>
                                        <td><input class="form-control" type="text"/></td>
										   <td>
										   <select class="form-control">
										   <option>O</option>
										   <option>O</option>
										   <option>O</option>
										   <option>O</option>
										   </select>
										   </td>
										     
                                        <td class="ui-group-buttons">

                                            <a class="btn btn-success" role="button">
                                                <span class="glyphicon glyphicon-floppy-disk"></span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>Nombre de un programa de ejemplo</label></td>
                                        <td>Ejemplo t actor</td>
                                        <td>Ejemplo pocision</td>
                                        <td>Ejemplo importancia</td>
										 <td>Ejemplo importancia</td>
                                        <td class="ui-group-buttons">
                                            <a class="btn btn-danger" role="button">
                                                <span class="glyphicon glyphicon-trash"></span>
                                            </a>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
								</div>
							</section>
                            </div> <!--Etiqueta de cierre del row-->
                        </div>
                    </div>
                </div>
              

            </div>
        </section>
        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
</div>