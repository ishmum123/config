return {
  "sphamba/smear-cursor.nvim",
  opts = {
    legacy_computing_symbols_support = true,
    cursor_color = "#50FF50",  -- Brighter gothic green for better visibility
    stiffness = 0.5,           -- Even lower stiffness for more pronounced trail
    trailing_stiffness = 0.3,  -- Lower trailing stiffness for more visible trail
    stiffness_insert_mode = 0.4,
    trailing_stiffness_insert_mode = 0.4,
    damping = 0.6,             -- Lower damping for more persistent trail
    damping_insert_mode = 0.75,
    distance_stop_animating = 1.0,  -- Longer visible distance
    never_draw_over_target = true,
    hide_target_hack = true,
  },
}
