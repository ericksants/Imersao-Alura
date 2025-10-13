const amigoSecreto = {
    adicionar() {
        const nome = document.getElementById('nome-amigo');
        const listaSecreta = document.getElementById('lista-amigos');
        if (nome.value == '') {
            alert('Por favor, insira um nome.');
            return;
        }
        
        if (listaSecreta.innerText == '') {
            listaSecreta.innerText = nome.value;
        }else {
            listaSecreta.innerText += ', ' + nome.value;
        }
        nome.value = '';
    },
    
    sortear() {
        const nomes = document.getElementById('lista-amigos').innerText.split(', ');
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
        document.getElementById('lista-sorteio').innerText = relacoes.join(', ');
    },
    
    reiniciar() {
        document.getElementById('lista-amigos').innerText = '';
        document.getElementById('lista-sorteio').innerText = '';
    }
}
window.adicionar = amigoSecreto.adicionar.bind(amigoSecreto);
window.sortear = amigoSecreto.sortear.bind(amigoSecreto);
window.reiniciar = amigoSecreto.reiniciar.bind(amigoSecreto);