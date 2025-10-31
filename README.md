# Nexfar Docs

Este repositório contém toda a documentação Nexfar organizada em um **único projeto Mintlify** com múltiplas seções acessíveis via tabs e paths.

## Estrutura do Repositório

```
nexfar-docs/
├── mint.json                     # Configuração consolidada
├── index.mdx                     # Homepage pública (docs.nexfar.com.br)
├── favicon.svg
│
├── dev/                          # docs.nexfar.com.br/dev (Developer Docs)
│   ├── index.mdx
│   ├── quickstart.mdx
│   ├── development.mdx
│   ├── infrastructure.mdx
│   ├── essentials/               # Guias de personalização e conteúdo
│   ├── ai-tools/                 # Cursor, Claude Code, Windsurf
│   ├── api-reference/            # Documentação de API
│   ├── deployment/               # Métodos de implantação e VIEWs
│   └── snippets/
│
└── integration/                  # docs.nexfar.com.br/integration
    ├── index.mdx                 # Homepage para integradores
    └── deployment/               # Documentação de implantação (cópia)
```

## Três Seções de Documentação

### 1. Public Root (`docs.nexfar.com.br`)
**Público:** Usuários finais, clientes
**Path:** `/`
**Conteúdo:** Homepage simples com introdução

### 2. Developer Docs (`docs.nexfar.com.br/dev`)
**Público:** Equipe interna Nexfar
**Path:** `/dev`
**Conteúdo:** TUDO (arquitetura, infraestrutura, deployment, API, etc.)
**Tab:** "Developer Docs"

### 3. Integration Docs (`docs.nexfar.com.br/integration`)
**Público:** Parceiros técnicos, integradores
**Path:** `/integration`
**Conteúdo:** Apenas documentação de implantação/integração
**Tab:** "Documentação de Integração"

## Configuração no Mintlify

Criar **1 único projeto** no [dashboard.mintlify.com](https://dashboard.mintlify.com):

- **Project Name:** Nexfar Documentation
- **Root Directory:** `/` (raiz do repositório)
- **Custom Domain:** `docs.nexfar.com.br`

As URLs serão automaticamente:
- `docs.nexfar.com.br` → Homepage pública
- `docs.nexfar.com.br/dev` → Developer Docs (internal)
- `docs.nexfar.com.br/integration` → Integration Docs

## Desenvolvimento Local

```bash
# Na raiz do repositório
mintlify dev

# As tabs estarão disponíveis:
# http://localhost:3000          → Public homepage
# http://localhost:3000/dev      → Developer Docs
# http://localhost:3000/integration → Integration Docs
```

## Editando Conteúdo

### Documentação Pública
```bash
vim index.mdx
```

### Developer Docs (Internal)
```bash
vim dev/index.mdx
vim dev/infrastructure.mdx
vim dev/deployment/overview.mdx
```

### Integration Docs
```bash
vim integration/index.mdx
vim integration/deployment/data-extraction/database-views.mdx
```

## Conteúdo de Deployment Duplicado

⚠️ **Nota Importante:** O conteúdo de deployment (`deployment/`) existe em **dois lugares**:
- `dev/deployment/` - Para equipe interna
- `integration/deployment/` - Para parceiros técnicos

### Como Manter Sincronizado

Quando editar a documentação de deployment, você precisa atualizar **ambas as cópias**.

**Opção 1: Editar e copiar manualmente**
```bash
# 1. Edite em dev/deployment/
vim dev/deployment/data-extraction/views/produtos.mdx

# 2. Copie para integration/
cp -r dev/deployment/* integration/deployment/

# 3. Commit
git add .
git commit -m "Atualizar documentação de deployment"
```

**Opção 2: Criar script de sync**
```bash
#!/bin/bash
# sync-deployment.sh
rsync -av --delete dev/deployment/ integration/deployment/
echo "✓ Deployment docs synchronized"
```

**Opção 3: Editar ambos ao mesmo tempo (usando multi-cursor)**
```bash
# Use um editor que suporte edição em múltiplos arquivos
# ou faça substituições com sed/awk quando apropriado
```

### Por Que Duplicar?

A duplicação permite:
1. Cada seção funciona independentemente
2. Paths internos corretos (`/dev/deployment/...` vs `/integration/deployment/...`)
3. Customização futura específica por audiência (se necessário)

## Estrutura do mint.json

```json
{
  "navigation": [...],        // Root navigation (public homepage)
  "tabs": [
    {
      "name": "Developer Docs",
      "url": "dev",           // Creates /dev path
      "navigation": [...]
    },
    {
      "name": "Documentação de Integração",
      "url": "integration",   // Creates /integration path
      "navigation": [...]
    }
  ]
}
```

## Links Internos

Ao criar links entre páginas, use paths absolutos baseados na seção:

**Em páginas do dev/:**
```markdown
[Ver VIEWs](/dev/deployment/data-extraction/database-views)
```

**Em páginas do integration/:**
```markdown
[Ver VIEWs](/integration/deployment/data-extraction/database-views)
```

**Da homepage pública:**
```markdown
[Developer Docs](/dev)
[Integration Docs](/integration)
```

## CI/CD

Mintlify detecta mudanças automaticamente ao fazer push para `main` e rebuilda o site completo.

## Comandos Úteis

```bash
# Validar mint.json
npx mintlify@latest validate mint.json

# Iniciar dev server
mintlify dev

# Verificar links quebrados
grep -r "](/deployment/" dev/ integration/
```

## Developer Docs ("Hidden")

As páginas em `/dev` são consideradas "internas" mas não são tecnicamente protegidas por senha. Se você precisa:

1. **Ocultar da navegação pública:** ✅ Já feito - o tab "Developer Docs" está visível mas o conteúdo é "semi-privado"
2. **Proteção real com senha:** Requer Mintlify Enterprise com SSO

Na versão gratuita, o conteúdo `/dev` é:
- Visível para quem conhece a URL
- Não indexado pelo Google (use `robots.txt` ou meta tags se necessário)
- Separado visualmente da documentação pública

## Suporte

- **Interno:** #docs no Slack
- **Externo:** suporte@nexfar.com.br

## Licença

Documentação proprietária da Nexfar.
