function followover( $button){
	var followID = $button.val();
		
			if ($button.hasClass('following')) {
				$button.addClass('unfollow');
				$button.text('Unfollow');
				$button.unbind('mouseleave').bind('mouseleave', function() {
					$button.removeClass('unfollow');
					$button.text('Following');
				});
				$button.unbind('click').bind('click', function() {
					//빨간색 -> 흰색
					$button.removeClass('unfollow');
					$button.removeClass('following');
					$button.text('Follow');
					$.post('/memberFollowDelete/' +followID);
					$button.unbind('mouseleave').bind('mouseleave', function() {
						$button.text('Follow');
					});
				});
			} else{
				$button.unbind('mouseleave').bind('mouseleave', function() {
				});
				$button.unbind('click').bind('click', function() {
					$.post('/memberFollow/' +followID);
					$button.addClass('following');
					$button.text('Following');
				});
			}
}