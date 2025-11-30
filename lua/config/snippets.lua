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
