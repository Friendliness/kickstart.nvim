local ls = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
ls.filetype_extend('html', { 'djangohtml' })

-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt -- {} delimiters by default
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.config.set_config {
  store_selection_keys = '<leader>sz',
}

-- Temporary snippets
local tir = function()
  return { 'interaction.client.try_interaction_respond()' }
end

-- Endblock
local endbl = function()
  return { '{% endblock %}' }
end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = 'tir',
      namr = 'try_interaction_respond',
      dscr = 'Try interaction respond snippet',
    }, {
      text { 'interaction.client.try_interaction_respond(interaction=interaction, content=' },
      insert(1),
      text { ', ephemeral=' },
      insert(2),
      text { ')' },
    }),

    snip({
      trig = 'endbl',
      namr = 'jinja_2_endblock',
      dscr = 'Jinja2 endblock',
    }, {
      func(endbl, {}),
    }),
    snip({
      trig = 'link',
      name = 'markdown_link',
      dscr = 'Create markdown link [txt](url)',
    }, {
      text '[',
      insert(1),
      text '](',
      func(function(_, snip)
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      text ')',
      insert(1),
    }),
    snip({
      trig = 'eee',
      name = 'go_error_not_equals_nil',
      dscr = 'If error != nil ',
    }, {
      text { 'if err != nil {', '' },
      insert(1),
      text { '', '}' },
    }),
    snip({
      trig = 'dbpy',
      name = 'import_debugpy',
      dscr = 'Import debugpydbstub',
    }, { text 'from utils.debug import debugpy' }),
    snip(
      {
        trig = 'flakenix',
        name = 'flake_nix_file',
        dscr = 'Make a basic flake.nix for in a project',
      },
      fmt(
        [[
      {
        description = "<>";

        inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

        outputs =
          { nixpkgs, ... }:
          let
            pkgs = nixpkgs.legacyPackages.x86_64-linux;

            # uv installs prebuilt manylinux wheels (numpy, Pillow, lxml, ...) that
            # are dynamically linked against libstdc++/libz from a normal Linux
            # distro. Nix doesn't put those on the default library path, so those
            # wheels fail to import with "ImportError: libstdc++.so.6: cannot open
            # shared object file" unless we point LD_LIBRARY_PATH at them ourselves.
            libPath = pkgs.lib.makeLibraryPath [
              pkgs.stdenv.cc.cc.lib
              pkgs.zlib
            ];
          in
          {
            devShells.x86_64-linux.default = pkgs.mkShell {
              packages = with pkgs; [
                <>
              ];

              LD_LIBRARY_PATH = libPath;
            };
          };
      }
    ]],
        { insert(1), insert(2) },
        { delimiters = '<>' }
      )
    ),
  },
})
