<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HuNgRy-SnAkE</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	var score = 0;

	$(document).ready(function() {
		generateFood();
	});

	$(document).keydown(function(event) {

		switch (event.keyCode) {
		case 27:
			reset();
			break;
		case 37:
			$("#snake0").stop()
			moveLeft();
			break;
		case 39:
			$("#snake0").stop()
			moveRight();
			break;
		case 38:
			$("#snake0").stop()
			moveUp();
			break;
		case 40:
			$("#snake0").stop()
			moveDown();
			break;
		}
	});

	function moveLeft() {

		$("#snake0").stop().animate({
			left : "-=400px"
		}, {
			duration : 5500,
			step : function(currentLeft) {

				if (currentLeft < 2) {
					endTheGame();
				}
				foodSwallowed();
			}
		});
	}

	function moveRight() {

		$("#snake0").stop().animate({
			left : "+=400px"
		}, {
			duration : 5500,
			step : function(currentLeft) {

				if (380 - currentLeft < 2) {
					endTheGame();
				}
				foodSwallowed();
			}
		});
	}

	function moveUp() {

		$("#snake0").animate({
			top : "-=400px"
		}, {
			duration : 5500,
			step : function(currentTop) {

				if (currentTop < 2) {
					endTheGame();
				}
				foodSwallowed();
			}
		});
	}

	function moveDown() {

		$("#snake0").animate({
			top : "+=400px"
		}, {
			duration : 5500,
			step : function(currentTop) {

				if (380 - currentTop < 2) {
					endTheGame();
				}
				foodSwallowed();
			}
		});
	}

	/* 	function checkCollision(wallname){
	 var snakePos = $( "#snake0" );
	 var positionOfSnake = snakePos.position();
	 var leftOfSnake = positionOfSnake.left;
	 var rightOfSnake = positionOfSnake.right;
	 var topOfSnake = positionOfSnake.top;
	 var bottomOfSnake = positionOfSnake.bottom;
	 } */

	function generateFood() {
		var max = 380;
		var min = 0;
		var randomPosX = Math.random() * (max - min) + min;
		var randomPosY = Math.random() * (max - min) + min;
		$("#food0").css({
			top : randomPosY,
			left : randomPosX,
			position : 'absolute'
		});
	}

	function foodSwallowed() {
		var snakePos = $("#snake0");
		var positionOfSnake = snakePos.position();
		var leftOfSnake = positionOfSnake.left;
		var topOfSnake = positionOfSnake.top;

		var foodPos = $("#food0");
		var positionOfFood = foodPos.position();
		var leftOfFood = positionOfFood.left;
		var topOfFood = positionOfFood.top;

		if (Math.abs(leftOfFood - leftOfSnake) < 20
				&& Math.abs(topOfFood - topOfSnake) < 20) {
			score += 100;
			$("#scoreDisplay").val(score);
			generateFood();
		}
	}

	function endTheGame() {
		$("#snake0").stop();
		document.getElementById("snake0").setAttribute("style","display: none");
		alert ("Game Over. Your score = "+score);
	}
	
	function reset() {
		location.reload();
	}
</script>
</head>
<body>
	<div id="myForest"
		style="height: 400px; width: 400px; background-color: green; position: relative; left: 0; top: 0">
		<!-- <img id="snake0" src="hello" style="position: absolute; left: 0; top: 0" height="20" width="20"> -->
		<div id="snake0"
			style="position: absolute; left: 0; top: 0; height: 20px; width: 20px; background-color: lime"></div>
		<div id="food0"
			style="position: absolute; right: 0; bottom: 0; height: 5px; width: 5px; background-color: yellow"></div>

		<!-- following are referring to the corners, to get the position of edges if required -->
		<!-- <div id="left-top" style="position: absolute; left: 0; top: 0">left-top</div>	
		<div id="right-top" style="position: absolute; right: 0; top: 0">right-top</div>
		<div id="left-bottom" style="position: absolute; left: 0; bottom: 0">left-bottom</div>
		<div id="right-bottom" style="position: absolute; right: 0; bottom: 0">right-bottom</div> -->
	</div>
	<div id="scoreboard"
		style="height: 40px; width: 400px; background-color: darkseagreen; position: relative; left: 0; top: 400">
		<table>
			<tr>
				<td><label>Your Score: </label></td>
				<td><input id="scoreDisplay" value="0"></input></td>
				<td><button value="RESET" onclick="reset()">RESET!</button></td>
			</tr>
		</table>
	</div>
</body>
</html>