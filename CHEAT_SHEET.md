# ⚡ Cheat Sheet DevOps - Neovim

## 🎯 Accesos Rápidos (Lo Más Importante)

### 🏃 Acceso Rápido
| Atajo | Acción |
|-------|--------|
| `<leader><space>` | Smart picker (archivos + búsqueda) |
| `<leader>ff` | Find files |
| `<C-\>` | Terminal flotante |
| `<leader>gg` | LazyGit |

### 📁 Búsqueda por Tipo
```
<leader>fc  →  Config files (~/.config/)
<leader>fd  →  Docker files
<leader>fk  →  Kubernetes files (.yaml)
<leader>ft  →  Terraform files (.tf)
<leader>fr  →  Recent files
<leader>sg  →  Search text in project
<leader>sw  →  Search word under cursor
```

### 💻 Terminal & REPL
```
<C-\>       →  Toggle terminal
<leader>tb  →  Bash REPL
<leader>tp  →  Python REPL
<leader>tn  →  Node REPL
```

### 🔧 Git & Diff
```
<leader>gg  →  LazyGit (completo)
<leader>gd  →  Diff view
<leader>gh  →  File history
<leader>gH  →  File history (current file)
```

### 🐛 Diagnostics & Errores
```
<leader>xx  →  Toggle trouble (diagnostics)
<leader>xw  →  Workspace diagnostics
<leader>xd  →  Document diagnostics
gR          →  LSP references
```

### 💾 Edición
```
<leader>lf  →  Format file
<leader>lh  →  Hover docs
<leader>ld  →  Go to definition
<leader>lr  →  Rename symbol
<leader>la  →  Code actions
```

### 🚀 Ejecución Rápida
```
<leader>rs  →  Run shell command
<leader>rx  →  Execute current file
<leader>yp  →  Copy file path
```

---

## 📝 Snippets Rápidos

### Docker
```vim
:read !echo 'dockerfile'     " O escribe: dockerfile<Tab>
:read !echo 'docker_compose' " O escribe: docker_compose<Tab>
```

### Kubernetes
```vim
deployment<Tab>  →  Deployment template
service<Tab>     →  Service template
configmap<Tab>   →  ConfigMap template
secret<Tab>      →  Secret template
ingress<Tab>     →  Ingress template
```

### Terraform
```vim
provider_aws<Tab>  →  AWS provider
vpc<Tab>           →  VPC
ec2<Tab>           →  EC2 instance
variable<Tab>      →  Variable block
output<Tab>        →  Output block
```

### Ansible
```vim
playbook<Tab>  →  Playbook structure
task<Tab>      →  Task definition
apt<Tab>       →  Apt module
yum<Tab>       →  Yum module
loop<Tab>      →  Loop structure
when<Tab>      →  Conditional
```

---

## 🔥 Combos DevOps

### Crear Dockerfile
```
<leader>ff dockerfile        " Buscar Dockerfiles existentes
OR
Nuevo archivo: Dockerfile    " Crear nuevo
Escribe: dockerfile<Tab>     " Inserta template
<leader>lf                   " Formatea
```

### Editar K8s Manifest
```
<leader>fk                   " Busca *.yaml
<leader>xw                   " Ver warnings/errors
<leader>lh                   " Ver schema help
<C-x><C-o>                   " Autocompletar
```

### Actualizar Terraform
```
<leader>ft                   " Busca *.tf
<leader>lf                   " Format terraform
<leader>xx                   " Ver errores
<leader>gd                   " Ver diff de cambios
```

### Ansible Playbook
```
<leader>sg                   " Busca en playbooks
playbook<Tab>                " Si archivo nuevo
<C-\> bash                   " Terminal para testing
ansible-playbook file.yml    " Ejecutar en terminal
```

### Git Workflow
```
<leader>gd                   " Ver diffs
<leader>gg                   " LazyGit UI
<C-\>                        " Terminal para commits
git commit -m "message"      " Commit desde terminal
git push                     " Push desde terminal
```

---

## 🎮 Controles en Trouble Panel

```
<leader>xx                   " Abrir/cerrar Trouble
<Tab> o j/k                  " Navegar items
<CR> o l                     " Ir a ubicación
gf                           " Mostrar/ocultar lista archivos
```

---

## 🖥️ Controles en Terminal Integrada

```
<C-\>                        " Toggle on/off
i                            " Modo insert
<Esc>                        " Modo normal
:ToggleTerm direction=float  " Flotante
:ToggleTerm direction=vertical size=60  " Vertical
```

---

## 🔍 Búsquedas Avanzadas

### Telescope Shortcuts
```
<C-q>                        " Enviar selección a quickfix
<C-/>                        " Abrir/cerrar preview
<Tab>                        " Multi-select
<C-u>/<C-d>                  " Scroll preview
```

### Grep Patrones
```
<leader>sg "TODO"            " Buscar TODOs
<leader>sg "FIXME"           " Buscar FIXMEs
<leader>sg "ERROR"           " Buscar errores
```

---

## 💡 Tips Pro

1. **Búsqueda rápida de errores**
   ```
   <leader>xw  →  Ver todos los errores del workspace
   <Tab>       →  Navegar entre errores
   <CR>        →  Ir al error
   ```

2. **Copiar ruta de archivo**
   ```
   <leader>yp  →  Copia ruta absoluta al clipboard
   ```

3. **Comparar configuraciones**
   ```
   <leader>gd  →  Abre diff view (ideal para IaC)
   ```

4. **Ejecutar tests rápidamente**
   ```
   <C-\>              " Abre terminal
   python test.py     " Ejecuta en terminal
   <leader>tp         " O usa Python REPL
   ```

5. **Formatear archivo automáticamente**
   ```
   <leader>lf  →  Formatea según conform.nvim
   ```

---

## 📚 Referencia Completa

Para ver TODOS los keybindings:
```
:WhichKey        " Abre Which-Key
<leader>?        " Abre help tags
:commands        " Lista todos los comandos
```

Para ver documentación de un plugin:
```
:help <plugin_name>
:Mason           " Ver language servers instalados
:LuaSnipInfo     " Ver info de snippets
```

---

**Pro Tip:** Agrega esto a tu workflow diario y en una semana serás 10x más rápido ⚡

