function Mychecked () {
    if (document.getElementById("checked").style.left == '100%') {
       document.getElementById("checked").style.left = '0';
    }else {
        document.getElementById("checked").style.left = '100%';
    }
}