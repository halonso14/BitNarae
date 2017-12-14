//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches
var data =[];
var count = 0;

$().ready(function(){
    
    var user_id = /*window.location.protocol + "//" + window.location.host + "/" +*/ (window.location.pathname).split('/')[1];
        
    $.get("http://127.0.0.1:8000/research/0"/*+user_id*/, function(data){
        console.log(data);
    });
    
});

$("#progressbar li").click(function(){
    console.log('index:'+$(this).index()); //ok
    console.log('count:'+count); //ok
    var index = $(this).index();
    var i= count;
	current_fs = $($(".next").get(count)).parent();
    next_fs = $($(".next").get(index)).parent();
    if(index==11 || count==11){
        if(count==0)
            current_fs = $($(".next").get(count)).parent();
        else
            current_fs = $($(".previous").get(count-1)).parent();
        
        next_fs = $($(".previous").get(index-1)).parent();
        console.log(current_fs);
        console.log(next_fs);
        
    }
    //console.log(current_fs);
    next_fs.show();
    current_fs.hide();
    
    if(0>(index-count)){
        
        var i= count;
        while(i> index){
            $("#progressbar li").eq(i).removeClass("active");
            i--;
        }
        
    }else if(0<(index-count)){
        var i= count;
        while(i<= index){
            $("#progressbar li").eq(i).addClass("active");
            i++;
        }
    }
    count=index;
});

$(".next").click(function(){
    console.log('check');
	if(animating) return false;
	animating = true;
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
    console.log(count);
    // add data to data object
    var val;
    if(count==3){//  checkbox
        checklist=[];
        for(var i=0 ; i<6; i++){
            if($(':input:checkbox[name="q'+count+i+'"]').is(":checked")){
                checklist.push( $(':input:checkbox[name="q'+count+i+'"]').val());
            }
        }
        
        val=checklist;
        
    }else{
        val = $(':input:radio[name="q'+count+'"]:checked').val();
    }
        
    data[count]= val;
    console.log(JSON.stringify(data));
    count++;
    
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'transform': 'scale('+scale+')'});
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});//animate
    
    
});

$(".previous").click(function(){
    
    
    // add data to data object
    var val;
    if(count==3){//  checkbox
        checklist=[];
        for(var i=0 ; i<6; i++){
            if($(':input:checkbox[name="q'+count+i+'"]').is(":checked")){
                checklist.push( $(':input:checkbox[name="q'+count+i+'"]').val());
            }
        }
        
        val=checklist;
    }else if(count==11){//  blog url. textarea
         val= $("#q"+count).val();
        console.log(val);
    
    }else{
        val = $(':input:radio[name="q'+count+'"]:checked').val();
    }
        
    data[count]= val;
    console.log(JSON.stringify(data));
    count--;
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".submit").click(function(){
    //last question data
    if(count==11){//  blog url. textarea
         //val= $(':input:text[name="q'+count+'"]').val();
        val= $("#q"+count).val();
        console.log(val);
        data[count]= val;
    }

    console.log(JSON.stringify(data));
    alert(JSON.stringify(data));
    /*
    $.ajax({
        url: "http://127.0.0.1:8000/research/22/insert",
        method:"POST",
        data: JSON.stringify({user_id:"22", age:"4", gender:"4"}),
        dataType: 'text/plain',
        crossDomain: true,
        success: function(){
            console.log("success");
        },
        error:function(){
            console.log("fail..");
        },
        }).done(function() {
            $( this ).addClass( "done" );
            alert("done")
        });
	return false;
    */
    
});