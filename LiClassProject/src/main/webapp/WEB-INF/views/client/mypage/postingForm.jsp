<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Theme CSS -->
<link href="/resources/client/mypage/mypost/css/clean-blog.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/resources/client/mypage/mypost/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
  <style>
  	.pager .next>a:hover {
		background-color: #191919;
		border:#191919;
		color:white;
	}
	#post_img{
	    font-size: 14px;
		    
	}
	input[type=file]::file-selector-button {
		margin:10px;
	  width: 100px;
	  height: 30px;
	  background: #fff;
	  border: 1px solid #a69797;
	  cursor: pointer;
	}
	
	
	#posting-container *{font-family: Poppins-Regular;}
  </style>
  <script>
  function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
  function chkData(item, msg){
		if($(item).val().replace(/\s/g,"")==""){
			alert(msg+"입력해 주세요.");
			$(item).val("");
			$(item).focus();
			return false;
		} else{
			return true;
		}
	}
  $(function(){
	 $("#posting-submit").click(function(){
		 if(!chkData($("#post_title"),"제목을 ")){
			 return false;
		 }else if(!chkData($("#post_content"),"내용을 ")){
			 return false;
		 }else{
			 $("#posting-form").attr({
		          "method" : "post",
		          "action" : "/posting"
		       });
		       $("#posting-form").submit();
		 }
	 });
  });
  </script>
  <div class="container" id="posting-container">
        <div class="row">
       	 	<h2 class="post-title text-center" style="margin: 50px 0px; font-weight: 800;">
               Posting
            </h2>
             <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <p class="text-center">${loginUser.user_name}님의 소중한 순간이 흘러가지 않도록 여기에 기록해보세요. </p>
                <form name="posting-form" id="posting-form" enctype="multipart/form-data">
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Title</label>
                            <input type="hidden" name="user_no" value="${loginUser.user_no}">
                            <input type="text" class="form-control" placeholder="제목" id="post_title" name="post_title" >
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Content</label>
                            <textarea rows="5" class="form-control" placeholder="내용" id="post_content" name="post_content" ></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <input type="file" name="file" id="post_img" accept="image/png, image/jpg" onchange="readURL(this);" >
							<br /><br />
							<img id="preview" />
                        </div>
                    </div>
                    <br>
                    <ul class="pager">
	                    <li class="next">
	                        <a class="button" id="posting-submit">작성완료</a>
	                    </li>
              	    </ul>
                </form>
            </div>
        </div>
  </div>
  <!-- Contact Form JavaScript -->
    <script src="/resources/client/mypage/mypost/js/jqBootstrapValidation.js"></script>
    <script src="/resources/client/mypage/mypost/js/contact_me.js"></script>
    <!-- Theme JavaScript -->
    <script src="/resources/client/mypage/mypost/js/clean-blog.min.js"></script>