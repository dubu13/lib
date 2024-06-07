# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dhasan <dhasan@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/31 19:41:34 by dhasan            #+#    #+#              #
#    Updated: 2024/06/07 18:02:38 by dhasan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = cc
CFLAGS = -Wall -Wextra -Werror -I./inc

GNL_DIR = gnl_src
PRINTF_DIR = printf_src
LIBFT_DIR = libft_src
BINDIR = bin

LIBFT_SRCS = $(addprefix $(LIBFT_DIR)/, \
		ft_bzero.c ft_isalnum.c ft_isascii.c ft_isprint.c \
		ft_memchr.c ft_memcpy.c ft_memset.c ft_putendl_fd.c \
		ft_putstr_fd.c ft_strchr.c ft_striteri.c ft_strlcat.c \
		ft_strlen.c ft_strncmp.c ft_strrchr.c ft_substr.c \
		ft_toupper.c ft_atoi.c ft_calloc.c ft_isalpha.c \
		ft_isdigit.c ft_itoa.c ft_memcmp.c ft_memmove.c \
		ft_putchar_fd.c ft_putnbr_fd.c ft_split.c ft_strdup.c \
		ft_strjoin.c ft_strlcpy.c ft_strmapi.c ft_strnstr.c \
		ft_strtrim.c ft_tolower.c ft_split.c ft_lstnew.c ft_lstmap.c \
		ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
		ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c \
		ft_lstiter.c)

GNL_SRCS = $(addprefix $(GNL_DIR)/, \
		get_next_line_bonus.c get_next_line_utils_bonus.c)

PRINTF_SRCS = $(addprefix $(PRINTF_DIR)/, \
		ft_print_csid.c ft_print_hex.c ft_printf.c ft_check_format.c ft_itoa_2.c)

SRCS = $(LIBFT_SRCS) $(GNL_SRCS) $(PRINTF_SRCS)

OBJS = $(SRCS:%.c=$(BINDIR)/%.o)

all: $(NAME)

.SILENT:

$(NAME): $(OBJS)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)
	echo $(GREEN)"Linking $(NAME)"$(DEFAULT)

$(BINDIR):
	echo $(GREEN)"Creating $(BINDIR) directory"$(DEFAULT)
	mkdir -p $(BINDIR)

$(BINDIR)/%.o: %.c | $(BINDIR)
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(BINDIR)/**/*.o
	echo $(RED)"Cleaning object files"$(DEFAULT)

fclean: clean
	rm -f $(NAME)
	rm -rf $(BINDIR)
	echo $(RED)"Removing $(NAME) and $(BINDIR) directory"$(DEFAULT)

re: fclean all

.PHONY: all clean fclean re

# Colours
DEFAULT = "\033[39m"
GREEN   = "\033[32m"
RED     = "\033[31m"
