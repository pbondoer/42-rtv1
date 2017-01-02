# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pbondoer <pbondoer@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/02/22 23:12:10 by pbondoer          #+#    #+#              #
#    Updated: 2017/01/02 11:00:49 by pbondoer         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= rtv1

# directories
SRC_DIR	= ./src
INC_DIR	= ./includes
OBJ_DIR	= ./obj
LIB_DIR	= ./lib

# src / obj files
SRC		= main.c
OBJ		= $(addprefix $(OBJ_DIR)/,$(SRC:.c=.o))

# compiler
CC		= gcc
CFLAGS	= -Wall -Wextra -Werror

# libraries
L_FT	= $(LIB_DIR)/libft
L_MLX	= $(LIB_DIR)/miniLibX
L_GFX	= $(LIB_DIR)/libgfx

include $(L_FT)/libft.mk
include $(L_MLX)/mlx.mk
include $(L_GFX)/gfx.mk

# targets
all: obj lib $(NAME)

obj:
	mkdir -p $(OBJ_DIR)

lib:
	@make -C $(L_FT)
	@make -C $(L_MLX)
	@make -C $(L_GFX)

$(OBJ_DIR)/%.o:$(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(LIB_INC) -I $(INC_DIR) -o $@ -c $<

$(NAME): $(OBJ)
	$(CC) $(OBJ) $(LIB_LNK) -lm -o $(NAME)

clean:
	rm -rf $(OBJ_DIR)
	make -C $(L_FT) clean
	make -C $(L_MLX) clean
	make -C $(L_GFX) clean

fclean: clean
	rm -f $(NAME)
	make -C $(L_FT) fclean
	make -C $(L_MLX) fclean
	make -C $(L_GFX) fclean

re: fclean all
