# ============================================================================
# Neovim LSP.
# - https://nix-community.github.io/nixvim/
# ============================================================================
{
  config,
  inputs,
  lib,
  ...
}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true; # Enable built-in LSP configuration

        inlayHints = true; # Enable inlay hints

        servers = {
          asm_lsp.enable = true;
          bashls.enable = true;
          ccls.enable = true;
          cssls.enable = true;
          dockerls.enable = true;
          docker_compose_language_service.enable = true;
          emmet_ls.enable = true;
          eslint.enable = true;
          golangci_lint_ls.enable = true;
          gopls.enable = true;
          helm_ls.enable = true;
          html.enable = true;
          htmx.enable = true;
          hyprls.enable = true;
          jsonls.enable = true;
          just.enable = true;
          lua_ls.enable = true;
          marksman.enable = true;
          nginx_language_server.enable = true;
          nushell.enable = true;
          phan.enable = true;
          phpactor.enable = true;
          pylsp.enable = true;
          qmlls.enable = true;
          superhtml.enable = true;
          svelte.enable = true;
          systemd_ls.enable = true;
          tailwindcss.enable = true;
          taplo.enable = true;
          terraformls.enable = true;
          tflint.enable = true;
          tilt_ls.enable = true;
          ts_ls.enable = true;
          vimls.enable = true;
          vue_ls.enable = true;
          yamlls.enable = true;
          zls.enable = true;

          nixd = {
            enable = true;

            settings = {
              formatting.command = ["alejandra"];
              nixpkgs.expr = "import <nixpkgs> {}";
            };
          };

          rust_analyzer = {
            enable = true;

            installRustc = false;
            installCargo = false;
          };
        };
      };
    };
  };
}
