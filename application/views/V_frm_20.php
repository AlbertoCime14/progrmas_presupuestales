<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <?php
    $pag = 20;
    include 'application/views/masterpage/navegacion.php';
    ?>
    <script src="https://www.google-analytics.com/analytics.js"></script>
    <link rel="stylesheet" href="<?=base_url();?>css/highlight.css">
    <link rel="stylesheet" href="<?=base_url();?>css/main.css">
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
                                <i class=""></i>
                            </h3>

                        </div>
                        <div class="panel-body">
                            <section>
                                <div id="sample">
                                    <div style="width: 100%; display: flex; justify-content: space-between">
                                        <div id="myPaletteDiv" style="width: 100px; margin-right: 2px; background-color: whitesmoke; border: solid 1px black"></div>
                                        <div id="myDiagramDiv" style="flex-grow: 1; height: 480px; border: solid 1px black"></div>
                                    </div>

                                    <button id="SaveButton" onclick="save()" class="btn btn-primary">Save</button>
                                    <button onclick="load()" class="btn btn-success">Load</button>
                                    <button onclick="layout()"class="btn btn-warning">Layout</button>
                                    Diagram Model saved in JSON format:
                                    <br>
                                    <textarea id="mySavedModel" style="width:100%;height:300px">{ "class": "GraphLinksModel",
  "copiesArrays": true,
  "copiesArrayObjects": true,
  "nodeDataArray": [
{"key":-3, "category":"Source", "text":"Page 20", "loc":"340.370073180965 277.5648262952178"},
{"key":-2, "loc":"393.40350331901027 104.7207509140588"},
{"key":-4, "loc":"278.03025231620757 116.11225096730509"},
{"key":-5, "loc":"561.3867546767868 144.87400120691277"},
{"key":-6, "loc":"173.63575144652043 390.94675325688956"},
{"key":-7, "loc":"373.90275311489984 392.01200326576395"},
{"key":-8, "loc":"630.6280052536201 400.5340033367588"}
 ],
  "linkDataArray": [
{"from":-3, "to":-2, "points":[382.02241168561056,277.56492033011244,381.04436874780674,227.14267977212882,391.2824355489837,180.112441413062,412.78410851082293,136.48555346532834]},
{"from":-3, "to":-4, "points":[367.722551304508,277.67267138699816,338.85020929021647,241.17044603992986,318.53426560036144,197.92537147206295,308.44143140348297,147.87705351857463]},
{"from":-3, "to":-5, "points":[402.30074706342157,277.7247008531348,452.97033727475025,230.70013827168478,504.3009890785607,196.98296644697695,561.3867546767868,172.44955483900358]},
{"from":-3, "to":-6, "points":[361.9376507062333,314.6877330663249,318.7492967908226,353.72058674470884,276.9918424686224,379.16528712268325,228.05236216429387,396.944599842731]},
{"from":-3, "to":-7, "points":[392.72611052173204,314.78936070576117,405.60170770000127,337.92185123735385,409.9146911188272,363.6439882049656,404.27086662765225,392.01200326576395]},
{"from":-3, "to":-8, "points":[424.37885824257967,308.1809722579502,497.7571474389078,329.10042309953064,567.3923645714351,359.48932909531,632.602851297614,400.5340033367588]}
 ]}
        </textarea>
                                </div>

                            </section>

                        </div>
                    </div>
                </div>
            </div>
        </section>


    </aside>
    <!-- /.right-side -->
</div>
<script src="<?=base_url();?>js/go.js"></script>
<script src="<?=base_url();?>js/highlight.js"></script>
<script src="<?=base_url();?>js/jquery.min.js"></script>
<script src="<?=base_url();?>js/bootstrap.min.js"></script>
<script src="<?=base_url();?>js/custom.js"></script>
<script>
    $( document ).ready(function() {
        console.log( "ready!" );
        init()
    });
</script>