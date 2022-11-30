# Beginners Guide to Nix

A package manager

---

## Warning: It's not actually a package manager

It's a:

- build system
- functional programming language
- operating system
- a package repository

Note: There are a lot of semantics which suck but... you get used to them

---

## A quick definition

STATE: (noun) A condition or mode of being, as with regard to circumstances.

STATE: (noun, with regard to computer science) Stuff that goes away if you
re-install your operating system

Note: State may also be stuff that goes away if you delete and re-clone your git
repo. State is bad because it's stuff that may not be on another person's
computer, or stuff that you could lose if you're not careful.

---

### Pros and Cons of nix / nixpkgs / nixOS

Pros | Cons
---|---
No more dependency hell | You have to learn (some of) a new programming language
Git track changes to your system <br> (allows for rollbacks) | Systemd dependant
If a build works once, it will work forever* |
If a build works on your machine, it will work on another** |

Note:

\* its possible that the source code used to build the package could be hosted at
a different domain or something
\** this isn't entirely guaranteed cross-architecture, its possible for a build
to only support linux or only x86_64 etc

nix is like the better docker: instead of adding a layer of complexity on top of
the already complex original problem, they just... fixed the original problem

---

## Installation

- If nix is in your package manager, use the package
- Otherwise: ``sh <(curl -L https://nixos.org/nix/install) --daemon``
- Enjoy never having any state on your computer ever again

---

## Your first steps

A new command should now be in your path: ``nix``. It's worth checking out
``man nix``.
<br>
<br>
\* you may have to add the following line to ``/etc/nix/nix.conf``:
```
extra-experimental-features = nix-command flakes
```

Note: adding lines to nix.conf may be state, but if you use NixOS you can
have nix manage that file

Now, time to learn about the great many sub-commands of the nix command

---

## Searching nixpkgs

Nixpkgs - a repository of Nix code
<br>
The search command: ```nix search nixpkgs [packagename]```

An example:

```txt
> nix search nixpkgs qtile
* legacyPackages.x86_64-linux.qtile (0.22.1)
  A small, flexible, scriptable tiling window manager written in Python
> _
```

---

## Installing a package from nixpkgs

``nix-shell -p [packagename]``

An ephermeral shell with the package installed. A practical example:

``nix-shell -p clang-tools gdb clang gtk4``

Note: Typing this command in every time is pretty annoying. Also, the versions
of these packages are based on a not entirely stateless system called "channels."
We're not going to cover all of the stateful legacy commands, because nix is much
too complicated if you add those in. Instead, lets try flakes!

---

## Making your first flake

First, run ``nix flake init``. That will give you a file called ``flake.nix``
that looks something like this:

```nix
{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.hello =
      nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default =
      self.packages.x86_64-linux.hello;

  };
}
```

Note: I ask you to suspend any disbelief or curiosity you may have as to the
syntax of the nix language or what exactly is going on here. A bunch of stuff
here is nix "magic" and we'll go over it later in the talk.

---

## Some upgrades to the flake

The flake is missing explicit inputs. Lets add these after the description.

```nix
{
  description = "...";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-22.05";
    };
  };

  outputs = {...};
}
```

Let's also run ``git init && git add .``

Note: We're choosing specifically nixos-22.05 because we want the stable release
of nixpkgs for this flake. If you prefer unstable for your usecase, use the
nixos-unstable branch instead

---

## Building our first package

- run ``nix run`` to build and run the default package.
- see "Hello, World!" appear in the console.
- a symlink to the (read-only) directory with the package in it will appear,
called "result"

Lets make a ``.gitignore``
file and add a line containing ``result``, so it won't be tracked by git.

Note:
When you do this, no actual compilation should occur. The binary has already
been built by other nix users, so it will be cached and simply downloaded. If
you were to apply some patch or compiler flags, then it would build from source.
