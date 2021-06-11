--TEST--
Psr\Cache\InvalidArgumentException
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Cache\CacheException;
use Psr\Cache\InvalidArgumentException;
class MyInvalidArgumentException extends Exception implements InvalidArgumentException {}
$ex = new MyInvalidArgumentException('test');
var_dump($ex instanceof InvalidArgumentException);
var_dump($ex instanceof Exception);
var_dump($ex instanceof CacheException);
try {
    throw $ex;
} catch( InvalidArgumentException $e ) {
    var_dump($e->getMessage());
}
--EXPECT--
bool(true)
bool(true)
bool(true)
string(4) "test"
