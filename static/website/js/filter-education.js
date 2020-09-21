function filterEducation() {

    let selected = document.getElementById("education").value;
    let bachelor = document.getElementById("bachelor");

    if(selected === 'Bachelor’s Degree'){
        bachelor.style.display = "";
    }else {
        bachelor.style.display = "none";
    }

}