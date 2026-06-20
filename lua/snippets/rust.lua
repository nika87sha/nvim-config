local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local rust_snippets = {
  -- `use` statement
  s("use", {
    t("use "),
    i(1, "std::collections::HashMap"),
    t(";"),
    i(0),
  }),

  -- `fn` function
  s("fn", {
    t("fn "),
    i(1, "function_name"),
    t("("),
    i(2),
    t(") -> "),
    i(3, "Result<()>"),
    t(" {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- `main` function
  s("main", {
    t("fn main() -> Result<(), Box<dyn std::error::Error>> {"),
    t({ "", "\t" }),
    i(0, "println!(\"Hello, world!\");"),
    t({ "", "\tOk(())" }),
    t({ "", "}" }),
  }),

  -- `impl` block
  s("impl", {
    t("impl "),
    i(1, "StructName"),
    t(" {"),
    t({ "", "\t" }),
    t("fn new("),
    i(2),
    t(") -> Self {"),
    t({ "", "\t\t" }),
    i(3, "Self { }"),
    t({ "", "\t}" }),
    t({ "", "}" }),
  }),

  -- `struct` definition
  s("struct", {
    t("struct "),
    i(1, "StructName"),
    t(" {"),
    t({ "", "\t" }),
    i(2, "field: String"),
    t({ "", "}" }),
    i(0),
  }),

  -- `enum` definition
  s("enum", {
    t("enum "),
    i(1, "EnumName"),
    t(" {"),
    t({ "", "\t" }),
    i(2, "Variant1,"),
    t({ "", "\t" }),
    i(3, "Variant2,"),
    t({ "", "}" }),
    i(0),
  }),

  -- `match` expression
  s("match", {
    t("match "),
    i(1, "value"),
    t(" {"),
    t({ "", "\t" }),
    i(2, "Pattern"),
    t(" => "),
    i(3, "result"),
    t(","),
    t({ "", "\t_ => unimplemented!()" }),
    t({ "", "}" }),
  }),

  -- `for` loop
  s("for", {
    t("for "),
    i(1, "item"),
    t(" in "),
    i(2, "iterable"),
    t(" {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- CLI app (clap)
  s("clap", {
    t({
      "use clap::Parser;",
      "",
      "#[derive(Parser)]",
      "#[command(author, version, about, long_about = None)]",
      "struct Cli {",
      "    /// ",
    }),
    i(1, "Description of the argument"),
    t({ "", "    " }),
    i(2, "name: String,"),
    t({ "", "}" }),
    t({ "", "" }),
    t("fn main() {"),
    t({ "", "\tlet cli = Cli::parse();" }),
    t({ "", "\tprintln!(\"{:?}\", cli);" }),
    t({ "", "}" }),
  }),

  -- Serde derive
  s("serde", {
    t({
      "use serde::{Deserialize, Serialize};",
      "",
      "#[derive(Debug, Serialize, Deserialize)]",
      "struct ",
    }),
    i(1, "Config"),
    t(" {"),
    t({ "", "\t" }),
    i(2, "field: String,"),
    t({ "", "}" }),
  }),

  -- Error handling with anyhow
  s("anyhow", {
    t({
      "use anyhow::{Context, Result};",
      "",
      "fn main() -> Result<()> {",
      "    ",
    }),
    i(0),
    t({ "", "    Ok(())", "}" }),
  }),

  -- HTTP request with reqwest
  s("reqwest", {
    t({ 'let response = reqwest::blocking::get("' }),
    i(1, "https://api.example.com"),
    t({ '")?;' }),
    t({ '', '\t.context("Failed to send request")?;' }),
    t({ '', 'let body = response.text()?;' }),
    t({ '', 'println!("{}", body);' }),
  }),

  -- Test module
  s("test", {
    t({
      "#[cfg(test)]",
      "mod tests {",
      "    use super::*;",
      "",
      "    #[test]",
      "    fn test_",
    }),
    i(1, "function_name"),
    t("() {"),
    t({ "", "\t\t" }),
    i(2, "assert_eq!(true, true);"),
    t({ "", "\t}" }),
    t({ "", "}" }),
  }),

  -- Async function
  s("async", {
    t({
      "async fn ",
    }),
    i(1, "function_name"),
    t("("),
    i(2),
    t(") -> "),
    i(3, "Result<()>"),
    t(" {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- Tokio main
  s("tokio", {
    t({
      '#[tokio::main]',
      'async fn main() -> Result<(), Box<dyn std::error::Error>> {',
      '    ',
    }),
    i(0, 'println!("Hello from async world!");'),
    t({ '', '\tOk(())', '}' }),
  }),
}

ls.add_snippets("rust", rust_snippets)
