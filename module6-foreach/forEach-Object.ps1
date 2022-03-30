# Has an alias of 'ForEach'
# Use when you want to process pipelined objects one at a time
# Use when parameter binding won't work
# -----------------------------------------------------------------
# Multiply all objects separately to number 3

# 2, 5, 6, 8, 9 | ForEach-Object { $_ * 3 }

# Now set parametrized count to mulitply objects
# $_ <----  represents the current object in the pipeline

Param(
    [Parameter(Mandatory, HelpMessage = "Add to number apply")]
    [int32]$Number
)
2, 5, 6, 8, 9 | ForEach-Object { $_ * $Number + $Number }