local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- Helper function for multi-language snippets
local function add_to_multiple(languages, snippets)
  for _, lang in ipairs(languages) do
    ls.add_snippets(lang, snippets)
  end
end

-- JavaScript/TypeScript/React snippets
local js_ts_snippets = {
  -- Console log
  s("cl", fmt("console.log('{}', {});", { i(1), i(2) })),

  -- React useState
  s(
    "us",
    fmt("const [{}, set{}] = useState({});", {
      i(1),
      i(2),
      i(3),
    })
  ),

  -- React useEffect
  s(
    "ue",
    fmt(
      [[
useEffect(() => {{
  {}
}}, [{}]);
  ]],
      { i(1), i(2) }
    )
  ),

  -- Toast error
  s("errtoast", fmt("toast.error(`{} ${{error}}`)", { i(1) })),

  -- Toast info
  s("infotoast", fmt("toast.info(`{}`)", { i(1) })),
}

-- Helper function to create HTML tag snippets
local function html_tag(tag)
  return s(tag, fmt("<" .. tag .. ">{}</" .. tag .. ">", { i(1) }))
end

-- JSX/TSX specific snippets
local jsx_snippets = {
  -- React function component export
  s(
    "rfce",
    fmt(
      [[
const {} = () => {{
  return (
    <div>
      <h1>{}</h1>
    </div>
  );
}}

export default {}
  ]],
      {
        i(1, "ComponentName"),
        rep(1),
        rep(1),
      }
    )
  ),

  -- React const component export
  s(
    "rce",
    fmt(
      [[
const {} = () => {{
  return (
    <div>
      <h1>{}</h1>
    </div>
  );
}};

export default {};
  ]],
      {
        i(1, "ComponentName"),
        rep(1),
        rep(1),
      }
    )
  ),

  -- div with className
  s("dc", fmt("<div className='{}'>{}</div>", { i(1), i(2) })),

  -- Tooltip component
  s(
    "tooltip",
    fmt(
      [[
<Tooltip>
  <TooltipTrigger>
    {}
  </TooltipTrigger>
  <TooltipContent side='{}'>
    {}
  </TooltipContent>
</Tooltip>
  ]],
      {
        i(1),
        i(3, "top"),
        i(2),
      }
    )
  ),

  -- HTML tags with auto-closing
  html_tag("div"),
  html_tag("span"),
  html_tag("p"),
  html_tag("h1"),
  html_tag("h2"),
  html_tag("h3"),
  html_tag("h4"),
  html_tag("h5"),
  html_tag("h6"),
  html_tag("body"),
  html_tag("header"),
  html_tag("footer"),
  html_tag("main"),
  html_tag("section"),
  html_tag("article"),
  html_tag("aside"),
  html_tag("nav"),
  html_tag("ul"),
  html_tag("ol"),
  html_tag("li"),
  html_tag("a"),
  html_tag("button"),
  html_tag("form"),
  html_tag("label"),
  html_tag("select"),
  html_tag("option"),
  html_tag("table"),
  html_tag("thead"),
  html_tag("tbody"),
  html_tag("tr"),
  html_tag("td"),
  html_tag("th"),
  html_tag("strong"),
  html_tag("em"),
  html_tag("code"),
  html_tag("pre"),
  html_tag("blockquote"),
  html_tag("figure"),
  html_tag("figcaption"),
  html_tag("iframe"),
  html_tag("video"),
  html_tag("audio"),
  html_tag("canvas"),
  html_tag("svg"),
}

-- Add JavaScript/TypeScript snippets to multiple filetypes
add_to_multiple({
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
}, js_ts_snippets)

-- Add JSX snippets to React filetypes
add_to_multiple({
  "javascriptreact",
  "typescriptreact",
}, jsx_snippets)
