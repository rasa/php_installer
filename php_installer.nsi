# Copyright (c) 2005-2015 Ross Smith II (http://smithii.com). MIT Licensed.

!define PHP_VER 5.6.6
!define PECL_VER 5.2.6
#!define ZEND_VER 3.3.3

!define PRODUCT_NAME "php_installer"
!define PRODUCT_DIR "PHP"
#!define PRODUCT_VERSION "1.0"
!define PRODUCT_DESC "PHP Installer ${PRODUCT_VERSION} for PHP ${PHP_VER}"
!define PRODUCT_TRADEMARKS "PHP is copyright (c) 1997-2015 The PHP Group"

!addincludedir "../nsislib"
!addincludedir "nsislib"

!include "config.nsh"

!undef PRODUCT_EXE
!undef PRODUCT_FILE
!define NO_DESKTOP_ICONS
!define ADD_INSTDIR_TO_PATH

!define COPYDIR "$EXEDIR"
#!define NOEXTRACTPATH
!define UNZIP_DIR "$INSTDIR"

# 1:
InstType "PHP ${PHP_VER} for Apache, PECL Extensions, and Manual (Thread Safe)"
# 2:
InstType "PHP ${PHP_VER} for Apache (Only)"

# 3:
InstType "PHP ${PHP_VER} for IIS, PECL Extensions, and Manual (Non-Thread Safe)"
# 4:
InstType "PHP ${PHP_VER} for IIS (Only)"

# 5:
InstType "PECL Extensions for Apache (Only)"
# 6:
InstType "PECL Extensions for IIS (Only)"
# 7:
InstType "PHP Manual (Only)"
#InstType "Zend Optimizer ${ZEND_VER} (Only)"
# 8:
#InstType "All"
# 9:
InstType "None"

!include "common.nsh"

Section "-hidden1"
	CreateDirectory "$INSTDIR\chm"
	File "fixini.php"
	File "setup.iss"
SectionEnd

!include "php_installer.nsh"

!include "WriteEnvStr.nsh"

Section "-hidden2"
	Push PHPRC
	Push "$INSTDIR"
	Call WriteEnvStr
	Var /GLOBAL TEMP_DIR
	StrCpy $TEMP_DIR "$INSTDIR"
	CreateDirectory "$TEMP_DIR\logs"
	CreateDirectory "$TEMP_DIR\sessions"
	CreateDirectory "$TEMP_DIR\uploads"
	CreateDirectory "$TEMP_DIR\wsdl_cache"

	CreateShortCut "$SMPROGRAMS\${PRODUCT_DIR}\Edit php.ini.lnk" "$INSTDIR\php.ini"

	IfFileExists "$INSTDIR\php.ini" phpini_exists 0
		CopyFiles "$INSTDIR\php.ini-recommended" "$INSTDIR\php.ini"
		ExecWait '"$INSTDIR\php.exe" fixini.php "$INSTDIR\php.ini-recommended"' $0
		DetailPrint '"$INSTDIR\php.exe" fixini.php "$INSTDIR\php.ini-recommended" returned error $0'
	phpini_exists:


	IfSilent 0 not_silent
		IfFileExists "$EXEDIR\ZendOptimizer-${ZEND_VER}-Windows-i386.exe" 0 zend_done
			DetailPrint 'Executing "net stop apache2"...'
			ExecWait 'cmd.exe /c start "Stopping Apache..." /min net stop apache2' $0
			DetailPrint '"net stop apache2" returned $0'
			DetailPrint 'Executing "$EXEDIR\ZendOptimizer-${ZEND_VER}-Windows-i386.exe"...'
			ExecWait '"$EXEDIR\ZendOptimizer-${ZEND_VER}-Windows-i386.exe" /s /f1"$INSTDIR\setup.iss"' $0
			DetailPrint '"$EXEDIR\ZendOptimizer-${ZEND_VER}-Windows-i386.exe" returned $0'
			Goto zend_done
	not_silent:
		IfFileExists "$EXEDIR\ZendOptimizer-${ZEND_VER}-Windows-i386.exe" 0 zend_done
			DetailPrint 'Executing "$EXEDIR\ZendOptimizer-${ZEND_VER}-Windows-i386.exe"...'
			ExecWait '"$EXEDIR\ZendOptimizer-${ZEND_VER}-Windows-i386.exe"' $0
			DetailPrint '"$EXEDIR\ZendOptimizer-${ZEND_VER}-Windows-i386.exe" returned $0'
	zend_done:
SectionEnd

Section uninstall
	Push PHPRC
	Call un.DeleteEnvStr
SectionEnd
