	const Toast1 = Swal.mixin({ 
		toast: true, position: 'bottom', 
		showConfirmButton: false, timer: 2600,
		timerProgressBar: true, 
		didOpen: (toast) => { toast.addEventListener('mouseenter', Swal.stopTimer) 
			toast.addEventListener('mouseleave', Swal.resumeTimer) } 
		})

$(function() {
	$('button[name=addCart]').click('a',function(e) {
		$.ajax({
			type:'GET',
	        async:false, //false가 기본값임 - 비동기
	        url:'http://localhost:8080/CRUVE/addCart',
	        dataType:'text',
	        data:{'ID':$(this).attr('id')},
	        success: function(data, textStatus) {
		    Toast1.fire({ icon: 'success',
		        title: '성공적으로 장바구니에 상품을 담아두었습니다!'})
	        },
	        error:function (data, textStatus) {
	            console.log('cartErr'+data);
	        }
	    })    //ajax
	})
})