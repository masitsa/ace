<?php   if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once "./application/modules/admin/controllers/admin.php";

class Tutorial extends admin
{
	var $tutorial_upload_path;
	var $tutorial_upload_location;
	
	function __construct()
	{
		parent:: __construct();
		$this->load->library('image_lib');

		$this->tutorial_upload_path = realpath(APPPATH . '../assets/tutorials');
		$this->tutorial_upload_location = base_url().'assets/tutorials/';
	}
	
	public function index() 
	{
		$where = 'tutorial.status = 1';
		$table = 'tutorial';
		//pagination
		$segment = 5;
		$this->load->library('pagination');
		$config['base_url'] = site_url().'administration/tutorial';
		$config['total_rows'] = $this->tutorial_model->count_tutorials($table, $where);
		$config['uri_segment'] = $segment;
		$config['per_page'] = 20;
		$config['num_links'] = 5;
		
		$config['full_tag_open'] = '<ul class="pagination pull-right">';
		$config['full_tag_close'] = '</ul>';
		
		$config['first_tag_open'] = '<li>';
		$config['first_tag_close'] = '</li>';
		
		$config['last_tag_open'] = '<li>';
		$config['last_tag_close'] = '</li>';
		
		$config['next_tag_open'] = '<li>';
		$config['next_link'] = 'Next';
		$config['next_tag_close'] = '</span>';
		
		$config['prev_tag_open'] = '<li>';
		$config['prev_link'] = 'Prev';
		$config['prev_tag_close'] = '</li>';
		
		$config['cur_tag_open'] = '<li class="active"><a href="#">';
		$config['cur_tag_close'] = '</a></li>';
		
		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';
		$this->pagination->initialize($config);
		
		$page = ($this->uri->segment($segment)) ? $this->uri->segment($segment) : 0;
        $v_data["links"] = $this->pagination->create_links();
		$query = $this->tutorial_model->get_all_tutorials($table, $where, $config["per_page"], $page);
		$v_data['sections'] = $this->tutorial_model->get_all_sections();
		$data['title'] = 'Tutorials';
		$v_data['title'] = $data['title'];

		$v_data['query'] = $query;
		$v_data['page'] = $page;
		$data['content'] = $this->load->view('admin/tutorials/human_resource', $v_data, true);
		
		$this->load->view('admin/templates/general_page',$data);
	}
	
	public function activate_tutorial($tutorial_id)
	{
		if($this->tutorial_model->activate_tutorial($tutorial_id))
		{
			$this->session->set_userdata('success_message', 'Tutorial activated successfully');
		}
		else
		{
			$this->session->set_userdata('success_message', 'Could not activate tutorial. Please try again');
		}
		redirect('administration/tutorial');
	}
	
	public function delete_tutorial($tutorial_id)
	{
			if($this->tutorial_model->delete_tutorial($tutorial_id))
		{
			$this->session->set_userdata('success_message', 'Tutorial deleted successfully');
		}
		else
		{
			$this->session->set_userdata('success_message', 'Could not delete tutorial. Please try again');
		}
		redirect('administration/tutorial');
	}
	
	
	public function edit_tutorial($tutorial_id) 
	{
		//form validation rules
		$this->form_validation->set_rules('section_id', 'Section', 'xss_clean');
		$this->form_validation->set_rules('tutorial_name', 'Tutorial Name', 'required|xss_clean');
		$this->form_validation->set_rules('tutorial_desription', 'Turorial Description', 'required|xss_clean');
		
		//if form has been submitted
		if ($this->form_validation->run())
		{
			//update tutorial
			if($this->tutorial_model->update_tutorial($tutorial_id))
			{
				$this->session->set_userdata('success_message', 'Tutorial updated successfully');
				redirect('administration/tutorial');
			}
			
			else
			{
				$this->session->set_userdata('error_message', 'Could not update tutorial. Please try again');
			}
		}
		//open the add new section
		$data['title'] = 'Edit tutorial';
		$v_data['title'] = $data['title'];
		
		//select the tutorial from the database
		$query = $this->tutorial_model->get_tutorial($tutorial_id);
			
		if ($query->num_rows() > 0)
		{
			$v_data['tutorial'] = $query;
			$v_data['sections'] = $this->tutorial_model->get_all_sections();
			
			$data['content'] = $this->load->view('tutorials/edit_tutorial', $v_data, true);
		}
		
		else
		{
			$data['content'] = 'Tutorial does not exist';
		}
		
		$this->load->view('templates/general_page', $data);
	}
	
