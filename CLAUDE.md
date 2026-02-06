# Piantor AI Context

## Ecosystem

All ZMK repos live under `~/code/zmk/`. See `~/code/zmk/shared/CLAUDE.md` for shared behaviors, layer defines, and build tools.

## Key Files

| File | Purpose |
|---|---|
| `config/piantor_pro_bt.keymap` | Keymap with 5 layers, combos, ZMK Studio physical layout |
| `config/west.yml` | West manifest — pulls zmk-shared + upstream ZMK **v0.3** |
| `build.yaml` | Build matrix: 3 keyboards x 2 halves + settings_reset variants |
| `boards/arm/piantor_pro_bt/` | Custom board definition (Piantor Pro BT) |
| `boards/arm/corne_choc_pro/` | Custom board definition (Corne Choc Pro) |
| `boards/arm/sofle_choc_pro/` | Custom board definition (Sofle Choc Pro) |
| `boards/shields/nice_view_disp/` | Custom nice!view shield with status widgets |
| `Makefile` | align, draw, build, sync, clean |
| `keymap_drawer.config.yaml` | Keymap-drawer config for this keyboard |
| `keymap_align.toml` | Keymap-align config |

## Keyboard Details

- **42 keys**: same position numbering as Corne42 (0-35 keys, 36-41 thumbs)
- **3 keyboards** sharing the same keymap but with different board defs
- **ZMK source**: `zmkfirmware/zmk@v0.3` (pinned version, NOT `main`)
- **ZMK Studio**: enabled via cmake arg `-DCONFIG_ZMK_STUDIO=y`
- **Physical layout**: `zmk,physical-layout = &default_layout` chosen in keymap

## Layers Used

Uses all 5 shared layers: BASE (0), DEVLEFT (1), NPAD (2), SYSTEM (3), NAV (4).

## Piantor-Specific Features

- RGB underglow controls on SYSTEM layer (`&rgb_ug` bindings)
- Custom nice!view display shield with widgets (`boards/shields/nice_view_disp/`)
- `studio-rpc-usb-uart` snippet in all builds for ZMK Studio
- Settings reset firmware variants for recovering from bad configs
## Guardrails

- **Must use ZMK v0.3** — `west.yml` pins `v0.3`, not `main`. Changing to `main` may break ZMK Studio support.
- Board definitions in `boards/` are custom — don't confuse with upstream ZMK board defs
- The `nice_view_disp` shield is NOT the standard nice!view shield — it's a custom implementation with status widgets
- Makefile `align`/`draw` only target `piantor_pro_bt.keymap` — other keyboards use the same keymap file
- No standalone `.conf` files in `config/` — configuration lives in board defconfigs under `boards/`
