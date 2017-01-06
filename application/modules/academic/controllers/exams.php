<?php   if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once "./application/modules/admin/controllers/admin.php";

class Exams extends admin 
{
	var $exams_path;
	
	function __construct()
	{
		parent:: __construct();
		$this->load->model('users_model');
		
		$this->load->library('image_lib');
		
		//path to image directory
		$this->exams_path = realpath(APPPATH . '../assets/images/exams');
	}
    
	/*
	*
	*	Default action is to show all the exams
	*
	*/
	public function index($order = 'exam_name', $order_method = 'ASC') 
	{
		$where = 'exam_id > 0';
		$table = 'exam';
		//pagination
		$segment = 5;
		$this->load->library('pagination');
		$config['base_url'] = site_url().'academic/exams/'.$order.'/'.$order_method;
		$config['total_rows'] = $this->users_model->count_items($table, $where);
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
		
		$config['cur_tag_open'] = '<li class="active">';
		$config['cur_tag_close'] = '</li>';
		
		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';
		$this->pagination->initialize($config);
		
		$page = ($this->uri->segment($segment)) ? $this->uri->segment($segment) : 0;
        $data["links"] = $this->pagination->create_links();
		$query = $this->exams_model->get_all_exams($table, $where, $config["per_page"], $page, $order, $order_method);
		
		//change of order method 
		if($order_method == 'DESC')
		{
			$order_method = 'ASC';
		}
		
		else
		{
			$order_method = 'DESC';
		}
		
		$data['title'] = 'Exams';
		$v_data['title'] = $data['title'];
		
		$v_data['order'] = $order;
		$v_data['order_method'] = $order_method;
		$v_data['query'] = $query;
		$v_data['page'] = $page;
		$data['content'] = $this->load->view('exams/all_exams', $v_data, true);
		
		$this->load->view('templates/general_page', $data);
	}
    
	/*
	*
	*	Add a new exam
	*
	*/
	public function add_exam() 
	{
		//form validation rules
		$this->form_validation->set_rules('exam_name', 'Exam Name', 'required|xss_clean');
		$this->form_validation->set_rules('exam_status', 'Exam Status', 'required|xss_clean');
		$this->form_validation->set_rules('exam_preffix', 'Exam Preffix', 'required|is_unique[exam.exam_preffix]|xss_clean');
		$this->form_validation->set_rules('exam_parent', 'Exam Parent', 'required|xss_clean');
		$this->form_validation->set_message("is_unique", "A unique preffix is requred.");
		
		//if form has been submitted
		if ($this->form_validation->run())
		{
			//upload product's gallery images
			$resize['width'] = 600;
			$resize['height'] = 800;
			
			if(is_uploaded_file($_FILES['exam_image']['tmp_name']))
			{
				$this->load->library('image_lib');
				
				$exams_path = $this->exams_path;
				/*
					-----------------------------------------------------------------------------------------
					Upload image
					-----------------------------------------------------------------------------------------
				*/
				$response = $this->file_model->upload_file($exams_path, 'exam_image', $resize);
				if($response['check'])
				{
					$file_name = $response['file_name'];
					$thumb_name = $response['thumb_name'];
				}
			
				else
				{
					$this->session->set_userdata('error_message', $response['error']);
					
					$data['title'] = 'Add New Exam';
					$v_data['all_exams'] = $this->exams_model->all_exams();
					$data['content'] = $this->load->view('exams/add_exam', $v_data, true);
					$this->load->view('templates/general_page', $data);
					break;
				}
			}
			
			else{
				$file_name = '';
				$thumb_name = '';
			}
			
			if($this->exams_model->add_exam($file_name))
			{
				$this->session->set_userdata('success_message', 'Exam added successfully');
				redirect('admin/exams');
			}
			
			else
			{
				$this->session->set_userdata('error_message', 'Could not add exam. Please try again');
			}
		}
		
		//open the add new exam
		
		$data['title'] = 'Add exam';
		$v_data['title'] = $data['title'];
		$v_data['all_exams'] = $this->exams_model->all_parent_exams();
		$data['content'] = $this->load->view('exams/add_exam', $v_data, true);
		$this->load->view('templates/general_page', $data);
	}
    
