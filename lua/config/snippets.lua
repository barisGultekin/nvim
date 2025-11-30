local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local d = ls.dynamic_node
local sn = ls.snippet_node

-- Get visual selection
local function get_visual(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end

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

-- Visual selection snippets for wrapping text
local visual_snippets = {
  s("vdiv", fmt("<div>{}</div>", { d(1, get_visual) })),
  s("vspan", fmt("<span>{}</span>", { d(1, get_visual) })),
  s("vp", fmt("<p>{}</p>", { d(1, get_visual) })),
  s("vh1", fmt("<h1>{}</h1>", { d(1, get_visual) })),
  s("vh2", fmt("<h2>{}</h2>", { d(1, get_visual) })),
  s("vh3", fmt("<h3>{}</h3>", { d(1, get_visual) })),
  s("vbutton", fmt("<button>{}</button>", { d(1, get_visual) })),
  s("vstrong", fmt("<strong>{}</strong>", { d(1, get_visual) })),
  s("vem", fmt("<em>{}</em>", { d(1, get_visual) })),
  s("vcode", fmt("<code>{}</code>", { d(1, get_visual) })),
  s("va", fmt('<a href="{}">{}</a>', { i(1), d(2, get_visual) })),
  s("v(", fmt("({})", { d(1, get_visual) })),
  s("v{", fmt("{{{}}}", { d(1, get_visual) })),
  s("v[", fmt("[{}]", { d(1, get_visual) })),
  s("v'", fmt("'{}'", { d(1, get_visual) })),
  s('v"', fmt('"{}"', { d(1, get_visual) })),
  s("v`", fmt("`{}`", { d(1, get_visual) })),
}

-- Add visual snippets to JSX/TSX
add_to_multiple({
  "javascriptreact",
  "typescriptreact",
}, visual_snippets)
