<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body onload="renderVideo()">
	<div style="text-align: center;">
		<button onclick="playPause()">播放/暂停</button>
		<button onclick="makeBig()">大</button>
		<button onclick="makeNormal()">中</button>
		<button onclick="makeSmall()">小</button>
		<br />
		<video id="video1" width="490" style="margin-top:15px;"> 
			<source src="../../12345.mp4" type="video/mp4" />
		</video>
	</div>
	
<script type="text/javascript">

    function renderVideo(){
    	var myVideo1=document.getElementById("video1");
    	myVideo.play(); 
    	//myVideo.load();
    }

    var myVideo=document.getElementById("video1");

	function playPause(){ 
		if (myVideo.paused) 
  			myVideo.play(); 
		else 
  			myVideo.pause(); 
	} 

	function makeBig(){ 
		myVideo.width=560; 
	} 

	function makeSmall(){ 
		myVideo.width=320; 
	} 

	function makeNormal(){ 
		myVideo.width=420; 
	} 
</script>

</body>
</html>