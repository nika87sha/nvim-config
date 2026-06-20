local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local k8s_snippets = {
  -- Deployment
  s("deployment", {
    t({
      "apiVersion: apps/v1",
      "kind: Deployment",
      "metadata:",
      "  name: ",
      i(1, "my-app"),
      "  namespace: ",
      i(2, "default"),
      "spec:",
      "  replicas: ",
      i(3, "3"),
      "  selector:",
      "    matchLabels:",
      "      app: ",
      i(4, "my-app"),
      "  template:",
      "    metadata:",
      "      labels:",
      "        app: ",
      i(5, "my-app"),
      "    spec:",
      "      containers:",
      "      - name: ",
      i(6, "my-app"),
      "        image: ",
      i(7, "my-app:latest"),
      "        ports:",
      "        - containerPort: ",
      i(8, "8080"),
      "        env:",
      "        - name: DEBUG",
      "          value: \"true\"",
    }),
  }),

  -- Service
  s("service", {
    t({
      "apiVersion: v1",
      "kind: Service",
      "metadata:",
      "  name: ",
      i(1, "my-app"),
      "  namespace: ",
      i(2, "default"),
      "spec:",
      "  type: ",
      i(3, "ClusterIP"),
      "  selector:",
      "    app: ",
      i(4, "my-app"),
      "  ports:",
      "  - protocol: TCP",
      "    port: ",
      i(5, "80"),
      "    targetPort: ",
      i(6, "8080"),
    }),
  }),

  -- ConfigMap
  s("configmap", {
    t({
      "apiVersion: v1",
      "kind: ConfigMap",
      "metadata:",
      "  name: ",
      i(1, "app-config"),
      "  namespace: ",
      i(2, "default"),
      "data:",
      "  config.yaml: |",
      "    ",
      i(3, "key: value"),
    }),
  }),

  -- Secret
  s("secret", {
    t({
      "apiVersion: v1",
      "kind: Secret",
      "metadata:",
      "  name: ",
      i(1, "app-secret"),
      "  namespace: ",
      i(2, "default"),
      "type: Opaque",
      "data:",
      "  password: ",
      i(3, "base64-encoded-value"),
    }),
  }),

  -- PersistentVolumeClaim
  s("pvc", {
    t({
      "apiVersion: v1",
      "kind: PersistentVolumeClaim",
      "metadata:",
      "  name: ",
      i(1, "my-pvc"),
      "spec:",
      "  accessModes:",
      "    - ReadWriteOnce",
      "  resources:",
      "    requests:",
      "      storage: ",
      i(2, "10Gi"),
    }),
  }),

  -- Ingress
  s("ingress", {
    t({
      "apiVersion: networking.k8s.io/v1",
      "kind: Ingress",
      "metadata:",
      "  name: ",
      i(1, "my-ingress"),
      "spec:",
      "  rules:",
      "  - host: ",
      i(2, "example.com"),
      "    http:",
      "      paths:",
      "      - path: /",
      "        pathType: Prefix",
      "        backend:",
      "          service:",
      "            name: ",
      i(3, "my-app"),
      "            port:",
      "              number: ",
      i(4, "80"),
    }),
  }),

  -- StatefulSet
  s("statefulset", {
    t({
      "apiVersion: apps/v1",
      "kind: StatefulSet",
      "metadata:",
      "  name: ",
      i(1, "my-app"),
      "spec:",
      "  serviceName: ",
      i(2, "my-app"),
      "  replicas: ",
      i(3, "3"),
      "  selector:",
      "    matchLabels:",
      "      app: ",
      i(4, "my-app"),
      "  template:",
      "    metadata:",
      "      labels:",
      "        app: ",
      i(5, "my-app"),
      "    spec:",
      "      containers:",
      "      - name: ",
      i(6, "my-app"),
      "        image: ",
      i(7, "my-app:latest"),
      "        ports:",
      "        - containerPort: ",
      i(8, "8080"),
    }),
  }),
}

ls.add_snippets("yaml", k8s_snippets)
