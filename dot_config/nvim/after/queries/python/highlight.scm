; extends
; https://github.com/nvim-treesitter/nvim-treesitter/issues/4392#issuecomment-1448355484

; Module docstring
(module . (expression_statement (string) @comment @fold))

; Class docstring
(class_definition
  body: (block . (expression_statement (string) @comment @fold)))

; Function/method docstring
(function_definition
  body: (block . (expression_statement (string) @comment @fold)))

; Attribute docstring
((expression_statement (assignment)) . (expression_statement (string) @comment @fold))
