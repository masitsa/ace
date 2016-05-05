<?php

class Personnel_model extends CI_Model 
{	
	/*
	*	Retrieve all personnel
	*
	*/
	public function all_personnel()
	{
		$this->db->where('personnel_status = 1');
		$query = $this->db->get('personnel');
		
		return $query;
	}
	
	/*
	*	Retrieve all parent personnel
	*
	*/
	public function all_parent_personnel($order = 'personnel_name')
	{
		$this->db->where('personnel_status = 1 AND personnel_parent = 0');
		$this->db->order_by($order, 'ASC');
		$query = $this->db->get('personnel');
		
		return $query;
	}
	/*
	*	Retrieve all children personnel
	*
	*/
	public function all_child_personnel()
	{
		$this->db->where('personnel_status = 1 AND personnel_parent > 0');
		$this->db->order_by('personnel_name', 'ASC');
		$query = $this->db->get('personnel');
		
		return $query;
	}
	
	/*
	*	Retrieve all personnel
	*	@param string $table
	* 	@param string $where
	*
	*/
	public function get_all_personnel($table, $where, $per_page, $page, $order = 'personnel_name', $order_method = 'ASC')
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
	*	Add a new personnel
	*	@param string $image_name
	*
	*/
	public function add_personnel()
	{
		$data = array(
			'personnel_onames'=>ucwords(strtolower($this->input->post('personnel_onames'))),
			'personnel_fname'=>ucwords(strtolower($this->input->post('personnel_fname'))),
			'personnel_dob'=>$this->input->post('personnel_dob'),
			'personnel_email'=>$this->input->post('personnel_email'),
			'gender_id'=>$this->input->post('gender_id'),
			'personnel_phone'=>$this->input->post('personnel_phone'),
			'civilstatus_id'=>$this->input->post('civil_status_id'),
			'personnel_address'=>$this->input->post('personnel_address'),
			'personnel_locality'=>$this->input->post('personnel_locality'),
			'title_id'=>$this->input->post('title_id'),
			'personnel_number'=>$this->input->post('personnel_number'),
			'personnel_city'=>$this->input->post('personnel_city'),
			'personnel_post_code'=>$this->input->post('personnel_post_code')
		);
		
		if($this->db->insert('personnel', $data))
		{
			return $this->db->insert_id();
		}
		else{
			return FALSE;
		}
	}
	
	/*
	*	Update an existing personnel
	*	@param string $image_name
	*	@param int $personnel_id
	*
	*/
	public function edit_personnel($personnel_id)
	{
		$data = array(
			'personnel_onames'=>ucwords(strtolower($this->input->post('personnel_onames'))),
			'personnel_fname'=>ucwords(strtolower($this->input->post('personnel_fname'))),
			'personnel_dob'=>$this->input->post('personnel_dob'),
			'personnel_email'=>$this->input->post('personnel_email'),
			'gender_id'=>$this->input->post('gender_id'),
			'personnel_phone'=>$this->input->post('personnel_phone'),
			'civilstatus_id'=>$this->input->post('civil_status_id'),
			'personnel_address'=>$this->input->post('personnel_address'),
			'personnel_locality'=>$this->input->post('personnel_locality'),
			'title_id'=>$this->input->post('title_id'),
			'personnel_username'=>$this->input->post('personnel_username'),
			'personnel_kin_fname'=>$this->input->post('personnel_kin_fname'),
			'personnel_kin_onames'=>$this->input->post('personnel_kin_onames'),
			'personnel_kin_contact'=>$this->input->post('personnel_kin_contact'),
			'personnel_kin_address'=>$this->input->post('personnel_kin_address'),
			'kin_relationship_id'=>$this->input->post('kin_relationship_id'),
			'job_title_id'=>$this->input->post('job_title_id'),
			'personnel_staff_id'=>$this->input->post('staff_id')
		);
		
		$this->db->where('personnel_id', $personnel_id);
		if($this->db->update('personnel', $data))
		{
			return TRUE;
		}
		else{
			return FALSE;
		}
	}
	
	/*
	*	get a single personnel's children
	*	@param int $personnel_id
	*
	*/
	public function get_sub_personnel($personnel_id)
	{
		//retrieve all users
		$this->db->from('personnel');
		$this->db->select('*');
		$this->db->where('personnel_parent = '.$personnel_id);
		$query = $this->db->get();
		
		return $query;
	}
	
	/*
	*	get a single personnel's details
	*	@param int $personnel_id
	*
	*/
	public function get_personnel($personnel_id)
	{
		//retrieve all users
		$this->db->from('personnel');
		$this->db->select('*');
		$this->db->where('personnel_id = '.$personnel_id);
		$query = $this->db->get();
		
		return $query;
	}
	
	/*
	*	Delete an existing personnel
	*	@param int $personnel_id
	*
	*/
	public function delete_personnel($personnel_id)
	{
		//delete children
		if($this->db->delete('personnel', array('personnel_parent' => $personnel_id)))
		{
			//delete parent
			if($this->db->delete('personnel', array('personnel_id' => $personnel_id)))
			{
				return TRUE;
			}
			else{
				return FALSE;
			}
		}
		else{
			return FALSE;
		}
	}
	
