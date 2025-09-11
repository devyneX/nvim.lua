return {
  {
    "elkowar/yuck.vim",
    enabled = true,
    config = function(_, opts)
      opts.yuck_align_multiline_strings = 1
      opts.yuck_align_subforms = 1
      opts.yuck_align_keywords = 1
      opts.yuck_lisp_indentation = 1
    end,
  },
}
