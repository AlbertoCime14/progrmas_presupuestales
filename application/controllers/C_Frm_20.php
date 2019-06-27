<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class C_Frm_20 extends CI_Controller {
    public function __construct()
	{
		parent::__construct();
		//session_start();
		$this->load->helper('url');
		$this->load->model('M_Problemas');
		//$this->load->library('session');
	}
	public function index()
	{
		$this->load->view('masterpage/head');
		$this->load->view('V_frm_20');
		$this->load->view('masterpage/footer');
	}
	public function actualizarproblema(){
			$id_problema = $this->input->post('id_problema');
			$Nombre_problema = $this->input->post('Nombre_problema');
			$estructura_problema = $this->input->post('estructura_problema');
			
				$data = array(
				'Nombre_problema' => $Nombre_problema,
				'estructura_problema' => $estructura_problema
			 );
		
		
		
		if($this->M_Problemas->actualizar_problema($data,$id_problema)===TRUE){
			echo "Correcto";
		}else{
			echo "Incorrecto";
		}
	}

	public function consultar_problema(){

		$id_problema=$this->uri->segment(3);
	 $data['problema']=$this->M_Problemas->consultarproblemas($id_problema);
	echo json_encode($data);
		
	
	}
}