	/*
	*	Activate a deactivated personnel
	*	@param int $personnel_id
	*
	*/
	public function activate_personnel($personnel_id)
	{
		$data = array(
				'personnel_status' => 1
			);
		$this->db->where('personnel_id', $personnel_id);
		

		if($this->db->update('personnel', $data))
		{
			return TRUE;
		}
		else{
			return FALSE;
		}
	}
	
	/*
	*	Deactivate an activated personnel
	*	@param int $personnel_id
	*
	*/
	public function deactivate_personnel($personnel_id)
	{
		$data = array(
				'personnel_status' => 0
			);
		$this->db->where('personnel_id', $personnel_id);
		
		if($this->db->update('personnel', $data))
		{
			return TRUE;
		}
		else{
			return FALSE;
		}
	}
	
	/*
	*	Retrieve gender
	*
	*/
	public function get_gender()
	{
		$this->db->order_by('gender_name');
		$query = $this->db->get('gender');
		
		return $query;
	}
	
	/*
	*	Retrieve title
	*
	*/
	public function get_title()
	{
		$this->db->order_by('title_name');
		$query = $this->db->get('title');
		
		return $query;
	}
	
	/*
	*	Retrieve civil_status
	*
	*/
	public function get_civil_status()
	{
		$this->db->order_by('civil_status_name');
		$query = $this->db->get('civil_status');
		
		return $query;
	}
	
	/*
	*	Retrieve religion
	*
	*/
	public function get_religion()
	{
		$this->db->order_by('religion_name');
		$query = $this->db->get('religion');
		
		return $query;
	}
	
	/*
	*	Retrieve relationship
	*
	*/
	public function get_relationship()
	{
		$this->db->order_by('relationship_name');
		$query = $this->db->get('relationship');
		
		return $query;
	}
	
	/*
	*	Select get_job_titles
	*
	*/
	public function get_job_titles()
	{
		$this->db->select('*');
		$this->db->order_by('job_title_name', 'ASC');
		$query = $this->db->get('job_title');
		
		return $query;
	}
	
	/*
	*	get a single personnel's details
	*	@param int $personnel_id
	*
	*/
	public function get_emergency_contacts($personnel_id)
	{
		//retrieve all users
		$this->db->from('personnel_emergency');
		$this->db->select('*');
		$this->db->where(array('personnel_emergency.personnel_id' => $personnel_id, 'personnel_emergency.relationship_id' => 'relationship.relationship_id'));
		$this->db->order_by('personnel_emergency_fname');
		$query = $this->db->get();
		
		return $query;
	}
	
	/*
	*	get a single personnel's details
	*	@param int $personnel_id
	*
	*/
	public function get_personnel_dependants($personnel_id)
	{
		//retrieve all users
		$this->db->from('personnel_dependant');
		$this->db->select('*');
		$this->db->where(array('personnel_dependant.personnel_id' => $personnel_id, 'personnel_dependant.relationship_id' => 'relationship.relationship_id'));
		$this->db->order_by('personnel_dependant_fname');
		$query = $this->db->get();
		
		return $query;
	}
	
	/*
	*	get a single personnel's details
	*	@param int $personnel_id
	*
	*/
	public function get_personnel_jobs($personnel_id)
	{
		//retrieve all users
		$this->db->from('personnel_job, job_title');
		$this->db->select('personnel_job.*, job_title.job_title_name');
		$this->db->order_by('job_title.job_title_name');
		$this->db->where(array('personnel_job.personnel_id' => $personnel_id, 'personnel_job.job_title_id' => 'job_title.job_title_id'));
		$query = $this->db->get();
		
		return $query;
	}
	
	public function get_leave_types()
	{
		$table = "leave_type";
		$where = "leave_type_status = 0";
		$items = "leave_type_id, leave_type_name";
		$order = "leave_type_name";
		
		$this->db->where($where);
		$this->db->order_by($order);
		$result = $this->db->get($table);
		
		return $result;
	}
	
	/*
	*	get a single personnel's leave details
	*	@param int $personnel_id
	*
	*/
	public function get_personnel_leave($personnel_id)
	{
		//retrieve all users
		$this->db->from('leave_duration, leave_type');
		$this->db->select('leave_duration.*, leave_type.leave_type_name');
		$this->db->order_by('start_date', 'DESC');
		$this->db->where(array('leave_duration.personnel_id' => $personnel_id, 'leave_duration.leave_type_id' => 'leave_type.leave_type_id'));
		$query = $this->db->get();
		
		return $query;
	}
	
	/*
	*	get a single personnel's roles
	*	@param int $personnel_id
	*
	*/
	public function get_personnel_roles($personnel_id)
	{
		//retrieve all users
		$this->db->from('personnel_section, section');
		$this->db->select('personnel_section.*, section.section_name, section.section_position');
		$this->db->order_by('section_position', 'ASC');
		$this->db->where(array('personnel_section.personnel_id' => $personnel_id, 'personnel_section.section_id' => 'section.section_id'));
		$query = $this->db->get();
		
		return $query;
	}
}
?>