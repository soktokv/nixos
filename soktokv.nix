{ config, pkgs, ... }:

{ 
  home.username = "soktokv";
  home.homeDirectory = "/home/soktokv";
  
  home.packages = with pkgs; [
    firefox
    vscode
    jetbrains-toolbox
  ];
  
  home.file.".config/i3/config".source = ./i3wm/conf;
   
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
    '';
    shellAliases = {
      ll="ls -al";
      cp="cp -i";
      df="df -h";
      free="free -m";
      np="nano -w PKGBUILD";
      more="less";
    };
  };

  programs.git = {
    enable = true;
    userName = "soktokv";
    userEmail = "soktokv@naihv.com";
  };
  
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-lastplace
      nerdtree
      vim-airline
      vim-commentary
      YouCompleteMe
      auto-pairs
    ];
    extraConfig = ''
      set mouse=a
      set number
      set tabstop=2
      set shiftwidth=4
      set clipboard=unnamedplus
      set ignorecase
      set smartindent
      syntax on
      nnoremap <F2> :NERDTreeToggle<CR>
      let NERDTreeShowHidden=1
      autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    '';
  };

  programs.go = {
    enable = true;
    package = pkgs.go_1_21;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 16;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      keyboard.bindings = [
        {
	        key = "Insert";
	        mods = "Control";
      	  action = "Copy";
	      }
      ];
    };
  };

  home.stateVersion = "23.11";  
 
  programs.home-manager.enable = true;
}
