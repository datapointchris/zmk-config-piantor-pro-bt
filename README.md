# zmk-config-piantor

ZMK firmware configuration for the Piantor Pro BT 42-key split keyboard.

## Hardware

| Keyboard | Board | Display |
| --- | --- | --- |
| **Piantor Pro BT** | Custom board def (`config/boards/arm/piantor_pro_bt/`) | nice!view (custom shield) |

The Piantor Pro BT has an onboard nRF52840 (no socketed Nice Nano), so it requires a custom board definition with its own pin mappings and peripheral configuration.

## Layers

| # | Layer | Notes |
| --- | --- | --- |
| 0 | BASE | QWERTY + home row mods + 8 combos |
| 1 | DEVLEFT | Programming symbols (left hand) |
| 2 | NPAD | Number pad (right) + nav (left) |
| 3 | SYSTEM | Bluetooth, RGB controls, bootloader, media |
| 4 | NAV | Arrow keys + F1-F12 + sticky modifiers |

## Notable

- **ZMK v0.3** pinned (not `main`) for ZMK Studio compatibility
- **ZMK Studio** enabled for all builds (`-DCONFIG_ZMK_STUDIO=y`)
- **Custom board definition** in `config/boards/arm/piantor_pro_bt/`
- **Custom nice!view shield** in `config/boards/shields/nice_view_disp/` with status display widgets
- **Settings reset** firmware variants included
- RGB underglow support on SYSTEM layer
- `config/piantor_pro_bt.keymap` is the stem every derived path follows

## Build

```sh
zmk check     # What is missing or has drifted
zmk sync      # Align + draw + build every variant
zmk flash     # Pick halves with fzf, then write each
zmk --help    # Show all commands
```

Build outputs include `.uf2` files for left + right halves (macOS + Linux variants) and settings_reset.

## Ecosystem

See [zmk-shared](https://github.com/datapointchris/zmk-shared) for shared behaviors, layer architecture, and full documentation.
