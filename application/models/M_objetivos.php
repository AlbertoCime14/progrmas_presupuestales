<?php
class M_objetivos extends CI_Model {


	function __construct()
	{
		parent::__construct();
		$this->db = $this->load->database('default',TRUE);

	}

    public function actualizar_objetivos($data,$id)
	{
		$this->db->where('iId_objeivos', $id);
		$this->db->update('objetivos', $data);

		if ($this->db->affected_rows() > 0)
			{
		  return TRUE;
			}
		else
			{
		  return FALSE;
			}
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
                'tEstructura_objetivo' => $row->tEstructura_objetivo,
				'iId_problemas' => $row->iId_problemas,
				'IActivo' => $row->IActivo

            ];
        }
        return $datos;
    }

}