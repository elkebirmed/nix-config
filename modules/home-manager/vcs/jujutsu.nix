# ============================================================================
# Jujutsu - Version control system.
# - https://jj-vcs.github.io/jj/latest/
# ============================================================================
{
  config,
  lib,
  ...
}: {
  programs.jujutsu = {
    enable = lib.mkDefault true;

    settings = {
      user = {
        name = config.programs.git.settings.user.name;
        email = config.programs.git.settings.user.email;
      };

      ui = {
        pager = lib.mkDefault "less -FRX";
        show-cryptographic-signatures = lib.mkDefault true;
      };

      revset-aliases = {
        "closest_bookmark(to)" = "heads(::to & bookmarks())";
      };

      aliases = {
        # Advances closest bookmark to parent commit
        tug = ["bookmark" "move" "--from" "closest_bookmark(@-)" "--to" "@-"];
      };

      template-aliases = {
        "gerrit_change_id(change_id)" = ''
          "Id0000000" ++ change_id.normal_hex()
        '';
      };

      templates = {
        draft_commit_description = ''
          concat(
            description,
            indent("JJ: ", concat(
              if(
                !description.contains("Change-Id: "),
                "Change-Id: " ++ gerrit_change_id(change_id) ++ "\n",
                "",
              ),
              "Change summary:\n",
              indent("     ", diff.summary()),
              "Full change:\n",
              "ignore-rest\n",
            )),
            diff.git(),
          )
        '';
      };
    };
  };
}
