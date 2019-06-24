<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
<?php
$pag = 12;
include 'application/views/masterpage/navegacion.php';
?>
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
           <!-- <h1>Formatos</h1> -->
            <ol class="breadcrumb">
             <!--   <li>
                    <a href="index.html">
                        <i class="fa fa-fw ti-home"></i> Dashboard
                    </a>
                </li>
                <li> Pages</li>
                <li class="active">
                    <a href="blank.html">Blank</a>
                </li>
				-->
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
		<!---Aqui va el contenido de la pagina :v-->
		<div class="row">
		 <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class=""></i>
								Formato de Documentación de Indicadores Programas Presupuestarios		
                            </h3>

                        </div>
                        <div class="panel-body">
                        	<section>
                        		<div class="row">
                        		 <div class="col-md-12">
                                           <section>
										                             <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="sample_1">
                                    <thead>
                                    <tr>
                                        <th rowspan="2">
                                            Programa
                                        </th>
                                        <th>Clave</th>
                                        <th>
                                            Nombre
                                        </th>
                                       
                                    </tr>
                                    </thead>
                                    <tbody>
                                <tr>
								<td></td>
								<td>
									<input type="text" class="form-control">
								</td>
								<td>
								<input type="text" class="form-control">
								</td>
								</tr>
                                    <tr>
                                        <td colspan="3" style="text-align:center" class="">Indicadores</td>
                                    </tr>
					
									<tr>
									<td>
									Nombre del indicador
									</td>
									<td colspan="2">
								<input type="text" class="form-control" />
									</td>
									</tr>
											<tr>
									<td>
									Definición									</td>
									<td colspan="2">
								<input type="text" class="form-control" />
									</td>
									</tr>
									<tr>
									  <td colspan="3" style="text-align:center" class="">Método de cálculo (Algoritmo)</td>
									</tr>
									  <td colspan="3" style="text-align:center" class="">
									  	<input type="text" class="form-control" />
									  </td>
									</tr>
                                    </tbody>
                                </table>
							
								
                            </div>
										   </section>             		 	
                                 </div>
                                </div>
                            </section>
                                                  
                        </div>
                    </div>
					<!--Fin de la primer panel-->
					      <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class=""></i>
								Variables		
                            </h3>

                        </div>
                        <div class="panel-body">
                        	<section>
                        		<div class="row">
                        		 <div class="col-md-12">
                                <section>
									 <div class="col-md-4">
									 <textarea placeholder="Nombre de la variable" rows="8" class="form-control" ></textarea>
									 </div>
									<div class="col-md-8">
						<div class="form-group">
						<div>
                                    <label class="control-label">
                                        Nombre:
                                    </label>
                                 
                                        <textarea class="form-control" placeholder=""></textarea>
										</div>
												<div>
                                    <label class="control-label">
                                       Medio de verificación:
                                    </label>
                                 
                                        <textarea class="form-control" placeholder="Describa el medio de verificacion"></textarea>
										</div>
                                    
                                </div>
									 </div>
									
                            </section>
                                                  
                        </div>
                    </div>
                </div>
				
            </div>	
			<!--inicio-->
			 <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class=""></i>
								Línea base o valor de referencia				
                            </h3>

                        </div>
                        <div class="panel-body">
                        	<section>
                        		<div class="row">
                        		 <div class="col-md-12">
                                <section>
									  <table class="table table-striped table-bordered table-hover" id="sample_1">
                                    <thead>
                                    <tr>
                                        <th>
                                            Valor
                                        </th>
                                        <th>Unidad de Medida
										</th>
                                        <th>
                                            Fecha:
                                        </th>
                                       
                                    </tr>
                                    </thead>
                                    <tbody>
                                <tr>
								<td>
								<input type="number" class="form-control" />
								</td>
								<td>
								  <select id="skill" name="skill" class="form-control" data-bv-field="skill">
                                                <option value="">
                                                    Seleccione una opción
                                                </option>
                                                <option >Porcentaje</option>
                                                                                         
                                                
                                            </select>
								</td>
								<td>
								<input type="date" class="form-control" />
								</td>
								
									</tr>
                                    </tbody>
                                </table>
									
                            </section>
                                                  
                        </div>
                    </div>
					
					
                </div>
				 </div>
				 <!--Inicio-->
			<div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class=""></i>
								Meta					
                            </h3>

                        </div>
                        <div class="panel-body">
                        	<section>
                        		<div class="row">
                        		 <div class="col-md-12">
                                <section>
									  <table class="table table-striped table-bordered table-hover" id="sample_1">
                                    <thead>
                                    <tr>
                                        <th>
                                            Valor
                                        </th>
                                        <th>Unidad de Medida
										</th>
                                        <th>
                                            Fecha:
                                        </th>
                                       
                                    </tr>
                                    </thead>
                                    <tbody>
                                <tr>
								<td>
								<input type="number" class="form-control" />
								</td>
								<td>
								  <select id="skill" name="skill" class="form-control" data-bv-field="skill">
                                                <option value="">
                                                    Seleccione una opción
                                                </option>
                                                <option >Porcentaje</option>
                                                                                         
                                                
                                            </select>
								</td>
								<td>
								<input type="date" class="form-control" />
								</td>
								
									</tr>
                                    </tbody>
                                </table>
									
                            </section>
                                                  
                        </div>
                    </div>
                </div>
