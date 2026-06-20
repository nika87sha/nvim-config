# 🚀 Neovim DevOps/Sysadmin Configuration

Configuración optimizada de Neovim para DevOps, SysAdmins e Ingenieros de Infraestructura.

## ✨ Características

### 🔧 DevOps-Ready Tools
- **Docker**: Soporte completo con snippets y LSP
- **Kubernetes**: Manifests con validación YAML
- **Terraform**: HCL language server y snippets
- **Ansible**: Playbook snippets y templates
- **Git**: DiffView avanzado, LazyGit integrado

### ⚡ Terminal Integrada
- **toggleterm.nvim**: Terminal flotante/horizontal/vertical
  - `<C-\>` - Toggle terminal (default)
  - `<leader>tb` - Bash REPL
  - `<leader>tp` - Python REPL
  - `<leader>tn` - Node REPL

### 📁 Búsqueda y Navegación
- **Telescope**: Búsqueda avanzada con dropdown theme
  - `<leader>ff` - Find files
  - `<leader><space>` - Smart picker
  - `<leader>sg` - Live grep
  - `<leader>sw` - Search word under cursor
  - `<leader>fc` - Find config files
  - `<leader>fd` - Find Docker files
  - `<leader>fk` - Find Kubernetes files
  - `<leader>ft` - Find Terraform files

### 📊 Diagnostics y LSP
- **Trouble.nvim**: Panel de diagnósticos integrado
  - `<leader>xx` - Toggle trouble
  - `<leader>xw` - Workspace diagnostics
  - `<leader>xd` - Document diagnostics
  - `<leader>xq` - Quickfix list
  - `gR` - LSP references

### 🎨 Edición y Formateo
- **conform.nvim**: Formateo automático
  - Soporta: Lua, Python, JS/TS, JSON, YAML, Bash, Terraform, HCL, Markdown
  - `<leader>lf` - Format file

### 📝 Snippets DevOps

#### Docker
```
dockerfile       - Basic Dockerfile
dockerfile_multi - Multi-stage Dockerfile
dockerfile_py    - Python Dockerfile
docker_compose   - Docker Compose
run              - RUN instruction
env              - ENV variables
```

#### Kubernetes
```
deployment  - Kubernetes Deployment
service     - Service
configmap   - ConfigMap
secret      - Secret
pvc         - PersistentVolumeClaim
ingress     - Ingress
statefulset - StatefulSet
```

#### Terraform
```
provider_aws - AWS Provider
ec2          - EC2 Instance
vpc          - VPC
subnet       - Subnet
sg           - Security Group
rds          - RDS Database
variable     - Variable block
output       - Output block
```

#### Ansible
```
playbook  - Basic playbook
task      - Task definition
handler   - Handler
apt       - Apt module
yum       - Yum module
service   - Service module
systemd   - Systemd module
file      - File module
copy      - Copy module
template  - Template module
shell     - Shell command
command   - Command module
register  - Register output
debug     - Debug output
loop      - Loop
when      - Conditional
```

## 🗂️ Estructura de Directorios

```
~/.config/nvim2k/
├── init.lua                           # Archivo principal
├── lazy-lock.json                     # Lock de plugins
├── .editorconfig                      # Configuración de edición
├── lua/
│   ├── config/
│   │   ├── mapping.lua               # Keybindings básicos
│   │   ├── mapping_devops.lua        # Keybindings DevOps
│   │   ├── options.lua               # Opciones de Neovim
│   │   ├── theme.lua                 # Tema
│   │   ├── session.lua               # Sesiones
│   │   └── autocmd.lua               # Autocmds
│   ├── lsp/
│   │   ├── python.lua                # Python LSP
│   │   ├── bash.lua                  # Bash LSP
│   │   ├── yaml_docker.lua           # YAML/Docker LSP
│   │   ├── docker.lua                # Docker LSP avanzado
│   │   └── terraform.lua             # Terraform LSP
│   ├── snippets/
│   │   ├── docker.lua                # Docker snippets
│   │   ├── kubernetes.lua            # K8s snippets
│   │   ├── terraform.lua             # Terraform snippets
│   │   └── ansible.lua               # Ansible snippets
│   ├── plugins/
│   │   ├── telescope.lua             # Fuzzy finder
│   │   ├── toggleterm.lua            # Terminal integrada
│   │   ├── diffview.lua              # Git diff
│   │   ├── trouble.lua               # Diagnostics
│   │   ├── conform.lua               # Formateo
│   │   └── ...
│   └── lib/
│       ├── icons.lua                 # Iconos
│       ├── util.lua                  # Utilidades
│       └── prompts.lua               # Prompts
```

## 🔑 Keybindings Principales (DevOps)

### Terminal
| Atajo | Acción |
|-------|--------|
| `<C-\>` | Toggle terminal flotante |
| `<leader>tb` | Bash REPL |
| `<leader>tp` | Python REPL |
| `<leader>tn` | Node REPL |

