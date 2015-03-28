# php_installer [![Flattr this][flatter_png]][flatter]

Download and install PHP 5, selected PECL extensions,
the PHP Manual (English) in Windows Help (CHM) Format
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

* Adds the installation directory to your PATH environment variable.
	On 32-bit systems, this directory is usually `C:\Program Files\PHP`.
	On 64-bit systems, this directory is usually `C:\Program Files(x86)\PHP`.

php_installer looks in the directory where php_installer.exe is for
any files it needs before attempting to download them. If it does download a
file, it will attempt to save a copy of the file in this same directory.

## Usage

````
php_installer [options]

Options:
/S         Install the application silently with the default options selected
/D=path    Install into the directory 'path' (default is
           %ProgramFiles%\PHP)
/INSTYPE n Where n is a number between 0 and 7:
           1: PHP for Apache, PECL Extensions, and Manual (Thread Safe) (Default)
           2: PHP for Apache (Only)
           3: PHP for IIS, PECL Extensions, and Manual (Non-Thread Safe)
           4: PHP for IIS (Only)
           5: PECL Extensions for Apache (Only)
           6: PECL Extensions for IIS (Only)
           7: PHP Manual Only (CHM English)
           8: None
````

## Verify a Release

To verify a release, download the .zip, .sha256, and .asc files for the release 
(replacing php_installer-5.6.7-win32.zip with the release you are verifying):

````
$ wget https://github.com/rasa/php_installer/releases/download/v5.6.7/php_installer-5.6.7-win32.zip{,.sha256,.asc}
````

Next, check that sha256sum reports "OK":
````
$ sha256sum -c php_installer-5.6.7-win32.zip.sha256
php_installer-5.6.7-win32.zip: OK
````

Lastly, check that GPG reports "Good signature":

````
$ gpg --keyserver hkps.pool.sks-keyservers.net --recv-key 0x105a5225b6ab4b22
$ gpg --verify php_installer-5.6.7-win32.zip.asc php_installer-5.6.7-win32.zip
gpg:                using RSA key 0xFF914F74B4BB6EF3
gpg: Good signature from "Ross Smith II <ross@smithii.com>" [ultimate]
...
````

## Contributing

To contribute to this project, please see [CONTRIBUTING.md](CONTRIBUTING.md).

## Bugs

To view existing bugs, or report a new bug, please see [issues](../../issues).

## Changelog

To view the version history for this project, please see [CHANGELOG.md](CHANGELOG.md).

## License

This project is [MIT licensed](LICENSE).

## Contact

This project was created and is maintained by [Ross Smith II][] [![endorse][endorse_png]][endorse]

Feedback, suggestions, and enhancements are welcome.

[Ross Smith II]: mailto:ross@smithii.com "ross@smithii.com"
[flatter]: https://flattr.com/submit/auto?user_id=rasa&url=https%3A%2F%2Fgithub.com%2Frasa%2Fphp_installer
[flatter_png]: http://button.flattr.com/flattr-badge-large.png "Flattr this"
[endorse]: https://coderwall.com/rasa
[endorse_png]: https://api.coderwall.com/rasa/endorsecount.png "endorse"

