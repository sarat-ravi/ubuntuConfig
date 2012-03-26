/******************************************************************************
 * Copyright (c) 2010 IBM Corporation and others.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0s
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 ******************************************************************************/
 
#ifndef SIGNAL_INFO_H_
#define SIGNAL_INFO_H_

struct signal_info {
	char *	name;
	int 	stop;
	int 	print;
	int 	pass;
	char *	desc;
};
typedef struct signal_info signal_info;

extern signal_info *	NewSignalInfo();
extern void				FreeSignalInfo(signal_info *);
#endif /*SIGNAL_INFO_H_*/
