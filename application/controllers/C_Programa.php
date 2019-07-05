<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	
	class C_Programa extends CI_Controller {
		
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
			$this->load->model('M_Programa');
			//$this->load->library('session');
			
		}
		public function agregar_programa(){
			$vNombre = $this->input->post('vNombre');
			$iIdTipoPrograma = $this->input->post('iIdTipoPrograma');
			$tDescripcion = $this->input->post('tDescripcion');
			$iIdUsuario=2;
			$data = array(
			'vNombre' => $vNombre,
			'iIdTipoPrograma' => $iIdTipoPrograma,
			'tDescripcion' => $tDescripcion,
			'iIdUsuario' =>$iIdUsuario
			);			
			if($this->M_Programa->agregar_programa($data)===TRUE){
			echo "correcto";	
			}else{
			echo "incorrecto";
			}
		}
		
	}
