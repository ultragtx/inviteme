function TableTrClick(link) {
	document.location.href = link;
}

function TableTrHighlight(ele, highlight) {
	if (highlight) {
		ele.style.backgroundColor = '#f9f9f9';
	}
	else {
		ele.style.backgroundColor = "white";
	}
		
}