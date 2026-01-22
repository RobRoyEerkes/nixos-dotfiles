{ pkgs, inputs, ... }:
{
  # ...
  imports = [
    inputs.noctalia.homeModules.default
    inputs.matugen.nixosModules.default
  ];
  programs.noctalia-shell = {
    enable = true;
    settings = {
      templates = {
        enableUserTemplates = true;
      };
    };
    user-templates = {
      config = {
        # General Matugen config settings
      };
      templates = {
        nvim-base16 = {
          input_path = "~/.config/nvim/lua/matugen-template.lua";
          output_path = "~/.config/nvim/lua/matugen.lua";
          post_hook = "pkill -SIGUSR1 nvim";
        };
      };
    };
  };

}
