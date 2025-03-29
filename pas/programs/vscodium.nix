{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-python.python
      ms-python.vscode-pylance
    ];
    keybindings = [
      {
	key = "f1";
	command = "workbench.action.quickOpenWithModes";
      }
      {
	key = "shift+f1";
	command = "workbench.action.copyEditorToNewWindow";
	when = "activeEditor";
      }
      {
	key = "f4";
	command = "workbench.action.terminal.new";
      }
      {
	key = "shift+f4";
	command = "workbench.action.terminal.openNativeConsole";
	when = "!terminalFocus";
      }
      {
	key = "ctrl+o";
	command = "workbench.action.openWalkthrough";
      }
    ];
  };
}