### Git
| Atajo | Acción |
|-------|--------|
| `<leader>gg` | LazyGit |
| `<leader>gd` | Diff view |
| `<leader>gD` | Close diff |
| `<leader>gh` | File history |

### LSP & Diagnostics
| Atajo | Acción |
|-------|--------|
| `<leader>xx` | Toggle trouble |
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `<leader>ld` | Go to definition |
| `<leader>lh` | Hover docs |
| `<leader>lr` | Rename symbol |
| `<leader>la` | Code actions |

### Archivos
| Atajo | Acción |
|-------|--------|
| `<leader>ff` | Find files |
| `<leader>fd` | Find Docker files |
| `<leader>fk` | Find K8s files |
| `<leader>ft` | Find Terraform files |
| `<leader>fc` | Find config files |
| `<leader>yp` | Copy file path |

### Ejecución
| Atajo | Acción |
|-------|--------|
| `<leader>rs` | Run shell command |
| `<leader>rx` | Execute current file |

## 📦 Plugins Instalados

### UI & Theme
- `tokyonight` - Tema
- `lualine` - Statusline
- `which-key` - Keymap help
- `bufferline` - Tabs mejorado
- `indent-blankline` - Guías de indentación

### Navegación
- `telescope` - Fuzzy finder
- `fzf-lua` - FZF integration
- `nvim-tree` - File explorer
- `toggleterm` - Terminal integrada

### LSP & Completion
- `nvim-lspconfig` - LSP configuration
- `mason.nvim` - Language server installer
- `nvim-cmp` - Autocompletion
- `LuaSnip` - Snippet engine

### Git
- `gitsigns` - Git signs
- `lazygit` - LazyGit integration
- `diffview` - Advanced diff viewer

### Development
- `conform` - Formatter
- `nvim-lint` - Linter
- `trouble` - Diagnostics panel
- `comment.nvim` - Comment plugin
- `autopairs` - Auto pairs

### Otros
- `snacks.nvim` - Utility library
- `render-markdown` - Markdown rendering
- `colorizer` - Color highlighting

## ⚙️ Instalación de Language Servers

Todos se instalan automáticamente con Mason:

```bash
# Dentro de Neovim
:Mason

# O instalador manual
# Python
pip install python-lsp-server pylint black isort

# Bash
npm install -g bash-language-server

# YAML
npm install -g yaml-language-server

# Docker
npm install -g dockerfile-language-server-nodejs

# Terraform
brew install terraform-ls  # o descargarlo

# JSON
npm install -g vscode-json-languageserver
```

## 🚀 Primeros Pasos

1. **Instalar dependencias**:
```bash
# Verificar que Lazy instala los plugins
:Lazy install
```

2. **Instalar Language Servers**:
```bash
# Abre Mason
:Mason

# Instala los que necesites:
# - python-lsp-server
# - bash-language-server
# - yaml-language-server
# - dockerfile-language-server
```

3. **Configurar formateadores**:
```bash
# Python
pip install black isort

# Bash
brew install shfmt

# JSON/YAML
npm install -g prettier

# Terraform
brew install terraform  # ya incluye formato
```

## 📖 Recursos Útiles

- [Neovim Docs](https://neovim.io/doc/user/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [LSPConfig](https://github.com/neovim/nvim-lspconfig)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Kubernetes YAML Schema](https://json.schemastore.org/kube-master-standalone.json)

## 🐛 Troubleshooting

### LSP no funciona
```lua
-- Verificar que Mason esté instalado
:Mason
-- Instalar servidor específico
:MasonInstall python-lsp-server
```

### Terminal no abre
```lua
-- Verificar que toggleterm esté cargado
:checkhealth toggleterm
```

### Snippets no aparecen
```lua
-- Verificar LuaSnip
:LuaSnipInfo
```

## 🎯 Tips & Tricks

1. **Buscar rápidamente**:
   - `<leader><space>` - Smart picker (archivos + buffers)
   - `<leader>sg` - Buscar texto en proyecto
   - `<leader>sw` - Buscar palabra bajo cursor

2. **Terminal productiva**:
   - `<C-\>` para abrir terminal rápidamente
   - `<leader>tp` para Python REPL
   - Ejecutar comandos en vivo

3. **Git workflow**:
   - `<leader>gg` - LazyGit completo
   - `<leader>gd` - Diff detallado
   - `<leader>gh` - Historial de cambios

4. **DevOps workflow**:
   - Crea un Dockerfile: tipo `:read !echo 'dockerfile'` o `<leader>sd`
   - Búsqueda de K8s: `<leader>fk` busca todos los .yaml
   - Validación automática con LSP integrado

## 📝 Notas

- La configuración usa **Lazy.nvim** para gestión de plugins
- Todos los LSPs se instalan con **Mason.nvim**
- Los snippets usan **LuaSnip**
- Tema por defecto: **TokyoNight**

---

**Creado para DevOps Engineers y SysAdmins** ⚙️
