# Nexfar Docs - Mono-Repo

Este repositório contém toda a documentação Nexfar organizada em uma estrutura de **mono-repo**, permitindo múltiplas documentações com diferentes níveis de acesso e públicos-alvo.

## Estrutura do Repositório

```
nexfar-docs/
├── shared/                           # Conteúdo compartilhado entre docs
│   └── deployment/                   # Documentação de implantação (fonte única)
│
├── public-docs/                      # docs.nexfar.com.br
│   ├── mint.json
│   └── index.mdx
│
├── internal-docs/                    # internal_docs.nexfar.com
│   ├── mint.json
│   ├── deployment -> ../shared/deployment/    # Symlink
│   └── ... (todo o conteúdo interno)
│
└── integration-docs/                 # int-docs.nexfar.com.br
    ├── mint.json
    ├── index.mdx
    └── deployment -> ../shared/deployment/    # Symlink
```

## Três Ambientes de Documentação

### 1. Public Docs (`docs.nexfar.com.br`)
**Público:** Usuários finais, clientes
**Config:** `public-docs/mint.json`

### 2. Internal Docs (`internal_docs.nexfar.com`)
**Público:** Equipe interna Nexfar
**Config:** `internal-docs/mint.json`
**Conteúdo:** TUDO (arquitetura, infraestrutura, deployment, etc.)

### 3. Integration Docs (`int-docs.nexfar.com.br`)
**Público:** Parceiros técnicos, integradores
**Config:** `integration-docs/mint.json`
**Conteúdo:** Apenas documentação de implantação/integração

## Configuração no Mintlify

Criar 3 projetos no [dashboard.mintlify.com](https://dashboard.mintlify.com):

1. **Nexfar Public Docs**
   - Root Directory: `public-docs/`
   - Custom Domain: `docs.nexfar.com.br`

2. **Nexfar Internal Docs**
   - Root Directory: `internal-docs/`
   - Custom Domain: `internal_docs.nexfar.com`

3. **Nexfar Integration Docs**
   - Root Directory: `integration-docs/`
   - Custom Domain: `int-docs.nexfar.com.br`

## Desenvolvimento Local

```bash
# Testar cada documentação
cd public-docs && mintlify dev
cd internal-docs && mintlify dev
cd integration-docs && mintlify dev
```

## Editando Conteúdo

### Conteúdo Compartilhado (Deployment)
```bash
# Edite em shared/deployment/
vim shared/deployment/data-extraction/views/produtos.mdx

# Automaticamente reflete em:
# - internal_docs.nexfar.com
# - int-docs.nexfar.com.br
```

### Conteúdo Específico
```bash
# Docs públicas
vim public-docs/index.mdx

# Docs internas
vim internal-docs/architecture.mdx

# Docs de integração
vim integration-docs/index.mdx
```

## Conteúdo Compartilhado (deployment/)

⚠️ **Nota:** Mintlify não segue symlinks corretamente. Por isso, a pasta `deployment/` é **copiada** de `shared/deployment/` para:
- `internal-docs/deployment/`
- `integration-docs/deployment/`

### Como Manter Sincronizado

Quando editar a documentação de deployment:

**Opção 1: Editar em shared/ e copiar**
```bash
# 1. Edite em shared/
vim shared/deployment/data-extraction/views/produtos.mdx

# 2. Copie para os outros ambientes
cp -r shared/deployment/* internal-docs/deployment/
cp -r shared/deployment/* integration-docs/deployment/

# 3. Commit
git add .
git commit -m "Atualizar documentação de deployment"
```

**Opção 2: Usar script de sync (recomendado)**
```bash
# Criar script sync-deployment.sh
./sync-deployment.sh
```

## CI/CD

Mintlify detecta mudanças automaticamente ao fazer push para `main` e rebuilda apenas as docs afetadas.

## Comandos Úteis

```bash
# Verificar symlinks
find . -type l -ls

# Validar mint.json
npx mintlify@latest validate public-docs/mint.json
npx mintlify@latest validate internal-docs/mint.json
npx mintlify@latest validate integration-docs/mint.json
```

## Suporte

- **Interno:** #docs no Slack
- **Externo:** suporte@nexfar.com.br

## Licença

Documentação proprietária da Nexfar.
