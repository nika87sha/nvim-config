local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local ansible_snippets = {
  -- Basic Playbook
  s("playbook", {
    t({
      "---",
      "- name: ",
      i(1, "My Playbook"),
      "  hosts: ",
      i(2, "all"),
      "  become: ",
      i(3, "yes"),
      "  vars:",
      "    app_user: ",
      i(4, "appuser"),
      "",
      "  tasks:",
      "    - name: ",
      i(5, "Install packages"),
      "      apt:",
      "        name: ",
      i(6, "nginx"),
      "        state: present",
    }),
  }),

  -- Task with handlers
  s("task", {
    t({
      "- name: ",
      i(1, "Task name"),
      "  ",
      i(2, "apt"),
      ":",
      "    name: ",
      i(3, "package"),
      "    state: present",
      "  notify: ",
      i(4, "restart service"),
    }),
  }),

  -- Handler
  s("handler", {
    t({
      "handlers:",
      "  - name: ",
      i(1, "restart service"),
      "    systemd:",
      "      name: ",
      i(2, "nginx"),
      "      state: restarted",
      "      daemon_reload: yes",
    }),
  }),

  -- Apt module
  s("apt", {
    t({
      "- name: ",
      i(1, "Install package"),
      "  apt:",
      "    name: ",
      i(2, "nginx"),
      "    state: ",
      i(3, "present"),
      "    update_cache: yes",
    }),
  }),

  -- Yum module (RHEL/CentOS)
  s("yum", {
    t({
      "- name: ",
      i(1, "Install package"),
      "  yum:",
      "    name: ",
      i(2, "httpd"),
      "    state: ",
      i(3, "present"),
    }),
  }),

  -- Service module
  s("service", {
    t({
      "- name: ",
      i(1, "Manage service"),
      "  service:",
      "    name: ",
      i(2, "nginx"),
      "    state: ",
      i(3, "started"),
      "    enabled: yes",
    }),
  }),

  -- Systemd module
  s("systemd", {
    t({
      "- name: ",
      i(1, "Manage systemd service"),
      "  systemd:",
      "    name: ",
      i(2, "nginx"),
      "    state: ",
      i(3, "restarted"),
      "    daemon_reload: yes",
      "    enabled: yes",
    }),
  }),

  -- File module
  s("file", {
    t({
      "- name: ",
      i(1, "Create directory"),
      "  file:",
      "    path: ",
      i(2, "/opt/app"),
      "    state: ",
      i(3, "directory"),
      "    mode: '0755'",
    }),
  }),

  -- Copy module
  s("copy", {
    t({
      "- name: ",
      i(1, "Copy file"),
      "  copy:",
      "    src: ",
      i(2, "local_file"),
      "    dest: ",
      i(3, "/etc/app/config"),
      "    mode: '0644'",
    }),
  }),

  -- Template module
  s("template", {
    t({
      "- name: ",
      i(1, "Deploy template"),
      "  template:",
      "    src: ",
      i(2, "config.j2"),
      "    dest: ",
      i(3, "/etc/app/config"),
      "    owner: root",
      "    group: root",
      "    mode: '0644'",
    }),
  }),

  -- Shell command
  s("shell", {
    t({
      "- name: ",
      i(1, "Execute command"),
      "  shell: |",
      "    ",
      i(2, "echo 'Hello World'"),
    }),
  }),

  -- Command module
  s("command", {
    t({
      "- name: ",
      i(1, "Run command"),
      "  command: ",
      i(2, "whoami"),
    }),
  }),

  -- Register variable
  s("register", {
    t({
      "- name: ",
      i(1, "Task with output"),
      "  shell: ",
      i(2, "echo 'test'"),
      "  register: ",
      i(3, "result"),
    }),
  }),

  -- Debug output
  s("debug", {
    t({
      "- name: Show variable",
      "  debug:",
      "    var: ",
      i(1, "result"),
    }),
  }),

  -- Loop
  s("loop", {
    t({
      "- name: ",
      i(1, "Install packages"),
      "  apt:",
      "    name: \"{{ item }}\"",
      "    state: present",
      "  loop:",
      "    - ",
      i(2, "nginx"),
      "    - ",
      i(3, "curl"),
      "    - ",
      i(4, "git"),
    }),
  }),

  -- Conditional
  s("when", {
    t({
      "- name: ",
      i(1, "Conditional task"),
      "  apt:",
      "    name: nginx",
      "    state: present",
      "  when: ansible_os_family == \"Debian\"",
    }),
  }),
}

ls.add_snippets("yaml", ansible_snippets)
