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
    ];
    userSettings = {
      "editor.defaultFormatter" = "xaver.clang-format";
      "git.confirmSync" = false;
      "git.autofetch" = true;
      "workbench.colorTheme" = "Dracula Theme";
    };
  };
}
