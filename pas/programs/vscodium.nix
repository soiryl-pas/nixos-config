{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-python.python
      ms-python.vscode-pylance
      xaver.clang-format
      ms-vscode.cpptools
      mkhl.direnv
      github.vscode-github-actions
      dracula-theme.theme-dracula
      ms-vscode.hexeditor
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
	name = "ARM";
	publisher = "dan-c-underwood";
	version = "1.4.0";
	sha256 = "sha256-atDbLgc2R+X/wyGAxA6M0lDa03L5yFX1rbfpyZ8oKUU=";
      }
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
      {
	key = "ctrl+shift+space";
	command = "editor.action.triggerSuggest";
	when = "editorHasCompletionItemProvider && textInputFocus && !editorReadonly";
      }
      {
	key = "ctrl+shift+f12";
	command = "editor.action.revealDeclaration";
      }
      {
	key = "ctrl+[Backslash]";
	command = "direnv.reset";
      }
    ];
    userSettings = {
      "editor.defaultFormatter" = "xaver.clang-format";
      "git.confirmSync" = false;
      "git.autofetch" = true;
      "workbench.colorTheme" = "Dracula Theme";
      "direnv.restart.automatic" = true;
    };
  };
}
