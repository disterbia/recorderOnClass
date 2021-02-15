## 0.1.0

* Initial release.

## 0.1.1

* Fix third-party repos in Android build. Now they are downloaded by the Gradle build if they don't exist.

## 0.1.2

* SampleDescriptor uses default values for most properties.
* README is updated to explain how to build a sampler without an SFZ.
* "pitch" has been replaced with "noteNumber" in all the public APIs.
* Minor refactoring in sfz_parser.dart

## 0.1.3

* Merged PR to expose presetIndex: https://github.com/mikeperri/flutter_sequencer/pull/2

## 0.1.4

* Merge PR to fix presetIndex assignment: https://github.com/mikeperri/flutter_sequencer/pull/7
* Fix iOS release mode issue: https://github.com/mikeperri/flutter_sequencer/issues/8
