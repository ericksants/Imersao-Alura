const amigoSecreto = {
    adicionar() {
        const nomeEl = document.getElementById('nome-amigo');
        const listaSecreta = document.getElementById('lista-amigos');
        var nome = nomeEl.value.trim();
        nome = nome.toUpperCase();
        
        if (nome == '') {
            alert('Por favor, insira um nome.');
            return;
        }

        if (listaSecreta.innerText.split(', ').includes(nome)) {
            alert('Esse nome já foi adicionado.');
            nomeEl.value = '';
            return;
        }
        
        if (listaSecreta.innerText == '') {
            listaSecreta.innerText = nome;
        }else {
            listaSecreta.innerText += ', ' + nome;
        }
        nomeEl.value = '';
    },
    
    sortear() {
        const nomes = document.getElementById('lista-amigos').innerText.split(', ');
        if (nomes.length < 4){
            alert('É necessário ter no mínimo 4 amigos para sortear.');
            return;
        }
        const nomesEmbaralhados = nomes.sort(() => Math.random() - 0.5);        
        amigoSecreto.associarAmigo(nomesEmbaralhados);
    },

    associarAmigo(nomesEmbaralhados) {
        const relacoes = [];
        for (let i = 0; i < nomesEmbaralhados.length; i++) {
            const amigo = nomesEmbaralhados[i];
            const amigoSorteado = nomesEmbaralhados[(i + 1) % nomesEmbaralhados.length];
            relacoes.push(`${amigo} -> ${amigoSorteado}`);

        }
        document.getElementById('lista-sorteio').innerText = relacoes.join('\n');
    },
    
    reiniciar() {
        document.getElementById('lista-amigos').innerText = '';
        document.getElementById('lista-sorteio').innerText = '';
    }
}
window.adicionar = amigoSecreto.adicionar.bind(amigoSecreto);
window.sortear = amigoSecreto.sortear.bind(amigoSecreto);
window.reiniciar = amigoSecreto.reiniciar.bind(amigoSecreto);