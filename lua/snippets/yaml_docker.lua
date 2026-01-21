local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("yaml", {
  s("docker", { t("version: '3'"), t({"", "services:"}), t({"", "	"}), i(0) }),
})