	/*
	*
	*	Edit an existing exam
	*	@param int $exam_id
	*
	*/
	public function edit_exam($exam_id) 
	{
		//form validation rules
		$this->form_validation->set_rules('exam_name', 'Exam Name', 'required|xss_clean');
		$this->form_validation->set_rules('exam_status', 'Exam Status', 'required|xss_clean');
		$this->form_validation->set_rules('exam_preffix', 'Exam Preffix', 'required|xss_clean');
		$this->form_validation->set_rules('exam_parent', 'Exam Parent', 'required|xss_clean');
		$this->form_validation->set_message("is_unique", "A unique preffix is requred.");
		
		//if form has been submitted
		if ($this->form_validation->run())
		{
			//upload product's gallery images
			$resize['width'] = 600;
			$resize['height'] = 800;
			
			if(is_uploaded_file($_FILES['exam_image']['tmp_name']))
			{
				$exams_path = $this->exams_path;
				
				//delete original image
				$this->file_model->delete_file($exams_path."\\".$this->input->post('current_image'));
				
				//delete original thumbnail
				$this->file_model->delete_file($exams_path."\\thumbnail_".$this->input->post('current_image'));
				/*
				/*
					-----------------------------------------------------------------------------------------
					Upload image
					-----------------------------------------------------------------------------------------
				*/
				$response = $this->file_model->upload_file($exams_path, 'exam_image', $resize);
				if($response['check'])
				{
					$file_name = $response['file_name'];
					$thumb_name = $response['thumb_name'];
				}
			
				else
				{
					$this->session->set_userdata('error_message', $response['error']);
					
					$data['title'] = 'Edit Exam';
					$query = $this->exams_model->get_exam($exam_id);
					if ($query->num_rows() > 0)
					{
						$v_data['exam'] = $query->result();
						$v_data['all_exams'] = $this->exams_model->all_exams();
						$data['content'] = $this->load->view('exams/edit_exam', $v_data, true);
					}
					
					else
					{
						$data['content'] = 'exam does not exist';
					}
					
					$this->load->view('templates/general_page', $data);
					break;
				}
			}
			
			else{
				$file_name = $this->input->post('current_image');
			}
			//update exam
			if($this->exams_model->update_exam($file_name, $exam_id))
			{
				$this->session->set_userdata('success_message', 'Exam updated successfully');
				redirect('admin/exams');
			}
			
			else
			{
				$this->session->set_userdata('error_message', 'Could not update exam. Please try again');
			}
		}
		
		//open the add new exam
		$data['title'] = 'Edit exam';
		$v_data['title'] = $data['title'];
		
		//select the exam from the database
		$query = $this->exams_model->get_exam($exam_id);
		
		if ($query->num_rows() > 0)
		{
			$v_data['exam'] = $query->result();
			$v_data['all_exams'] = $this->exams_model->all_parent_exams();
			
			$data['content'] = $this->load->view('exams/edit_exam', $v_data, true);
		}
		
		else
		{
			$data['content'] = 'Exam does not exist';
		}
		
		$this->load->view('templates/general_page', $data);
	}
    
	/*
	*
	*	Delete an existing exam
	*	@param int $exam_id
	*
	*/
	public function delete_exam($exam_id)
	{
		//delete exam image
		$query = $this->exams_model->get_exam($exam_id);
		
		if ($query->num_rows() > 0)
		{
			$result = $query->result();
			$image = $result[0]->exam_image_name;
			
			$this->load->model('file_model');
			//delete image
			$this->file_model->delete_file($this->exams_path."/images/".$image);
			//delete thumbnail
			$this->file_model->delete_file($this->exams_path."/thumbs/".$image);
		}
		$this->exams_model->delete_exam($exam_id);
		$this->session->set_userdata('success_message', 'Exam has been deleted');
		redirect('admin/exams');
	}
    
	/*
	*
	*	Activate an existing exam
	*	@param int $exam_id
	*
	*/
	public function activate_exam($exam_id)
	{
		$this->exams_model->activate_exam($exam_id);
		$this->session->set_userdata('success_message', 'Exam activated successfully');
		redirect('admin/exams');
	}
    
	/*
	*
	*	Deactivate an existing exam
	*	@param int $exam_id
	*
	*/
	public function deactivate_exam($exam_id)
	{
		$this->exams_model->deactivate_exam($exam_id);
		$this->session->set_userdata('success_message', 'Exam disabled successfully');
		redirect('admin/exams');
	}
}
?>