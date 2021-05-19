.PHONY: no_targets__ info help build deploy doc
        no_targets__:

.DEFAULT_GOAL := help

#-----------------------------------------------------------------
# CONSTANTS
#-----------------------------------------------------------------

ifneq (,$(findstring xterm,${TERM}))
	BLACK   := $(shell tput -Txterm setaf 0)
	RED     := $(shell tput -Txterm setaf 1)
	GREEN   := $(shell tput -Txterm setaf 2)
	YELLOW  := $(shell tput -Txterm setaf 3)
	BLUE    := $(shell tput -Txterm setaf 4)
	MAGENTA := $(shell tput -Txterm setaf 5)
	CYAN    := $(shell tput -Txterm setaf 6)
	WHITE   := $(shell tput -Txterm setaf 7)
	RESET   := $(shell tput -Txterm sgr0)
else
	BLACK   := ""
	RED     := ""
	GREEN   := ""
	YELLOW  := ""
	BLUE    := ""
	MAGENTA := ""
	CYAN    := ""
	WHITE   := ""
	RESET   := ""
endif

TARGET_COLOR := $(YELLOW)

#-----------------------------------------------------------------
# HELP
#-----------------------------------------------------------------

help:
	@echo "╔══════════════════════════════════════════════════════════════════════════════╗"
	@echo "║                                                                              ║"
	@echo "║                           ${CYAN}.:${RESET} AVAILABLE COMMANDS ${CYAN}:.${RESET}                           ║"
	@echo "║                                                                              ║"
	@echo "╚══════════════════════════════════════════════════════════════════════════════╝"
	@echo ""
	@grep -E '^[a-zA-Z_0-9%-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -E 's/^[^:]*://' | sort | awk 'BEGIN {FS=":.*?## "}; {printf "· ${TARGET_COLOR}%-30s${RESET} %s\n", $$1, $$2}'
	@echo ""
