# GNU-S1500

[TI S1500 / HP 9000-1500] TI-contributed GNU toolchain (public)

## Overview

* [GCC 1.37.1.1 (TI S1500 version 1.1.06)](/gcc)
* [GDB 3.1.1 (TI S1500 version 1.2)](/gdb)
* [GAS 1.34 (TI S1500 version 1.34.1)](/gas)

## Notes

* Changes from upstream appear mostly self-contained (`#ifdef ti1500`).
* Several source files seem to be slightly newer than the distributed binaries.
* The toolchain, as distributed, is functional and able to build working programs.

## Development

* [Pull requests](https://github.com/TI-S1500/GNU-S1500/pulls) for bug-fixes and
  improvements will be accepted.
* [Issues](https://github.com/TI-S1500/GNU-S1500/issues) should be used for
  defect tracking.

## Branches

* The branch [original](https://github.com/TI-S1500/GNU-S1500/tree/original)
  contains all files, exactly as originally distributed.
  * The [tape archive files](https://github.com/TI-S1500/GNU-S1500/tree/original/dist),
    as originally distributed, are kept in this branch.
* The branch [master](https://github.com/TI-S1500/GNU-S1500/tree/master)
  will be used for fixes and updates.
