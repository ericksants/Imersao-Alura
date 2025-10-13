const carrinho = {
    adicionar: function() {
        const produto = document.getElementById('produto').value;
        const nomeProduto = produto.split('-')[0];
        const valorProduto = produto.split('R$')[1];
        const quantidade = document.getElementById('quantidade').value;
        const subTotal = document.getElementById('valor-total').innerText;
        const somaSubTotal = subTotal.split(/\D+/).join('');

        const valorProdutoXquantidade = this.valorPorQuantidade(valorProduto, quantidade);
        const novoSoma = Number(somaSubTotal) + Number(valorProduto) * Number(quantidade);

        this.imprimeNaTela(quantidade, nomeProduto, valorProdutoXquantidade, novoSoma);
        document.getElementById('quantidade').value = '';
    },

    valorPorQuantidade: function(valorProduto, quantidade) {
        return valorProduto * quantidade;
    },

    limpar: function() {
        document.getElementById('lista-produtos').innerHTML = '';
        document.getElementById('valor-total').innerText = 'R$0';
    },

    imprimeNaTela: function(quantidade, nomeProduto, valorProdutoXquantidade, somaSubTotal) {
        const carrinhoEl = document.getElementById('lista-produtos');
        carrinhoEl.innerHTML += '<section class="carrinho__produtos__produto"><span class="texto-azul"> '+ quantidade + 'x </span>' + nomeProduto + '<span class="texto-azul"> R$'+ valorProdutoXquantidade + '</span></section>';
        document.getElementById('valor-total').innerText = 'R$' + somaSubTotal;
    }
};

// bindings globais para compatibilidade com código/HTML existente
window.adicionar = carrinho.adicionar.bind(carrinho);
window.valorPorQuantidade = carrinho.valorPorQuantidade.bind(carrinho);
window.limpar = carrinho.limpar.bind(carrinho);
window.imprimeNaTela = carrinho.imprimeNaTela.bind(carrinho);