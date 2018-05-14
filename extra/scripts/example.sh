#!/bin/bash

# Define the clock
Clock() {
        DATETIME=$(date "+%a %b %d, %T")

        echo -n "$DATETIME"
}

# Print the clock

while true; do
        echo "%{S1}%{c}%{F#FFFF00}%{B#0000FF} $(Clock) %{F-}%{B-}"
        sleep 1
done
