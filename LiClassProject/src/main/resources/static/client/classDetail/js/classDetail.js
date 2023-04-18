/* 은아 */
$(function(){
		//localStorage.clear();
		//최근 본 클래스에 추가
		var classNo = JSON.parse(localStorage.getItem("classNo") || "[]");
		var c_no = $(".class-content").data("num");
		classNo.push(JSON.stringify(c_no));
		localStorage.setItem("classNo",JSON.stringify(classNo));
		/*console.log("localStorage - classNo : "+localStorage.getItem("classNo"));*/
	
		//지도보기 클릭 시 스크롤제어
		$("#map-click").click(function(e){
			e.preventDefault();
		});
	});
	
	function shareTwitter() {
	    var sendText = "LiClass-"+$(".class-info").data("title"); 
	    var sendUrl = $(location).attr('href'); 
	    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl,'window_name','width=430,height=500,location=no,status=no,scrollbars=yes');
	}
  
  
  function shareFacebook() {
	   const pageUrl = $(location).attr('href');
	   window.open(`http://www.facebook.com/sharer/sharer.php?u=${pageUrl}`,'window_name','width=430,height=500,location=no,status=no,scrollbars=yes');
	}
  
  function shareNaver() {
	   window.open('http://share.naver.com/web/shareView.nhn?url=' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
  }
  
  function copy(){

      var url = '';  
      var textarea = document.createElement("textarea");  
      
      document.body.appendChild(textarea); 
      url = window.document.location.href; 
      textarea.value = url; 
      textarea.select(); 
      document.execCommand("copy"); 
      document.body.removeChild(textarea); 
      
      alert("URL이 복사되었습니다.") 
  }
  
  function kakaoShare() {
	    Kakao.Link.sendDefault({
	      objectType: 'feed',
	      content: {
	        title: 'LiClass',
	        description: '$(".class-info").data("title")',
	        imageUrl: '/uploadLiClass/LiClass.jpg',
	        link: {
	          mobileWebUrl: encodeURIComponent(document.URL),
	          webUrl: encodeURIComponent(document.URL),
	        },
	      },
	      buttons: [
	        {
	          title: '웹으로 보기',
	          link: {
	            mobileWebUrl: encodeURIComponent(document.URL),
	            webUrl: encodeURIComponent(document.URL),
	          },
	        },
	      ],
	      // 카카오톡 미설치 시 카카오톡 설치 경로이동
	      installTalk: true,
	    })
	  }
	  
	  
	  
/*	  
 <script>
 // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('93dabf793b8403bbf540b6d314c75a8f');

  // SDK 초기화 여부를 판단합니다.
  console.log(Kakao.isInitialized());

  
</script>*/