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
static const char *ng0 = "/home/ise/ISE-FiltroFIR/FiltroFIR/module_Ca2Bin.vhd";
extern char *IEEE_P_1242562249;



static void work_a_0372423827_0964256931_p_0(char *t0)
{
    char t17[16];
    char t19[16];
    char t24[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t18;
    char *t20;
    char *t21;
    int t22;
    unsigned int t23;
    char *t25;
    int t26;
    unsigned char t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (31 - 31);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)2);
    if (t8 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 5021);
    t9 = (t0 + 1032U);
    t10 = *((char **)t9);
    t4 = (31 - 20);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t9 = (t10 + t6);
    t12 = ((IEEE_P_1242562249) + 3080);
    t16 = (t19 + 0U);
    t18 = (t16 + 0U);
    *((int *)t18) = 0;
    t18 = (t16 + 4U);
    *((int *)t18) = 0;
    t18 = (t16 + 8U);
    *((int *)t18) = 1;
    t3 = (0 - 0);
    t13 = (t3 * 1);
    t13 = (t13 + 1);
    t18 = (t16 + 12U);
    *((unsigned int *)t18) = t13;
    t18 = (t24 + 0U);
    t20 = (t18 + 0U);
    *((int *)t20) = 20;
    t20 = (t18 + 4U);
    *((int *)t20) = 10;
    t20 = (t18 + 8U);
    *((int *)t20) = -1;
    t22 = (10 - 20);
    t13 = (t22 * -1);
    t13 = (t13 + 1);
    t20 = (t18 + 12U);
    *((unsigned int *)t20) = t13;
    t11 = xsi_base_array_concat(t11, t17, t12, (char)97, t1, t19, (char)97, t9, t24, (char)101);
    t13 = (1U + 11U);
    t7 = (12U != t13);
    if (t7 == 1)
        goto LAB7;

LAB8:    t20 = (t0 + 3168);
    t21 = (t20 + 56U);
    t25 = *((char **)t21);
    t28 = (t25 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t11, 12U);
    xsi_driver_first_trans_fast(t20);

LAB3:    t1 = (t0 + 3072);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(36, ng0);
    t9 = (t0 + 5020);
    t11 = (t0 + 1032U);
    t12 = *((char **)t11);
    t13 = (31 - 20);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t11 = (t12 + t15);
    t18 = ((IEEE_P_1242562249) + 3080);
    t20 = (t19 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 0;
    t21 = (t20 + 4U);
    *((int *)t21) = 0;
    t21 = (t20 + 8U);
    *((int *)t21) = 1;
    t22 = (0 - 0);
    t23 = (t22 * 1);
    t23 = (t23 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t23;
    t21 = (t24 + 0U);
    t25 = (t21 + 0U);
    *((int *)t25) = 20;
    t25 = (t21 + 4U);
    *((int *)t25) = 10;
    t25 = (t21 + 8U);
    *((int *)t25) = -1;
    t26 = (10 - 20);
    t23 = (t26 * -1);
    t23 = (t23 + 1);
    t25 = (t21 + 12U);
    *((unsigned int *)t25) = t23;
    t16 = xsi_base_array_concat(t16, t17, t18, (char)97, t9, t19, (char)97, t11, t24, (char)101);
    t23 = (1U + 11U);
    t27 = (12U != t23);
    if (t27 == 1)
        goto LAB5;

LAB6:    t25 = (t0 + 3168);
    t28 = (t25 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t16, 12U);
    xsi_driver_first_trans_fast(t25);
    goto LAB3;

LAB5:    xsi_size_not_matching(12U, t23, 0);
    goto LAB6;

LAB7:    xsi_size_not_matching(12U, t13, 0);
    goto LAB8;

}

static void work_a_0372423827_0964256931_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(45, ng0);

LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 3232);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 12U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3088);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0372423827_0964256931_init()
{
	static char *pe[] = {(void *)work_a_0372423827_0964256931_p_0,(void *)work_a_0372423827_0964256931_p_1};
	xsi_register_didat("work_a_0372423827_0964256931", "isim/tb_top_desing_isim_beh.exe.sim/work/a_0372423827_0964256931.didat");
	xsi_register_executes(pe);
}
