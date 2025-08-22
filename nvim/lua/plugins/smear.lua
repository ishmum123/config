return {
  "sphamba/smear-cursor.nvim",
  opts = {
    legacy_computing_symbols_support = true,
    cursor_color = "#2D4F2D",  -- Gothic green color
    stiffness = 0.6,           -- Lower stiffness for longer trail
    trailing_stiffness = 0.4,  -- Lower trailing stiffness for longer trail
    stiffness_insert_mode = 0.5,
    trailing_stiffness_insert_mode = 0.5,
    damping = 0.7,             -- Lower damping for longer persistence
    damping_insert_mode = 0.85,
    distance_stop_animating = 0.8,  -- Increased distance before animation stops
    never_draw_over_target = true,
    hide_target_hack = true,
  },
}
