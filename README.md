# SkyHorizon Airlines — Sistema de Emissão de Passagens

Trabalho da **Avaliação Formativa I** — Programação para Dispositivos Móveis
Universidade Municipal de São Caetano do Sul (USCS)
Prof. Ms. Raphael Lopes de Souza

## Sobre

Modelo orientado a objetos em Dart (com Null-Safety habilitado) para o sistema
de emissão de passagens da companhia fictícia **SkyHorizon Airlines**,
implementado de forma incremental nos 10 exercícios propostos e consolidado
no arquivo único [`main.dart`](main.dart).

## Exercícios cobertos

| # | Tópico | Onde está |
|---|--------|-----------|
| 1 | Abstração — classes `Passageiro`, `PlataformaVenda`, `Atendente` | topo do arquivo |
| 2 | Agregação e Construtor Não Nomeado (`Passagem()`) | classe `Passagem` |
| 3 | Construtores nomeados `somenteCodigo` e `completa` | classe `Passagem` |
| 4 | Parâmetros nomeados: `codigoEPassageiro` e `all` | classe `Passagem` |
| 5 | Encapsulamento tradicional (`getCodigoLocalizador`/`setCodigoLocalizador`) | classe `Passagem` |
| 6 | Getters/setters nativos (`get`/`set codigoLocalizador`) | classe `Passagem` |
| 7 | Métodos de negócio (`EmitirPassagem`, `CancelarPassagem`, `AtualizarPassagem`, `ConsultarPassagem`) | classe `Passagem` |
| 8 | Herança — `PassagemPrimeiraClasse extends Passagem` | fim do arquivo |
| 9 | Mixins `Logger` e `Auditoria` aplicados com `with` | fim do arquivo |
| 10 | Sobrescrita polimórfica (`@override`) e `main()` de demonstração | fim do arquivo |

## Como executar

Com o [Dart SDK](https://dart.dev/get-dart) instalado:

```bash
dart run main.dart
```

Ou cole o conteúdo de `main.dart` no [DartPad](https://dartpad.dev) e clique em Run.

## Autor

Trabalho desenvolvido individualmente para a disciplina de Programação para
Dispositivos Móveis (USCS).
