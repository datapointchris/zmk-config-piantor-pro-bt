# Piantor Pro BT ZMK Config Makefile

CONFIG_DIR := config
KEYMAP := $(CONFIG_DIR)/piantor_pro_bt.keymap
DRAWER_YAML := piantor_keymap.yaml
SVG := piantor_keymap.svg

.PHONY: help align draw build sync clean

help:
	@echo "Piantor Pro BT ZMK Config"
	@echo "========================="
	@echo ""
	@echo "Workflows:"
	@echo "  sync    - align + draw + build"
	@echo ""
	@echo "Individual Tasks:"
	@echo "  align   - Align Piantor keymap"
	@echo "  draw    - Generate SVG from YAML"
	@echo "  build   - Build firmware (outputs: piantor_left.uf2, piantor_right.uf2)"
	@echo "  clean   - Remove generated files and UF2s"

align:
	keymap-align -k $(KEYMAP)

draw:
	keymap -c keymap_drawer.config.yaml draw $(DRAWER_YAML) > $(SVG)
	@echo "$(SVG) generated"

build:
	zmk-build

sync: align draw build
	@echo "Sync complete"

clean:
	rm -f ./*.uf2 2>/dev/null || true
	@echo "Cleaned"
