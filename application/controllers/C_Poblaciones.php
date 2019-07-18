<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Poblaciones extends CI_Controller
{

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *        http://example.com/index.php/welcome
     *    - or -
     *        http://example.com/index.php/welcome/index
     *    - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see https://codeigniter.com/user_guide/general/urls.html
     */
    public function __construct()
    {
        parent::__construct();
        //session_start();
        $this->load->helper('url');
        $this->load->model('M_poblaciones');
        //$this->load->library('session');
    }


    public function index()
    {
        $this->load->view('masterpage/Head');
        $this->load->view('V_poblaciones');
        $this->load->view('masterpage/Footer');
    }

    public function AgregarServicio()
    {
        $vNombre = $this->input->post('vNombreServicio');
        $tDescripcion = $this->input->post('tDescripcion');
        $tCriteriosCalidad = $this->input->post('tCriteriosCalidad');
        $tCriteriosEntregas = $this->input->post('tCriteriosEntregas');
        $iIdUnidadMedida = $this->input->post('iIdUnidadMedida');
        $iIdPrograma = $this->input->post('iIdPrograma');

        $data = array(
            'vNombreServicio' => $vNombre,
            'tDescripcion' => $tDescripcion,
            'tCriteriosCalidad' => $tCriteriosCalidad,
            'tCriteriosEntregas' => $tCriteriosEntregas,
            'iIdUnidadMedida' => $iIdUnidadMedida,
            'iIdPrograma' => $iIdPrograma
        );

        if ($this->M_ServiciosBienes->agregar_Servicio($data) === TRUE) {
            echo "correcto";
        } else {
            echo "incorrecto";
        }
    }

    public function ListarDefPoblacion()
    {
        $key = $this->uri->segment(4);


        $data['filas'] = '';
        $data['num_def'] = 0;

        $data['definicion_poblacion'] = $this->M_poblaciones->listar_definiciones();
        $data['cuantificacion_pobla'] = $this->M_poblaciones->cuantificacion_poblacion($key);

        if ($data['definicion_poblacion'] == null) {
            echo '<script>location.reload();</script>';
        } else if ($data['cuantificacion_pobla'] == null) {
            var_dump($data['cuantificacion_pobla']);
            $objetos_definicion = $data['definicion_poblacion'];
            foreach ($objetos_definicion as $datos) {

                $data['filas'] .= $this->fila_definicion($datos['iIdDefinicion'], $datos['vNombre'], $data['num_def']);

                $data['num_def']++;
            }

        } else if ($data['definicion_poblacion'] != null) {
            $objeto_Def= $data['definicion_poblacion'];
            $objeto_cuantificacion=$data['cuantificacion_pobla'];
            var_dump($objeto_cuantificacion);
        }


    }

    public function EliminarServicio()
    {
        $iIdBienServicio = $this->input->post('iIdBienServicio');
        $data = array(
            'iActivo' => 0
        );
        if ($this->M_ServiciosBienes->Eliminar_servicio($iIdBienServicio, $data) === TRUE) {
            echo "correcto";
        } else {
            echo "incorrecto";
        }
    }

    public function listar_unidad_medida()
    {
        $data['UnidadMedida'] = $this->M_ServiciosBienes->recuperar_unidad();
        echo json_encode($data);
    }

    public function fila_definicion($iIdDefinicion, $nombre_definicion, $num_definicion)
    {


        //$datos = $model->listar_servicio($iIdBienServicio);


        $html = '<tr id="' . $num_definicion . '">
		<td><input type="hidden" name="id' . $num_definicion . '" id="id' . $num_definicion . '" value="' . $iIdDefinicion . '">
		<label style="width: 170px;" name="vNombreServicio' . $iIdDefinicion . '" type="text" id="vNombreServicio' . $iIdDefinicion . '"  >' . $nombre_definicion . '</label></td>';


        $html .= '<td>
			    <textarea name="DescripcionServicio_' . $iIdDefinicion . '" id="DescripcionServicio_' . $iIdDefinicion . '" style="width: 200px;resize:none;"  rows="4" placeholder="Ingrese aquí su descripción" class="form-control resize_vertical" required></textarea>
			</td>
			<td>
                <input style="width: 100px;" name="meta_' . $iIdDefinicion . '" id="meta_' . $iIdDefinicion . '" type="number" min="1" max="99999999999999" maxlength="11" onKeyPress="return soloNumeros(event,\'decNO\');"  class="form-control" value="" required>
			</td>
			<td>
			    <input style="width: 100px;" name="meta_' . $iIdDefinicion . '" id="meta_' . $iIdDefinicion . '" type="number" min="1" max="99999999999999" maxlength="11" onKeyPress="return soloNumeros(event,\'decNO\');"  class="form-control" value="" required>
			</td>
			
			
			</td>
			<td  style="width: 103px;">
				 <input style="width: 100px;" name="meta_' . $iIdDefinicion . '" id="meta_' . $iIdDefinicion . '" type="number" min="1" max="99999999999999" maxlength="11" onKeyPress="return soloNumeros(event,\'decNO\');"  class="form-control" value="" required>
				
			</td>
			<td>
			    <input style="width: 100px;" name="meta_' . $iIdDefinicion . '" id="meta_' . $iIdDefinicion . '" type="number" min="1" max="99999999999999" maxlength="11" onKeyPress="return soloNumeros(event,\'decNO\');"  class="form-control" value="" required>
			</td>
			<td >
			    ' . $this->Grupo_edad($iIdDefinicion) . '
			</td>
			<td >
			    <button type="submit" class="btn btn-labeled btn-success" name="idprograma"><span class="btn-label"><i class="glyphicon glyphicon-edit"></i></span>Agregar fuente</button>
			</td>
			<td >
			    <button type="submit" class="btn btn-labeled btn-success" name="idprograma"><span class="btn-label"><i class="glyphicon glyphicon-edit"></i></span>Agregar criterios</button>
			</td>
			
			<td class="ui-group-buttons" style="width: 150px;">
				 ' . $this->CoberturaGeografica($iIdDefinicion ,$nombre_definicion) . '
				
			</td>
		</tr>';

        echo $html;

    }

    function Grupo_edad($iIdDefinicion)
    {


        $html = '';
        $data['Grupoedad'] = $this->M_poblaciones->recuperar_grupo_Edad();

        $html .= '<select style="width: 150px;" name="cbo_unidad' . $iIdDefinicion . '" id="cbo_unidad_' . $iIdDefinicion . '" class="form-control">';
        foreach ($data['Grupoedad'] as $u) {

            $html .= '<option value="' . $u['iIdGrupoEdad'] . '">' . $u['vClasificacion'] . '</option>';

        }
        $html .= '</select>';

        return $html;
    }

    function ActualizarServicio()
    {
        $iIdBienServicio = $this->input->post('iIdBienServicio');
        $vNombre = $this->input->post('vNombreServicio');
        $tDescripcion = $this->input->post('tDescripcion');
        $tCriteriosCalidad = $this->input->post('tCriteriosCalidad');
        $tCriteriosEntregas = $this->input->post('tCriteriosEntregas');
        $iIdUnidadMedida = $this->input->post('iIdUnidadMedida');
        $iIdPrograma = 20; ///este id del programa se obtiene a traves de la url

        $data = array(
            'vNombreServicio' => $vNombre,
            'tDescripcion' => $tDescripcion,
            'tCriteriosCalidad' => $tCriteriosCalidad,
            'tCriteriosEntregas' => $tCriteriosEntregas,
            'iIdUnidadMedida' => $iIdUnidadMedida,
            'iIdPrograma' => $iIdPrograma
        );


        if ($this->M_ServiciosBienes->actualizar_servicio($iIdBienServicio, $data) === TRUE) {
            echo "correcto";
        } else {
            echo "incorrecto";
        }
    }

    public function CoberturaGeografica($iIdDefinicion,$nombre_definicion)
    {
         $html='';
        $definicion = $iIdDefinicion;
        switch ($nombre_definicion) {

            case "Población 2020":

                $html.=' <a title="Actualizar servicio" class="btn btn-success" role="button" >
                                                <span class="glyphicon glyphicon-floppy-disk" onclick="ActualizarServicio('.$definicion.');"></span>
                                            </a>
				<a title="Eliminar servicio" class="btn btn-danger" role="button">
                                                <span class="glyphicon glyphicon-trash" onclick="EliminarServicio()"></span>
                                            </a><a title="Cobertura Geográfica" class="btn btn-info" role="button" >
                                                <span class="glyphicon glyphicon-globe" onclick="ActualizarServicio($iIdDefinicion);"></span>
                                            </a>';
                break;
            case "Población 2021":
                $html.=' <a title="Actualizar servicio" class="btn btn-success" role="button" >
                                                <span class="glyphicon glyphicon-floppy-disk" onclick="ActualizarServicio($iIdDefinicion);"></span>
                                            </a>
				<a title="Eliminar servicio" class="btn btn-danger" role="button">
                                                <span class="glyphicon glyphicon-trash" onclick="EliminarServicio($iIdDefinicion)"></span>
                                            </a><a title="Cobertura Geográfica" class="btn btn-info" role="button" >
                                                <span class="glyphicon glyphicon-globe" onclick="ActualizarServicio($iIdDefinicion);"></span>
                                            </a>';
                break;
            case "Población 2022":
                $html.=' <a title="Actualizar servicio" class="btn btn-success" role="button" >
                                                <span class="glyphicon glyphicon-floppy-disk" onclick="ActualizarServicio($iIdDefinicion);"></span>
                                            </a>
				<a title="Eliminar servicio" class="btn btn-danger" role="button">
                                                <span class="glyphicon glyphicon-trash" onclick="EliminarServicio($iIdDefinicion)"></span>
                                            </a><a title="Cobertura Geográfica" class="btn btn-info" role="button" >
                                                <span class="glyphicon glyphicon-globe" onclick="ActualizarServicio($iIdDefinicion);"></span>
                                            </a>';
                break;
            case "Población 2023":
                $html.=' <a title="Actualizar servicio" class="btn btn-success" role="button" >
                                                <span class="glyphicon glyphicon-floppy-disk" onclick="ActualizarServicio($iIdDefinicion);"></span>
                                            </a>
				<a title="Eliminar servicio" class="btn btn-danger" role="button">
                                                <span class="glyphicon glyphicon-trash" onclick="EliminarServicio($iIdDefinicion)"></span>
                                            </a><a title="Cobertura Geográfica" class="btn btn-info" role="button" >
                                                <span class="glyphicon glyphicon-globe" onclick="ActualizarServicio($iIdDefinicion);"></span>
                                            </a>';
                break;
            case "Población 2024":
                $html.=' <a title="Actualizar servicio" class="btn btn-success" role="button" >
                                                <span class="glyphicon glyphicon-floppy-disk" onclick="ActualizarServicio($iIdDefinicion);"></span>
                                            </a>
				<a title="Eliminar servicio" class="btn btn-danger" role="button">
                                                <span class="glyphicon glyphicon-trash" onclick="EliminarServicio($iIdDefinicion)"></span>
                                            </a><a title="Cobertura Geográfica" class="btn btn-info" role="button" >
                                                <span class="glyphicon glyphicon-globe" onclick="ActualizarServicio($iIdDefinicion);"></span>
                                            </a>';
                break;
            default:
                $html.=' <a title="Guardar" class="btn btn-success" role="button" >
                                                <span class="glyphicon glyphicon-floppy-disk" onclick="GuardarCuantificacion('.$definicion.');"></span>
                                            </a>
				<a title="Eliminar" class="btn btn-danger" role="button">
                                                <span class="glyphicon glyphicon-trash" onclick="EliminarCuantificacion('.$definicion.')"></span>
                                            </a>';
        }
        return $html;
    }
}
