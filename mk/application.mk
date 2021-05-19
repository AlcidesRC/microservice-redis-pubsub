info: ## Displays information about main service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ DISPLAYING GENERIC INFORMATION FROM SERVICE                                                                         │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose exec ${SERVICE_NAME} bash -c "php --version"
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""

publish-demo-message: check-required-parameter-id ## Publish an <demo:event> message
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ DEMO: PUBLISH A <demo:event> MESSAGE                                                                                │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose exec ${SERVICE_NAME} bash -c "cd app && php publisher.php demo:event $(id)"
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""
