---
title: Resultados da Seletiva IME 2008
date: '2008-09-06 00:00:00'
layout: post
permalink: seletiva-2008
categories:
- seletiva
- contests
---

No último domingo, 17 de agosto, o IME realizou a 12a. Maratona de Programação, que funciona como seletiva de seus times para participar da Maratona de Programação da SBC. Neste ano tivemos a participação de 140 equipes de todo o país, dos quais 34 disputaram a competição no IME-USP e as restantes pela Internet.

A prova da seletiva foi elaborada pelo Wanderley Guimarães, coach dos times do IME-USP, e utilizamos o sistema Boca de autoria do Prof. Cassio Campos para gerenciar a competição.

O aquecimento da Seletiva de 2008 foi em outro dia, em uma prova maior que um aquecimento normal.

## Placar, estatísticas, problemas, etc. do aquecimento
- [Placar](https://www.ime.usp.br/~maratona/assets/seletivas/2008/warmup/score/score.html)
- [Prova](https://www.ime.usp.br/~maratona/assets/seletivas/2008/warmup/caderno.pdf)
- [Times inscritos](https://www.ime.usp.br/~maratona/assets/seletivas/2008/warmup/times.html)
- [Dados (placar, estatísticas)](https://www.ime.usp.br/~maratona/assets/seletivas/2008/warmup/data.tar.xz)
- [Entradas e saídas dos problemas](https://www.ime.usp.br/~maratona/assets/seletivas/2008/warmup/io.tar.xz)

No problema I (reunião) havia instâncias no set original em que o grafo de entrada era desconexo, o que não fazia sentido com a história do problema. Nos arquivos `in-apenas-conexos` e `out-apenas-conexos` foram geradas novas instâncias, todas conexas.

## Placar, estatísticas, problemas, etc. da prova principal
- [Placar](https://www.ime.usp.br/~maratona/assets/seletivas/2008/score/score.html)
- [Prova](https://www.ime.usp.br/~maratona/assets/seletivas/2008/caderno.pdf)
- [Times inscritos](https://www.ime.usp.br/~maratona/assets/seletivas/2008/times.pdf)
- [Entradas e saídas dos problemas](https://www.ime.usp.br/~maratona/assets/seletivas/2008/io.tar.xz)
- [Dados (estatísticas, submissões, etc)](https://www.ime.usp.br/~maratona/assets/seletivas/2008/data.tar.xz)

Classificaram-se para representar o IME-USP na Maratona de Programação da SBC os times formados pelos seguintes alunos:
- Breno Flesch Franco, Gabriel Ribeiro Da Cruz Peixoto, e Rafael Sato Suguiura;
- Atol Fortin de Oliveira, Lucas Piva Rocha Correa, e Cesar Gamboa Machado;
- Leonardo Marchetti, Bruno Yoiti Ozahata, e Pedro Luis Furio Raphael;
- Henrique Stagni, Igor dos Santos Montagner, e Filipe Manoel Xavier Resina;
- Marcos de Azevedo Iriarte, Felipe Torres, e Gregory De Bonis.

Devidos a problemas na prova, uma segunda prova foi realizada.

## Placar, estatísticas, problemas, etc. da segunda prova
- [Prova](https://www.ime.usp.br/~maratona/assets/seletivas/2008/prova2/caderno.pdf)
- [Entradas e saídas dos problemas](https://www.ime.usp.br/~maratona/assets/seletivas/2008/prova2/io.tar.xz)
- [Soluções dos juízes](https://www.ime.usp.br/~maratona/assets/seletivas/2008/prova2/solutions.tar.xz)

# Motivos
Mesmo depois de alguns dias após a prova da Seletiva do IME-USP, resolvemos deixar claro os problemas que aconteceram e atitudes tomadas. (Estes problemas não estão arrumados no pdf do caderno)

## O que aconteceu
- **Problema A** -- O grande vilão da prova. O arquivo de saída tinha 18mb, e com isso o diff demorava aproximadamente 5min para determinar se dois arquivos eram idênticos. Infelizmente, demoramos cerca de 1 hora para resolver o problema. Depois de diminuir a entrada (e a saída) tínhamos cerca de 200 submissões para corrigir.

- **Problema C** -- O limite no enunciado estava errado. O valor correto é N <= 6000 ao invés de 600.

- **Problema E** -- O enunciado não informava que a resposta devia ser impressa módulo 1300031. Além disso, esse problema foi deletado durante a prova, e com isso as submissões e clarifications também.

- **Problema F** -- A saída dos casos da folha estavam erradas.

- **Problema H** -- Arquivo de saída muito grande. Toda correção deste problema travava o servidor.

- **Problema I** -- O enunciado não deixou claro que os mapas são cercados por burracos. Durante a competição foram dados alguns clarifications contraditórios.

- **Problema K** -- A saída estava errada. Quando preparamos o arquivo de saída para colocar no BOCA, abrimos o arquivo em um editor que quebrou as linhas em 70 caracteres.

## O que fizemos
Alguns dias após a competição reunimos os alunos e escutamos todas as reclamações e sugestões. Decidimos que daríamos mais duas vagas para Regional, e para selecionar os times vamos fazer mais uma prova que acontecerá no próximo sábado dia 6 de setembro.

## Desculpas
Gostaríamos de mais uma vez pedir desculpa pelo ocorrido. Além disso, queremos firmar que essa prova serviu de lição em vários aspectos. Vamos no esforçar para manter uma seletiva de alto nível e uma prova cada vez melhor.

Esperamos que os treinadores, que usaram nossa prova como seletiva em suas universidades, continuem usando e quem sabe até ajudem no processo de desenvolvimento dos problemas.

Mais uma vez, obrigado pela participação!
