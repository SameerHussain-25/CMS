$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});

document.querySelector('.custom-file-input').addEventListener('change', function(e) {
	var fileName = document.getElementById("customFile").files[0].name;
	var nextSibling = e.target.nextElementSibling
	nextSibling.innerText = fileName
});

		$(".alert-success").fadeTo(2000, 500).slideUp(500, function(){
		    $(".alert-success").slideUp(500);
		});
