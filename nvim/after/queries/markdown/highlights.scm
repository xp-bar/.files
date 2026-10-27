; inherits: markdown
; vim: set ts=2 sw=2:

(inline
  ("#" @tag)
)

(fenced_code_block
  (info_string
    (language) @injection.language))

(fenced_code_block
  (fenced_code_block_delimiter) @fenced.delimiter)
