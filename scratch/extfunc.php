<?php

$functions  = get_defined_functions()['internal'] ?? [];
$extensions = []; // get_loaded_extensions(true);
foreach ($extensions as $extension)
    $functions = array_merge($functions, get_extension_funcs($extension));

foreach ($functions as $function)
    echo "\"{$function}\"" . PHP_EOL;
