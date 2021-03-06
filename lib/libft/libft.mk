# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    libft.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pbondoer <pbondoer@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/31 05:24:55 by pbondoer          #+#    #+#              #
#    Updated: 2017/01/02 10:57:43 by pbondoer         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Base variables for libft
# Use with 'include /path/to/libft.mk'
# Make sure to define L_FT with path to libft first

ifndef L_FT
	L_FT	= .
endif

FT_NAME		= libft.a

FT_LNK		= -L $(L_FT) -l ft
FT_INC		= -I $(L_FT)/includes
FT_LIB		= $(L_FT)/$(FT_NAME)

LIB_LNK		+= $(FT_LNK)
LIB_INC		+= $(FT_INC)