	public function deactivate_tutorial($tutorial_id)
	{
		if($this->tutorial_model->deactivate_tutorial($tutorial_id))
		{
			$this->session->set_userdata('success_message', 'Tutorial deactivated successfully');
		}
		else
		{
			$this->session->set_userdata('success_message', 'Could not deactivate tutorial. Please try again');
		}
		redirect('administration/tutorial');
	}
	 public function view_tutorials()
   {
	   $where = 'tutorial.status = 1';
		$table = 'tutorial';
		//pagination
		$segment = 5;
		$this->load->library('pagination');
		$config['base_url'] = site_url().'tutorial/human-resource';
		$config['total_rows'] = $this->tutorial_model->count_tutorials($table, $where);
		$config['uri_segment'] = $segment;
		$config['per_page'] = 20;
		$config['num_links'] = 5;
		
		$config['full_tag_open'] = '<ul class="pagination pull-right">';
		$config['full_tag_close'] = '</ul>';
		
		$config['first_tag_open'] = '<li>';
		$config['first_tag_close'] = '</li>';
		
		$config['last_tag_open'] = '<li>';
		$config['last_tag_close'] = '</li>';
		
		$config['next_tag_open'] = '<li>';
		$config['next_link'] = 'Next';
		$config['next_tag_close'] = '</span>';
		
		$config['prev_tag_open'] = '<li>';
		$config['prev_link'] = 'Prev';
		$config['prev_tag_close'] = '</li>';
		
		$config['cur_tag_open'] = '<li class="active"><a href="#">';
		$config['cur_tag_close'] = '</a></li>';
		
		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';
		$this->pagination->initialize($config);
		
		$page = ($this->uri->segment($segment)) ? $this->uri->segment($segment) : 0;
        $v_data["links"] = $this->pagination->create_links();
		$section_id = $this->tutorial_model->get_all_tutorials($table, $where, $config["per_page"], $page);
		$tutorial_id = $this->tutorial_model->get_all_tutorials($table, $where, $config["per_page"], $page);
		$query = $this->tutorial_model->get_selected_section($tutorial_id);
		$selected_tutorial = $this->tutorial_model->get_selected_section($section_id);
		$data['title'] = 'Tutorials';
		$v_data['title'] = $data['title'];
		$v_data['query'] = $query;
		$v_data['tutorial_id']=$tutorial_id;
		$v_data['page'] = $page;
		$v_data['table'] = $table;
		$v_data['where'] = $where;
		//$v_data['per_page'] = $per_page;
	   $tutorial_id = $this->tutorial_model->get_all_tutorials($table, $where, $config["per_page"], $page);
	   if($tutorial_id->num_rows() > 0)
	   {
		   foreach ($tutorial_id->result() as $row)
		   {
		   $tutorial_id = $row->tutorial_id;
	   	   $section_name = $this->tutorial_model->get_section($tutorial_id);
		   }
	   }
	   $section_id = $this->tutorial_model->get_all_tutorials($table, $where, $config["per_page"], $page);
	   if ($section_id ->num_rows() > 0)
	   {
		   foreach ($section_id->result() as $row)
		   {
		   $section_id = $row->section_id;
	   	   $section_name = $this->tutorial_model->get_section($tutorial_id);
		   } 
	   }
	   $data['title'] = 'Tutorials';
	   $v_data['title'] = $data['title'];
	   $query = $this->tutorial_model->get_selected_section($tutorial_id);
	   $all_sections = $this->tutorial_model->get_all_sections();
		$data['all_sections'] = $all_sections;
		$v_data['sections'] = $data['all_sections'];
	   $data['content'] = $this->load->view('admin/tutorials/human_resource',$v_data,TRUE);
	   $this->load->view('admin/templates/general_page',$data);
   }
   public function get_all_tutorials()
   {
   }
   	
	public function upload_tutorial() 
	{
		$image_error = '';
		$this->session->unset_userdata('upload_error_message');
		$tutorial_name = 'tutorial_image';
		
		//upload image if it has been selected
		$response = $this->tutorial_model->upload_any_file($this->tutorial_upload_path, $this->tutorial_upload_location, $tutorial_name, 'tutorial_image');
		//var_dump($response);
		if($response)
		{
			$tutorial_upload_location = $this->tutorial_upload_location.$this->session->userdata($tutorial_name);
		}
		
		//case of upload error
		else
		{
			$image_error = $this->session->userdata('upload_error_message');
			$this->session->unset_userdata('upload_error_message');
		}

		$tutorial = $this->session->userdata($tutorial_name);
		$this->form_validation->set_rules('section_id', 'Section', 'xss_clean');
		$this->form_validation->set_rules('tutorial_name', 'Tutorial Name', 'required|xss_clean');
		$this->form_validation->set_rules('tutorial_desription', 'Turorial Description', 'required|xss_clean');
		//if form has been submitted
		if ($this->form_validation->run())
		{
			$hr_tutorial_id = $this->tutorial_model->add_human_resource_tutorial($tutorial);
			if($hr_tutorial_id > 0)
			{
				$this->session->set_userdata("success_message", "Tutorial added successfully");
				redirect('administration/tutorial');
			}
			
			else
			{
				$this->session->set_userdata("error_message","Could not add tutorial. Please try again ".$personnel_id);
			}
		}
		else
		{
			$this->session->set_userdata('error_message',validation_errors());
		}
		$data['title'] = 'Tutorials';
		$v_data['title'] = $data['title'];
		$all_sections = $this->tutorial_model->get_section_name();
		$data['all_sections'] = $all_sections;
		$v_data['sections'] = $data['all_sections'];
		$data['content'] = $this->load->view('admin/tutorials/add_hr_tutorial', $v_data, true);
		$this->load->view('admin/templates/general_page',$data);
	}
}