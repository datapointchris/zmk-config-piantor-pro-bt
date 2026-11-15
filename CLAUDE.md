# Piantor AI Context

Read `~/code/zmk/shared/CLAUDE.md` first: it holds the shared behaviors, the `zmk` build tool and the guardrails every board follows, and a session here does not load it.

## Keyboard Details

- **42 keys**: same position numbering as Corne42 (0-35 keys, 36-41 thumbs)
- **ZMK Studio, the ZMK pin and the `.conf`**: README § "The board" says how each is set and why
- **Physical layout**: `zmk,physical-layout = &default_layout` chosen in keymap
- **Single firmware per half** — runtime OS switching, no separate macOS/Linux builds
- RGB underglow controls on the SYSTEM layer (`&rgb_ug` bindings)
- `build.yaml` also builds settings-reset firmware for recovering from a bad config

## Tasks

`Taskfile.yml` holds the jobs: `task build` (`zmk build`), `task generate` (`zmk align`, then `zmk draw`), `task lint` (the read-only pre-commit hooks) and `task format` (the hooks that rewrite files). `task` alone lists them.

## Layers

Nine layers, BASE 0 through WM_MAC_LAYER 8. **Corne42's table does not apply here** — every layer above index 2 sits at a different number. Count the layer blocks in this board's own keymap.

## Guardrails

- **Must use ZMK v0.3** — `config/west.yml` pins `zmkfirmware/zmk` at `v0.3`, not `main`. README § "The board" gives the reason
- The board definition in `config/boards/arm/piantor_pro_bt/` is custom (onboard nRF52840, pin mappings, peripherals) — don't confuse it with upstream ZMK board defs
- `config/piantor_pro_bt.keymap` is the stem, so the drawer files are `piantor_pro_bt_keymap.{yaml,svg}`
