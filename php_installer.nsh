# Copyright (c) 2005-2015 Ross Smith II (http://smithii.com). MIT Licensed.

!define PHP_YTS_URL "http://windows.php.net/downloads/releases/php-${PHP_VER}-Win32-VC11-x86.zip"
!define PHP_NTS_URL "http://windows.php.net/downloads/releases/php-${PHP_VER}-nts-Win32-VC11-x86.zip"

!insertmacro DownloadCLI "1 2          " "PHP ${PHP_VER} for Apache" "${PHP_YTS_URL}"	"" ''
!insertmacro DownloadCLI "    3 4      " "PHP ${PHP_VER} for IIS" "${PHP_NTS_URL}"	"" ''
!insertmacro DownloadGUI "1   3        7" "PHP Manual (English CHM Version)" "http://www.php.net/distributions/manual/php_manual_chm.zip"	"chm\php_manual_en.chm" "chm" ''

!insertmacro DownloadCLI "1       5    " "APCU for Apache" "http://windows.php.net/downloads/pecl/snaps/apcu/4.0.7/php_apcu-4.0.7-5.6-ts-vc11-x86.zip"	"" ''
!insertmacro DownloadCLI "    3     6  " "APCU for IIS" "http://windows.php.net/downloads/pecl/snaps/apcu/4.0.7/php_apcu-4.0.7-5.6-nts-vc11-x86.zip"	"" ''
