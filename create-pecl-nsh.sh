#!/bin/bash

# Copyright (c) 2005-2015 Ross Smith II (http://smithii.com). MIT Licensed.

export UA="Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36"
export REFERER=http://windows.php.net/downloads/pecl/

wget --mirror --no-parent --referer="$REFERER" --reject "*.zip" --user-agent="$UA" http://windows.php.net/downloads/pecl/
# wget --mirror --no-parent --referer="$REFERER" --user-agent="$UA" http://windows.php.net/downloads/pecl/
