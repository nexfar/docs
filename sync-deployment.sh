#!/bin/bash

# Script para sincronizar deployment/ de shared/ para os outros ambientes
# Uso: ./sync-deployment.sh

set -e

echo "🔄 Sincronizando deployment/ de shared/ para os outros ambientes..."

# Cores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Verificar se estamos na raiz do projeto
if [ ! -d "shared/deployment" ]; then
    echo "❌ Erro: Execute este script da raiz do projeto docs/"
    exit 1
fi

# Sincronizar para internal-docs
echo -e "${BLUE}📋 Copiando para internal-docs/deployment/...${NC}"
rm -rf internal-docs/deployment
cp -r shared/deployment internal-docs/
echo -e "${GREEN}✅ internal-docs/deployment/ atualizado${NC}"

# Sincronizar para integration-docs
echo -e "${BLUE}📋 Copiando para integration-docs/deployment/...${NC}"
rm -rf integration-docs/deployment
cp -r shared/deployment integration-docs/
echo -e "${GREEN}✅ integration-docs/deployment/ atualizado${NC}"

echo ""
echo -e "${GREEN}🎉 Sincronização completa!${NC}"
echo ""
echo "Próximos passos:"
echo "  git add ."
echo "  git commit -m \"Sincronizar deployment\""
echo "  git push"
