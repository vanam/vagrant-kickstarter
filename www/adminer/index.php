<?php

declare(strict_types=1);

if (isset($_SERVER['HTTP_X_FORWARDED_FOR']) || !isset($_SERVER['REMOTE_ADDR']) ||
	filter_var(
    $_SERVER['REMOTE_ADDR'],
    FILTER_VALIDATE_IP,
    FILTER_FLAG_IPV4 | FILTER_FLAG_IPV6 | FILTER_FLAG_NO_PRIV_RANGE |  FILTER_FLAG_NO_RES_RANGE
	)) {
	header('HTTP/1.1 403 Forbidden');
	echo 'Adminer is available only from private network';
	for ($i = 2e3; $i; $i--) {
		echo substr(" \t\r\n", rand(0, 3), 1);
	}
	exit;
}


$root = __DIR__ . '/../../vendor/dg/adminer-custom';

if (!is_file($root . '/index.php')) {
	echo "Install Adminer using `composer install`\n";
	exit(1);
}


require $root . '/index.php';
