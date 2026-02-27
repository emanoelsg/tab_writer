# 🎼 TabWriter

**TabWriter** é um editor de tablaturas musicais de alta performance desenvolvido com **Flutter**.

---

## 🎯 Objetivo do Projeto

O foco principal do TabWriter é auxiliar músicos no desenvolvimento de tablaturas de violão diretamente pelo smartphone. Diferente de editores de texto convencionais, o app estrutura a música de forma lógica, tratando-a como uma sequência de compassos validados.

### 🌟 Diferenciais Técnicos

* **Lógica Baseada em Compassos**: Permite a edição granular de trechos da música, garantindo que alterações locais não corrompam a estrutura global da tablatura.
* **Persistência Relacional**: Gerenciamento robusto de dados através de um esquema SQL para Usuários, Tabs e Compassos.
* **Arquitetura Desacoplada**: Separação clara entre Domínio, Dados e UI, facilitando a escalabilidade, manutenção e implementação de testes unitários.
---

## 🛠️ Stack Tecnológica

### Core & Persistência
- **Flutter & Dart**: Desenvolvimento nativo cross-platform.
- **Drift (Moor)**: Biblioteca de persistência reativa com tipagem estática e suporte a SQL avançado.

### Gerenciador de Estado 
- **BLoC/Cubit**: Gerenciamento de estado.


---

## 🏗️ Estrutura de Arquitetura

O projeto segue o padrão **Clean Architecture**, mantendo as regras de negócio (Domain) isoladas de detalhes de implementação externa e frameworks.

### Organização de Diretórios
```text
lib/
├── app/
│   ├── core/           # Configurações globais, temas e esquemas do banco (.drift)
│   └── features/       # Divisão por contextos de negócio
│       └── tab/
│           ├── domain/ # Entidades, Validadores e Contratos (Interfaces)
│           ├── data/   # Models (DTOs), DataSources e Implementações de Repositórios
│           └── ui/     # Camada visual (Cubits, Páginas e Componentes)
```
# 🤖Em desenvolvimento...
