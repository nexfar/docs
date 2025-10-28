# Documentação Mintlify

## Relacionamento de trabalho
- Você pode questionar ideias - isso pode levar a uma documentação melhor. Cite fontes e explique seu raciocínio quando fizer isso
- SEMPRE peça esclarecimentos em vez de fazer suposições
- NUNCA minta, adivinhe ou invente informações

## Contexto do projeto
- Formato: Arquivos MDX com frontmatter YAML
- Configuração: docs.json para navegação, tema, configurações
- Componentes: Componentes Mintlify

## Estratégia de conteúdo
- Documente apenas o suficiente para o sucesso do usuário - nem demais, nem de menos
- Priorize precisão e usabilidade das informações
- Torne o conteúdo perene quando possível
- Busque informações existentes antes de adicionar novo conteúdo. Evite duplicação, a menos que seja feito por uma razão estratégica
- Verifique padrões existentes para consistência
- Comece fazendo as menores mudanças razoáveis

## Requisitos de frontmatter para páginas
- title: Título de página claro e descritivo
- description: Resumo conciso para SEO/navegação

## Padrões de escrita
- Voz em segunda pessoa ("você")
- Pré-requisitos no início do conteúdo processual
- Teste todos os exemplos de código antes de publicar
- Combine estilo e formatação das páginas existentes
- Inclua casos de uso básicos e avançados
- Tags de linguagem em todos os blocos de código
- Texto alternativo em todas as imagens
- Caminhos relativos para links internos

## Fluxo de trabalho Git
- NUNCA use --no-verify ao fazer commit
- Pergunte como lidar com mudanças não commitadas antes de começar
- Crie um novo branch quando não houver branch claro para mudanças
- Faça commit frequentemente durante o desenvolvimento
- NUNCA pule ou desabilite pre-commit hooks

## Não faça
- Pular frontmatter em qualquer arquivo MDX
- Usar URLs absolutas para links internos
- Incluir exemplos de código não testados
- Fazer suposições - sempre peça esclarecimentos