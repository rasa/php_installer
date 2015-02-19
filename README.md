# php_installer

php_installer lets you download and install PHP 5, the PECL extensions,
the PHP Manual (English) in Windows Help (CHM) Format, and the Zend Optimizer,
which are available at http://www.php.net, and http://zend.com.

php_installer also performs the following:

* copies php.ini-recommended to php.ini and sets the following settings:
````
  extension_dir="C:\Program Files\php\ext"
  error_log="C:\Program Files\php\logs\phperror.log"
  upload_tmp_dir="C:\Program Files\php\uploads"
  session.save_path="C:\Program Files\php\sessions"
````

* Adds the following variables to your environment:

   `PHPRC=C:\Program Files\php`

* Adds the installation directory (typically
  `%ProgramFiles%\php`) to your PATH environment variable.

php_installer looks in the directory where php_installer.exe is for
any files it needs before attempting to download them. If it does download a
file, it will attempt to save a copy of the file in this same directory.

Note: you are responsible to verify that each program you install using
php_installer is designed to work in your environment.
If you are unsure, then please visit http://www.php.net for more information.

## Usage

````
php_installer [options]

Options:
/S         Install the application silently with the default options selected
/D=path    Install into the directory 'path' (default is
           %ProgramFiles%\PHP)
/INSTYPE n Where n is a number between 0 and 7:
           1: PHP VC6 for Apache, PECL, and Manual (Default)
           2: PHP VC9 for IIS, PECL, and Manual
           3: PHP VC6 for Apache (Only)
           4: PHP VC6 for IIS (Only)
           5: PECL Extensions (Only)
           6: PHP Manual Only (CHM English)
           7: Zend Optimizer (Only)

The following options are planned to be implemented in a future version:

/SAVEDIR d Save downloaded files in directory d
/PROXY     Set proxy settings
/RETRIES n Number of times to retry each download before reporting failure
           (default: 5)
/ALLUSERS  Install icons for all users
           This is the default if the user is an administrator
/USER      Install icons for the current user only
           This is the default if the user is not an administrator
/VERSION   Show the version and quit
/?         Show this help message and quit

````

## Contributing

To contribute to this project, please see [CONTRIBUTING.md](CONTRIBUTING.md).

## Bugs

To view existing bugs, or report a new bug, please see the [issues](/issues) page for this project.

## License

This project is [MIT licensed](LICENSE).

## Changelog

Please see [CHANGELOG.md](CHANGELOG.md) for the version history for this project.

## Contact

This project was originally developed by [Ross Smith II](mailto:ross@smithii.com).
Any enhancements and suggestions are welcome.
