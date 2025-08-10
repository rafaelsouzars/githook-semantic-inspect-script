# Githook Semantic Inspect Script v1.0.1

![Version](https://img.shields.io/badge/version-1.0.1-green) ![Status](https://img.shields.io/badge/status-completed-green) ![GitHub Release](https://img.shields.io/github/v/release/rafaelsouzars/githook-semantic-inspect-script) ![GitHub top language](https://img.shields.io/github/languages/top/rafaelsouzars/githook-semantic-inspect-script?color=green)

Este script de hook verifica a mensagem de log de commit. Chamado por "git commit" com um argumento, o nome do arquivo que contém a mensagem de commit. O hook deve sair com um status diferente de zero após emitir uma mensagem apropriada se desejar interromper o commit. O hook tem permissão para editar o arquivo de mensagem de commit.

Para habilitar este hook, renomeie este arquivo .sh para "commit-msg" (sem a extensão), copie e substitua o arquivo (de mesmo nome) na pasta .git/hooks que fica dentro da pasta do seu projeto.

```
my-project/
	.git/
		hooks/
			commit-msg
```
### Notas da versão
- Correção no nome do emoji ```sparkles```.

## 📷 Screenshots
<img width="1366" height="768" alt="githook_03" src="https://github.com/user-attachments/assets/d7008cd1-3aed-45df-8704-22c319ab3a7d" />

## 📖 Sobre commits semânticos
- Repositório do IuriCode [Commits Semânticos](https://github.com/iuricode/padroes-de-commits)
