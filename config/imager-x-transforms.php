<?php
return [
    'auto' => [
        'transforms' => [
            ['width' => 200],
            ['width' => 800],
            ['width' => 1600],
        ],
        'defaults' => [
            'format' => 'webp',
        ],
    ],
    '1:1' => [
        'transforms' => [
            ['width' => 200],
            ['width' => 800],
            ['width' => 1600],
        ],
        'defaults' => [
            'ratio' => 1,
            'format' => 'webp'
        ],
    ],
    '3:2' => [
        'transforms' => [
            ['width' => 200],
            ['width' => 800],
            ['width' => 1600],
        ],
        'defaults' => [
            'ratio' => 3 / 2,
            'format' => 'webp',
        ],
    ],
];
