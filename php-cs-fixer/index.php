<?php

$finder = \PhpCsFixer\Finder::create()
    ->exclude('somedir')
    ->notPath('src/Symfony/Component/Translation/Tests/fixtures/resources.php')
    ->in(__DIR__)
;

$config = new \PhpCsFixer\Config();
return $config->setRules([
    /* '@PSR12' => true, */
    /* 'strict_param' => true, */
    'binary_operator_spaces'              => [
        'operators' => [
            '='   => 'align_single_space_minimal', // ALIGN_ASSIGNMENTS
            '=>'  => 'align_single_space_minimal', // ALIGN_KEY_VALUE_PAIRS
            '??'  => 'align_single_space_minimal',
            '??=' => 'align_single_space_minimal',
        ],
    ],
    'align_multiline_comment'             => true,
    'array_indentation'                   => true,
    'array_syntax'                        => ['syntax' => 'short'], // FORCE_SHORT_DECLARATION_ARRAY_STYLE
    'constant_case'                       => ['case' => 'lower'], // LOWER_CASE_BOOLEAN_CONST, LOWER_CASE_NULL_CONST
    'elseif'                              => false, // ELSE_IF_STYLE -> separate
    'multiline_comment_opening_closing'   => true,
    'phpdoc_add_missing_param_annotation' => false,
    'phpdoc_align'                        => true, // ALIGN_PHPDOC_PARAM_NAMES
    'phpdoc_indent'                       => true,
    'phpdoc_scalar'                       => ['types' => ['boolean', 'callback', 'double', 'integer', 'real', 'str']],
    'phpdoc_trim'                         => true, // similar to PHPDOC_BLANK_LINE_BEFORE_TAGS
    'single_import_per_statement'         => false, // I think GROUP_USE_WRAP
    'space_after_semicolon'               => true,
    'trailing_comma_in_multiline'         => ['elements' => []],
    'trim_array_spaces'                   => true,
    'whitespace_after_comma_in_array'     => true,
    'not_operator_with_successor_space'   => true
])
->setFinder($finder);
