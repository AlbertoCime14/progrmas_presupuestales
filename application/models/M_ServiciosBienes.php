<?php

class M_ServiciosBienes extends CI_Model
{


    function __construct()
    {
        parent::__construct();
        $this->db = $this->load->database('default', TRUE);

    }

    public function agregar_Servicio($data)
    {
        $this->db->insert('bienesservicios', $data);
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function listar_servicios()
    {
        //falta mandarle el id del programa
        $iIdProgrma = 20;
        $this->db->select('*');
        $this->db->from('bienesservicios');
        $this->db->where("(iIdPrograma=$iIdProgrma AND iActivo=1)");
        $this->db->order_by("vNombreServicio", "desc");
        $query = $this->db->get();

        foreach ($query->result() as $row) {
            $datos[] = [
                'iIdBienServicio' => $row->iIdBienServicio,
                'vNombreServicio' => $row->vNombreServicio,
                'tDescripcion' => $row->tDescripcion,
                'tCriteriosCalidad' => $row->tCriteriosCalidad,
                'tCriteriosEntregas' => $row->tCriteriosEntregas,
                'iIdUnidadMedida' => $row->iIdUnidadMedida
            ];
        }
        return $datos;
    }

    public function actualizar_status_objetivo($iIdPrograma, $data)
    {
        $this->db->where('iIdPrograma', $iIdPrograma);
        $this->db->update('programas', $data);
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }

    }

    public function actualizar_problema($data, $id)
    {
        $this->db->where('iId_problema', $id);
        $this->db->update('problemas', $data);
        $this->actualizar_status_objetivo($id);
        if ($this->db->affected_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function recuperar_unidad()
    {

        $this->db->select('*');
        $this->db->from('unidadmedida');
        $this->db->order_by("vNombre", "ASC");
        $this->db->where("iActivo", 1);
        $query = $this->db->get();
        foreach ($query->result() as $row) {
            $datos[] = [
                'iUnidadMedida' => $row->iUnidadMedida,
                'vNombre' => $row->vNombre,
            ];
        }
        return $datos;
    }

}