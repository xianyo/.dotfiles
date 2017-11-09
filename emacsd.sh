#!/bin/bash

[[ -z $(ps -C 'emacs --daemon' -o pid=) ]] && nohup emacs --daemon >/dev/null 2>&1 >&/dev/null
