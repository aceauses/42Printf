# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aceauses <aceauses@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/17 09:47:04 by aceauses          #+#    #+#              #
#    Updated: 2023/05/08 16:30:05 by aceauses         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.SILENT:
NAME = libftprintf.a
CC = cc
FLAGS = -Wall -Werror -Wextra
AR= ar rcs
SRC= ft_printf.c \
	 ft_putchar.c \
	 ft_putstr.c \
	 ft_print_hex.c \
	 ft_put_ptr.c \
	 ft_putnmbr.c \
	 ft_putnmbr_un.c \

OBJS=$(SRC:.c=.o)

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)

$(OBJS):
	$(CC) -c $(FLAGS) $(SRC)

all: $(NAME)
	echo "Printf Library Compiled"

clean:
	rm -f $(OBJS)
	echo "Printf: Objects Deleted"

fclean: clean
	rm -f $(NAME)
	echo "Printf: Everything Deleted"

re: fclean all

.PHONY: libft all clean fclean re