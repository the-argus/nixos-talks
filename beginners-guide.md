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

Note: State is bad because it's stuff that may not be on another person's
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


---

## Making your first flake

