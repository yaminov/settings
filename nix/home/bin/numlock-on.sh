#!/bin/sh


if [ -f /usr/bin/numlockx  ] ; then
    echo 'NumLock mode ON'
    numlockx on
else 
    echo "W: cannot turn on NumLock mode: 'numlockx' utility not found"
fi
