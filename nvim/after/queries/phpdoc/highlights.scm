; inherits: phpdoc
; vim: set ts=2 sw=2:

(primitive_type) @type.primitive

(array_type ["<" ">"] @punctuation.bracket)

(variable_name "$" @parameter)

(union_type
  "|" @keyword.pipe)

(variable_name
  "$" @keyword.dollar)