</div>
<!--inicio-->
			<div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class=""></i>
								Metadatos							
                            </h3>

                        </div>
                        <div class="panel-body">
                        	<section>
                        		<div class="row">
                        		 <div class="col-md-12">
                                <section>
									  <table class="table table-striped table-bordered table-hover" id="sample_1">
                                    <thead>
                                    <tr>
                                        <th>
                                        </th>
                                        <th>
										</th>
                                        <th>
                                       </th>
                                       
                                    </tr>
                                    </thead>
                                    <tbody>
                                <tr>
								<td>
								<label>Tipo de Algoritmo:</label>
								</td>
								<td colspan="2">
								 <select id="skill" name="skill" class="form-control" data-bv-field="skill">
                                                <option value="">
                                                    Seleccione una opción
                                                </option>
                                                <option >Porcentaje</option>
                                                                                         
                                                
                                            </select>
								</td>
									</tr>
									   <tr>
								<td>
								<label>Periodicidad de cálculo:</label>
								</td>
								<td colspan="2">
								 <select id="skill" name="skill" class="form-control" data-bv-field="skill">
                                                <option value="">
                                                    Seleccione una opción
                                                </option>
                                                <option >Porcentaje</option>
                                                                                         
                                                
                                            </select>
								</td>
									</tr>
									   <tr>
								<td>
								<label>Tendencia:</label>
								</td>
								<td colspan="2">
								 <select id="skill" name="skill" class="form-control" data-bv-field="skill">
                                                <option value="">
                                                    Seleccione una opción
                                                </option>
                                                <option >Porcentaje</option>
                                                                                         
                                                
                                            </select>
								</td>
									</tr>
									   <tr>
								<td>
								<label>Ámbito de medición:</label>
								</td>
								<td colspan="2">
								 <select id="skill" name="skill" class="form-control" data-bv-field="skill">
                                                <option value="">
                                                    Seleccione una opción
                                                </option>
                                                <option >Porcentaje</option>
                                                                                         
                                                
                                            </select>
								</td>
									</tr>
									   <tr>
								<td>
								<label>Dimensión del desempeño:</label>
								</td>
								<td colspan="2">
								 <select id="skill" name="skill" class="form-control" data-bv-field="skill">
                                                <option value="">
                                                    Seleccione una opción
                                                </option>
                                                <option >Porcentaje</option>
                                                                                         
                                                
                                            </select>
								</td>
									</tr>
                                    </tbody>
                                </table>
									
                            </section>
                                                  
                        </div>
                    </div>
                </div>
</div>
				<!--fin de los paneles-->	
				<div class="col-md-10"></div>
				<div class="col-md-2" style="text-align: center">
				
				  <button type="button" class="btn btn-labeled btn-success">
                                    
                                                    <span class="btn-label">
                                                    <i class="glyphicon glyphicon-ok"></i>
                                                </span> Guardar
                                            </button>
				</div>
					
					<!--fin del las doce columnas-->
                </div>
			</div>
        
        </section>
        <!-- /.content -->
        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
</div>
