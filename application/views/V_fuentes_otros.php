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
                <aside class="right-side strech" style="padding: 8px">
                    <!-- Content Header (Page header) -->
                    <section class="content-header" style="padding: 10px">
                        <h1>Fuentes utilizadas</h1>

                    </section>
                    <!-- Main content -->
                    <section class="content">
                        <!---Aqui va el contenido de la pagina :v-->
                        <div class="row">
                            <section>
                                <section>
                                    <div class="col-md-12">
                                        <label class="control-label">
                                            Identifica las fuentes utilizadas
                                        </label>
                                        <table class="table">
                                            <tr>
                                                <th>Fuente</th>
                                                <th>Fecha de consulta</th>
                                                <th>Liga</th>
                                                <th>Adjuntar el archivo</th>
                                                <th>Opciones</th>
                                            </tr>
                                            <tbody>
                                            <tr>
                                                <td><input type="text" value="Ejemplo de fuente"
                                                           class="form-control">
                                                </td>
                                                <td><input type="date" class="form-control" /></td>
                                                <td><input type="text" value="wwww.ok.com" class="form-control">
                                                </td>
                                                <td>
                                                    <input type="file" tabindex="500"
                                                           class="btn btn-default fileinput-upload fileinput-upload-button glyphicon glyphicon-upload" /
                                                    value="Subir">
                                                </td>
                                                <td class="ui-group-buttons">
                                                    <a class="btn btn-success" role="button">
                                                        <span class="glyphicon glyphicon-floppy-disk"></span>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><label>Ejemplo de fuente</label></td>
                                                <td><input type="date" class="form-control" readonly /></td>
                                                <td>www.ok.com</td>
                                                <td>Sin archivo</td>
                                                <td class="ui-group-buttons">
                                                    <a class="btn btn-danger" role="button">
                                                        <span class="glyphicon glyphicon-trash"></span>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><label>Ejemplo de fuente 2</label></td>
                                                <td><input type="date" class="form-control" readonly /></td>
                                                <td>Sin URL</td>
                                                <td>Pack.zip</td>
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
                                </secion>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">
                                                    <i class=""></i>Listado de criterios
                                                </h3>
                                            </div>
                                            <div class="panel-body">
                                                <table class="table table-striped "
                                                       id="listado_programas">
                                                    <thead>
                                                    <tr>
                                                        <th>Nombre del criterio</th>
                                                        <th>Descripcion del criterio</th>
                                                        <th>Opciones</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="listado_criterios_body">
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
        <?php $id_cuantificacion = base64_decode($this->uri->segment(4)); ?>
        <input type="text" value="<?= $id_cuantificacion; ?>" id="id_cuantificacion" style="visibility: hidden">


    </aside>
    <!-- /.right-side -->
</div>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
        crossorigin="anonymous"></script>
<script src="<?= base_url(); ?>js/formatos/fuentes_criterios.js"></script>

<script>

    var isIE = document.all ? true : false;
    var isNS = document.layers ? true : false;

    function soloNumeros(e, decReq) {
        var key = (isIE) ? event.keyCode : e.which;
        var obj = (isIE) ? event.srcElement : e.target;
        var isNum = (key > 47 && key < 58) ? true : false;
        var dotOK = (key == 46 && decReq == 'decOK' && (obj.value.indexOf(".") < 0 || obj.value.length == 0)) ? true : false;
        var isDel = (key == 0 || key == 8) ? true : false;
        var isEnter = (key == 13) ? true : false;
        //e.which = (!isNum && !dotOK && isNS) ? 0 : key;
        return (isNum || dotOK || isDel || isEnter);
    }

</script>
