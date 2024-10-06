/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   Httpd.hpp                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sguzman <sguzman@student.42barcelona.com>  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/06 11:11:57 by sguzman           #+#    #+#             */
/*   Updated: 2024/10/06 11:33:53 by sguzman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef HTTPD_H
# define HTTPD_H

#include <cstdio>
#include <cstdlib>

class Httpd
{
	// HttpServer *server;
	// HttpConfigLoader *builder;

  public:
	Httpd();
	~Httpd();
	int main(int argc, char *argv[]);
};

#endif /* HTTPD_H */
