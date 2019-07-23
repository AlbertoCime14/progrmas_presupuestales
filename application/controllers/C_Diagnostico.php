<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Diagnostico extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
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
		$this->load->model('M_Diagnostico');
		//$this->load->library('session');
	}
	public function index()
	{
		
	    $this->load->view('masterpage/Head');
		$this->load->view('V_diagnostico');
		$this->load->view('masterpage/Footer');
		
		
		
	}
	public function agregar_programa_estatal_previo()
	{
	$data['id_programapp']=$this->M_Diagnostico->agregar_programa_estatal_previo($_POST);
	echo json_encode($data);
	}
	public function agregar_lugarimplementacion()
	{
		$iIdConfiguracion = $this->input->post('iIdConfiguracion');
		$iIdmunicipio = $this->input->post('iIdmunicipio');
		for ($i = 0; $i < count($iIdmunicipio); $i++) {
			$datos=array(
			'iIdConfiguracion' =>$iIdConfiguracion,
			'iIdmunicipio' =>$iIdmunicipio[$i]
			);
			$this->M_Diagnostico->agregar_lugarimplementacion($datos);
		
		}
			echo "correcto";	
	}
	public function listar_lugarimplementacion(){
		
		$data['lugares_implentacion'] = $this->M_Diagnostico->listar_lugarimplementacion($_POST);
        echo json_encode($data);
	}
	public function listar_municipios()
    {

        $data['municipios'] = $this->M_Diagnostico->listar_municipios();
        echo json_encode($data);
    }

	
}