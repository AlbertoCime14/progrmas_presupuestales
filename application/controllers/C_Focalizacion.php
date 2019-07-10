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