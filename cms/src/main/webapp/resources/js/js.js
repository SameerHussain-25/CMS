$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});

document.querySelector('.custom-file-input').addEventListener('change', function(e) {
	var fileName = document.getElementById("customFile").files[0].name;
	var nextSibling = e.target.nextElementSibling
	nextSibling.innerText = fileName
});

