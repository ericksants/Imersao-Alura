function sortear() {
    var quantidade = parseInt(document.getElementById('quantidade').value);
    var inicio = parseInt(document.getElementById('de').value);
    var fim = parseInt(document.getElementById('ate').value);
    
    if (inicio >= fim) {
        alert('Campo "Do número" deve ser inferior ao campo "Até o número". Verifique!');
        return;
    }
    if (quantidade > (fim - inicio + 1)) {
        alert('A quantidade de números a serem sorteados é maior que o intervalo disponível. Verifique!');
        return;
    }
    
    var numerosSorteados = [];
    var numero;
    
    for (var i = 0; i < quantidade; i++) {     
        var numero = obterNumeroAleatorio(inicio, fim);

        while (numerosSorteados.includes(numero)) {
            numero = obterNumeroAleatorio(inicio, fim);
        }
        numerosSorteados.push(numero);
    }
    var resultado = document.getElementById('resultado');
    resultado.innerHTML = '<label class="texto__paragrafo">Números sorteados: ' + numerosSorteados + '</label>';

    alterarStatusBotao();
}

function obterNumeroAleatorio(min, max) {
    return  Math.floor(Math.random() * (max - min + 1)) + min;
}

function alterarStatusBotao() {
    var botao = document.getElementById('btn-reiniciar');
    if(botao.classList.contains('container__botao-desabilitado')){
        botao.classList.remove('container__botao-desabilitado');
        botao.classList.add('container__botao');
    } else  {
        botao.classList.remove('container__botao');
        botao.classList.add('container__botao-desabilitado');
    }
}
function reiniciar() {
    document.getElementById('quantidade').value = '';
    document.getElementById('de').value = '';
    document.getElementById('ate').value = '';
    var resultado = document.getElementById('resultado');
    resultado.innerHTML = '<label class="texto__paragrafo">Números sorteados:  nenhum até agora</label>';
    alterarStatusBotao();
}

