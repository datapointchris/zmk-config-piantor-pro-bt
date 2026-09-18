# Piantor AI Context

Read `~/code/zmk/shared/CLAUDE.md` first: it holds the shared behaviors, the `zmk` build tool and the guardrails every board follows, and a session here does not load it.

## Keyboard Details

- **42 keys**: same position numbering as Corne42 (0-35 keys, 36-41 thumbs)
- **ZMK Studio**: enabled via cmake arg `-DCONFIG_ZMK_STUDIO=y`, with the `studio-rpc-usb-uart` snippet in every build
- **Physical layout**: `zmk,physical-layout = &default_layout` chosen in keymap
- **Single firmware per half** — runtime OS switching, no separate macOS/Linux builds
- RGB underglow controls on the SYSTEM layer (`&rgb_ug` bindings)
- `build.yaml` also builds settings-reset firmware for recovering from a bad config

## Layers

Nine layers, BASE 0 through WM_MAC_LAYER 8. **Corne42's table does not apply here** — every layer above index 1 sits at a different number. Count the layer blocks in this board's own keymap.

## Guardrails

- **Must use ZMK v0.3** — `config/west.yml` pins `zmkfirmware/zmk` at `v0.3`, not `main`. Pinned due to build errors on main, not for ZMK Studio.
- The board definition in `config/boards/arm/piantor_pro_bt/` is custom (onboard nRF52840, pin mappings, peripherals) — don't confuse it with upstream ZMK board defs
- `config/boards/shields/nice_view_disp/` is a custom nice!view shield with status widgets, not the standard one. No `build.yaml` target selects it; every build uses the stock `nice_view`
- `config/piantor_pro_bt.keymap` is the stem, so the drawer files are `piantor_pro_bt_keymap.{yaml,svg}`
- `config/piantor_pro_bt.conf` applies to both halves; there are no side-specific `.conf` files, and the board-level defaults live in defconfigs under `config/boards/`
