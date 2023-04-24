/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnmbr_un.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aceauses <aceauses@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/22 15:04:46 by aceauses          #+#    #+#             */
/*   Updated: 2023/04/24 14:24:55 by aceauses         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static int	ft_unbr_base_len(unsigned long index, size_t base)
{
	size_t	i;

	i = 1;
	while (index >= (unsigned long int)base)
	{
		index = index / base;
		i++;
	}
	return (i);
}

int	ft_putnmbr_un(unsigned int n)
{
	char				*base;
	unsigned int		nmbr_len;

	base = "0123456789";
	nmbr_len = 0;
	if (n < 0)
	{
		write(1, "-", 1);
		nmbr_len += ft_putnmbr_un(-n);
	}
	else if (n >= 10)
	{
		ft_putnmbr_un(n / 10);
		ft_putnmbr_un(n % 10);
	}
	else
		write (1, &base[n], 1);
	nmbr_len += ft_unbr_base_len(n, ft_strlen(base));
	return (nmbr_len);
}
