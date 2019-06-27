<?php
class M_Problemas extends CI_Model {


	function __construct()
	{
		parent::__construct();
		$this->db = $this->load->database('default',TRUE);
		
	}

    public function actualizar_problema($data,$id)
	{	
		$this->db->where('id_problema', $id);
		$this->db->update('problemas', $data);
				
		if ($this->db->affected_rows() > 0)
			{
		  return TRUE;
			}
		else
			{
		  return FALSE;
			}
    }
	  public function consultarproblemas($id_problema){
        $this->db->select('*');
        $this->db->from('problemas');
        $this->db->where('id_problema',$id_problema);
		
        $query = $this->db->get();
		
        foreach ($query->result() as $row) {
           $datos[] = [
		   	'id_problema'       => $row->id_problema ,  
            'Nombre_problema'       => $row->Nombre_problema , 
            'estructura_problema'       => $row->estructura_problema 
						  
            ];
        }
        return $datos;
    }
	
}