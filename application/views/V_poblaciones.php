<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <?php
    $pag = 5;
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
                               Definición y cuantificación de las poblaciones
                            </h3>
                        </div>
                        <div class="panel-body">
                            <div class="row"> <!--Etiqueta de entrada del row-->
	
							<section>
							<div class="col-md-12">
							  <table class="table">
                                    <tr>
                                        <th>Población</th>
                                        <th>Descripción</th>
                                        <th>Total</th>
                                        <th>Hombres</th>
                                        <th>Mujeres</th>
										<th>Hablantes de lengua indígena</th>
										<th>¿Pertenece a un grupo de edad?</th>
										<th>Opciones</th>
                                    </tr>
                                    <tbody>
                                    <tr>
                                        <td><input class="form-control" type="text"/></td>
                                        <td><input class="form-control" type="text"/></td>
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
										  <td>Ejemplo importancia</td>
										   <td>Ejemplo importancia</td>
                                        <td class="ui-group-buttons" style="width: 103px;">
										   <a class="btn btn-success" role="button">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </a>
                                            <a class="btn btn-danger" role="button">
                                                <span class="glyphicon glyphicon-trash"></span>
                                            </a>
                                        </td>
                                    </tr>
									     <tr>
                                        <td><label>Nombre de un programa de ejemplo</label></td>
                                        <td>Ejemplo t actor</td>
                                        <td>Ejemplo pocision</td>
                                        <td>Ejemplo importancia</td>
										 <td>Ejemplo importancia</td>
										  <td>Ejemplo importancia</td>
										   <td>Ejemplo importancia</td>
                                        <td class="ui-group-buttons" style="width: 103px;">
										   <a class="btn btn-success" role="button">
                                                <span class="glyphicon glyphicon-edit"></span>
                                            </a>
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
                 <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                              Criterios y fuentes
                            </h3>
                        </div>
                        <div class="panel-body">
                            <div class="row"> <!--Etiqueta de entrada del row-->
	
							<section>
						
							<div class="col-md-5">
								<label>Criterios</label>
							  <table class="table">
                                    <tr>
                                        <th>Nombre del criterio</th>
										<th>Opciones</th>
                                    </tr>
                                    <tbody>
                                    <tr>
                                        <td><input class="form-control" type="text"/></td>
										   </td>
										     
                                        <td class="ui-group-buttons">

                                            <a class="btn btn-success" role="button">
                                                <span class="glyphicon glyphicon-floppy-disk"></span>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>Nombre de un programa de ejemplo</label></td>
                                       
                                        <td class="ui-group-buttons" style="width: 103px;">
										   
                                            <a class="btn btn-danger" role="button">
                                                <span class="glyphicon glyphicon-trash"></span>
                                            </a>
                                        </td>
                                    </tr>
					

                                    </tbody>
                                </table>
								</div>
								<div class="col-md-7">
								<label>Fuentes</label>
							  <table class="table">
                                    <tr>
                                        <th>Nombre de la fuente</th>
                                        <th>Liga</th>
                                        <th>Documento</th>
                                        <th>Opciones</th>
                                    </tr>
                                    <tbody>
                                    <tr>
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
                                        <td>Ejemplo de fuente</td>
                                        <td>wwww.google.com</td>
										          <td>
                                                  Pack.zip
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
  <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                              Cobertura geografica 
                            </h3>
                        </div>
                        <div class="panel-body">
                            <div class="row"> <!--Etiqueta de entrada del row-->
	
							<section class="col-md-12">
						
						
								<div class="col-md-12">
								<label>Fuentes</label>
							  <table class="table">
							  <tr>
							  <th colspan="5"></th>
							   <th colspan="6" style="text-align: center">Localidades por número de habitantes</th>
							  </tr>
                                    <tr>
                                        <th rowspan="2">Nombre del municipio</th>
                                        <th rowspan="2">Numero de localidades</th>
                                        <th rowspan="2">Total de la población programada</th>
                                        <th rowspan="2">% de la población urbana</th>
										 <th rowspan="2" > % de la población rural</th>
										
										 <th rowspan="1">De hasta 500 habitantes</th>
										  <th rowspan="1">501-2,500 </th>
										   <th rowspan="1">2,501-10,000</th>
										    <th rowspan="1">1,001-15,000</th>
											 <th rowspan="1">15,000-49,999</th>
											  <th rowspan="1">Más de 50,000</th>
											  <th rowspan="1">Opciones</th>
                                    </tr>
                                    <tbody>
									<tr>
                                   <td>
								        <select class="form-control">
                                            <option>A</option>
                                            <option>v</option>
                                            <option>c</option>
                                        </select>
								   </td>
								   <td><input type="text" class="form-control"/></td>
								   <td><input type="text" class="form-control"/></td>
								   <td><input type="text" class="form-control"/></td>
								   <td><input type="text" class="form-control"/></td>
								   <td><input type="text" class="form-control"/></td>
								   <td><input type="text" class="form-control"/></td>
								   <td><input type="text" class="form-control"/></td>
								   <td><input type="text" class="form-control"/></td>
								   <td><input type="text" class="form-control"/></td>
								   <td><input type="text" class="form-control"/></td>
								    <td class="ui-group-buttons">

                                            <a class="btn btn-success" role="button">
                                                <span class="glyphicon glyphicon-floppy-disk"></span>
                                            </a>
                                        </td>
										</tr>
							<tr>
                                   <td>
								        <select class="form-control">
                                            <option>A</option>
                                            <option>v</option>
                                            <option>c</option>
                                        </select>
								   </td>
								   <td><input type="text" class="form-control" disabled="disabled"/></td>
								   <td><input type="text" class="form-control" disabled="disabled"/></td>
								   <td><input type="text" class="form-control" disabled="disabled"/></td>
								   <td><input type="text" class="form-control" disabled="disabled"/></td>
								   <td><input type="text" class="form-control" disabled="disabled"/></td>
								   <td><input type="text" class="form-control" disabled="disabled"/></td>
								   <td><input type="text" class="form-control" disabled="disabled"/></td>
								   <td><input type="text" class="form-control" disabled="disabled"/></td>
								   <td><input type="text" class="form-control" disabled="disabled"/></td>
								   <td><input type="text" class="form-control" disabled="disabled"/></td>
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