# paneru fork

Upstream: https://github.com/karinushka/paneru

Base revision: `f79b66ca34c217af1dbf779c9e2fd7a475277c99`. Upstream ancestry and license attribution are retained.

Nix packaging for the standard and Lua variants, with nix-darwin and Home Manager modules.

## Build

```sh
nix build .#packages.<system>.<package>
```

Supported packages and native systems are listed in `nix/platforms.json`.

## CI

Build and upstream-sync drafts are under `ci/disabled/` and are inactive there.
Darwin and Linux builds are separate where supported. See
[ci/ATTIC.md](ci/ATTIC.md) for optional binary-cache publication and
[ci/UPSTREAM-SYNC.md](ci/UPSTREAM-SYNC.md) for upstream maintenance.
