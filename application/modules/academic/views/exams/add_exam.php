          
          <section class="panel">
                <header class="panel-heading">
            
                    <h2 class="panel-title"><?php echo $title;?></h2>
                </header>
                <div class="panel-body">
                	<div class="row" style="margin-bottom:20px;">
                        <div class="col-lg-12">
                            <a href="<?php echo site_url();?>admin/exams" class="btn btn-info pull-right">Back to exams</a>
                        </div>
                    </div>
                        
                    <!-- Adding Errors -->
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
                    <!-- Category Name -->
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Category Name</label>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" name="exam_name" placeholder="Category Name" value="<?php echo set_value('exam_name');?>" required>
                        </div>
                    </div>
                    <!-- Category Parent -->
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Category Parent</label>
                        <div class="col-lg-6">
                            <select name="exam_parent" class="form-control" required>
                                <?php
                                echo '<option value="0">No Parent</option>';
                                if($all_exams->num_rows() > 0)
                                {
                                    $result = $all_exams->result();
                                    
                                    foreach($result as $res)
                                    {
                                        if($res->exam_id == set_value('exam_parent'))
                                        {
                                            echo '<option value="'.$res->exam_id.'" selected>'.$res->exam_name.'</option>';
                                        }
                                        else
                                        {
                                            echo '<option value="'.$res->exam_id.'">'.$res->exam_name.'</option>';
                                        }
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <!-- Category Preffix -->
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Category Preffix</label>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" name="exam_preffix" placeholder="Category Preffix" value="<?php echo set_value('exam_preffix');?>" required>
                        </div>
                    </div>
                    <!-- Image -->
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Category Image</label>
                        <div class="col-lg-6">
                            
                            <div class="row">
                            
                                <div class="col-md-4 col-sm-4 col-xs-4">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:200px; height:200px;">
                                            <img src="http://placehold.it/200x200">
                                        </div>
                                        <div>
                                            <span class="btn btn-file btn_pink"><span class="fileinput-new">Select Image</span><span class="fileinput-exists">Change</span><input type="file" name="exam_image"></span>
                                            <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <!-- Activate checkbox -->
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Activate Category?</label>
                        <div class="col-lg-6">
                            <div class="radio">
                                <label>
                                    <input id="optionsRadios1" type="radio" checked value="1" name="exam_status">
                                    Yes
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input id="optionsRadios2" type="radio" value="0" name="exam_status">
                                    No
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions center-align">
                        <button class="submit btn btn-primary" type="submit">
                            Add Category
                        </button>
                    </div>
                    <br />
                    <?php echo form_close();?>
                </div>
            </section>