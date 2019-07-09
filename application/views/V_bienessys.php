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
                                                <th>Descripción del bien o servicio</th>
                                                <th>Criterios de calidad</th>
                                                <th>Criterios para determinar la entrega oportuna</th>
                                                <th>Unidad de medida</th>
                                                <th>Opciones</th>
                                            </tr>
                                            <tbody>
                                            <tr>
                                                <td><input placeholder="Ingrese el nombre del bien y/o servicio" id="Nombre_bien" class="form-control" type="text"/></td>
                                                <td><textarea id="descripcion_bien" rows="4" style="resize:none;" cols="35"
                                                              placeholder="Ingrese aquí su descripción" class="form-control resize_vertical"></textarea>
                                                </td>
                                                <td> <textarea id="criterios_calidad" rows="4" style="resize:none;" cols="35"
                                                               placeholder="Ingrese aquí su descripción" class="form-control resize_vertical"></textarea>
                                                </td>
                                                <td> <textarea id="criterios_entrega" rows="4" style="resize:none;" cols="15"
                                                               placeholder="Ingrese aquí su descripción" class="form-control resize_vertical"></textarea>
                                                </td>
                                                <td>
                                                    <select class="form-control" id="cbo_unidad_medida">

                                                    </select>
                                                </td>

                                                <td class="ui-group-buttons">

                                                    <a class="btn btn-success" role="button" id="create_service">
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
<script type="text/javascript" src="<?= base_url(); ?>vendors/pnotify/js/pnotify.js"></script>
<script type="text/javascript" src="<?= base_url(); ?>vendors/pnotify/js/pnotify.animate.js"></script>
<script type="text/javascript" src="<?= base_url(); ?>vendors/pnotify/js/pnotify.buttons.js"></script>
<script type="text/javascript" src="<?= base_url(); ?>vendors/pnotify/js/pnotify.confirm.js"></script>
<script type="text/javascript" src="<?= base_url(); ?>vendors/pnotify/js/pnotify.nonblock.js"></script>
<script type="text/javascript" src="<?= base_url(); ?>vendors/pnotify/js/pnotify.mobile.js"></script>
<script type="text/javascript" src="<?= base_url(); ?>vendors/pnotify/js/pnotify.desktop.js"></script>
<script type="text/javascript" src="<?= base_url(); ?>vendors/pnotify/js/pnotify.history.js"></script>
<script type="text/javascript" src="<?= base_url(); ?>vendors/pnotify/js/pnotify.callbacks.js"></script>
<script src="<?= base_url(); ?>js/custom_js/notifications.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
        crossorigin="anonymous"></script>
<script src="<?= base_url(); ?>js/formatos/bienesyservicios.js"></script>
