<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class C_Frm_20 extends CI_Controller {
    public function __construct()
	{
		parent::__construct();
		//session_start();
		$this->load->helper('url');
		//$this->load->model('');
		//$this->load->library('session');
	}
	public function index()
	{
		$this->load->view('masterpage/head');
		$this->load->view('V_frm_20');
		$this->load->view('masterpage/footer');
	}
}