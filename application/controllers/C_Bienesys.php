<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Bienesys extends CI_Controller
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
        $this->load->model('M_ServiciosBienes');
        //$this->load->library('session');
    }

    public function index()
    {

        $this->load->view('masterpage/Head');
        $this->load->view('V_bienessys');
        $this->load->view('masterpage/Footer');


    }

    public function AgregarServicio()
    {
        $vNombre = $this->input->post('vNombreServicio');
        $tDescripcion =$this->input->post('tDescripcion');
        $tCriteriosCalidad=$this->input->post('tCriteriosCalidad');
        $tCriteriosEntregas=$this->input->post('tCriteriosEntregas');
        $iIdUnidadMedida = $this->input->post('iIdUnidadMedida');
        $iIdPrograma = 20;

        $data = array(
            'vNombreServicio' => $vNombre,
            'tDescripcion' => $tDescripcion,
            'tCriteriosCalidad' => $tCriteriosCalidad,
            'tCriteriosEntregas' => $tCriteriosEntregas,
            'iIdUnidadMedida'=> $iIdUnidadMedida,
            'iIdPrograma'=> $iIdPrograma
        );

        if ($this->M_ServiciosBienes->agregar_Servicio($data) === TRUE) {
            echo "correcto";
        } else {
            echo "incorrecto";
        }
    }

    public function ListarServicios()
    {
        $data['servicios'] = $this->M_ServiciosBienes->listar_servicios();
        echo json_encode($data);
    }

    public function actualizar_status_objetivo()
    {
        $iIdPrograma = $this->input->post('iIdPrograma');
        $data = array(
            'iActivo' => 0
        );
        if ($this->M_Programa->actualizar_status_objetivo($iIdPrograma, $data) === TRUE) {
            echo "correcto";
        } else {
            echo "incorrecto";
        }
    }
    public function listar_unidad_medida()
    {
        $data['UnidadMedida']=$this->M_ServiciosBienes->recuperar_unidad();
        echo json_encode($data);
    }


}