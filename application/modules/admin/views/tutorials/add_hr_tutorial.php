<?php
//personnel data
$tutorial_name =set_value('tutorial_name');
$section_id =set_value('section_id');
$tutorial_desription =set_value('tutorial_desription');
$tutorial_image =set_value('tutorial_image');

?>
          <human_resource_tutorial class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="panel-action panel-action-toggle" data-panel-toggle></a>
                        <a href="#" class="panel-action panel-action-dismiss" data-panel-dismiss></a>
                    </div>
            
                    <h2 class="panel-title"><?php echo $title;?></h2>
                </header>
                <div class="panel-body">
                	<div class="row" style="margin-bottom:20px;">
                        <div class="col-lg-12">
                            <a href="<?php echo site_url();?>tutorial/human-resource" class="btn btn-info pull-right">Back to Tutorials</a>
                        </div>
                    </div>
                    
                         <?php
                    if(isset($error)){
                        echo '<div class="alert alert-danger"> Oh snap! Change a few things up and try submitting again. </div>';
                    }
                    
                    $validation_errors = validation_errors();
                    
                    if(!empty($validation_errors))
                    {
                        echo '<div class="alert alert-danger"> Oh snap! '.$validation_errors.' </div>';
                    }
                    ?>
                    
                     <?php echo form_open_multipart($this->uri->uri_string(), array("class" => "form-horizontal", "role" => "form"));?>
<div class="row" align="center">
	<div class="col-md-6">
        <div class="form-group">
            <label class="col-lg-5 control-label">Section: </label>
            
            <div class="col-lg-7">
                <select class="form-control" name="section_id">
                	<?php
                    	if($sections->num_rows() > 0)
						{
							$section = $sections->result();
							
							foreach($section as $res)
							{
								$section_id = $res->section_id;
								$section_name = $res->section_name;
								
								if($section_id == $section_id)
								{
									echo '<option value="'.$section_id.'" selected>'.$section_name.'</option>';
								}
								
								else
								{
									echo '<option value="'.$section_id.'">'.$section_name.'</option>';
								}
							}
						}
					?>
                </select>
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-lg-5 control-label">Tutorial Name: </label>
            
            <div class="col-lg-7">
            	<input type="text" class="form-control" name="tutorial_name" placeholder="Tutorial Name" value="<?php echo $tutorial_name;?>">
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-lg-5 control-label">Tutorial Desription: </label>
            
            <div class="col-lg-7">
            	<input type="text" class="form-control" name="tutorial_desription" placeholder="Tutorial Desription" value="<?php echo $tutorial_desription;?>">
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-lg-5 control-label">Tutorial Image: </label>
            <div class="col-lg-7">
                
                <div class="fileinput fileinput-new" data-provides="fileinput">
                    <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="max-width:200px; max-height:200px;">
                        <img src="" class="img-responsive">
                    </div>
                    <div>
                        <span class="btn btn-file btn-success"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="tutorial_image"></span>
                        <a href="#" class="btn btn-info fileinput-exists" data-dismiss="fileinput">Remove</a>
                    </div>
                </div>
                
        </div>
    
        </div>
       <div class="row" style="margin-top:10px;">
	<div class="col-md-12">
        <div class="form-actions center-align">
            <button class="submit btn btn-primary" type="submit">
                Add Tutorial
            </button>
        </div>
    </div>
</div>
                    <?php echo form_close();?>
                </div>
        
        
       
        
                    
                    