<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Focalizacion extends CI_Controller {

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
		$this->load->model('M_Criterios');
		//$this->load->library('session');
	}
	public function index()
	{
		
			$this->load->view('masterpage/Head');
		$this->load->view('V_Focalizacion');
		$this->load->view('masterpage/Footer');
		
		
		
	}
		public function agregar_criteriosfocalizacioncomplemento(){
        $vDescripcion = $this->input->post('vDescripcion');
        $vJustificacion = $this->input->post('vJustificacion');
		$vMedioVerificacion = $this->input->post('vMedioVerificacion');
		$tLiga = $this->input->post('tLiga');
		$tArchivo = $this->input->post('tArchivo');
		$iIdPrograma = $this->input->post('iIdPrograma');
		$iIdCriterioFoc = $this->input->post('iIdCriterioFoc');
			
				$data = array(
				'vDescripcion' => $vDescripcion,
				'vJustificacion' => $vJustificacion,
				'vMedioVerificacion' => $vMedioVerificacion,
				'tLiga' => $tLiga,
				'tArchivo' => $tArchivo,
				'iIdPrograma' => $iIdPrograma,
				'iIdCriterioFoc' => $iIdCriterioFoc,
			
			 );
		
		
		
		if($this->M_Criterios->agregar_criteriosfocalizacioncomplemento($data)===TRUE){
			echo "correcto";
		}else{
			echo "incorrecto";
		}
	}
	public function listar_criteriofocalizacion(){
	     $iIdPrograma = $this->uri->segment(3);
        $data['criteriofocalizacion'] = $this->M_Criterios->listar_criteriofocalizacion(base64_decode($iIdPrograma));
        echo json_encode($data);
	}
		public function listar_criterios(){
        $data['criteriofocalizacion'] = $this->M_Criterios->listar_criterios();
        echo json_encode($data);
	}

	
}