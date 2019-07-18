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
        } else if( $data['cuantificacion_pobla'] == null){
            $objetos_definicion = $data['definicion_poblacion'];
            foreach ($objetos_definicion as $datos) {

                $data['filas'] .= $this->fila_definicion($datos['iIdDefinicion'],$datos['vNombre']);


            }
            echo "perr";
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

    public function fila_definicion($iIdBienServicio, $nombre_definicion)
    {


        //$datos = $model->listar_servicio($iIdBienServicio);

        $html = '<tr id="' . $iIdBienServicio . '">
		<td><input type="hidden" name="id' . $iIdBienServicio . '" id="id' . $iIdBienServicio . '" value="' . $iIdBienServicio . '">
		<input name="vNombreServicio' . $iIdBienServicio . '" type="text" id="vNombreServicio' . $iIdBienServicio . '" class="form-control" value="' . $nombre_definicion . '"></td></tr>';


        echo $html;

    }

    function selector_unidad($seleccionado = 0, $iIdBienServicio)
    {


        $html = '';
        $data['UnidadMedida'] = $this->M_ServiciosBienes->recuperar_unidad();

        $html .= '<select name="cbo_unidad' . $iIdBienServicio . '" id="cbo_unidad_' . $iIdBienServicio . '" class="form-control">';
        foreach ($data['UnidadMedida'] as $u) {
            $selected = ($u['iUnidadMedida'] == $seleccionado) ? 'selected' : '';
            $html .= '<option value="' . $u['iUnidadMedida'] . '" ' . $selected . '>' . $u['vNombre'] . '</option>';
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
}
