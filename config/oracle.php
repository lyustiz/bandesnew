<?php

/*return [
    'oracle' => [
        'driver'         => 'oracle',
        'tns'            => env('OCI_DB_TNS', ''),
        'host'           => env('OCI_DB_HOST', ''),
        'port'           => env('OCI_DB_PORT', ''),
        'database'       => env('OCI_DB_DATABASE', ''),
        'username'       => env('OCI_DB_USERNAME', ''),
        'password'       => env('OCI_DB_PASSWORD', ''),
        'charset'        => env('OCI_DB_CHARSET', ''),
        'prefix'         => env('OCI_DB_PREFIX', ''),
        'prefix_schema'  => env('OCI_DB_SCHEMA_PREFIX', 'FLOBA'),
        'server_version' => env('OCI_DB_SERVER_VERSION', ''),
        'schema' => 'FLOBA',
    ],
    
];*/

return [
    'oracle' => [
        'driver' => 'oracle',
        'host' => env('OCI_DB_HOST', ''),
        'port' => env('OCI_DB_PORT', ''),
        'database' => env('OCI_DB_DATABASE', ''),
        'service_name' => env('OCI_DB_SID', ''),
        'username' => env('OCI_DB_USERNAME', ''),
        'password' => env('OCI_DB_PASSWORD', ''),
        'charset' => '',
        'prefix' => '',
    ]
];
