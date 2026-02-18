#!/bin/sh
# 
# ==================== GitHook Semantic Inspect Script v1.1.3 ====================
# AUTHOR: rafaelsouzars
# Date: 10/08/2025
# Github: https://github.com/rafaelsouzars
#
# Este script de hook verifica a mensagem de log de commit.
# Chamado por "git commit" com um argumento, o nome do arquivo
# que contém a mensagem de commit. O hook deve sair com um status
# diferente de zero após emitir uma mensagem apropriada se desejar interromper o
# commit. O hook tem permissão para editar o arquivo de mensagem de commit.
#
# Para habilitar este hook, renomeie este arquivo .sh para "commit-msg" (sem a extensão),
# copie e substitua o arquivo (de mesmo nome) na pasta .git/hooks que fica dentro da pasta do
# seu projeto.

# Variáveis com os códicos de escape ASCII referentes as cores do foreground
BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;93m"
BLUE="\033[0;34m"
WHITE="\033[1;37m"
DEFAULT="\033[0m"

# Variáveis com os códicos de escape ASCII referentes as cores do background
BK_BLACK="\033[40m"
BK_RED="\033[41m"
BK_GREEN="\033[42m"
BK_YELLOW="\033[103m"
BK_BLUE="\033[44m"
BK_DEFAULT="\033[0m"

# Variável com o arquivo da menssagem do commit (provided by Git).
COMMIT_MSG_FILE=$1

# Lê a mensagem do commit que esta no arquivo.
COMMIT_MSG=$(cat "$COMMIT_MSG_FILE")

# Expressão regular de padronização das mensagens do commit
COMMIT_REGEX='^(:(tada|sparkles|bug|lipstick|wrench|truck|bricks|bulb|books|ok_hand|recycle|broom|boom|zap|package|rocket|white_check_mark|heavy_plus_sign|heavy_minus_sign|card_file_box|test_tube|iphone|pencil|label|lock|mag|goal_net|construction|wheelchair|dizzy|arrow_up|arrow_down|wastedbasket):\s)?(build|ci|docs|feat|fix|perf|refactor|style|test|chore|revert|wip|release|hotfix|rollback|raw|cleanup|remove|init)(\([a-zA-Z0-9_.-]+\))?(!)?: .+$'
#TYPE_COMMIT_REGEX=''

# Testa a mensagem do commit com o PATTERN REGEX
if [ "$(egrep -e "$COMMIT_REGEX" "$COMMIT_MSG_FILE")" ]; then
	echo >&2
	echo >&2 -e "${WHITE}${BK_BLUE}[==================== GitHook Semantic Inspect Script v1.1.2 ====================]${DEFAULT}"
	echo >&2 -e "${BK_GREEN}SUCCESS: O commit foi realizado com sucesso.${DEFAULT}"
	echo >&2
	echo >&2 -e "${GREEN}(OK) COMMIT => ${BLACK}${BK_GREEN}'${COMMIT_MSG}'${DEFAULT}"
	echo
	echo >&2 -e "${BK_BLUE}Programmer: https://github.com/rafaelsouzars${DEFAULT}"
	echo >&2 -e "${WHITE}${BK_BLUE}[==================== GitHook Semantic Inspect Script v1.1.2 ====================]${DEFAULT}"	
	echo >&2 -e "${GREEN}[=== FINISHED ===]${DEFAULT}"
	exit 0	
else
	echo >&2 -e "${WHITE}${BK_RED}[==================== GitHook Semantic Inspect Script v1.1.2 ====================]${DEFAULT}"
	echo >&2 -e "${BLACK}${BK_RED}ERRO: A mensagem de commit não segue o formato do conventional Commits.${DEFAULT}"
	echo >&2
	echo >&2 -e "${RED}(!) COMMIT => ${BLACK}${BK_RED}'${COMMIT_MSG}'${DEFAULT}"
	echo >&2
	echo >&2 -e "${BLACK}${BK_YELLOW}O formato correto da mensagem de commit é obrigatório:${DEFAULT}"
	echo >&2 -e "  <:emoji opcional:> <tipo>(<escopo opcional>): <descrição>"
	echo >&2
	echo >&2 -e "${BK_GREEN}Os tipos válidos são:${DEFAULT}"
	echo >&2 -e "${GREEN}  feat:${DEFAULT}     Uma nova funcionalidade."
	echo >&2 -e "${GREEN}  fix:${DEFAULT}      Correção de um bug."
	echo >&2 -e "${GREEN}  docs:${DEFAULT}     Alterações na documentação."
	echo >&2 -e "${GREEN}  style:${DEFAULT}    Alterações de estilo de código (formatação, ponto-e-vírgula ausente, etc.)."
	echo >&2 -e "${GREEN}  refactor:${DEFAULT} Refatoração de código (nem corrige bug nem adiciona funcionalidade)."
	echo >&2 -e "${GREEN}  test:${DEFAULT}     Adicionar ou atualizar testes."
	echo >&2 -e "${GREEN}  chore:${DEFAULT}    Tarefas rotineiras como atualização de dependências ou ferramentas de build."
	echo >&2 -e "${GREEN}  build:${DEFAULT}    Alterações que afetam o sistema de build ou dependências externas."
	echo >&2 -e "${GREEN}  ci:${DEFAULT}       Alterações nos arquivos de configuração de CI ou scripts."
	echo >&2 -e "${GREEN}  perf:${DEFAULT}     Melhorias de desempenho."
	echo >&2 -e "${GREEN}  revert:${DEFAULT}   Reverter um commit anterior."
	echo >&2
	echo >&2 -e "${BK_GREEN}Emojis:${DEFAULT}"
	echo >&2 -e "${GREEN}tada|sparklers|bug|lipstick|wrench|truck|bricks|bulb|books|ok_hand|recycler|broom|boom|zap"
	echo >&2 -e "package|rocket|white_check_mark|heavy_plus_sign|heavy_minus_sign|card_file_box|test_tube"
	echo >&2 -e "iphone|pencil|label|lock|mag|goal_net|construction|wheelchair|dizzy|arrow_up|arrow_down|wastedbasket${DEFAULT}"
	echo >&2
	echo >&2 -e "Exemplos:"
	echo >&2 -e "  :tada: feat: Primeira feature"
	echo >&2 -e "  feat(auth): adicionar funcionalidade de login"
	echo >&2 -e "  fix(api)!: resolver problema de timeout"
	echo >&2 -e "  docs(readme): atualizar instruções de instalação"
	echo
	echo >&2 -e "${BK_RED}Programmer: https://github.com/rafaelsouzars${DEFAULT}"
	echo >&2 -e "${WHITE}${BK_RED}[==================== GitHook Semantic Inspect Script v1.1.2 ====================]${DEFAULT}"
	echo >&2
	exit 1
fi