// alert('Hello');
var one = 'hello';
console.log(one);
var item = document.getElementById('message').innerHTML = 'message';
// Обращаемся к элементу с id test (# обязательно)
$('#test').text(one);
$('#test').fadeOut('slow');
// Обращаемся к элементу с class myclass (. обязательно)
$('.myclass').text(one);

document.getElementsByClassName('myclass')[0].innerHTML = one + '!!!';
console.log(document.getElementsByClassName('myclass'));

// js
document.getElementsByClassName('myclass')[0].style.color = 'red';
// jQuery
$('#test').css('color', 'green');
$('#test').css('background-color', 'black');
array = [1, 2, 3, 4, 5];
array2 = new Array(1, 2, 3, 4);
array.reverse();
array = array.concat(6);
array.slice(1, -1);
array.push(10);
array.sort();
// ...
console.log(array);

for (var i = 0; i < array.length; i++) {
    console.log(array[i]);
}

array.forEach(function(element, index) {
    console.log(element);
});

array.forEach(function(element, index, array) {
    array[index] = array[index] + 5;
});
console.log(array);

// Плохой способ создания событий
var test = document.getElementById('event');
test.onclick = function() {
    alert('hello');
};

// Получше
var say = function() {
    alert('hello123');
}
test.addEventListener('click', say);
// test.removeEventListener('click', say);
test.addEventListener('contextmenu', say); // ПКМ
test.addEventListener('mouseover', say);
