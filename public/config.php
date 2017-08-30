<?php return array(
    'db' => [
        'host' => 'mysql',
        'port' => '3306',
        'username' => 'shopware',
        'password' => 'shopware',
        'dbname' => 'db',
    ],

    'es' => [
        'enabled' => true,
        'number_of_replicas' => 0,
        'number_of_shards' => 5,
        'client' => [
            'hosts' => [
                'es:9200'
            ]
        ]
    ],
    'front' => [
        'throwExceptions' => true,
        'showException' => true,
    ],
    'template' => [
        'forceCompile' => true,
    ],
    'phpsettings' => [
        'error_reporting' => E_ALL & ~E_USER_DEPRECATED,
        'display_errors' => 1,
        'date.timezone' => 'Europe/Berlin',
    ]

);