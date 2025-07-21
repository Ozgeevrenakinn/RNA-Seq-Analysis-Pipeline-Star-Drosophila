#!/bin/bash

#Birden fazla ornek hizalama kalitesi

for f in mapped/*Log.final.out; do
    echo "$(basename "$f")"
    cat "$f" | grep "Uniquely mapped reads %"
    echo "------"
done
