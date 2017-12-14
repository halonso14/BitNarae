<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" href ="/resources/css/test_view.css">
<title>Insert title here</title>
</head>
<body>

    <!-- multistep form -->
<form id="msform">
	<!-- progressbar -->
	<ul id="progressbar">
		<li class="active" >Age</li> <!-- 1 -->
		<li>Gender</li> <!-- 2 -->
		<li>favorite1</li> <!-- 3 -->
		<li>favorite2</li> <!-- 4 -->
		<li>mediaAccess</li> <!-- 5 -->
		<li>travel_type1</li> <!-- 6 -->
	<!--	<li>travel_type2</li>  8 -->
		<li>travel_reason</li> <!-- 7 -->
		<li>travel_season</li> <!-- 8 -->
		<li>travel_time1</li> <!-- 9 -->
		<li>travel_time2</li> <!-- 10 -->
		<li>travel_budget</li> <!-- 11 -->
        <li>blog url</li> <!-- 12 -->
	</ul>
	<!-- fieldsets -->
	
    <fieldset>
        <h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> Age </h3>
		<div class="container">
            <input type="radio" id="q0" name="q0" value="1" checked="checked">
            <label for="q0">10~19</label>
            <input type="radio" name="q0" value="2"/><label for="q0" id="q02">20~29</label>
            <input type="radio" name="q0" value="3"/><label for="q0" id="q03">30~39</label>
            <input type="radio" name="q0" value="4"/><label for="q0" id="q04">40~50</label>
		</div>
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
	
	<fieldset>
        <h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> Gender </h3>
		<div class="container">
            <label for="q1"><input type="radio" id="q1" name="q1" value="1" checked="checked"/>female</label>
            <label for="q1"><input type="radio" name="q1" id="q1" value="2"/>male</label>
            <label for="q1" ><input type="radio" name="q1" id="q1" value="3"/>other</label>
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
    
    <fieldset>
        <h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> Favorite continents </h3>
		<div class="container">
            <label for="q2"><input type="radio" id="q2" name="q2" value="1" checked="checked"/>Africa</label>
            <label for="q2" id="q2"><input type="radio" name="q2" value="2"/>Asia</label>
            <label for="q2" id="q2"><input type="radio" name="q2" value="3"/>Austrailia(oseania)</label>
            <label for="q2" id="q2"><input type="radio" name="q2" value="4"/>Europe</label>
            <label for="q2" id="q2"><input type="radio" name="q2" value="5"/>North ameria</label>
            <label for="q2" id="q2"><input type="radio" name="q2" value="6"/>South ameria</label>
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
   
   <!-- must consider above (favorite1)question -->
   <!-- need better way to present a country list-->    
    <fieldset>
        <h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> Favorite countries </h3>
		<div class="container">
            <label for="q3"><input type="checkbox" id="q3" name="q30" value="1" checked="checked"/>Japan</label>
            <label for="q3" id="q3"><input type="checkbox" name="q31" value="2"/>Bali</label>
            <label for="q3" id="q3"><input type="checkbox" name="q32" value="3"/>France</label>
            <label for="q3" id="q3"><input type="checkbox" name="q33" value="4"/>USA</label>
            <label for="q3" id="q3"><input type="checkbox" name="q34" value="5"/>Canada</label>
            <label for="q3" id="q3"><input type="checkbox" name="q35" value="6"/>India</label>
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
   
    <fieldset>
        <h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> Media Access </h3>
        <div class="container">
            <label for="q4"><input type="radio" id="q4" name="q4" value="1" checked="checked"/>very often upload posts</label>
            <label for="q4" id="q4"><input type="radio" name="q4" value="2"/>usually watch other posts</label>
            <label for="q4" id="q4"><input type="radio" name="q4" value="3"/>rarely use it</label>
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
   
    <fieldset>
        <h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> Travel type1 </h3>
        <div class="container">
            <label for="q5"><input type="radio" id="q5" name="q5" value="1" checked="checked"/>usually travel alone</label>
            <label for="q5" id="q5"><input type="radio" name="q5" value="2"/>usually with friends or family</label>
            <label for="q5" id="q5"><input type="radio" name="q5" value="3"/>other</label>
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>

    <fieldset>
        <h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> Travel reason </h3>
        <div class="container">
            <label for="q6"><input type="radio" id="q6" name="q6" value="1" checked="checked"/>food</label>
            <label for="q6" id="q6"><input type="radio" name="q6" value="2"/>culture and famous place</label>
            <label for="q6" id="q6"><input type="radio" name="q6" value="3"/>nature, view</label>
            <label for="q6" id="q6">nature, sightseeing<input type="radio" name="q6" value="4"/>activity(sports)</label>
            <label for="q6" id="q6"><input type="radio" name="q6" value="5"/>shopping</label>
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
   
    <fieldset>
        <h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> Travel season </h3>
        <div class="container">
            <label for="q7"><input type="radio" id="q7" name="q7" value="1" checked="checked"/>summer, winter vacation, holidays</label>
            <label for="q7" id="q7"><input type="radio" name="q7" value="2"/>anytime</label>
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
   
    <fieldset>
        <h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> Travel time1 </h3>
        <div class="container">
            <label for="q8"><input type="radio" id="q8" name="q8" value="1" checked="checked"/>0~2</label>
            <label for="q8" id="q8"><input type="radio" name="q8" value="2"/>3~5</label>
            <label for="q8" id="q8"><input type="radio" name="q8" value="3"/>over 6</label>
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
    <fieldset>
        <h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> Travel time2 </h3>
        <div class="container">
            <label for="q9"><input type="radio" id="q9" name="q9" value="1" checked="checked"/>0~3 days</label>
            <label for="q9" id="q9"><input type="radio" name="q9" value="2"/>4~7 days</label>
            <label for="q9" id="q9"><input type="radio" name="q9" value="3"/>2~3weeks</label>
            <label for="q9" id="q9"><input type="radio" name="q9" value="4"/>1~3 months</label>
            <label for="q9" id="q9"><input type="radio" name="q9" value="5"/>over 3 months</label>
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
	<fieldset>
		<h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> Travel time2 </h3>
        <div class="container">
            <label for="q10"><input type="radio" id="q10" name="q10" value="1" checked="checked"/>flight days</label>
            <label for="q10" id="q10"><input type="radio" name="q10" value="2"/>hotel</label>
            <label for="q10" id="q10"><input type="radio" name="q10" value="3"/>shoppings</label>
            <label for="q10" id="q10"><input type="radio" name="q10" value="4"/>foods</label>
            <label for="q10" id="q10"><input type="radio" name="q10" value="5"/>activities</label>
		</div>
		<input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
	<fieldset>
		<h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> blog url </h3>
        <div class="container">
           <input type="text" id="q11" name="q11" placeholder="your blog url" />
		</div>
		<input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="submit" name="submit" class="submit action-button" value="Submit" />
	</fieldset>
</form>

   <!-- jQuery -->
    <!-- must open them later!!    -->
    <script src="http://thecodeplayer.com/uploads/js/jquery-1.9.1.min.js" type="text/javascript"></script>

    <!-- jQuery easing plugin -->
    <!--    -->
    <script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/resources/js/test_view_edit.js"></script>

</body>
</html>