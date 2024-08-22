SHELL := bash
CPP := cpp
DTC ?= dtc

BUILD_DIR ?= ./dtbo
DTBO_INSTALL_DIR ?= /boot

UDEV_RULES := $(wildcard ./udev-rules/*.rules)
DTSO := $(wildcard *.dtso)
DTBO := $(DTSO:%.dtso=$(BUILD_DIR)/%.dtbo)

all: $(DTBO)

$(BUILD_DIR)/%.dtbo: %.dtso
	mkdir -p $(@D)
	$(DTC) -@ -I dts -O dtb -o $@ $<

clean:
	rm -rf $(BUILD_DIR)

install:
	@[ "$$EUID" -eq 0 ] || { echo "Please, run as root"; false; }
	install -m 644 $(DTBO) $(DTBO_INSTALL_DIR)
	install -m 644 $(UDEV_RULES) /etc/udev/rules.d/
	
.PHONY: clean install all
