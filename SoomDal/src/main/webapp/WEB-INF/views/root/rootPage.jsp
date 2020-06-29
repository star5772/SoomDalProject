<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function loadImage() {
	// <input type='file' name='sajin' multiple='multiple'>
	var file = $("#sajin")[0].files[0];	
	var maxSize = 1024*1024; // 1MB
	if(file.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#sajin").val("");
		return false;
	}
	
	// 이하 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
	var reader = new FileReader();
	reader.onload = function(e) {
		$("#show_sport").attr("src", e.target.result);
	}
	reader.readAsDataURL(file);
	return true;
}

function loadImage2() {
	// <input type='file' name='sajin' multiple='multiple'>
	var file = $("#sajin2")[0].files[0];	
	var maxSize = 1024*1024; // 1MB
	if(file.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#sajin2").val("");
		return false;
	}
	
	// 이하 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
	var reader = new FileReader();
	reader.onload = function(e) {
		$("#show_music").attr("src", e.target.result);
	}
	reader.readAsDataURL(file);
	return true;
}

function loadImage3() {
	// <input type='file' name='sajin' multiple='multiple'>
	var file = $("#sajin3")[0].files[0];	
	var maxSize = 1024*1024; // 1MB
	if(file.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#sajin3").val("");
		return false;
	}
	
	// 이하 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
	var reader = new FileReader();
	reader.onload = function(e) {
		$("#show_art").attr("src", e.target.result);
	}
	reader.readAsDataURL(file);
	return true;
}



$(function(){
	$("#sajin").on("change", loadImage);
	$("#sajin2").on("change", loadImage2);
	$("#sajin3").on("change", loadImage3);
	
	$("#insertField").on("click",function() {
	    var formData = new FormData();
	    formData.append("fNo", $("#fNo").val());
	    formData.append("fName", $("#fName").val());
	    if($("#sajin")[0].files[0]!=undefined)
	       formData.append("sajin", $("#sajin")[0].files[0]);
	    formData.append("_csrf","${_csrf.token}");
		$.ajax({
			url : "/dal/member/admin/insertField",
			data: formData ,
			method: "post" ,
			processData: false,
			contentType: false
		}).done(()=>{ alert("변경성공"); })
	})
	$("#insertField2").on("click",function() {
	    var formData = new FormData();
	    formData.append("fNo", $("#fNo2").val());
	    formData.append("fName", $("#fName2").val());
	    if($("#sajin2")[0].files[0]!=undefined)
	       formData.append("sajin", $("#sajin2")[0].files[0]);
	    formData.append("_csrf","${_csrf.token}");
		$.ajax({
			url : "/dal/member/admin/insertField",
			data: formData ,
			method: "post" ,
			processData: false,
			contentType: false
		}).done(()=>{ alert("변경성공"); })
	})
	$("#insertField3").on("click",function() {
	    var formData = new FormData();
	    formData.append("fNo", $("#fNo3").val());
	    formData.append("fName", $("#fName3").val());
	    if($("#sajin3")[0].files[0]!=undefined)
	       formData.append("sajin", $("#sajin3")[0].files[0]);
	    formData.append("_csrf","${_csrf.token}");
		$.ajax({
			url : "/dal/member/admin/insertField",
			data: formData ,
			method: "post" ,
			processData: false,
			contentType: false
		}).done(()=>{ alert("변경성공"); })
	})		
})
</script>
</head>
<body>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('/dal/image/slideTwo.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('/dal/image/secondSlide.png')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>

    <h2>분야</h2>
    <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="/dal/member/field_sport/list" style="color:white;"><img id="show_sport" class="card-img-top" src="/image/sport.jpg"/></a>
          <div class="card-body">
            <p class="card-text"style="font-size: xx-large; text-align: center; background-color: maroon; color:white; margin-top: 25px;"><a href="/dal/member/field_sport/list" style="color:white;">스포츠</a></p>
            
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="/dal/member/field_music/list"><img id="show_music"class="card-img-top" src="/image/music.jpg" alt=""></a>
          <div class="card-body">
            <p class="card-text" style="font-size: xx-large; text-align: center; background-color: aqua; margin-top: 25px;"><a href="/dal/member/field_music/list" style="color:pink;">악기</a></p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="/dal/member/field_art/list"><img id="show_art" class="card-img-top" src="/image/art.jpg" alt=""></a>
          <div class="card-body">
            <p class="card-text" style="font-size: xx-large; text-align: center; background-color: pink; margin-top: 25px;"><a href="/dal/member/field_art/list" style="color:white;">미술</a></p>
        </div>
      </div>
     </div>
	</div>
    <hr>
</body>
</html>