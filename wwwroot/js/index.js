var img = [];
var int = 2;
function loading() {
    for (let i = 1; i <= 4; i++) {
        img[i] = "./images/banner" + i + ".png";
    }
    var anh = document.getElementById("slidershow")
    anh.src = img[1];
    setInterval(sau, 3000);
}
function truoc() {
    var anh = document.getElementById("slidershow")
    anh.src = img[int];
    document.querySelector(".text").innerHTML = int + " / 4";
    if (int == 1) {
        int = img.length;
    }
    int--
    console.log(int)
}
function sau() {
    var anh = document.getElementById("slidershow");
    if (int == img.length) {
        int = 1;
    }
    anh.src = img[int];
    document.querySelector(".text").innerHTML = int + " / 4";
    int++

}

function bam(so) {
    int = so;
    var anh = document.getElementById("slidershow");
    document.querySelector(".text").innerHTML = so + " / 4";
    anh.src = img[so];
}