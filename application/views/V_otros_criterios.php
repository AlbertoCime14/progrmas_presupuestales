
<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <?php
    $pag = 5;
    include 'application/views/masterpage/navagacionnavb.php';
    ?>
    <aside class="right-side">
        <!-- Content Header (Page header) -->

        <!-- Main content -->
        <!---Aqui va el contenido de la pagina :v-->
        <section class="content">
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <!-- Left side column. contains the logo and sidebar -->
                <aside class="right-side strech">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>Otros criterios</h1>

                    </section>
                    <!-- Main content -->
                    <section class="content">
                        <!---Aqui va el contenido de la pagina :v-->
                        <div class="row">
                            <sesion >
                                <div>
                                    <div class="text-right"><a href="<?= base_url(); ?>formatos/poblaciones/<?=$id_programa;?>/" class="btn btn-md btn-default float-right"><span class="fa fa-mail-reply"></span>Regresar</a></div>
                                    <div class="panel">

                                        <div class="panel-heading">
                                            <h3 class="panel-title">
                                                <i class=""></i> Nuevo programa presupuestal
                                            </h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="col-md-7" >
                                                <input id="nombreplan" type="text" class="form-control" placeholder="Escriba un nuevo plan presupuestal">
                                            </div>
                                            <div class="form-inline">
                                                <div class="form-group col-md-3">
                                                    <label>Tipo de programa</label>
                                                    <select id="tipoprograma" class="form-control">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-2" >
                                                <button id="enviarprograma" type="button" class="btn btn-labeled btn-success">
												<span class="btn-label">
													<i class="glyphicon glyphicon-ok"></i>
												</span> Crear
                                                </button>
                                            </div>
                                            <div class="col-md-12">
                                                <label>Descipción</label>
                                                <textarea id="descripcionprograma" class="form-control" placeholder="Describe brevemente el programa"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </sesion>
                            <br><br>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">
                                                <i class=""></i>Listado programas presupuestales
                                            </h3>
                                        </div>
                                        <div class="panel-body">
                                            <table class="table table-striped table-bordered" id="listado_programas">
                                                <thead>
                                                <tr>
                                                    <th>Nombre del programa</th>
                                                    <th>Opciones</th>
                                                </tr>
                                                </thead>
                                                <tbody id="listado_programas_body">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </section>
                    <!-- /.content -->
                </aside>
                <!-- /.right-side -->
            </div>
        </section>
        <?php $id_programa = base64_decode($this->uri->segment(3)); ?>
        <input type="text" value="<?= $id_programa; ?>" id="id_programa" style="visibility: hidden">
        <!-- /.content -->
        <?php $id_cuantificacion=base64_decode($this->uri->segment(4));?>
        <input type="text" value="<?= $id_cuantificacion; ?>" id="id_cuantificacion" style="visibility: hidden">


    </aside>
    <!-- /.right-side -->
</div>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
        crossorigin="anonymous"></script>
<script src="<?= base_url(); ?>js/formatos/poblaciones.js"></script>

<script>

    var isIE = document.all?true:false;
    var isNS = document.layers?true:false;
    function soloNumeros(e,decReq) {
        var key = (isIE) ? event.keyCode : e.which;
        var obj = (isIE) ? event.srcElement : e.target;
        var isNum = (key > 47 && key < 58) ? true : false;
        var dotOK = (key==46 && decReq=='decOK' && (obj.value.indexOf(".")<0 || obj.value.length==0)) ? true:false;
        var isDel = (key==0 || key==8 ) ? true:false;
        var isEnter = (key==13) ? true:false;
        //e.which = (!isNum && !dotOK && isNS) ? 0 : key;
        return (isNum || dotOK || isDel || isEnter);
    }

</script>
