# Changelog

All Notable changes to `php-psr` will be documented in this file.

Updates should follow the [Keep a CHANGELOG](http://keepachangelog.com/) principles.

## [1.1.0] - 2021-04-10

### Changed
- Update psr/container to 1.1.1

### Added
- Version ID constants to each header

### Fixed
- Use __dllspec(dllimport) where appropriate in php_psr.h on windows

## [1.0.1] - 2020-11-12

### Fixed 
- Test failures on PHP 8 in psr-http-client and psr-http-message due to changes in inheritance
- Compile failures with clang
- Compatibility with API changes to PHP 8 in psr-log (@remicollet)
- Report proper default value in reflection for LoggerInterface - PHP 8 only ([GH-78](https://github.com/jbboehr/php-psr/issues/78))

## [1.0.0] - 2020-02-18

### Changed
- Drop max PHP version constraint in package.xml

## [0.7.0] - 2019-08-12

### Added
- Preliminary PHP 7.4 and 8.0 (master) support
- PSR-14 Event Dispatcher support

### Removed
- PHP 5 support

## [0.6.1] - 2018-11-13

### Fixed 
- Test failures on PHP 5.6

## [0.6.0] - 2018-11-11

### Added
- PSR-18 HTTP Client support

## [0.5.1] - 2018-10-29

### Fixed 
- `Psr\Http\Message\ServerRequestInterface` did not actually extend `Psr\Http\Message\RequestInterface`

## [0.5.0] - 2018-09-10

### Added
- PSR-17 HTTP Factories support
- Whitelist PHP 7.3

## [0.4.0] - 2018-03-05

### Added
- PSR-15 HTTP Handlers support

## [0.3.0] - 2018-02-08

### Added
- PSR-11 Container support
- PSR-13 Link support
- PSR-16 Simple Cache support
- Windows support

### Removed
- No longer run CI against PHP 5 due to lack of support in libraries

### Fixed 
- TypeError when no argument is passed to methods in AbstractLogger

## [0.2.3] - 2016-05-05

### Changed
- Changed the license from `LGPLv3` to `Simplified BSD License`
- Move PHP5/7 compatibility macros into separate header

## [0.2.2] - 2016-03-16

### Added
- arginfo for interfaces in headers

### Fixed 
- Memory leak in Psr\Log\AbstractLogger::log()
 
## [0.2.1] - 2015-12-15

### Changed
- PSR-6 [psr/cache](https://github.com/php-fig/cache) v1.0.0 is released without changes to interfaces since commit [4908941](https://github.com/php-fig/cache/commit/4908941)
- Test PSR-6 interfaces against Stash v1.0.0-dev branch

### Fixed
- Memory leak in Psr\Log\AbstractLogger::log() with PHP7

## [0.2.0] - 2015-12-09

### Changed
- Update PSR-6 interfaces for commits up to [4908941](https://github.com/php-fig/cache/commit/4908941)

### Fixed
- Invalid read in Psr\Log\AbstractLogger::log()

## 0.1.0 - 2015-08-07

### Added
- PSR-3 [psr/log](https://github.com/php-fig/log) v1.0.0 interfaces and classes
- PSR-6 [commit 2b812a4](https://github.com/php-fig/fig-standards/commit/2b812a4) interfaces
- PSR-7 [psr/http-message](https://github.com/php-fig/http-message) v1.0.0 interfaces


[Unreleased]: https://github.com/jbboehr/php-psr/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/jbboehr/php-psr/compare/v1.0.1...v1.1.0
[1.0.1]: https://github.com/jbboehr/php-psr/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/jbboehr/php-psr/compare/v0.7.0...v1.0.0
[0.7.0]: https://github.com/jbboehr/php-psr/compare/v0.6.1...v0.7.0
[0.6.1]: https://github.com/jbboehr/php-psr/compare/v0.6.0...v0.6.1
[0.6.0]: https://github.com/jbboehr/php-psr/compare/v0.5.1...v0.6.0
[0.5.1]: https://github.com/jbboehr/php-psr/compare/v0.5.0...v0.5.1
[0.5.0]: https://github.com/jbboehr/php-psr/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/jbboehr/php-psr/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/jbboehr/php-psr/compare/v0.2.3...v0.3.0
[0.2.3]: https://github.com/jbboehr/php-psr/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/jbboehr/php-psr/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/jbboehr/php-psr/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/jbboehr/php-psr/compare/v0.1.0...v0.2.0
