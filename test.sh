#!/bin/sh

set -e

OUTPUT=$(docker run --rm -e 'OBJECT=variables' -v `pwd`/tests:/data kolemp/twig-renderer:latest env_var_test.txt.twig)
EXPECTED=$(cat tests/env_var_test.txt)

echo $OUTPUT

echo $EXPECTED

if [ "$OUTPUT" != "$EXPECTED" ]; then
    exit 1
fi
