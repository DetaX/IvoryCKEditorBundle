#!/usr/bin/env bash

set -e

SYMFONY_VERSION=${SYMFONY_VERSION-3.4.*}
COMPOSER_PREFER_LOWEST=${COMPOSER_PREFER_LOWEST-false}

composer require --no-update --dev symfony/asset:${SYMFONY_VERSION}
composer require --no-update --dev symfony/console:${SYMFONY_VERSION}
composer require --no-update symfony/framework-bundle:${SYMFONY_VERSION}
composer require --no-update symfony/form:${SYMFONY_VERSION}
composer require --no-update --dev symfony/templating:${SYMFONY_VERSION}
composer require --no-update --dev symfony/twig-bridge:${SYMFONY_VERSION}
composer require --no-update --dev symfony/yaml:${SYMFONY_VERSION}

composer remove --no-update --dev friendsofphp/php-cs-fixer

composer update --prefer-source `if [ "$COMPOSER_PREFER_LOWEST" = true ]; then echo "--prefer-lowest --prefer-stable"; fi`
