#!/bin/sh
set -e

# First argument is template file full path.
php /bin/renderer.php "$@"
