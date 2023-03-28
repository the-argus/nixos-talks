# How To Install the Programs You Need

There are many ways to get your programs on linux. They have upsides and
downsides. When choosing how to install a certain program, you might think about
the following criteria:

1. Is the program available?
2. Is the program available in the version that I want/need?
3. With what method have I installed all the other programs on my computer?
4. How often will the program be updated?
    This can be good or bad. If you're installing your everyday use web browser,
    the answer to this question *must* be: all the time.

5. Who is making sure that the package I'm trying to install isn't actually
malware?
    Distros often come with native repositories, maintained by a team of trusted
    indivuduals who sign their changes, so you can cryptographically verify they
    made it. These teams are asking you, the user, to trust that they tested the
    software before shipping it.
    Other repositories may have no guarantees, and add software from source that
    submits some.

6. Does the program have external dependencies which may change?
    Most programs you will install, especially graphical ones, will be
    *dynamically linked*. That means that they don't include all of the code
    needed to run them. This code should be somewhere else on your system,
    usually in your ``/lib`` or ``/usr/lib`` folder.

    If these dependencies change, the program may break even though the main
    part of its code (the executable binary) didn't update or change.

## Native package manager

### Third-Party repositories

#### The AUR

#### RPM Fusion

## Third-party package managers

### Flatpak

### Appimage

### Nix

## Manual installation

## Building from source
