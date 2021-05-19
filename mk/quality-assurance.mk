phpcs: ## Performs <phpcs> onto main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ RUNS THE PHPCS (PHP CODE SNIFFER) ONTO APPLICATION SERVICE                                                          │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose exec ${SERVICE_NAME} bash -c "./vendor/bin/phpcs --standard=PSR12 app"
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""

phpcbf: ## Performs <phpcbf> onto main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ RUNS THE PHPCBF (PHP CODE BEAUTIFIER AND FIXER) ONTO APPLICATION SERVICE                                            │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose exec ${SERVICE_NAME} bash -c "./vendor/bin/phpcbf --standard=PSR12 app"
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""

phpstan: ## Performs <phpstan> onto main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ RUNS THE PHPSTAN (PHP STATIC ANALYSIS) ONTO APPLICATION SERVICE                                                     │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose exec ${SERVICE_NAME} bash -c "./vendor/bin/phpstan analyse --memory-limit=2G --level=6 app"
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""
