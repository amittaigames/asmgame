# Assembly Game

### About

This is basically just a simple challenge for myself. If your platform is not
supported, and you know assembly, feel free to contribute. This won't be
anything crazy, just a text based RPG Rogue-like or something like that.

### Dependencies

If you'd like to build this on your own machine, the assembly compiler used
was NASM (version 2.11.08), so you'll need that. Otherwise, everything should
be ready to go

If you'd like to build using the Makefile within each platform's folder, you
should also have Make installed.

### Conventions

##### Functions
* Arguments should go in system call argument order
* Return value should be in the D register
* The C version of the function should be documented above
* To make this a learning experience for others, comment code!