#----------------------------------------------------------------------------------------------------------------------
# CONSTANTS
#----------------------------------------------------------------------------------------------------------------------

SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

SERVICE_NAME = redis-pubsub

#----------------------------------------------------------------------------------------------------------------------
# TARGETS
#----------------------------------------------------------------------------------------------------------------------

-include $(SELF_DIR)/mk/default.mk
-include $(SELF_DIR)/mk/application.mk
-include $(SELF_DIR)/mk/composer.mk
-include $(SELF_DIR)/mk/docker-compose.mk
-include $(SELF_DIR)/mk/phpunit.mk
-include $(SELF_DIR)/mk/quality-assurance.mk
-include $(SELF_DIR)/mk/shared.mk
