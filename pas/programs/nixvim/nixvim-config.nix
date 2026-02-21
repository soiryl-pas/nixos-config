{ pkgs }:
{
  globals.mapleader = " "; # <leader> mapping

  highlight = {
    DapBreakpoint = {
      bg = "#4b2c5b";
    };
  };

  keymaps = [
    {
      # Open and close Filetree
      action = "<cmd>Neotree toggle<CR>";
      key = "<leader>nf";
    }
    {
      # Open Filetree in new tab
      action = "<cmd>Texplore<CR>";
      key = "<leader>ne";
    }
    {
      # Find files in cwd
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
    }
    {
      # Grep files in cwd
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fg";
    }
    {
      # List buffers
      action = "<cmd>Telescope buffers<CR>";
      key = "<leader>fb";
    }
    {
      # List help
      action = "<cmd>Telescope help_tags<CR>";
      key = "<leader>fh";
    }
    {
      # List LSP Diagnostics
      action = "<cmd>Telescope diagnostics<CR>";
      key = "<leader>fd";
    }
    {
      # Display keymaps
      action = "<cmd>Telescope keymaps<CR>";
      key = "<leader>fk";
    }
    {
      # Look into Nix documentation
      action = "<cmd>Telescope manix<CR>";
      key = "<leader>fm";
    }
    {
      # List and select projects
      action = "<cmd>Telescope projects<CR>";
      key = "<leader>fp";
    }
    {
      # Format with nvim-conform
      action = "<cmd>lua require('conform').format()<CR>";
      key = "<leader>fo";
    }
    {
      # Open LazyGit
      action = "<cmd>LazyGit<CR>";
      key = "<leader>gg";
    }
    {
      # Open LazyGitLog
      action = "<cmd>LazyGitLog<CR>";
      key = "<leader>gl";
    }
    {
      # Get outline of file in floating window
      action = "<cmd>Lspsaga outline<CR>";
      key = "<leader>sol";
    }
    {
      # See documentation of symbol in hover
      # -- Press twice to jump into hover window
      # -- gx to visit links
      action = "<cmd>Lspsaga hover_doc<CR>";
      key = "K";
    }
    {
      # Peek definition
      action = "<cmd>Lspsaga peek_definition<CR>";
      key = "<leader>spd";
    }
    {
      # Peek type definition
      action = "<cmd>Lspsaga peek_type_definition<CR>";
      key = "<leader>spt";
    }
    {
      action = "<cmd>Lspsaga goto_definition<CR>";
      key = "grd";
    }
    {
      action = "<cmd>Lspsaga goto_type_definition<CR>";
      key = "grt";
    }
    {
      # Show incoming calls
      action = "<cmd>Lspsaga incoming_calls<CR>";
      key = "<leader>sic";
    }
    {
      # Show outgoing calls
      action = "<cmd>Lspsaga outgoing_calls<CR>";
      key = "<leader>soc";
    }
    {
      # Find symbol in multiple files
      action = "<cmd>Lspsaga finder<CR>";
      key = "grr";
    }
    {
      # Rename symbols
      action = "<cmd>Lspsaga rename<CR>";
      key = "grn";
    }
    {
      # See supertypes / generalisations
      action = "<cmd>Lspsaga supertypes<CR>";
      key = "<leader>stg";
    }
    {
      # See subtypes / specialisations
      action = "<cmd>Lspsaga subtypes<CR>";
      key = "<leader>sts";
    }
    {
      # Goto next diagnostic and list actions
      # -- Use CTRL+F, CTRL+B for code action preview
      action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
      key = "[d";
    }
    {
      # Goto previous diagnostic
      action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
      key = "]d";
    }
    {
      # Toggle Floaterm to last terminal, also with F12 from within terminal
      # F11: Next terminal
      # F10: Previous terminal
      # F9:  Kill terminal
      action = "<cmd>FloatermToggle<CR>";
      key = "<leader>aa";
    }
    {
      action = "<cmd>FloatermNew<CR>";
      key = "<leader>an";
    }
    {
      # Open DAP-UI
      action.__raw = "require('dapui').toggle";
      key = "<leader>dv";
    }
    {
      # Also start DAP session
      action = "<cmd>DapContinue<CR>";
      key = "<F5>";
    }
    {
      action = "<cmd>DapStepOver<CR>";
      key = "<F6>";
    }
    {
      action = "<cmd>DapStepInto<CR>";
      key = "<F7>";
    }
    {
      action = "<cmd>DapStepOut<CR>";
      key = "<F8>";
    }
    {
      action = "<cmd>DapToggleBreakpoint<CR>";
      key = "<leader>db";
    }
    {
      action = "<cmd>DapTerminate<CR>";
      key = "<leader>dq";
    }
    {
      action.__raw = "require('dap').run_last";
      key = "<leader>dl";
    }
    {
      # List last tasks and outputs
      action = "<cmd>OverseerToggle<CR>";
      key = "<leader>ot";
    }
    {
      # Select and run task in cwd
      action = "<cmd>OverseerRun<CR>";
      key = "<leader>or";
    }
    {
      # Manipulate tasks
      action = "<cmd>OverseerTaskAction<CR>";
      key = "<leader>oa";
    }
    {
      # Run oneshot shell command
      action = "<cmd>OverseerShell<CR>";
      key = "<leader>os";
    }
    {
      # Stage and unstage text hunk to git
      action = "<cmd>Gitsigns stage_hunk<CR>";
      key = "<leader>gs";
    }
    {
      # Show full git blame on the side
      action = "<cmd>Gitsigns blame<CR>";
      key = "<leader>gf";
    }
    {
      # Show git blame per line
      action = "<cmd>Gitsigns toggle_current_line_blame<CR>";
      key = "<leader>gb";
    }
    {
      # Show diff per word inline
      action = "<cmd>Gitsigns toggle_word_diff<CR>";
      key = "<leader>gw";
    }
  ]
  ++ pkgs.lib.lists.forEach [ "h" "j" "k" "l" ] (char: {
    # Making window manoeuvring more hasslefree with the leader key
    action = "<C-w>${char}";
    key = "<leader>${char}";
  });

  # Tabs:
  # gt : goto next tab
  # gT : goto prev tab
  # $gt : goto tab num $
  # C-wT : move split into new tab

  # Commandline:
  # C-w : Delete last word
  # C-u : Delete whole line

  # LSP:
  # K : Show info for symbol
  # grr : Show references
  # grd, grt : Goto definition
  # grn : Rename
  # gra : Code Action (e.g. clangd's "Fix available")
  # <l>sx, ss, sr : LspStop, LspStart, LspRestart

  # Clipboard:
  # "+<KEY> to yank-delete into Clipboard or put from Clipboard

  # Debugging:
  # <F5> : Start, Continue
  # <F6> : StepOver
  # <F7> : StepInto
  # <F8> : StepOut
  # <leader>dq : Terminate

  autoCmd = [
    {
      # Special formatting for .nix files
      command = "setlocal shiftwidth=2";
      event = [
        "Filetype"
      ];
      pattern = [ "nix" ];
    }

    {
      # Get Neotree to open when entering neovim without arguments
      event = [ "VimEnter" ];
      once = true;
      callback = {
        __raw = "function() if vim.fn.argc() == 0 then vim.cmd(\"Neotree current\") end end";
      };
    }
  ];
  opts = {
    autochdir = true;
    cursorline = true;
    syntax = "on";
    shiftwidth = 4;
    tabstop = 4;
    number = true;
    expandtab = true;
    showmode = false;
    termguicolors = true;
    completeopt = [
      "menuone"
      "noselect"
      "noinsert"
    ];
    clipboard = {
      providers.wl-copy.enable = true;
      register = "wl-copy";
    };
    ruler = true;
    scrolloff = 5;
  };

  # Shows lsp diagnostics when cursor on current line
  diagnostic.settings = {
    float = {
      border = "rounded";
    };
    virtual_lines.current_line = true;
  };

  plugins = {

    # Autocompletion
    # Switch to blink-cmp?
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        window = {
          completion = {
            border = "solid";
          };
          documentation = {
            border = "solid";
          };
        };
        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-c>" = "cmp.mapping.complete()"; # Call autocomplete
        };
      };
    };

    # Debugging
    dap = {
      enable = true;
      signs = {
        dapBreakpoint = {
          text = "";
          linehl = "DapBreakpoint";
        };
      };
      # Systemwide configurations here
    };
    dap-lldb = {
      enable = true;
      settings.codelldb_path = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
    };
    dap-virtual-text.enable = true;
    dap-ui.enable = true;
    dap-python.enable = true;

    web-devicons.enable = true;
    image.enable = true;
    direnv.enable = true;

    # New Statusbar
    lightline = {
      enable = true;
      settings = {
        colorscheme = "one";
      };
    };

    treesitter = {
      enable = true;
      nixvimInjections = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        toml
        yaml
        c
        cpp
        cmake
        rust
        python
      ];
      settings = {
        ensure_installed = [
          "c"
          "cpp"
          "nix"
          "rust"
          "python"
        ];
        highlight = {
          enable = true;
        };
        indent = {
          enable = false;
        };
      };
    };

    colorful-menu.enable = true;

    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        clangd.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          installRustfmt = false;
        };
      };
      keymaps = {
        extra = [
          {
            action = "<CMD>LspStop<Enter>";
            key = "<leader>sx";
          }
          {
            action = "<CMD>LspStart<Enter>";
            key = "<leader>ss";
          }
          {
            action = "<CMD>LspRestart<Enter>";
            key = "<leader>sr";
          }
        ];
      };
    };

    lspsaga = {
      enable = true;
      settings = {
        outline = {
          layout = "float";
        };
        lightbulb = {
          sign = false;
          debounce = 0;
        };
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          c = [ "clang-format" ];
          cpp = [ "clang-format" ];
          nix = [ "nixfmt" ];
          rust = [ "rustfmt" ];
          python = [ "autopep8" ];
        };
        formatters = {
          rustfmt.command = pkgs.lib.getExe pkgs.rustfmt;
          autopep8.command = pkgs.lib.getExe pkgs.python313Packages.autopep8;
        };
      };
    };

    clangd-extensions = {
      enable = true;
    };

    # Filetree
    neo-tree = {
      enable = true;
      settings = {
        enableDiagnostics = true;
        enableGitStatus = true;
        enableRefreshOnWrite = true;
        closeIfLastWindow = false;
        popupBorderStyle = "rounded";
        buffers.bindToCwd = false;
        buffers.followCurrentFile.enabled = true;
        window = {
          mappings = {
            h = "navigate_up";
            l = "set_root";
            n = "toggle_node";
            "<space>" = "none";
          };
        };
        filesystem = {
          hijackNetrwBehavior = "open_current";
          bindToCwd = false;
        };
      };
    };

    nix.enable = true;

    lint = {
      enable = true;
      lintersByFt = {
        bash = [ "shellcheck" ];
        nix = [
          "deadnix"
          "nix"
        ];
      };
      linters = {
        deadnix.cmd = pkgs.lib.getExe pkgs.deadnix;
        shellcheck.cmd = pkgs.lib.getExe pkgs.shellcheck;
      };
    };

    # Various functions: find_files, live_grep
    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        manix.enable = true;
        media-files.enable = true;
      };
      settings = {
        defaults = {
          set_env.COLORTERM = "truecolor";
        };
        pickers.colorscheme.enable_preview = true;
      };
    };

    lazygit = {
      enable = true;
    };
    gitsigns.enable = true;

    floaterm = {
      enable = true;
      settings = {
        keymap_toggle = "<F12>";
        keymap_next = "<F11>";
        keymap_prev = "<F10>";
        keymap_kill = "<F9>";
      };
    };

    # Markdown preview
    markview = {
      enable = true;
      settings.preview = {
        icon_provider = "devicons";
      };
    };

    # Projects and sessions
    project-nvim = {
      enable = true;
      enableTelescope = true;
    };

    # Tasks
    overseer = {
      enable = true;
    };
  };

  extraPackages = with pkgs; [ ripgrep ]; # For Telescope live_grep
  colorschemes.tokyonight.enable = true;
  performance.byteCompileLua = {
    enable = true;
    configs = true;
    initLua = true;
    luaLib = true;
    nvimRuntime = true;
  };

  extraConfigLua = ''
    -- Reading trusted .nvim.lua files in project directories, as opts.exrc
    -- isn't supported on Nixvim (see https://github.com/nix-community/nixvim/issues/3506)
    local function secure_nvimlua_load()
      local path

      -- Find first directory with .git/ upwards, else use cwd
      local git_dir = vim.fs.find('.git', { upward = true, type = 'directory' })[1]
      if git_dir then
        path = vim.fs.dirname(git_dir) .. '/.nvim.lua'
      else
        path = vim.fn.getcwd() .. '/.nvim.lua'
      end

      -- If no .nvim.lua found, silently fail, else notify
      if vim.fn.filereadable(path) == 1 then
        if vim.secure.read(path) ~= nil then
          local ok, err = pcall(dofile, path)
          if not ok then vim.notify('.nvim.lua error: ' .. err, vim.log.levels.ERROR) end
        else
          vim.notify('.nvim.lua not trusted: ' .. path, vim.log.levels.WARN)
        end
      end
    end

    save_nvimlua_load()
  '';
}
