{
  shell.enableBashIntegration = true;
  programs.bash = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
    };
  };
}
