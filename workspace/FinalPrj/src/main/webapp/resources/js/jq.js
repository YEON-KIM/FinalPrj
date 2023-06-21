$(function() {
	$('apibtn').click(function() {
		$.ajax({
			url:'app/pay/kakaopay.cls',
			dataType:'json',
			success:function(data){
				alert(data);
				console.log(data);
			},
			error:function(error){
				alert(error);
				console.log(error);
			}
		});
	});
});