local active_border_color = "rgb(d4a64a)"
local active_shadow_color = "rgba(00000077)" -- was rgba(d4a64a55); same as inactive to avoid Hyprland 0.56.2 shadow color swap flicker
local inactive_border_color = "rgba(4a403899)"
local inactive_shadow_color = "rgba(00000077)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    }
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    shadow = {
      enabled = true,
      range = 8,
      render_power = 3,
      color = active_shadow_color,
      color_inactive = inactive_shadow_color,
    },
  },
})
