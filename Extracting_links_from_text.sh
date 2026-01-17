#!/bin/bash

INPUT="$1"

grep -o '\[[^]]*\]' "$INPUT" | tr -d '[]' > nume.tmp

grep -o '([^)]*)' "$INPUT" | tr -d '()' > linkuri.tmp

paste -d ' ' nume.tmp linkuri.tmp

rm nume.tmp linkuri.tmp
