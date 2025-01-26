{pkgs, ...}:
{
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%H:%M | %a • %h | %d/%m/%Y' --remember --remember-session --user-menu --window-padding 1 --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];
}
