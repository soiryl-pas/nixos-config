{ config, pkgs, pkgs-24-11, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
	vscodevim.vim
	xaver.clang-format
	mkhl.direnv
	dracula-theme.theme-dracula
	ms-python.python
	ms-python.vscode-pylance
	ms-vscode.hexeditor
	twxs.cmake
	llvm-vs-code-extensions.vscode-clangd
	ms-vscode.cmake-tools
	redhat.java
	vscjava.vscode-maven
	vscjava.vscode-gradle
	vscjava.vscode-java-test
	vscjava.vscode-java-debug
	vscjava.vscode-java-dependency
      ] ++ [ pkgs-24-11.vscode-extensions.ms-vscode.cpptools ] 
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
	{
	  name = "ARM";
	  publisher = "dan-c-underwood";
	  version = "1.4.0";
	  sha256 = "sha256-atDbLgc2R+X/wyGAxA6M0lDa03L5yFX1rbfpyZ8oKUU=";
	}
	{
	  name = "qtvsctools";
	  publisher = "tonka3000";
	  version = "0.11.0";
	  sha256 = "sha256-/iJzPI4xJY+Vg9B/ah+zdErq988aXdN/UL1V3fR2nJ8=";
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
	  command = "workbench.action.terminal.toggleTerminal";
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
	"debug.allowBreakpointsEverywhere" = true;
	"vim.useSystemClipboard" = true;
	"redhat.telemetry.enabled" = false;
      };
    };
  };
}
