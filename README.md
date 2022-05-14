# GNU-S1500

[TI S1500 / HP 9000-1500] TI-contributed GNU toolchain (public)

## Contents

* GCC 1.37.1.1, TI S1500 version 1.1.06
* GDB 3.1.1,  TI S1500 version 1.2
* GAS 1.34, TI S1500 version 1.34.1

## Notes

* Changes from upstream versions appear to be mostly self-contained (*i.e.* `#ifdef ti1500`).
* Several source files seem to be slightly newer than the distributed compiled binaries.
* The binaries, as distributed, are functional and can be used to build working programs.

## Branches

* The [original](https://github.com/TI-S1500/GNU-S1500/tree/original)
  branch contains all files exactly as originally distributed.
  * The [tape archives](https://github.com/TI-S1500/GNU-S1500/tree/original/dist)
    as originally distrubuted are kept in this branch.
* The [master](https://github.com/TI-S1500/GNU-S1500/tree/master)
  branch will be used for fixes and updates.
