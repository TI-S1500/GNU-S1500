# GNU-S1500

[TI S1500 / HP 9000-1500] TI-contributed GNU toolchain (public)

## Overview

* [GCC](gcc) 1.37.1.1
  * TI S1500 version 1.1.06
* [GDB](/gdb) 3.1.1
  * TI S1500 version 1.2
* [GAS](/gas) 1.34
  * TI S1500 version 1.34.1

## Notes

* Changes from upstream appear mostly self-contained.
  * Search "[`#ifdef ti1500`](https://github.com/TI-S1500/GNU-S1500/search?q=%22%23ifdef+ti1500%22&type=)" to see  these modifications.
* Several source files seem to be slightly newer than the distributed binaries.
* The toolchain, as distributed, is functional and able to build working programs.

## Development

* **Although future GCC development will most likely occur in the** [***GCC-1.x***](https://github.com/TI-S1500/GCC-1.x) **repository**,
  * [Pull requests](https://github.com/TI-S1500/GNU-S1500/pulls) for bug-fixes and
    improvements to the code in this repository will be accepted, and,
  * [Issues](https://github.com/TI-S1500/GNU-S1500/issues) should be opened to track bugs and defects in this code.

## Licensing

* GCC is distributed under the
  [GNU General Public License, version 1](https://github.com/TI-S1500/GNU-S1500/blob/master/gcc/COPYING)
* GDB is distributed under the
  [GDB General Public License, 11 Feb 1988](https://github.com/TI-S1500/GNU-S1500/blob/master/gdb/COPYING)
* GAS is distributed under the
  [GNU General Public License, version 1](https://github.com/TI-S1500/GNU-S1500/blob/master/gas/COPYING)

## Branches

* The branch [original](https://github.com/TI-S1500/GNU-S1500/tree/original)
  contains all files, exactly as originally distributed.
  * The [tape archive files](https://github.com/TI-S1500/GNU-S1500/tree/original/dist),
    as originally distributed, are kept in this branch.
* The branch [master](https://github.com/TI-S1500/GNU-S1500/tree/master)
  will be used for fixes and updates.
