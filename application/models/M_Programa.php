<?php
class M_Programa extends CI_Model {


	function __construct()
	{
		parent::__construct();
		$this->db = $this->load->database('default',TRUE);
		
	}
	
	public function agregar_programa($data){
	$this->db->insert('programas', $data);
			if ($this->db->affected_rows() > 0)
			{
		  return TRUE;
			}
		else
			{
		  return FALSE;
			}
	}

    public function actualizar_problema($data,$id)
	{	
		$this->db->where('iId_problema', $id);
		$this->db->update('problemas', $data);
		$this->actualizar_status_objetivo($id);
		if ($this->db->affected_rows() > 0)
			{
		  return TRUE;
			}
		else
			{
		  return FALSE;
			}
    }
	public function actualizar_status_objetivo($id){	
		$data= array(
		'IActivo'=>0
		);
		$this->db->where('iId_problemas', $id);
		$this->db->update('objetivos', $data);
		
	}
	  public function consultarproblemas($iId_problema){
        $this->db->select('*');
        $this->db->from('problemas');
        $this->db->where('iId_problema',$iId_problema);
		
        $query = $this->db->get();
		
        foreach ($query->result() as $row) {
           $datos[] = [
		   	'iId_problema'       => $row->iId_problema ,
            'tNombre_problema'       => $row->tNombre_problema ,
            'tEstructura_problema'       => $row->tEstructura_problema
						  
            ];
        }
        return $datos;
    }
	
}