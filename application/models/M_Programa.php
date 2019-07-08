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
	public function listar_programas(){
		$iIdUsuario=2;
        $this->db->select('*');
        $this->db->from('programas');
		$this->db->where("(iIdUsuario=$iIdUsuario AND iActivo=1)");
		$this->db->order_by("iIdPrograma", "desc");
        $query = $this->db->get();
		
        foreach ($query->result() as $row) {
           $datos[] = [
		   'iIdPrograma' => $row->iIdPrograma,
		   	'vNombre'       => $row->vNombre ,
            'iIdTipoPrograma'       => $row->iIdTipoPrograma ,
            'tDescripcion'       => $row->tDescripcion
						  
            ];
        }
        return $datos;
    }
		public function actualizar_status_objetivo($iIdPrograma,$data){	
		$this->db->where('iIdPrograma', $iIdPrograma);
		$this->db->update('programas', $data);
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


	
}