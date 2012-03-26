dnl $Id: misc.m4,v 1.1 2005/09/20 19:09:34 gwatson Exp $
dnl
AC_DEFUN([upcase],[`echo $1 | tr abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ`])dnl
AC_DEFUN([CONFIG_HEADER],[AH_TOP([#ifndef RCSID
#define RCSID(msg) \
static /**/const char *const rcsid[] = { (const char *)rcsid, "\100(#)" msg }
#endif
])])
