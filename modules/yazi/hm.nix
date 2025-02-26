{
  config,
  lib,
  ...
}:
{
  options.stylix.targets.yazi = {
    enable = config.lib.stylix.mkEnableTarget "Yazi" true;
  };

  config = lib.mkIf (config.stylix.enable && config.stylix.targets.yazi.enable) {
    programs.yazi.theme =
      with config.lib.stylix.colors.withHashtag;
      let
        primary = base0D;
        secondary = base0C;
        tertiary = base08;
        accent = base0E;
        background = base00;
        surface = base01;
        surface1 = base02;
        surface2 = base03;
        # onSurface = base04;
        onSurface1 = base05;
        onSurface2 = base06;
        red = base08;
        green = base0B;
        blue = base0D;
        yellow = base0A;

        mkFg = fg: { inherit fg; };
        mkBg = bg: { inherit bg; };
        mkBoth = fg: bg: { inherit fg bg; };
        mkSame = c: (mkBoth c c);
      in
      {
        manager = {
          cwd = mkFg secondary;
          hovered = {
            reversed = true;
          };
          preview_hovered = {
            underline = true;
          };
          find_keyword = {
            fg = yellow;
            bold = true;
            italic = true;
            underline = true;
          };
          find_position = {
            fg = accent;
            bg = "reset";
            bold = true;
            italic = true;
          };
          marker_copied = mkSame green;
          marker_cut = mkSame red;
          marker_marked = mkSame secondary;
          marker_selected = mkSame yellow;
          tab_active = {
            reversed = true;
          };
          tab_inactive = { };
          border_style = mkFg onSurface1;
        };

        mode = {
          normal_main = {
            fg = background;
            bg = primary;
            bold = true;
          };
          normal_alt = mkBoth primary surface;
          select_main = {
            fg = background;
            bg = secondary;
            bold = true;
          };
          select_alt = mkBoth secondary surface;
          unset_main = {
            fg = background;
            bg = tertiary;
            bold = true;
          };
          unset_alt = mkBoth tertiary surface;
        };

        status = {
          progress_label = {
            fg = "#ffffff";
            bold = true;
          };
          progress_normal = mkBoth primary surface1;
          progress_error = mkBoth red surface1;
          perm_sep = mkFg onSurface1;
          perm_type = mkFg blue;
          perm_read = mkFg yellow;
          perm_write = mkFg red;
          perm_exec = mkFg green;
        };

        pick = {
          border = mkFg primary;
          active = {
            fg = accent;
            bold = true;
          };
          inactive = { };
        };

        input = {
          border = mkFg primary;
          selected = {
            reversed = true;
          };
        };

        completion = {
          border = mkFg primary;
        };

        tasks = {
          border = mkFg primary;
          hovered = {
            fg = accent;
            underline = true;
          };
        };

        which = {
          mask = mkBg surface;
          cand = mkFg secondary;
          rest = mkFg onSurface2;
          desc = mkFg accent;
          separator_style = mkFg surface2;
        };

        help = {
          on = mkFg secondary;
          run = mkFg accent;
          hovered = {
            reversed = true;
            bold = true;
          };
          footer = {
            fg = surface;
            bg = onSurface1;
          };
        };

        notify = {
          title_info = mkFg green;
          title_warn = mkFg yellow;
          title_error = mkFg red;
        };

        filetype.rules = [
          {
            mime = "image/*";
            fg = secondary;
          }
          {
            mime = "{audio,video}/*";
            fg = yellow;
          }
          {
            mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}";
            fg = accent;
          }
          {
            mime = "application/{pdf,doc,rtf}";
            fg = green;
          }
          {
            name = "*";
            fg = onSurface1;
          }
          {
            name = "*/";
            fg = primary;
          }
        ];
      };
  };
}
