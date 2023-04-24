# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aceauses <aceauses@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/17 09:47:04 by aceauses          #+#    #+#              #
#    Updated: 2023/04/24 14:25:35 by aceauses         ###   ########.fr        #
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

LIBFT= ./libft/libft.a

OBJS=$(SRC:.c=.o)

$(NAME):  $(LIBFT) $(OBJS)
	cp $(LIBFT) $(NAME)
	$(AR) $(NAME) $(OBJS)

$(OBJS):
	$(CC) -c $(FLAGS) $(SRC)

all: $(NAME)
	echo "Printf Library Compiled"

$(LIBFT):
	make -C ./libft all

clean:
	cd libft/ && make clean
	rm -f $(OBJS)
	echo "Printf: Objects Deleted"

fclean: clean
	cd libft/ && make fclean
	rm -f $(NAME)
	echo "Printf: Everything Deleted"

re: fclean all

.PHONY: libft all clean fclean re