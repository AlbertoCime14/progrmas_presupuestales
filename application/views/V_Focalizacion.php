<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <?php
    $pag = 6;
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
                               Criterios para la focalización de la población objetivo
                            </h3>
                        </div>
                        <div class="panel-body">
                            <div class="row"> <!--Etiqueta de entrada del row-->
							<section>
							<div class="col-md-12">
							  <table class="table">
                                    <tr>
                                        <th>Criterio</th>
                                        <th>Descripción del criterio</th>
                                        <th>Justificación de la elección</th>
                                        <th>Medio de verificación</th>
                                        <th>Liga</th>
										<th>Adjuntar archivo</th>
										<th>Opciones</th>
                                    </tr>
                                    <tbody>
                                    <tr>
                                        <td><input class="form-control" type="text"/></td>
                                        <td><input class="form-control" type="text"/></td>
                                        <td><input class="form-control" type="text"/></td>
										   <td><input class="form-control" type="text"/></td>
										      <td><input class="form-control" type="text"/></td>
										       <td>
                                                    <input type="file" style="width: 200px;"
                                                           class="btn btn-default fileinput-upload fileinput-upload-button glyphicon glyphicon-upload"
                                                    / value="Subir">
                                                </td>
										     
                                        <td class="ui-group-buttons">

                                            <a class="btn btn-success" role="button">
                                                <span class="glyphicon glyphicon-floppy-disk"></span>
                                            </a>
                                        </td>
                                    </tr>
									     <tr>
                                        <td><input class="form-control" type="text" disabled="disabled"/></td>
                                        <td><input class="form-control" type="text" disabled="disabled"/></td>
                                        <td><input class="form-control" type="text" disabled="disabled"/></td>
										   <td><input class="form-control" type="text" disabled="disabled"/></td>
										      <td><input class="form-control" type="text" disabled="disabled"/></td>
										       <td>
                                                    <input type="file" style="width: 200px;"
                                                           class="btn btn-default fileinput-upload fileinput-upload-button glyphicon glyphicon-upload"
                                                    / value="Subir" disabled="disabled">
                                                </td>
										     
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
 			
            </div> <!--Este siiiii-->
        </section>
        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
</div>