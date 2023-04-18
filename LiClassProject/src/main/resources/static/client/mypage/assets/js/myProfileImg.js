/*은아*/
$(function(){
		
		//회원정보 프로필사진 수정관련
		var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }

	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	    
	    //사진 선택 후 변경 클릭
	    $("#update-img").click(function(){
	    	let filename = $("#input-file").val();
	    	console.log("filename : "+filename);
	    	if(filename == ""){
	    		alert("사진을 선택해주세요.");
	    		return false;
	    	}else{
	    		$("#img-update-form").attr({
					"method" : "post",
					"action" : "/mypage/imgUpdate",
					"enctype" : "multipart/form-data" 
				});
		    	 $("#img-update-form").submit();
	    	}
		});
	    
	    //기본이미지로 선택클릭
	    $("#delete-img").click(function(){
	    	if(confirm("삭제한 프로필사진은 복구할 수 없습니다. 기본이미지로 변경하겠습니까?")){
	    		location.href="/mypage/delImg";
	    	}
		});
		
		//전화번호
	  var tel = $(".fa-phone").data("tel");
	  var result = tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	  
	  $("#user_tel").text(result);
	    
});