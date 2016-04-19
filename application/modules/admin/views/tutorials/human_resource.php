 <section class="panel">
                <header class="panel-heading">
                    <h2 class="panel-title">Human Resource Tutorials</h2>
                </header>
                <div class="panel-body">
                	<div class="row" style="margin-bottom:20px;">
                        <div class="col-lg-12">
                            <a href="<?php echo site_url();?>tutorial/administration/add-human-resource" class="btn btn-info pull-right">Add Human Resource Tutorial</a>
                        </div>
                    </div>
                   
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
						<th>Tutorial Name</th>
						<th>Tutorial Description</th>
						<th>Tutorial Section</th>
						<th>Date Created</th>
						<th>Last Modified</th>
						<th></th>
						<th colspan="5">Actions</th>
					</tr>
				</thead>
				  <tbody>
				  
			';
			
			//get all administrators
			$administrators = $this->users_model->get_active_users();
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
				$tutorial_id = $row->tutorial_id;
				$tutorial_name = $row->tutorial_name;
				$tutorial_image = $row->tutorial_image;
				$tutorial_description = $row->tutorial_desription;
				$section_id = $row->section_id;
				$modified = $row->last_modified;
				$modified_by = $row->modified_by;
				$created_by = $row->created_by;
				$created = $row->created;
				$tutorial_activated = $row->tutorial_activated;
				
				//status
				if($tutorial_activated == 0)
				{
					$status = 'Active';
				}
				else
				{
					$status = 'Disabled';
				}
				$tutorial_category = '-';
				
				//section parent
				foreach($sections->result() as $row2)
				{
					$section_id2 = $row2->section_id;
					
					if($section_id == $section_id2)
					{
						$tutorial_category = $row2->section_name;
						break;
					}
				}
				
				//create deactivated status display
				if($tutorial_activated == 1)
				{
					$status = '<span class="label label-important">Deactivated</span>';
					$button = '<a class="btn btn-info" href="'.site_url().'administration/activate-tutorial/'.$tutorial_id.'" onclick="return confirm(\'Do you want to activate '.$tutorial_name.'?\');" title="Activate '.$tutorial_name.'"><i class="fa fa-thumbs-up"></i></a>';
				}
				//create available tutorils to display
				else if($tutorial_activated == 0)
				{
					$status = '<span class="label label-success">Active</span>';
					$button = '<a class="btn btn-default" href="'.site_url().'administration/deactivate-tutorial/'.$tutorial_id.'" onclick="return confirm(\'Do you want to deactivate '.$tutorial_name.'?\');" title="Deactivate '.$tutorial_name.'"><i class="fa fa-thumbs-down"></i></a>';
				}
				
				//creators & editors
				if($admins != NULL)
				{
					foreach($admins as $adm)
					{
						$personnel_id = $adm->personnel_id;
						
						if($personnel_id == $created_by)
						{
							$created_by = $adm->personnel_fname;
						}
						
						if($personnel_id == $modified_by)
						{
							$modified_by = $adm->personnel_fname;
						}
					}
				}
				
				else
				{
				}
				$count++;
				$result .= 
				'
					<tr>
						<td>'.$count.'</td>
						<td>'.$tutorial_name.'</td>
						<td>'.$tutorial_description.'</td>
						<td>'.$tutorial_category.'</td>
						<td>'.date('jS M Y H:i a',strtotime($row->created)).'</td>
						<td>'.date('jS M Y H:i a',strtotime($row->last_modified)).'</td>
						<td>'.$status.'</td>
						<td>
							
							<!-- Button to trigger modal -->
							<a href="#user'.$tutorial_id.'" class="btn btn-primary" data-toggle="modal" title="Expand '.$tutorial_name.'"><i class="fa fa-plus"></i></a>
							
							<!-- Modal -->
							<div id="user'.$tutorial_id.'" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											<h4 class="modal-title">'.$tutorial_name.'</h4>
										</div>
										
										<div class="modal-body">
											<table class="table table-stripped table-condensed table-hover">
												<tr>
													<th>Tutorial name</th>
													<td>'.$tutorial_name.'</td>
												</tr>
												<tr>
													<th>Tutorial Description</th>
													<td>'.$tutorial_description.'</td>
												</tr>
												<tr>
													<th>Status</th>
													<td>'.$status.'</td>
												</tr>
												<tr>
													<th>Date created</th>
													<td>'.date('jS M Y H:i a',strtotime($row->created)).'</td>
												</tr>
												<tr>
													<th>Created by</th>
													<td>'.$created_by.'</td>
												</tr>
												<tr>
													<th>Date modified</th>
													<td>'.date('jS M Y H:i a',strtotime($row->last_modified)).'</td>
												</tr>
												<tr>
													<th>Modified by</th>
													<td>'.$modified_by.'</td>
												</tr>
												<tr>
													<th>Section icon</th>
													
												</tr>
											</table>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
											<a href="'.site_url().'administration/edit-tutorial/'.$tutorial_id.'" class="btn btn-sm btn-success" title="Edit '.$tutorial_name.'"><i class="fa fa-pencil"></i></a>
											'.$button.'
											<a href="'.site_url().'administration/delete-tutorial/'.$tutorial_id.'" class="btn btn-sm btn-danger" onclick="return confirm(\'Do you really want to delete '.$tutorial_name.'?\');" title="Delete '.$tutorial_name.'"><i class="fa fa-trash"></i></a>
										</div>
									</div>
								</div>
							</div>
						
						</td>
						<td><a href="'.site_url().'administration/edit-tutorial/'.$tutorial_id.'" class="btn btn-sm btn-success" title="Edit '.$tutorial_name.'"><i class="fa fa-pencil"></i></a></td>
						<td>'.$button.'</td>
						<td><a href="'.site_url().'administration/delete-tutorial/'.$tutorial_id.'" class="btn btn-sm btn-danger" onclick="return confirm(\'Do you really want to delete '.$tutorial_name.'?\');" title="Delete '.$tutorial_name.'"><i class="fa fa-trash"></i></a></td>
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
			$result .= "There are no tutorials yet";
		}
?>

						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="panel-action panel-action-toggle" data-panel-toggle></a>
									<a href="#" class="panel-action panel-action-dismiss" data-panel-dismiss></a>
								</div>
						
								<h2 class="panel-title"><?php echo $title;?></h2>
							</header>
							<div class="panel-body">
                            	<?php
                                $success = $this->session->userdata('success_message');
		
								if(!empty($success))
								{
									echo '<div class="alert alert-success"> <strong>Success!</strong> '.$success.' </div>';
									$this->session->unset_userdata('success_message');
								}
								
								$error = $this->session->userdata('error_message');
								
								if(!empty($error))
								{
									echo '<div class="alert alert-danger"> <strong>Oh snap!</strong> '.$error.' </div>';
									$this->session->unset_userdata('error_message');
								}
								?>
                            
								<div class="table-responsive">
                                	
									<?php echo $result;?>
							
                                </div>
							</div>
							<div class="panel-body">
                            	<?php if(isset($links)){echo $links;}?>
							</div>
						</section>  