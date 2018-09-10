#!/bin/sh

TEST_PATH="/var/lib/php/twig_renderer/tests/"

cd $TEST_PATH
export OBJECT=variables

OUTPUT=$(php /bin/renderer.php env_var_test.txt.twig)
EXPECTED=$(cat $TEST_PATH/env_var_test.txt)

if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test failed!"
    echo "$OUTPUT - output"
    echo "$EXPECTED - expected"

    exit 1
else
    echo "Test passed"
    exit 0
fi
