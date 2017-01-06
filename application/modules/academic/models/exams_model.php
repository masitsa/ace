<?php

class Exams_model extends CI_Model 
{	
	/*
	*	Retrieve all exams
	*
	*/
	public function all_exams()
	{
		$this->db->where('exam_status = 1');
		$query = $this->db->get('exam');
		
		return $query;
	}
	/*
	*	Retrieve latest exam
	*
	*/
	public function latest_exam()
	{
		$this->db->limit(1);
		$this->db->order_by('created', 'DESC');
		$query = $this->db->get('exam');
		
		return $query;
	}
	/*
	*	Retrieve all parent exams
	*
	*/
	public function all_parent_exams()
	{
		$this->db->where('exam_status = 1 AND exam_parent = 0');
		$this->db->order_by('exam_name', 'ASC');
		$query = $this->db->get('exam');
		
		return $query;
	}
	/*
	*	Retrieve all children exams
	*
	*/
	public function all_child_exams()
	{
		$this->db->where('exam_status = 1 AND exam_parent > 0');
		$this->db->order_by('exam_name', 'ASC');
		$query = $this->db->get('exam');
		
		return $query;
	}
	
	/*
	*	Retrieve all exams
	*	@param string $table
	* 	@param string $where
	*
	*/
	public function get_all_exams($table, $where, $per_page, $page, $order = 'exam_name', $order_method = 'ASC')
	{
		//retrieve all users
		$this->db->from($table);
		$this->db->select('*');
		$this->db->where($where);
		$this->db->order_by($order, $order_method);
		$query = $this->db->get('', $per_page, $page);
		
		return $query;
	}
	
	/*
	*	Add a new exam
	*	@param string $image_name
	*
	*/
	public function add_exam($image_name)
	{
		$data = array(
				'exam_name'=>ucwords(strtolower($this->input->post('exam_name'))),
				'exam_parent'=>$this->input->post('exam_parent'),
				'exam_preffix'=>strtoupper($this->input->post('exam_preffix')),
				'exam_status'=>$this->input->post('exam_status'),
				'created'=>date('Y-m-d H:i:s'),
				'created_by'=>$this->session->userdata('user_id'),
				'modified_by'=>$this->session->userdata('user_id'),
				'exam_image_name'=>$image_name
			);
			
		if($this->db->insert('exam', $data))
		{
			return TRUE;
		}
		else{
			return FALSE;
		}
	}
	
	/*
	*	Update an existing exam
	*	@param string $image_name
	*	@param int $exam_id
	*
	*/
	public function update_exam($image_name, $exam_id)
	{
		$data = array(
				'exam_name'=>ucwords(strtolower($this->input->post('exam_name'))),
				'exam_parent'=>$this->input->post('exam_parent'),
				'exam_preffix'=>strtoupper($this->input->post('exam_preffix')),
				'exam_status'=>$this->input->post('exam_status'),
				'modified_by'=>$this->session->userdata('user_id'),
				'exam_image_name'=>$image_name
			);
			
		$this->db->where('exam_id', $exam_id);
		if($this->db->update('exam', $data))
		{
			return TRUE;
		}
		else{
			return FALSE;
		}
	}
	
	/*
	*	get a single exam's children
	*	@param int $exam_id
	*
	*/
	public function get_sub_exams($exam_id)
	{
		//retrieve all users
		$this->db->from('exam');
		$this->db->select('*');
		$this->db->where('exam_parent = '.$exam_id);
		$query = $this->db->get();
		
		return $query;
	}
	
	/*
	*	get a single exam's details
	*	@param int $exam_id
	*
	*/
	public function get_exam($exam_id)
	{
		//retrieve all users
		$this->db->from('exam');
		$this->db->select('*');
		$this->db->where('exam_id = '.$exam_id);
		$query = $this->db->get();
		
		return $query;
	}
	
	/*
	*	Delete an existing exam
	*	@param int $exam_id
	*
	*/
	public function delete_exam($exam_id)
	{
		if($this->db->delete('exam', array('exam_id' => $exam_id)))
		{
			return TRUE;
		}
		else{
			return FALSE;
		}
	}
	
	/*
	*	Activate a deactivated exam
	*	@param int $exam_id
	*
	*/
	public function activate_exam($exam_id)
	{
		$data = array(
				'exam_status' => 1
			);
		$this->db->where('exam_id', $exam_id);
		

		if($this->db->update('exam', $data))
		{
			return TRUE;
		}
		else{
			return FALSE;
		}
	}
	
	/*
	*	Deactivate an activated exam
	*	@param int $exam_id
	*
	*/
	public function deactivate_exam($exam_id)
	{
		$data = array(
				'exam_status' => 0
			);
		$this->db->where('exam_id', $exam_id);
		
		if($this->db->update('exam', $data))
		{
			return TRUE;
		}
		else{
			return FALSE;
		}
	}
}
?>