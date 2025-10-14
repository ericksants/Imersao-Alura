var  jogosAlugados = 0;
function contarEExibirJogosAlugados() {
    jogosAlugados = document.querySelectorAll('.dashboard__item__img--rented').length;
    console.log(`Total de jogos alugados: ${jogosAlugados}`);
}

function alterarStatus(val) {   
    var game = document.getElementById('game-' + val);
    var image = game.querySelector('.dashboard__item__img');
    var button = game.querySelector('.dashboard__item__button');
    var nameGame = game.querySelector('.dashboard__item__name');

    if(image.classList.contains('dashboard__item__img--rented')){
        confirm('Confirma a devolução do jogo ' + nameGame.textContent + '?');
        
        if(confirm){
            image.classList.remove('dashboard__item__img--rented');
            button.classList.remove('dashboard__item__button--return');
            button.textContent = 'Alugar';
            console.log(nameGame.textContent + ' Devolvido com sucesso!')
        
        }

    } else  {
        image.classList.add('dashboard__item__img--rented');
        button.classList.add('dashboard__item__button--return');
        button.textContent = 'Devolver';
    }
    contarEExibirJogosAlugados();
}

document.addEventListener('DOMContentLoaded', function() {
    contarEExibirJogosAlugados();
});