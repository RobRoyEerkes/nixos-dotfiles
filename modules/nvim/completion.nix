{ ... }:
{
  programs.nixvim = {
    opts.completeopt = [
      "menu"
      "menuone"
      "noinsert"
    ];

    plugins.blink-cmp = {
      enable = true;

      completion = {
        documentation = {
          auto-show = true;
        };
      };
      sources = {
        default = [
          "lsp"
          "path"
          "buffer"
        ];
      };
    };
  };
}
