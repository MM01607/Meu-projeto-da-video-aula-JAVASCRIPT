// Mensagem personalizada
let nome = 'Miccoli';
let mensagem = ', por favor verifique o seu pedido';
let bemVindo = nome + mensagem;

// Sinal de saudação
let sinal = 'Olá';
let elSinalUsuario = document.getElementById('sinalUsuario');
elSinalUsuario.textContent = sinal;

// Número de caracteres do sinal
let telhas = sinal.length;
let elTelhas = document.getElementById('telhas');
elTelhas.textContent = telhas;

// Calcular subtotal
let subtotal = telhas * 5;
let elSubTotal = document.getElementById('subTotal');
elSubTotal.textContent = '$' + subtotal;

// Calcular envio (fixo, por exemplo $10)
let envio = 10;
let elEnvio = document.getElementById('envio');
elEnvio.textContent = '$' + envio;

// Calcular total geral
let totalGeral = subtotal + envio;
let elTotalGeral = document.getElementById('totalGeral');
elTotalGeral.textContent = '$' + totalGeral;

