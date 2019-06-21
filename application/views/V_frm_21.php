<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
<?php
$pag = 21;
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
{"key":-3, "category":"Source", "text":"Page 21", "loc":"389.3700731809651 264.5648262952179"},
{"key":-2, "loc":"393.40350331901027 104.7207509140588"},
{"key":-4, "loc":"278.03025231620757 116.11225096730509"},
{"key":-5, "loc":"561.3867546767868 144.87400120691277"},
{"key":-6, "loc":"173.63575144652043 390.94675325688956"},
{"key":-7, "loc":"373.90275311489984 392.01200326576395"},
{"key":-8, "loc":"630.6280052536201 400.5340033367588"}
 ],
  "linkDataArray": [ 
{"from":-3, "to":-2, "points":[425.1978495464476,264.5903326374819,411.355660183476,222.93010890264418,408.52731796540485,180.23665342923348,417.3933035303203,136.48555346532834]},
{"from":-3, "to":-4, "points":[407.84727447646907,264.75633809623974,371.16168538996453,235.99563893012743,338.68172084721726,197.0610291649605,313.40187892568053,147.87705351857463]},
{"from":-3, "to":-5, "points":[447.1870784341726,264.6844394350868,482.9512523562851,222.7619095244835,520.6618491230671,193.38898433605905,561.3867546767868,173.82625800375098]},
{"from":-3, "to":-6, "points":[406.9464076651667,301.65369586766064,348.31652852737227,345.906366907757,291.9649950747638,376.1232718893762,228.05236216429387,397.6605150613275]},
{"from":-3, "to":-7, "points":[432.70850935219147,301.85121924795794,435.11126062015745,335.67127537453035,427.8133792816415,365.72915639594663,411.1690325807604,392.01200326576395]},
{"from":-3, "to":-8, "points":[472.0315892577356,299.2137412310368,526.830718700815,320.7910594427483,582.889701318473,353.7670648319374,638.8363957334774,400.5340033367588]}
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