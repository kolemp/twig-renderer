#!/bin/sh
set -e

if [ "$TEST_MODE" == "1" ]; then
    /var/lib/php/twig_renderer/tests/test.sh
else
    # First argument is template file full path.
    php /bin/renderer.php "$@"
fi