/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function Mychecked() {
    const checkedElement = document.getElementById("checked");
    if (checkedElement.style.left === '100%') {
        checkedElement.style.left = '0';
    } else {
        checkedElement.style.left = '100%';
    }
}