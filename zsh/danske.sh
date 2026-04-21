# Cewrts
export NODE_EXTRA_CA_CERTS="/usr/local/share/ca-certificates/danske-bank.crt"
export REQUESTS_CA_BUNDLE="/usr/local/share/ca-certificates/danske-bank.crt"
export SSL_CERT_FILE="/usr/local/share/ca-certificates/danske-bank.crt"
export SSL_CERT_DIR="/usr/local/share/ca-certificates"

# Npm
export NPM_CONFIG_REGISTRY="https://artifactory.danskenet.net/artifactory/api/npm/joined-npm-build/"

# AWS
export AWS_PROFILE="default"
export AWS_REGION="eu-central-1"
export AWS_DEFAULT_REGION="eu-central-1"
# DBCLI
export DBCLI_USER="BH7219"

export JIRA_URL="https://jira.danskebank.com"
export CONFLUENCE_URL="https://confluence.danskenet.net"

# Claude
export PROMPT_COMMAND="history -a"
export CLAUDE_CODE_USE_BEDROCK="1"
export ANTHROPIC_MODEL="eu.anthropic.claude-opus-4-6-v1[1m]"
