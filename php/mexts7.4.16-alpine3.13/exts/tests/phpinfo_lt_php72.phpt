--TEST--
psr phpinfo
--SKIPIF--
<?php
include('skip.inc');
if (PHP_VERSION_ID >= 70200) {
    print "skip Due to version incompatibility";
}
?>
--FILE--
<?php
phpinfo(INFO_MODULES);
--EXPECTF--
%A
psr
%A
Version => %s
Released => %s
Authors => %s
PSR-3 Log Version => %d.%d.%d
PSR-6 Cache Version => %d.%d.%d
PSR-7 Http Message Version => %d.%d.%d
PSR-11 Container Version => %d.%d.%d
PSR-13 Link Version => %d.%d.%d
PSR-15 HTTP Handlers (Server Handler) => %d.%d.%d
PSR-15 HTTP Handlers (Middleware) => %d.%d.%d
PSR-16 Simple Cache Version => %d.%d.%d
PSR-17 HTTP Factories => %d.%d.%d
PSR-18 HTTP Client => %d.%d.%d
%A
