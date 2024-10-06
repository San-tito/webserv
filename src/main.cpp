/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.cpp                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sguzman <sguzman@student.42barcelona.com>  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/06 11:00:50 by sguzman           #+#    #+#             */
/*   Updated: 2024/10/06 11:21:30 by sguzman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "Httpd.hpp"

int	main(int argc, char *argv[])
{
	Httpd	*httpd;
	int		ret;

	httpd = new Httpd();
	if (httpd == 0)
	{
		perror("new Httpd()");
		exit(1);
	}
	ret = httpd->main(argc, argv);
	delete	httpd;
	exit(ret);
}
