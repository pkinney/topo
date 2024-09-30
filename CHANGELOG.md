# Change Log

## [1.0.2] - 2024-09-30

### Changed

- Fix warning about matching `0.0` vs `0`

## [1.0.1] - 2024-09-27

### Changed

- Updated Geo dependency to allow for 4.0

## [1.0.0] - 2023-05-31

### Added

- Config option `:epsilon` that provides tolerance for float precision errors.

## [0.5.0] - 2022-02-26

### Fixed

- Fixes issue where linestrings that had a segment outside of a ring were incorrectly reported as contained.

### Changed

- Uses Github Actions instead of TravisCI

## [0.4.0] - 2019-11-16

### Fixed

- Fixes bug where floating point coordinates were not evaluating as equivalent to themselves
