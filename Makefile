# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: joandre- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/07 16:29:18 by joandre-          #+#    #+#              #
#    Updated: 2025/05/13 03:14:58 by joandre-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = https://cdn.intra.42.fr/document/document/32362/net_practice.1.5.tgz
TAR = $(shell basename $(SRC))
FOLDER = $(shell ls -l | grep ^d | awk '{print $$NF}')
NAME = $(FOLDER)/index.html
BROWSER := $(shell which google-chrome || which firefox)

all: $(NAME)

$(NAME):
	wget -q $(SRC)
	tar xf $(TAR)

clean:
	rm -rf $(TAR)

fclean: clean
	rm -rf $(FOLDER)

re: fclean all

run: $(NAME)
	$(BROWSER) $(NAME) > /dev/null 2>&1 &

rerun: re run
