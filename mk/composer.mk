composer-require: ## Performs <composer require xxxx> onto main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ ADDING A DEPENDENCY ONTO APPLICATION SERVICE                                                                        │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker run --rm --interactive --tty --volume $(PWD)/src:/app composer/composer require
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""

composer-require-dev: ## Performs <composer require xxxx --dev> onto main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ ADDING A DEVELOPMENT DEPENDENCY ONTO APPLICATION                                                                    │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker run --rm --interactive --tty --volume $(PWD)/src:/app composer/composer require --dev
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""

composer-remove: ## Performs <composer remove xxxx> from main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ REMOVING A DEPENDENCY FROM APPLICATION SERVICE                                                                      │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker run --rm --interactive --tty --volume $(PWD)/src:/app composer/composer remove
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""

composer-remove-dev: ## Performs <composer remove xxxx --dev> onto main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ REMOVING A DEVELOPMENT DEPENDENCY FROM APPLICATION SERVICE                                                          │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker run --rm --interactive --tty --volume $(PWD)/src:/app composer/composer remove --dev
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""

composer-install-no-dev: ## Performs <composer install --optimize-autoloader --no-dev> onto main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ INSTALLING DEPENDENCIES ONTO APPLICATION SERVICE IN PRODUCTION MODE                                                 │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker run --rm --interactive --tty --volume $(PWD)/src:/app composer/composer install --optimize-autoloader --verbose --no-dev
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""

composer-install: ## Performs <composer install --optimize-autoloader> onto main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ INSTALLING DEPENDENCIES ONTO APPLICATION SERVICE                                                                    │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker run --rm --interactive --tty --volume $(PWD)/src:/app composer/composer install --optimize-autoloader --verbose
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""

composer-update: ## Performs <composer update> onto main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ UPDATING DEPENDENCIES ONTO APPLICATION SERVICE                                                                      │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker run --rm --interactive --tty --volume $(PWD)/src:/app composer/composer update
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""

composer-dump-auto: ## Performs <composer dump-auto> onto main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ GENERATING OPTIMIZED AUTOLOAD CLASS MAP ONTO APPLICATION SERVICE                                                    │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker run --rm --interactive --tty --volume $(PWD)/src:/app composer/composer dump-auto
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""
