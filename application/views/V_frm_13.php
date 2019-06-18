<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
<?php
include 'application/views/masterpage/navegacion.php';
?>
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Fomento al empleo</h1>
           
        </section>
        <!-- Main content -->
      
		<!---Aqui va el contenido de la pagina :v-->
      
     
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class=""></i> Fuentes de información
                            </h3>

                        </div>
                        <div class="panel-body">

                                <section>
                                <div class="row">
                        		  <div class="col-md-10">
                        		  			 	<div class="form-group">
                                    <label class="control-label">
                                      Nuevo indicador
                                    </label>
                                		<input type="text" name="" id="" class="form-control" placeholder="Ingrese el nombre del indicador">                                   
                                </div>
                        		 </div>
                                 <div class="col-md-2" style="padding-top: 2.3%">
                                        <button type="button" class="btn btn-labeled btn-success">
                                                <span class="btn-label">
                                                <i class="glyphicon glyphicon-ok"></i>
                                            </span> Guardar
                                        </button>
                                    </div>
                                 </div>
                                </section>
                               <section>
                        		<div class="row">
                        		  <div class="col-md-1">
                        		  			 	<div class="form-group">
                                    <label class="control-label">
                                      Indicadores
                                    </label>
                                 
                                		<select class="form-control">
                                		<option value="0">Seleccione</option>
                                        <option value="1">Porcentaje de colocación de personas desempleadas y subempleadas</option>
                                        <option value="2">Porcentaje de apoyos económicos entregado</option>
                                        <option value="3">Porcentaje de apoyos en especie entregados</option>
                                        <option value="4">Porcentaje de personas colocadas en un empleo</option>
                                		</select>                                    
                                </div>
                        		 </div>
                        		  <div class="col-md-1">
                        		  		<div class="form-group">
                                    <label class="control-label">
                                      Variables
                                    </label>
                         
                                		<select class="form-control">
                                		<option value="0">Seleccione</option>
                                        <option style="display:none;" value="1">Total de beneficiarios colocados en un empleo o que comienzan una iniciativa de ocupación por cuenta propia</option>
                                        <option style="display:none;" value="2">Total de beneficiarios atendidos por programas y servicios de vinculación del Servicio Nacional de Empleo, Yucatán</option>
                                        <option style="display:none;"value="3">Total de apoyos económicos entregados</option>
                                        <option style="display:none;" value="4">Total de apoyos económicos entregados programados</option>
                                        <option style="display:none;" value="5">Total de personas apoyadas</option>
                                        <option style="display:none;" value="6">Total de personas programadas a atender</option>
                                        <option style="display:none;" value="7">Total de personas colocadas a través de los servicios de vinculación laboral en el año actual</option>
                                        <option style="display:none;" value="8">Total de personas programadas a colocar a través de los servicios de vinculación laboral en el año actual</option>
                                		</select>                                    
                                </div>
                        		 </div>
                        		 	 <div class="col-md-3">
                        		 		 	<div class="form-group">
                                    <label class="control-label">
                                     Registro administrativo generado
                                    </label>
                                 
                                        <textarea rows="4" class="form-control resize_vertical" placeholder="Ingrese aqui la información correspondiente"></textarea>
                                    
                                </div>
                        		 </div>
                        		 </div>                     
                        	</section>	
               <section>
               	<div class="row">
                        	
                        		  <div class="col-md-1">
                        		  	  		<div class="form-group">
                                    <label class="control-label">
                                    Desagregacion por sexo
                                    </label>
                         <br><br>
                                		<select class="form-control">
                                		<option value="0">Seleccione</option>
                                        <option value="1">Si</option>
                                        <option value="2">No</option>
                                		</select>                                    
                                </div>
                        		 </div>
                        		  <div class="col-md-1">
                        		  	  		<div class="form-group">
                                    <label class="control-label">
                                    Instrumento de recolección de la información
                                    </label>
                         
                                		<select class="form-control">
                                		<option values="0">Seleccione</option>
                                        <option value="1">Registro Administrativo</option>
                                		</select>                                    
                                </div>
                        		 </div>
                     	  		<div class="col-md-3">
                        		  			 		 	<div class="form-group">
                                    <label class="control-label">
                                    ¿En qué programa tiene o tendrá su base de datos?</label>
                                 
                                        <textarea rows="4" class="form-control resize_vertical" placeholder="Ingrese la información solicitada"></textarea>
                                    
                                </div>
                        		 </div>
                        		 </div>
                        	</section>
                            <section>
               	<div class="row">
                        	
                        		  <div class="col-md-3">
                        		  	  		<div class="form-group">
                                    <label class="control-label">
                                    Responsable de la producción de información
                                    </label>
                         
                                		<select class="form-control">
                                		<option value="0">Seleccione</option>
                                        <option value="1">Unidad de Vinculación Laboral. Servicio Nacional de Empleo Yucatán.</option>
                                        <option value="2">Unidad de Apoyos Financieros a la Capacitación</option>
                                        <option value="3">Unidad de Vinculación Laboral. Servicio Nacional de Empleo Yucatán.</option>
                                        <option value="4">Unidad de Apoyos Financieros a la Capacitación</option>
                                		</select>                                    
                                </div>
                        		 </div>
                        		  <div class="col-md-3">
                        		  	  		<div class="form-group">
                                    <label class="control-label">
                                    Periodicidad de la producción de la información
                                    </label>
                         
                                		<select class="form-control">
                                		<option values="0">Seleccione</option>
                                        <option value="1">Trimestral</option>
                                		</select>                                    
                                </div>
                        		 </div>
                                <div class="col-md-2">
                                
                                </div>
                                <div class="col-md-4">
                                    <br>
                                    <br><br>

                                <button type="button" class="btn btn-labeled btn-success">
                                                <span class="btn-label">
                                                <i class="glyphicon glyphicon-ok"></i>
                                            </span> Guardar
                                        </button>
                                <button type="button" class="btn btn-labeled btn-danger">
                                                <span class="btn-label">
                                                <i class="glyphicon glyphicon-ok"></i>
                                            </span> Eliminar
                                        </button>
                                </div>
                        		 </div>
                        		 </div>
                        	</section>
                        </div>
                    </div>
                </div>
            </div>
   

        </section>
        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
</div>