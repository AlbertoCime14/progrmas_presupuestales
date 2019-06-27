<?php
class M_objetivos extends CI_Model {


	function __construct()
	{
		parent::__construct();
		$this->db = $this->load->database('default',TRUE);

	}

    public function actualizar_problema($data,$id)
	{
		$this->db->where('iId_problema', $id);
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
	  public function consultarproblemas($iId_problema){
        $this->db->select('*');
        $this->db->from('problemas');
        $this->db->where('iId_problema',$iId_problema);

        $query = $this->db->get();

        foreach ($query->result() as $row) {
           $datos[] = [
		   	'iId_problema'       => $row->iId_problema ,
            'tNombre_problema'       => $row->tNombre_problema ,
            'tEstructura_problema' => $row->tEstructura_problema

            ];
        }
        return $datos;
    }
    public function consultarobjetivos($iId_objetivos){
        $this->db->select('*');
        $this->db->from('objetivos');
        $this->db->where('iId_objeivos',$iId_objetivos);

        $query = $this->db->get();

        foreach ($query->result() as $row) {
            $datos[] = [
                'iId_objeivos'       => $row->iId_objeivos ,
                'tNombre_objetivo'       => $row->tNombre_objetivo ,
                'tEstructura_objetivo' => $row->tEstructura_objetivo//averiguar si traigo el id del problema

            ];
        }
        return $datos;
    }

}