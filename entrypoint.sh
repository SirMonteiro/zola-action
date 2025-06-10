#!/bin/sh
set -e

ARGS=""

if [ "$INPUT_CHECK" = "true" ]; then
    CMD="check"
    [ "$INPUT_DRAFTS" = "true" ] && ARGS="$ARGS --drafts"
    [ "$INPUT_CHECK_SKIP_EXTERNAL_LINKS" = "true" ] && ARGS="$ARGS --skip-external-links"
else
    CMD="build"

    [ "$INPUT_DRAFTS" = "true" ] && ARGS="$ARGS --drafts"
    [ "$INPUT_MINIFY" = "true" ] && ARGS="$ARGS --minify"
    [ -n "$INPUT_BASE_URL" ] && ARGS="$ARGS --base-url \"$INPUT_BASE_URL\""
    [ -n "$INPUT_OUTPUT_DIR" ] && ARGS="$ARGS --output-dir \"$INPUT_OUTPUT_DIR\""
fi

echo "Running: zola $CMD$ARGS on version $(zola --version | cut -d ' ' -f 2)"
sh -c "zola $CMD $ARGS"
