# zmk-config-piantor

ZMK firmware configuration for the Piantor Pro BT and related 42-key split keyboards.

## Hardware

This repo builds firmware for 3 keyboards:

| Keyboard | Board | Display |
|---|---|---|
| **Piantor Pro BT** (primary) | Custom board def | nice!view |
| Corne Choc Pro | Custom board def | nice!view |
| Sofle Choc Pro | Custom board def | nice!view (custom shield) |

All boards are defined in `boards/` with custom pin mappings and configurations.

## Layers

| # | Layer | Notes |
|---|---|---|
| 0 | BASE | QWERTY + home row mods + 8 combos |
| 1 | DEVLEFT | Programming symbols (left hand) |
| 2 | NPAD | Number pad (right) + nav (left) |
| 3 | SYSTEM | Bluetooth, RGB controls, bootloader, media |
| 4 | NAV | Arrow keys + F1-F12 + sticky modifiers |

## Notable

- **ZMK v0.3** pinned (not `main`) for ZMK Studio compatibility
- **ZMK Studio** enabled for all builds (`-DCONFIG_ZMK_STUDIO=y`)
- **Custom board definitions** in `boards/arm/` for all 3 keyboards
- **Custom nice!view shield** in `boards/shields/nice_view_disp/` with status display widgets
- **Settings reset** firmware variants for all boards
- RGB underglow support on SYSTEM layer
- Makefile `align`/`draw` targets only process the Piantor keymap

## Build

```sh
make build    # Build all firmware variants via zmk-build
make sync     # Align + draw + build
make help     # Show all targets
```

Build outputs include `.uf2` files for all 3 keyboards (left + right + settings_reset for each).

## Ecosystem

See [zmk-shared](https://github.com/datapointchris/zmk-shared) for shared behaviors, layer architecture, and full documentation.
