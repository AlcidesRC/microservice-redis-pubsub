check-required-parameter-%:
	@if [ -z "$($(*))" ] ; then \
		echo "" ; \
		echo " ⛔  ${RED}Parameter [ ${WHITE}${*}${RED} ] is required!${RESET}" ; \
		echo "" ; \
		exit 1 ; \
	fi;
