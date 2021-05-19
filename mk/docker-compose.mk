build: ## Builds the container(s) service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ BUILDING THE SERVICE(s)                                                                                             │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose build
	@echo ""
	@echo " 📦  ${GREEN}Service has been built!${RESET}"
	@echo ""

rebuild: down build ## Rebuilds the container(s) service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ REBUILDING THE SERVICE(s)                                                                                           │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose up --remove-orphans
	@echo ""
	@echo " 📦  ${CYAN}Service has been rebuilt!${RESET}"
	@echo ""

up: ## Starts the container(s) service in daemonized mode
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ BUILDING, (RE)CREATING, STARTING AND ATTACHING TO CONTAINERS FOR A SERVICE                                          │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose up --remove-orphans -d
	@echo ""
	@echo " 🟢  ${GREEN}Service is up & running!${RESET}"
	@echo ""

down: ## Stops the container(s) service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ STOPPING AND REMOVING CONTAINERS, NETWORKS, VOLUMES AND IMAGES                                                      │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose down
	@echo ""
	@echo " 🟠  ${YELLOW}Service has been stopped!${RESET}"
	@echo ""

restart: ## Restarts the container(s)
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ RESTARTING ALL STOPPED AND RUNNING SERVICES                                                                         │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose restart
	@echo ""
	@echo " 🔵  ${BLUE}Service has been restarted!${RESET}"
	@echo ""

logs: ## Prints out the container(s) log(s)
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ DISPLAYING LOG OUTPUT FROM SERVICES                                                                                 │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose logs
	@echo ""
	@echo " 🔎  ${WHITE}Service log were displayed!${RESET}"
	@echo ""

bash: ## Opens a bash connection to containerised service
	@echo "┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
	@echo "│ GETTING AN INTERACTIVE PROMPT FROM SERVICE CONTAINER                                                                │"
	@echo "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
	@echo ""
	@docker-compose exec ${SERVICE_NAME} bash
	@echo ""
	@echo " ✅  ${GREEN}Task done!${RESET}"
	@echo ""