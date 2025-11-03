# Imersão Alura - Desafios de Assincronismo em Dart

Este repositório contém os exercícios e desafios realizados durante a Imersão Alura de Dart.

## Aula 1 - Introdução ao Assincronismo

### Exercícios
1. Crie um Gist e adicione as receitas
   - você precisa criar um arquivo .json
   - conteudo disponivel em: assets\data\recipes.json
2. Instalando o pacote
   - você precisará instalar o pacote http no seu projeto Dart.
   - dart pub add http -> Adcionar o pacote HTTP.
3. Realizando a primeira requisição HTTP
   - Criar uma função chamada fetchRecipes.
   - função deverá utilizar o método get para fazer uma requisição HTTP para o GIST.
4. Lidando com a resposta da requisição
   - Utilize o objeto Response do pacote http para capturar a resposta da API.
   - A função deve esperar até que a resposta seja recebida antes de tentar acessar os dados. 
5. Exibindo os dados da resposta
    - Modifique a função fetchRecipes para imprimir no console.

## Aula 2 - Capturando a resposta e manipulando

### Exercícios
1. Buscando livros por autor em uma biblioteca digital
   - Crie uma unção que busque todos os livros de um determinado autor/a e exiba os títulos dos livros encontrados no console.
   - Conteudo disponivel em: assets\data\books.json
2. Filtrando receitas por ingredientes disponíveis
   - Crie uma unção que filtre as receitas que podem ser feitas com os ingredientes disponíveis.
   - Que deverão ser fornecidas por uma lista de String no parâmetro na função.
   - Exiba os nomes das receitas que podem ser preparadas com esses ingredientes.
   - Conteudo disponivel em: assets\data\recipesClass2.json
3. Organizando times de vôlei por nível de habilidade
   - Criar uma função que organize as pessoas jogadoras em times.
   - Distribua as pessoas em times, de forma que a quantidade de pessoas por time seja compatível com o que está definido em “rules”.
   - As pessoas que estão a mais rodadas esperando tenham prioridade na alocação. 
   - Exiba a composição dos times no console.
   - Conteudo disponivel em: assets\data\players.json
4. Agendando consultas para uma clínica veterinária
   - Crie uma função que filtre as consultas de um determinado veterinário e as organize por ordem de dia e horário e mostre na tela.
   - Conteudo disponivel em: assets\data\vet.json

## Como Diponibilizar o arquivos json usando o GIST do GuitHub
1.Acesse o site do GitHub Gist
   - Vá para: https://gist.github.com
2. Faça login na sua conta GitHub
   - Se ainda não estiver logado, clique em Sign in no canto superior direito.
3. Crie seu Gist
   - Você verá um formulário com os seguintes campos:
      - Descrição (opcional): Escreva um título ou explicação breve do que o Gist faz.
      - Nome do arquivo: Exemplo: organizar_times.dart
      - Conteúdo do arquivo: Cole ou escreva o código ou texto que deseja compartilhar.
4. Escolha a visibilidade
   - Public Gist: Qualquer pessoa pode ver.
   - Secret Gist: Só quem tiver o link pode ver (não aparece na busca pública).
5. Clique em "Create public gist" ou "Create secret gist"
   - Isso criará o Gist e você será redirecionado para a página dele.
6. Compartilhe ou edite
   - Você pode copiar o link para compartilhar.
   - Também pode clicar em Edit para modificar o conteúdo depois.

## Como Executar

1. Clone o repositório
2. Entre na pasta do projeto
3. Execute o comando:
```bash
dart run
```

## Tecnologias Utilizadas

- Dart
- Pacote HTTP
- dart:convert

## Autor

[Erick Abreu]

---
Desenvolvido durante a Imersão Alura 🚀
