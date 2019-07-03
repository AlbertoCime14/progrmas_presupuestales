<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <?php
    $pag = 1;
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
                               Programas estatales previos
                            </h3>
                        </div>
                        <div class="panel-body">
						<div class="row"> <!--Etiqueta de entrada del row-->
						<section>
					<div class="col-md-12">
                                            <label class="">
                                                <div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" name="c1" id="c1" value="" ins></div> No aplica
                                            </label>
                                        </div>
						</section>
						<section>
						<div class="col-md-4">
						   
                                            <label class="control-label">
                                                Política o programa
                                            </label>
                                           <select class="form-control">
										   <option>A</option>
										   <option>v</option>
										   <option>c</option>
										   </select>
                                     
						</div>
								<div class="col-md-8">
								
                                            <label class="control-label">
                                                Objetivo
                                            </label>
                                        <textarea class="form-control"></textarea>
									</div>
                                      
						
						</section>
						<section>
						<div class="col-md-4">
						   
                                            <label class="control-label">
                                                Lugar donde se implementó
                                            </label>
                                           <select class="form-control" multiple style="height:71px;">
										   <option>A</option>
										   <option>v</option>
										   <option>c</option>
										   </select>
                                     
						</div>
								<div class="col-md-8">
								
                                            <label class="control-label">
                                                Descripción
                                            </label>
                                        <textarea class="form-control"></textarea>
									</div>
                                      
						
						</section>
						<section>
						<div class="col-md-12">
						   
                                            <label class="control-label">
                                                Población objetivo
                                            </label>
                                          <input type="text" class="form-control"/>
                                     
						</div>                                   
						</section>
			
												<section>
													<div class="col-md-12">
						<div class="col-md-4">
												
                                            <label class="control-label">
                                                Bienes y servicios que entregaba y se vinculan con el nuevo programa
                                            </label>
											<table>
											<tr>
											<th></th>
											<th></th>
											</tr>
											<tbody>
											<tr>
											<td style="width:239px;"><input type="text" class="form-control" style="width: 95%;"/></td>
											<td style="height:35px; width:81px;"><input type="submit" class="btn btn-success" value="Guardar"/></td>
											</tr>
												<tr>
											<td style="width:239px;"><input type="text" class="form-control" style="width: 95%;" disabled="disabled" value="Ejemplo de uno"/></td>
											<td style="height:35px; width:81px;"><input type="submit" class="btn btn-warning" value="Eliminar"/></td>
											</tr>
											</tbody>
											</table>
										
						</div>
						<div class="col-md-8">
								
                                            <label class="control-label">
                                                Resultados de evaluaciones
                                            </label>
                                        <textarea class="form-control"></textarea>
						</div>
								</div>
						</section>
							<section>
						<div class="col-md-4">
												
                                            <label class="control-label">
                                             Liga del informe de evaluación
                                            </label>
											 <input type="text" class="form-control"/>
										
						</div>
						<div class="col-md-8">
					
						  <label class="control-label">
                                            	En caso que no sea público, adjuntar archivo
                                            </label>
								           <div class="fileupload-buttonbar">
                                            <div class="col-lg-8">
                                                <!-- The fileinput-button span is used to style the file input field as button -->
                                                    </br><input type="file"  class="btn btn-success fileinput-button" name="files"></br>
                                               
                                                <button type="submit" class="btn btn-primary start">
                                                    <i class="fa fa-fw ti-export"></i>
                                                    <span>Iniciar carga de archivo</span>
                                                </button>
                                              
                                            </div>
                                            <!-- The global progress state -->
                                           
                                        </div>
                                   
						</div>
                                      
												<section>
											</section>
												<section>
												<div class="col-md-12">
												<div class="col-md-10"></div>
												<div class="col-md-1">
												<input class="btn btn-success" value="Guardar" type="submit"/>
												</div>
												</div>
											</section>
						</section>
				
						</div> <!--Etiqueta de cierre del row-->
                        </div>
                    </div>
                </div>
				<!--Listado de pogramas estatales previos-->
				    <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                              Listado de Programas estatales previos            | <input type="submit" value="Nuevo programa" class="btn btn-success">
                            </h3>
							
                        </div>
                        <div class="panel-body">
						<div class="row"> <!--Etiqueta de entrada del row-->
												<table  class="table">
											<tr>
											<th>Nombre de Programas estatales previos</th>
											<th>Opciones</th>
											</tr>
											<tbody>
											<tr>
											<td ><label>Nombre de un programa de ejemplo</label></td>
											<td class="ui-group-buttons">
                                        <a  class="btn btn-success" role="button">
                                            <span class="glyphicon glyphicon-edit"></span>
                                        </a>
                                     
                                        <a  class="btn btn-danger" role="button">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </a>
                                    </td>
											</tr>
								
											</tbody>
											</table>
						</div> <!--Etiqueta de cierre del row-->
                        </div>
                    </div>
                </div>
				<!--Fin programas estatales previos-->
				
				
				
				 <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
								Programas similares y buenas prácticas
                            </h3>
                        </div>
                        <div class="panel-body">
						<div class="row"> <!--Etiqueta de entrada del row-->
						<section>
					<div class="col-md-12">
                                            <label class="">
                                                <div class="icheckbox_square-blue" style="position: relative;"><input type="checkbox" name="c1" id="c1" value="" ins></div> No aplica
                                            </label>
                                        </div>
						</section>
						<section>
						<div class="col-md-4">
						   
                                            <label class="control-label">
                                                Política o programa
                                            </label>
                                           <select class="form-control">
										   <option>A</option>
										   <option>v</option>
										   <option>c</option>
										   </select>
                                     
						</div>
								<div class="col-md-8">
								
                                            <label class="control-label">
                                                Objetivo
                                            </label>
                                        <textarea class="form-control"></textarea>
									</div>
                                      
						
						</section>
						<section>
						<div class="col-md-4">
						   
                                            <label class="control-label">
                                                Lugar donde se implementó
                                            </label>
                                           <select class="form-control" multiple style="height:71px;">
										   <option>A</option>
										   <option>v</option>
										   <option>c</option>
										   </select>
                                     
						</div>
								<div class="col-md-8">
								
                                            <label class="control-label">
                                                Descripción
                                            </label>
                                        <textarea class="form-control"></textarea>
									</div>
                                      
						
						</section>
						<section>
						<div class="col-md-12">
						   
                                            <label class="control-label">
                                                Población objetivo
                                            </label>
                                          <input type="text" class="form-control"/>
                                     
						</div>                                   
						</section>
			
												<section>
													<div class="col-md-12">
						<div class="col-md-4">
												
                                            <label class="control-label">
                                                Bienes y servicios que entregaba y se vinculan con el nuevo programa
                                            </label>
											<table>
											<tr>
											<th></th>
											<th></th>
											</tr>
											<tbody>
											<tr>
											<td style="width:239px;"><input type="text" class="form-control" style="width: 95%;"/></td>
											<td style="height:35px; width:81px;"><input type="submit" class="btn btn-success" value="Guardar"/></td>
											</tr>
												<tr>
											<td style="width:239px;"><input type="text" class="form-control" style="width: 95%;" disabled="disabled" value="Ejemplo de uno"/></td>
											<td style="height:35px; width:81px;"><input type="submit" class="btn btn-warning" value="Eliminar"/></td>
											</tr>
											</tbody>
											</table>
										
						</div>
						<div class="col-md-8">
								
                                            <label class="control-label">
                                                Resultados de evaluaciones
                                            </label>
                                        <textarea class="form-control"></textarea>
						</div>
								</div>
						</section>
							<section>
						<div class="col-md-4">
												
                                            <label class="control-label">
                                             Liga del informe de evaluación
                                            </label>
											 <input type="text" class="form-control"/>
										
						</div>
						<div class="col-md-8">
					
						  <label class="control-label">
                                            	En caso que no sea público, adjuntar archivo
                                            </label>
								           <div class="fileupload-buttonbar">
                                            <div class="col-lg-8">
                                                <!-- The fileinput-button span is used to style the file input field as button -->
                                                    </br><input type="file"  class="btn btn-success fileinput-button" name="files"></br>
                                               
                                                <button type="submit" class="btn btn-primary start">
                                                    <i class="fa fa-fw ti-export"></i>
                                                    <span>Iniciar carga de archivo</span>
                                                </button>
                                              
                                            </div>
                                            <!-- The global progress state -->
                                           
                                        </div>
                                   
						</div>
                                      
												<section>
											</section>
												<section>
												<div class="col-md-12">
												<div class="col-md-10"></div>
												<div class="col-md-1">
												<input class="btn btn-success" value="Guardar" type="submit"/>
												</div>
												</div>
											</section>
						</section>
				
						</div> <!--Etiqueta de cierre del row-->
                        </div>
                    </div>
                </div>
				<!--Listado de pogramas estatales previos-->
				    <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                              Listado de Programas similares y buenas prácticas            | <input type="submit" value="Nuevo programa" class="btn btn-success">
                            </h3>
							
                        </div>
                        <div class="panel-body">
						<div class="row"> <!--Etiqueta de entrada del row-->
												<table  class="table">
											<tr>
											<th>Nombre de Programas similares y buenas prácticas</th>
											<th>Opciones</th>
											</tr>
											<tbody>
											<tr>
											<td ><label>Nombre de un programa de ejemplo</label></td>
											<td class="ui-group-buttons">
                                        <a  class="btn btn-success" role="button">
                                            <span class="glyphicon glyphicon-edit"></span>
                                        </a>
                                     
                                        <a  class="btn btn-danger" role="button">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </a>
                                    </td>
											</tr>
								
											</tbody>
											</table>
						</div> <!--Etiqueta de cierre del row-->
                        </div>
                    </div>
                </div>
				<!--Fin programas estatales previos-->
				
				
				
				  <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                          Diagnostico
                            </h3>
							
                        </div>
                        <div class="panel-body">
						<div class="row"> <!--Etiqueta de entrada del row-->
						<div class="col-md-12">
						  <label class="control-label">
                                            	Descripción de la problemática que origina el programa
                                            </label>					
									<textarea class="form-control"></textarea>
									</div>
						</div> <!--Etiqueta de cierre del row-->
                        </div>
                    </div>
                </div>
				<!--Fin programas estatales previos-->
				
				
            </div>
        </section>
        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
</div>