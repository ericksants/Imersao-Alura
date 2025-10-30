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

## Autor

[Erick Abreu]

---
Desenvolvido durante a Imersão Alura 🚀
