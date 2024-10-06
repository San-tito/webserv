# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sguzman <sguzman@student.42barcelona.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/06 10:25:09 by sguzman           #+#    #+#              #
#    Updated: 2024/10/06 11:38:55 by sguzman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
#                                     CONFIG                                   #
################################################################################

NAME        = webserv
CC          = c++
CFLAGS      = -Wall -Wextra -Werror -std=c++98
DFLAGS      = -MMD -MF $(@:.o=.d)

ifneq ($(SANITIZER),)
    CFLAGS += -fsanitize=$(SANITIZER)
endif

################################################################################
#                                 PROGRAM'S SRCS                               #
################################################################################

SRCS_PATH    = ./src
OBJS_PATH    = ./build
INCLUDE_PATH	= ./include


SRCS = Httpd.cpp

MAIN         = main.cpp

################################################################################
#                                  Makefile  objs                              #
################################################################################

OBJS		= $(addprefix $(OBJS_PATH)/, ${SRCS:.cpp=.o})
OBJS_MAIN   = $(addprefix $(OBJS_PATH)/, ${MAIN:.cpp=.o})
DEPS		= $(addprefix $(OBJS_PATH)/, ${SRCS:.cpp=.d})
DEPS_MAIN   = $(addprefix $(OBJS_PATH)/, ${MAIN:.cpp=.d})

################################################################################
#                                 Makefile logic                               #
################################################################################

SHELL := /bin/bash
RED    = \033[0;31m
GREEN  = \033[0;32m
YELLOW = \033[0;33m
BLUE   = \033[0;34m
PURPLE = \033[0;35m
CYAN   = \033[0;36m
RESET  = \033[m

define compile
    printf "%b%-46b" "$(BLUE)$(2) " "$(CYAN)$(@F)$(RESET)"; \
    OUTPUT=$$($(1) 2>&1); \
    RESULT=$$?; \
    if [ $$RESULT -ne 0 ]; then \
        printf "%b\n" "$(RED)[✗]$(RESET)"; \
	printf "%b\n" "$$OUTPUT"; \
    else  \
        printf "%b\n" "$(GREEN)[✓]$(RESET)"; \
    fi; \
    [ $$RESULT -eq 0 ]
endef

################################################################################
#                                 Makefile rules                               #
################################################################################

all: banner $(NAME)

banner:
	@printf "%b" "$(GREEN)\n"
	@echo
	@echo "  _      __    __                   "
	@echo " | | /| / /__ / /  ___ ___ _____  __"
	@echo " | |/ |/ / -_) _ \(_-</ -_) __/ |/ /"
	@echo " |__/|__/\__/_.__/___/\__/_/  |___/ "
	@echo "                                    "
	@echo
	@printf "%b" "$(YELLOW)Name:           $(CYAN)$(NAME)\n$(RESET)"
	@printf "%b" "$(YELLOW)CC:             $(CYAN)$(CC)\n$(RESET)"
	@printf "%b" "$(YELLOW)Flags:          $(CYAN)$(CFLAGS)\n$(RESET)"
	@printf "%b" "\n$(RESET)"

-include $(DEPS) $(DEPS_MAIN)

$(NAME):	$(OBJS) $(OBJS_MAIN)
			@$(call compile,$(CC) $(CFLAGS) $(DFLAGS) -I $(INCLUDE_PATH) $^ -o $@)

$(OBJS_PATH)/%.o: $(SRCS_PATH)/%.cpp
			@mkdir -p $(dir $@)
			@$(call compile,$(CC) $(CFLAGS) $(DFLAGS) -c $< -o $@ -I $(INCLUDE_PATH))

clean:		banner
			@rm -rf $(OBJS_PATH)
			@printf "%-53b%b" "$(CYAN)$(@):" "$(GREEN)[✓]$(RESET)\n"

fclean:		banner clean
			@rm -rf $(NAME)
			@printf "%-53b%b" "$(CYAN)$(@):" "$(GREEN)[✓]$(RESET)\n"

re:			fclean all

.PHONY:		all banner clean fclean re
