
    <!-- Left side column. contains the logo and sidebar -->
    <?php
    $pag = 20;
    include 'application/views/masterpage/navegacion.php';
    ?>
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <!--<h1>Fuentes de información</h1>-->

        </section>
        <!-- Main content -->

        <!---Aqui va el contenido de la pagina :v-->

        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <i class=""></i> Matriz de indicador
                            </h3>

                        </div>
                        <div class="panel-body">
                            <div class="row page" id="demo" style="display:block;">
        <div class="col-md-12">
            <h3>Arbol de objetivos</h3>
            <div class="row">
                <div class="col-md-4 col-sm-8 col-xs-8">
                    <button type="button" class="btn btn-success btn-sm" onclick="demo_create();"><i
                            class="glyphicon glyphicon-asterisk"></i> Create
                    </button>
                    <button type="button" class="btn btn-warning btn-sm" onclick="demo_rename();"><i
                            class="glyphicon glyphicon-pencil"></i> Rename
                    </button>
                    <button type="button" class="btn btn-danger btn-sm" onclick="demo_delete();"><i
                            class="glyphicon glyphicon-remove"></i> Delete
                    </button>
                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <div id="jstree_demo" class="demo" style="margin-top:1em; min-height:200px;"></div>

                </div>

            </div>


            
        </div>
    </div>

                        </div>
                    </div>
                </div>
            </div>


        </section>


        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
</div>

         


