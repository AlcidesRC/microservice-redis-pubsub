tests: ## Executes the PHPUnit testsuite onto main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ RUNNING THE TESTSUITE ONTO APPLICATION SERVICE                                                                      │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose exec ${SERVICE_NAME} bash -c "./vendor/bin/phpunit"
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""

tests-debug: ## Executes the PHPUnit testsuite with debug flag
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ RUNNING THE TESTSUITE ONTO APPLICATION SERVICE IN DEBUG MODE                                                        │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose exec ${SERVICE_NAME} bash -c "./vendor/bin/phpunit --debug"
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""