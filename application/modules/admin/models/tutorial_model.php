<?php

class Tutorial_model extends CI_Model
{
	public function get_all_tutorials($table, $where, $per_page, $page)
	{
		//retrieve all tutorials
		$this->db->from($table);
		$this->db->select('*');
		$this->db->where($where);
		$query = $this->db->get('', $per_page, $page);
		
		return $query;
	}
	
	public function get_section_name()
	{
		$this->db->from('section');
		$this->db->select('section.section_id, section.section_name');
		$this->db->where('section_parent = 133');
		$this->db->order_by('section.section_name');
		$query = $this->db->get();
		
		return $query;
	}
	
	public function get_selected_section()
	{
		$this->db->from('section, tutorial');
		$this->db->select('section.section_id, section.section_name, tutorial.*');
		$this->db->where('tutorial.section_id = section.section_id AND section.section_parent');
		$query = $this->db->get();
		
		return $query;
	}
	
	public function get_section($tutorial_id)
	{
	$this->db->from('section, tutorial');
	$this->db->select('section.section_id, section.section_name, tutorial.tutorial_id, tutorial.tutorial_name');
	$this->db->where('section_parent = 133 AND section.section_id = tutorial.section_id AND tutorial.tutorial_id ='.$tutorial_id);
	$query = $this->db->get();
	
	return $query;
	}
	public function delete_tutorial($tutorial_id)
	{
			$data = array(
					'status' => 0
				);
			$this->db->where('tutorial_id', $tutorial_id);
			if($this->db->update('tutorial', $data))
			{
				return TRUE;
			}
			else{
				return FALSE;
			}
	}
	public function count_tutorials()
	{
		
	}
	
	public function upload_any_file($path, $location, $name, $upload, $edit = NULL)
	{
		if(!empty($_FILES[$upload]['tmp_name']))
		{
			$image = $this->session->userdata($name);
			
			/*if((!empty($image)) || ($edit != NULL))
			{
				if($edit != NULL)
				{
					$image = $edit;
				}
				
				//delete any other uploaded image
				if($this->file_model->delete_file($path."\\".$image, $location))
				{
					//delete any other uploaded thumbnail
					$this->file_model->delete_file($path."\\thumbnail_".$image, $location);
				}
				
				else
				{
					$this->file_model->delete_file($path."/".$image, $location);
					$this->file_model->delete_file($path."/thumbnail_".$image, $location);
				}
			}*/
			//Upload image
			$response = $this->file_model->upload_any_file($path, $upload);
			if($response['check'])
			{
				$file_name = $response['file_name'];
					
				//Set sessions for the image details
				$this->session->set_userdata($name, $file_name);
			
				return TRUE;
			}
		
			else
			{
				$this->session->set_userdata('upload_error_message', $response['error']);
				
				return FALSE;
			}
		}
		
		else
		{
			$this->session->set_userdata('upload_error_message', '');
			return FALSE;
		}
	}
	
	public function update_tutorial($tutorial_id)
	{
		$data = array(
				'tutorial_name'=>$this->input->post('tutorial_name'),
				'section_id'=>$this->input->post('section_id'),
				'tutorial_desription'=>$this->input->post('tutorial_desription'),
				'tutorial_image'=>$this->input->post('tutorial_image'),
				'created'=>date('Y-m-d H:i:s'),
				'status'=>1,
				'last_modified'=>date('Y-m-d H:i:s'),
				'modified_by'=>$this->session->userdata('personnel_id'),
				'created_by'=>$this->session->userdata('personnel_id'),
				'tutorial_image' =>$this->input->post('tutorial_image')
			);
		$this->db->where('tutorial_id', $tutorial_id);
			if($this->db->update('tutorial', $data))
			{
				return TRUE;
			}
			else{
				return FALSE;
			}
	}
		public function get_tutorial($tutorial_id)
	{
		//retrieve all users
		$this->db->from('tutorial');
		$this->db->select('*');
		$this->db->where('tutorial_id = '.$tutorial_id);
		$query = $this->db->get();
		
		return $query;
	}
	public function get_all_sections()
	{
		$this->db->from('section');
		$this->db->select('section_id, section_name');
		$this->db->where('section_parent = 133');
		$query = $this->db->get();
		
		return $query;
	}
	
		public function activate_tutorial($tutorial_id)
		{
			$data = array(
					'tutorial_activated' => 0
				);
			$this->db->where('tutorial_id', $tutorial_id);
			if($this->db->update('tutorial', $data))
			{
				return TRUE;
			}
			else{
				return FALSE;
			}
		}
	
	public function deactivate_tutorial($tutorial_id)
	{
		$data = array(
				'tutorial_activated' => 1
			);
		$this->db->where('tutorial_id', $tutorial_id);
		
		if($this->db->update('tutorial', $data))
		{
			return TRUE;
		}
		else{
			return FALSE;
		}
	}
	
	public function add_human_resource_tutorial($tutorial)
	{
		$data = array(
				'tutorial_name'=>ucwords(strtolower($this->input->post('tutorial_name'))),
				'section_id'=>$this->input->post('section_id'),
				'tutorial_desription'=>$this->input->post('tutorial_desription'),
				'created'=>date('Y-m-d H:i:s'),
				'last_modified'=>date('Y-m-d H:i:s'),
				'modified_by'=>$this->session->userdata('personnel_id'),
				'created_by'=>$this->session->userdata('personnel_id'),
				'tutorial_image' =>$tutorial
			);
			
		if($this->db->insert('tutorial', $data))
		{
			return TRUE;
		}
		else{
			return FALSE;
		}
	}
}