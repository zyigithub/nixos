{
  config,
  pkgs,
  ...
}:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "zyi";
  home.homeDirectory = "/home/zyi";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    #rice stuff
    neofetch
    nwg-look
    swaybg
    hyprpaper
    hyprlock

    #theme
    jetbrains-mono
    palenight-theme

    #misc utils
    unzip
    grim
    obs-studio
    mpv
    vlc
    slurp
    micro 
	okular
	zip
	btop
	kitty
	chromium
	firefox-bin
	vscode
	libsForQt5.kate
	gnome-solanum
	errands
	p7zip
	
    anyrun
	dig

	xfce.thunar
	xfce.thunar-volman


    libreoffice-qt6-fresh
	abiword

	clamav
	chkrootkit

	postman
	nodePackages_latest.ts-node
	typescript

	#art shit
	blender 
	krita

	nexusmods-app

	zoom-us
	godot_4
	protonvpn-gui
	transmission_4
	qbittorrent
	
  ];

  gtk = {
    enable = true;

    theme = {
      package = pkgs.palenight-theme;
      name = "palenight";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };

    font = {
      name = "Jetbrains-Mono";
      size = 11;
    };
  };

  qt.enable = true;
  qt.platformTheme.name = "gtk";

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };


  programs.git = {
    enable = true;
    userName  = "zyi";
    userEmail = "zyutan7@gmail.com";
  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/zyi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
