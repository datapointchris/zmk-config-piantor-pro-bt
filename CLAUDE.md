# Piantor AI Context

## Ecosystem

All ZMK repos live under `~/code/zmk/`. See `~/code/zmk/shared/CLAUDE.md` for shared behaviors, layer defines, and build tools.

## Key Files

| File | Purpose |
| --- | --- |
| `config/piantor_pro_bt.keymap` | Keymap with 9 layers, combos, conditional layers, ZMK Studio physical layout |
| `config/west.yml` | West manifest — pulls zmk-shared + upstream ZMK **v0.3** |
| `build.yaml` | Build matrix: Piantor Pro BT left/right + settings_reset variants |
| `config/boards/arm/piantor_pro_bt/` | Custom board definition (onboard nRF52840, pin mappings, peripherals) |
| `config/boards/shields/nice_view_disp/` | Custom nice!view shield with status widgets |
| `Makefile` | Standard targets — see `~/code/zmk/shared/CLAUDE.md` |
| `keymap_drawer.config.yaml` | Keymap-drawer config for this keyboard |
| `keymap_align.toml` | Keymap-align config |

## Keyboard Details

- **42 keys**: same position numbering as Corne42 (0-35 keys, 36-41 thumbs)
- **ZMK source**: `zmkfirmware/zmk@v0.3` (pinned for build compatibility, NOT `main`)
- **ZMK Studio**: enabled via cmake arg `-DCONFIG_ZMK_STUDIO=y`
- **Physical layout**: `zmk,physical-layout = &default_layout` chosen in keymap
- **Single firmware per half** — runtime OS switching, no separate macOS/Linux builds

## Layers

Same 9-layer architecture as Corne42. See `~/code/zmk/corne42/CLAUDE.md` for layer table.

## Piantor-Specific Features

- RGB underglow controls on SYSTEM layer (`&rgb_ug` bindings)
- Custom nice!view display shield with widgets (`config/boards/shields/nice_view_disp/`)
- `studio-rpc-usb-uart` snippet in all builds for ZMK Studio
- Settings reset firmware variants for recovering from bad configs

## Guardrails

See `~/code/zmk/shared/CLAUDE.md` guardrails for the universal build-before-commit rule and the runtime-OS-switching rules (combos must include `OS_MAC_LAYER`; Shift uses `hmls`/`hmrs`) — piantor is a runtime-OS-switching board, so both apply here. Board-specific:

- **Must use ZMK v0.3** — `west.yml` pins `v0.3`, not `main`. Pinned due to build errors on main, not for ZMK Studio.
- Board definitions in `config/boards/` are custom — don't confuse with upstream ZMK board defs
- The `nice_view_disp` shield is NOT the standard nice!view shield — it's a custom implementation with status widgets
- Makefile `align`/`draw` only target `piantor_pro_bt.keymap`
- No standalone `.conf` files in `config/` — configuration lives in board defconfigs under `config/boards/`
