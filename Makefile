CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c99

SRCDIR = srcs/
INCDIR = ../
LIBFTDIR = libft/

SRCS = $(addprefix $(SRCDIR), $(SRCS_FIL))
SRCS_FIL = \
			ft_printf.c \
			check_flags.c \
			digit_count_base.c \
			write_padding.c \
			ft_putnbr_base.c \
			ft_putnbr_long.c \
			print_char.c \
			print_str.c \
			print_ptr.c \
			print_uint.c \
			print_int.c \
			print_hex.c \

OBJS = $(SRCS:.c=.o)

LIBFT.A = $(LIBFTDIR)libft.a

NAME = libftprintf.a

bonus: all

all: $(NAME)

$(NAME): $(OBJS)
		make -C $(LIBFTDIR)
		cp $(LIBFT.A) $(NAME)
		ar -rc $(NAME) $(OBJS)


%.o:%.c
	$(CC) $(CFLAGS)  -c $< -o $@

RM = rm -f

clean:
		$(RM) $(OBJS) $(BOBJS) 
		find $(LIBFTDIR) -type f -name "*.o" -exec rm {} \;

fclean: clean
		$(RM) $(NAME) $(LIBFT.A)

re: fclean all

.PHONY: all clean fclean all bonus
