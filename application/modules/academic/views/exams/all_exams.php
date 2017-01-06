<?php
		
		$result = '';
		
		//if users exist display them
		if ($query->num_rows() > 0)
		{
			$count = $page;
			
			$result .= 
			'
			<table class="table table-bordered table-striped table-condensed">
				<thead>
					<tr>
						<th>#</th>
						<th>Image</th>
						<th><a href="'.site_url().'admin/exams/exam_code/'.$order_method.'/'.$page.'">Code</a></th>
						<th><a href="'.site_url().'admin/exams/exam_form/'.$order_method.'/'.$page.'">Form</a></th>
						<th><a href="'.site_url().'admin/exams/exam_term/'.$order_method.'/'.$page.'">Term</a></th>
						<th><a href="'.site_url().'admin/exams/exam_type/'.$order_method.'/'.$page.'">Type</a></th>
						<th><a href="'.site_url().'admin/exams/exam_paper/'.$order_method.'/'.$page.'">Paper</a></th>
						<th><a href="'.site_url().'admin/exams/exam_week/'.$order_method.'/'.$page.'">Week</a></th>
						<th colspan="5">Actions</th>
					</tr>
				</thead>
				  <tbody>
				  
			';
			
			//get all administrators
			$administrators = $this->users_model->get_all_administrators();
			if ($administrators->num_rows() > 0)
			{
				$admins = $administrators->result();
			}
			
			else
			{
				$admins = NULL;
			}
			
			foreach ($query->result() as $row)
			{
				$exam_id = $row->exam_id;
				$exam_week = $row->exam_week;
				$exam_paper = $row->exam_paper;
				$exam_type = $row->exam_type;
				$exam_term = $row->exam_term;
				$exam_form = $row->exam_form;
				$exam_code = $row->exam_code;
				$exam_status = 0;//$row->exam_status;
				//$exam_image_name = $row->exam_image_name;
				
				//status
				if($exam_status == 1)
				{
					$status = 'Active';
				}
				else
				{
					$status = 'Disabled';
				}
				
				//create deactivated status display
				if($exam_status == 0)
				{
					$status = '<span class="label label-important">Deactivated</span>';
					$button = '<a class="btn btn-info" href="'.site_url().'admin/activate-exam/'.$exam_id.'" onclick="return confirm(\'Do you want to activate '.$exam_name.'?\');" title="Activate '.$exam_name.'"><i class="fa fa-thumbs-up"></i></a>';
				}
				//create activated status display
				else if($exam_status == 1)
				{
					$status = '<span class="label label-success">Active</span>';
					$button = '<a class="btn btn-default" href="'.site_url().'admin/deactivate-exam/'.$exam_id.'" onclick="return confirm(\'Do you want to deactivate '.$exam_name.'?\');" title="Deactivate '.$exam_name.'"><i class="fa fa-thumbs-down"></i></a>';
				}
				
				//creators & editors
				/*if($admins != NULL)
				{
					foreach($admins as $adm)
					{
						$user_id = $adm->user_id;
						
						if($user_id == $created_by)
						{
							$created_by = $adm->first_name;
						}
						
						if($user_id == $modified_by)
						{
							$modified_by = $adm->first_name;
						}
					}
				}
				
				else
				{
				}*/
				$count++;
				$result .= 
				'
					<tr>
						<td>'.$count.'</td>
						<td>'.$exam_code.'</td>
						<td>'.$exam_form.'</td>
						<td>'.$exam_term.'</td>
						<td>'.$exam_type.'</td>
						<td>'.$exam_paper.'</td>
						<td>'.$exam_week.'</td>
						<td><a href="'.site_url().'academic/edit-exam/'.$exam_id.'" class="btn btn-sm btn-success" title="Edit '.$exam_code.'"><i class="fa fa-pencil"></i></a></td>
						<td><a href="'.site_url().'admin/exam/candidates/'.$exam_id.'" class="btn btn-sm btn-info" title="View '.$exam_code.' candidates"><i class="fa academic-plus"></i></a></td>
						<td><a href="'.site_url().'academic/delete-exam/'.$exam_id.'" class="btn btn-sm btn-danger" onclick="return confirm(\'Do you really want to delete '.$exam_code.'?\');" title="Delete '.$exam_code.'"><i class="fa fa-trash"></i></a></td>
					</tr> 
				';
			}
			
			$result .= 
			'
						  </tbody>
						</table>
			';
		}
		
		else
		{
			$result .= "There are no exams";
		}
?>
						<section class="panel">
							<header class="panel-heading">
								<h2 class="panel-title"><?php echo $title;?></h2>
							</header>
							<div class="panel-body">
                            	<div class="row" style="margin-bottom:20px;">
                                    <div class="col-lg-12">
                                    	<a href="<?php echo site_url();?>academic/exams/add_exam" class="btn btn-success pull-right">Add Exam</a>
                                    </div>
                                </div>
								<div class="table-responsive">
                                	
									<?php echo $result;?>
							
                                </div>
							</div>
						</section>