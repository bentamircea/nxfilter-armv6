#!/bin/bash

set -e

if [ ! "$(ls -A /nxfilter/conf)" ]
then
        cp -r /nxfilter/conf.defaults/* /nxfilter/conf
fi
