<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
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
	  var message = '${message}';
	  if(message != ""){
		  alert(messgae);
	  }
	 $("#edit-submit").click(function(){
		 if(!chkData($("#post_title"),"제목을 ")){
			 return false;
		 }else if(!chkData($("#post_content"),"내용을 ")){
			 return false;
		 }else{
			 $("#editPosting-form").attr({
		          "method" : "post",
		          "action" : "/updatePosting"
		       });
		       $("#editPosting-form").submit();
		 }
	 });
	 $("#deletePosting").click(function(){
		 if(confirm("정말 삭제하시겠습니까?")){
			 $("#editPosting-form").attr({
		          "method" : "post",
		          "action" : "/deletePosting"
		       });
		       $("#editPosting-form").submit();
		 }
	 });
  });
  </script>
  <div class="container">
        <div class="row">
       	 	<h2 class="post-title text-center" style="margin: 50px 0px; font-weight: 800;">
               Update Posting
            </h2>
             <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <form name="editPosting-form" id="editPosting-form" enctype="multipart/form-data">
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Title</label>
                            <input type="hidden" name="user_no" value="${loginUser.user_no}">
                            <input type="hidden" name="post_no" value="${originPost.post_no}">
                            <input type="text" class="form-control" value="${originPost.post_title}" id="post_title" name="post_title" >
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Content</label>
                            <textarea rows="5" class="form-control" id="post_content" name="post_content" >
                            	${originPost.post_content}
                            </textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
	                        <c:if test="${orginPost.post_img != ''}">
	                        	<img src="/uploadLiClass/post/${originPost.post_img}" style="width:250px; height:250px; margin-bottom:10px;">
							</c:if>
                            <input type="file" name="file" id="post_img" onchange="readURL(this);" accept="image/png, image/jpg">
							<br /><br />
							<img id="preview" />
                        </div>
                    </div>
                    <br>
                    <ul class="pager">
	                    <li class="next" >
	                        <a class="button" id="edit-submit">수정완료</a>
	                    </li>
	                    <li class="next">
	                        <a class="button" href="/mypage/myPost" style="margin-right: 10px;" >목록</a>
	                    </li>
	                    <li class="next">
	                        <a class="button" id="deletePosting" style="margin-right: 10px;" >삭제</a>
	                    </li>
              	    </ul>
              	     <ul class="pager">
	                    
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