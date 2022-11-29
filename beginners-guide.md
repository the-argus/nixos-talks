# Beginners Guide to Nix

The package manager *and* the language

---

## The target audience for this talk

- Frustrated arch users

Note: Frustrated arch users- those who like the AUR but wish things weren't so
needlessly complex and unstable. next, let's talk about the target audience for
nix itself

---

## The target audience for nix

- Stable distro users who want the AUR
- Arch users who want stability
- Gentoo users who don't want to compile absolutely everything
- MacOS users, actually

---

## Searching nixpkgs

Nixpkgs - a repository of Nix code
<br>
The search command: ``nix search nixpkgs [packagename]``

Note: You can find all this in ``man nix``

---

## Installing a package from nixpkgs

```txt
> nix search nixpkgs qtile
* legacyPackages.x86_64-linux.qtile (0.22.1)
  A small, flexible, scriptable tiling window manager written in Python
> _
```

---

## Making your first flake

Note: once you have nix installed
