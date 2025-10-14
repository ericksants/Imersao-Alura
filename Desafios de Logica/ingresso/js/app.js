const ingresso = {
    comprar: function () {
        const tipoIngresso = document.getElementById('tipo-ingresso').value;
        const quantidade = parseInt(document.getElementById('qtd').value);

        const pista = parseInt(document.getElementById('qtd-pista').innerText);
        const cadeiraSuperior = parseInt(document.getElementById('qtd-superior').innerText);
        const cadeiraInferior = parseInt(document.getElementById('qtd-inferior').innerText);

        if (tipoIngresso === 'pista' && pista >= quantidade) {
            document.getElementById('qtd-pista').innerText = pista - quantidade;
            ingresso.imprimirNaTela();
        } else if (tipoIngresso === 'superior' && cadeiraSuperior >= quantidade) {
            document.getElementById('qtd-superior').innerText = cadeiraSuperior - quantidade;
            ingresso.imprimirNaTela();
        } else if (tipoIngresso === 'inferior' && cadeiraInferior >= quantidade) {
            document.getElementById('qtd-inferior').innerText = cadeiraInferior - quantidade;
            ingresso.imprimirNaTela();
        } else {
            alert('Quantidade indisponível');
        }
    },

    imprimirNaTela: function() {
        alert('Compra realizada com sucesso!');        
    }
}

window.comprar = ingresso.comprar.bind(ingresso);