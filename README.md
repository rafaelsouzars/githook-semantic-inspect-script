# Githook Semantic Inspect Script

![Version](https://img.shields.io/badge/version-1.3.3-green) ![Status](https://img.shields.io/badge/status-completed-green) ![GitHub Release](https://img.shields.io/github/v/release/rafaelsouzars/githook-semantic-inspect-script) ![GitHub top language](https://img.shields.io/github/languages/top/rafaelsouzars/githook-semantic-inspect-script?color=green)

Este script de hook verifica a mensagem de log de commit. Chamado por "git commit" com um argumento, o nome do arquivo que contém a mensagem de commit. O hook deve sair com um status diferente de zero após emitir uma mensagem apropriada se desejar interromper o commit. O hook tem permissão para editar o arquivo de mensagem de commit.

Para habilitar este hook, renomeie este arquivo .sh para "commit-msg" (sem a extensão), copie e substitua o arquivo (de mesmo nome) na pasta .git/hooks que fica dentro da pasta do seu projeto.

```
my-project/
	.git/
		hooks/
			commit-msg
```
### Notas da versão
- Criação da variável de ambiente para controle de versão do script.
- Atualização do README.

## 📷 Screenshots
<img width="1366" height="768" alt="githook_07" src="https://github.com/user-attachments/assets/2b63d7e3-665b-46cb-a4a6-5745635cc8eb" />
<img width="1366" height="768" alt="githook_06" src="https://github.com/user-attachments/assets/94ad4e47-7330-482e-9bef-2183cd81e2b8" />

## 📖 Sobre commits semânticos
- Repositório do IuriCode [Commits Semânticos](https://github.com/iuricode/padroes-de-commits)
