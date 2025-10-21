// N1
let number =parseInt(prompt("Insere um numero;"));

document.write("<h2>Multiplication table for :" + number + "</h2>");

for (let i=1; i<=10; i++){
    let result = number * i;
    document.write(number+ "x" +i + "=" +result + "<br>");
}
//N2
let height=parseInt(prompt("Qual a altura da arrvore que deseja ?"));
document.write("<h2> Text-Based Tree <h2>");
for(let i=1; i<= height;i++){
    let spaces="".repeat(height-i);
    let stars="*".repeat(2 * i-1);
    document.write(spaces+stars+"</br>");
}
//N3
let numero = parseInt(prompt("Enter a number:"));

if (numero % 2 === 0) {
  alert("The number is even.");
} else {
  alert("The number is odd.");
}

//N4
let operation = prompt("Choose an operation: +, -, *, /");

let num1 = parseFloat(prompt("Enter first number:"));
let num2 = parseFloat(prompt("Enter second number:"));

let result;

if (operation === "+") {
  result = num1 + num2;
} else if (operation === "-") {
  result = num1 - num2;
} else if (operation === "*") {
  result = num1 * num2;
} else if (operation === "/") {
  if (num2 !== 0) {
    result = num1 / num2;
  } else {
    alert("Error: Division by zero!");
  }
} else {
  alert("Invalid operation.");
}

if (result !== undefined) {
  alert("Result: " + result);
}

//N5
let seconds = parseInt(prompt("Enter time in seconds:"));

let timer = setInterval(function() {
  console.log(seconds);
  seconds--;

  if (seconds < 0) {
    clearInterval(timer);
    console.log("Time's up!");
  }
}, 1000);
