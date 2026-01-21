local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("java", {
  s("main", { t("public static void main(String[] args) {"), t({"", "	"}), i(0), t({"", "}"}) }),
})