all:
	docker build -t gullitmiranda/php-fpm 5.6
	docker build -t gullitmiranda/php-fpm:5.6 5.6
	docker build -t gullitmiranda/php-fpm:5.6-debian 5.6-debian

no-cache:
	docker build --rm --no-cache -t gullitmiranda/php-fpm 5.6
	docker build --rm --no-cache -t gullitmiranda/php-fpm:5.6 5.6
	docker build --rm --no-cache -t gullitmiranda/php-fpm:5.6-debian 5.6-debian
