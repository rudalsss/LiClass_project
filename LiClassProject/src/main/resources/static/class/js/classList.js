/*!
* Start Bootstrap - Shop Homepage v5.0.5 (https://startbootstrap.com/template/shop-homepage)
* Copyright 2013-2022 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-homepage/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

 $(function(){
	// 카테고리
	       // 전체 
	       $("#category_All").click(function(){
	    	  $(".list0").fadeIn("slow"); 
	    	  $(".list1").fadeIn("slow"); 
	    	  $(".list2").fadeIn("slow"); 
	    	  $(".list3").fadeIn("slow"); 
	    	  $(".list4").fadeIn("slow"); 
	    	  $(".list5").fadeIn("slow");
	    	  console.log("전체");
	       });
	       
	       
	       //공예 클릭시 0
	       $("#category_gong").click(function(){
	    	  $(".list0").fadeOut("slow"); 
	    	  $(".list1").fadeOut("slow"); 
	    	  $(".list2").fadeOut("slow"); 
	    	  $(".list3").fadeOut("slow"); 
	    	  $(".list4").fadeOut("slow"); 
	    	  $(".list5").fadeOut("slow");
	    	  
	    	  $(".list0").fadeIn("slow");
	    	  console.log("0");
	       });
	       
	       // 요리 클릭시 1
	       $("#category_cooking").click(function(){
	    	  $(".list0").fadeOut("slow"); 
	    	  $(".list1").fadeOut("slow"); 
	    	  $(".list2").fadeOut("slow"); 
	    	  $(".list3").fadeOut("slow"); 
	    	  $(".list4").fadeOut("slow"); 
	    	  $(".list5").fadeOut("slow");
	    	  
	    	  $(".list1").fadeIn("slow");
		    	  console.log("1");
		       });
	       
	       // 미술 클릭시 2
	       $("#category_art").click(function(){
	    	  $(".list0").fadeOut("slow"); 
	    	  $(".list1").fadeOut("slow"); 
	    	  $(".list2").fadeOut("slow"); 
	    	  $(".list3").fadeOut("slow"); 
	    	  $(".list4").fadeOut("slow"); 
	    	  $(".list5").fadeOut("slow");
	    	  
	    	  $(".list2").fadeIn("slow");
		    	  console.log("1");
		       });
	       
	       // 플라워 클릭시 2
	       $("#category_flower").click(function(){
	    	  $(".list0").fadeOut("slow"); 
	    	  $(".list1").fadeOut("slow"); 
	    	  $(".list2").fadeOut("slow"); 
	    	  $(".list3").fadeOut("slow"); 
	    	  $(".list4").fadeOut("slow"); 
	    	  $(".list5").fadeOut("slow");
	    	  
	    	  $(".list3").fadeIn("slow");
		    	  console.log("3");
		       });
	       
	       // 뷰티 클릭시 4
	       $("#category_beauty").click(function(){
	    	  $(".list0").fadeOut("slow"); 
	    	  $(".list1").fadeOut("slow"); 
	    	  $(".list2").fadeOut("slow"); 
	    	  $(".list3").fadeOut("slow"); 
	    	  $(".list4").fadeOut("slow"); 
	    	  $(".list5").fadeOut("slow");
	    	  
	    	  $(".list4").fadeIn("slow");
		    	  console.log("4");
		       });
	        
	       // 체험 및 기타 5
	       $("#category_etc").click(function(){
	    	  $(".list0").fadeOut("slow"); 
	    	  $(".list1").fadeOut("slow"); 
	    	  $(".list2").fadeOut("slow"); 
	    	  $(".list3").fadeOut("slow"); 
	    	  $(".list4").fadeOut("slow"); 
	    	  $(".list5").fadeOut("slow");
	    	  
	    	  $(".list5").fadeIn("slow");
		    	  console.log("5");
		       });
});