/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/ISE-FiltroFIR/FiltroFIR/module_prod.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_2423793367844140314_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2598175070666390882_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3525738511873186323_1035706684(char *, char *, char *, char *, char *, char *);


static void work_a_0684323081_2589805957_p_0(char *t0)
{
    char t1[16];
    char t2[16];
    char t6[16];
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(27, ng0);

LAB3:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t3 = (t0 + 6504U);
    t5 = ieee_p_1242562249_sub_2423793367844140314_1035706684(IEEE_P_1242562249, t2, t4, t3, 33);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t7 = (t0 + 6520U);
    t9 = ieee_p_1242562249_sub_2423793367844140314_1035706684(IEEE_P_1242562249, t6, t8, t7, 33);
    t10 = ieee_p_1242562249_sub_3525738511873186323_1035706684(IEEE_P_1242562249, t1, t5, t2, t9, t6);
    t11 = (t1 + 12U);
    t12 = *((unsigned int *)t11);
    t13 = (1U * t12);
    t14 = (33U != t13);
    if (t14 == 1)
        goto LAB5;

LAB6:    t15 = (t0 + 4336);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t10, 33U);
    xsi_driver_first_trans_fast(t15);

LAB2:    t20 = (t0 + 4208);
    *((int *)t20) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(33U, t13, 0);
    goto LAB6;

}

static void work_a_0684323081_2589805957_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(29, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = (32 - 27);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 4400);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 18U);
    xsi_driver_first_trans_fast(t6);

LAB2:    t11 = (t0 + 4224);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0684323081_2589805957_p_2(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(31, ng0);

LAB3:    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 6536U);
    t4 = (t0 + 1832U);
    t5 = *((char **)t4);
    t4 = (t0 + 6584U);
    t6 = ieee_p_1242562249_sub_2598175070666390882_1035706684(IEEE_P_1242562249, t1, t3, t2, t5, t4);
    t7 = (t1 + 12U);
    t8 = *((unsigned int *)t7);
    t9 = (1U * t8);
    t10 = (30U != t9);
    if (t10 == 1)
        goto LAB5;

LAB6:    t11 = (t0 + 4464);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 30U);
    xsi_driver_first_trans_fast(t11);

LAB2:    t16 = (t0 + 4240);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(30U, t9, 0);
    goto LAB6;

}

static void work_a_0684323081_2589805957_p_3(char *t0)
{
    char t1[16];
    char t7[16];
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(33, ng0);

LAB3:    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t4 = (29 - 29);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t2 = (t3 + t6);
    t8 = (t7 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 29;
    t9 = (t8 + 4U);
    *((int *)t9) = 1;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t10 = (1 - 29);
    t11 = (t10 * -1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t9 = ieee_p_1242562249_sub_2423793367844140314_1035706684(IEEE_P_1242562249, t1, t2, t7, 32);
    t12 = (t1 + 12U);
    t11 = *((unsigned int *)t12);
    t11 = (t11 * 1U);
    t13 = (32U != t11);
    if (t13 == 1)
        goto LAB5;

LAB6:    t14 = (t0 + 4528);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t9, 32U);
    xsi_driver_first_trans_fast_port(t14);

LAB2:    t19 = (t0 + 4256);
    *((int *)t19) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t11, 0);
    goto LAB6;

}


extern void work_a_0684323081_2589805957_init()
{
	static char *pe[] = {(void *)work_a_0684323081_2589805957_p_0,(void *)work_a_0684323081_2589805957_p_1,(void *)work_a_0684323081_2589805957_p_2,(void *)work_a_0684323081_2589805957_p_3};
	xsi_register_didat("work_a_0684323081_2589805957", "isim/tb_module_prod_isim_beh.exe.sim/work/a_0684323081_2589805957.didat");
	xsi_register_executes(pe);
}
