<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Frm_21 extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        //session_start();
        $this->load->helper('url');
        $this->load->model('M_objetivos');
        $this->load->model('M_Problemas');
        //$this->load->library('session');
    }

    public function index()
    {
        $this->load->view('masterpage/head');
        $this->load->view('V_frm_21');
        $this->load->view('masterpage/footer');
    }

    public function actualizarobjetivo()
    {
        $iId_problema = $this->input->post('iId_problema');
        $tNombre_problema = $this->input->post('tNombre_problema');
        $tEstructura_problema = $this->input->post('tEstructura_problema');

        $data = array(
            'tNombre_problema' => $tNombre_problema,
            'tEstructura_problema' => $tEstructura_problema
        );


        if ($this->M_objetivos->actualizar_problema($data, $iId_problema) === TRUE) {
            echo "Correcto";
        } else {
            echo "Incorrecto";
        }
    }

    public function consultar_problema()
    {
        //la consulta de este problema servira para pintar un json similar al del arbol de problemas
        $iId_problema = $this->uri->segment(3);
        $data['problema'] = $this->M_Problemas->consultarproblemas($iId_problema);
        echo json_encode($data);
    }
    public function cosultar_objetivos()
    {

        $iId_objetivos = $this->uri->segment(3);
        $data['objetivos'] = $this->M_objetivos->consultarobjetivos($iId_objetivos);
        echo json_encode($data);
    }
}