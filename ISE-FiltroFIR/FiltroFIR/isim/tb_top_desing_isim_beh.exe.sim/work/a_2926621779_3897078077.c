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
static const char *ng0 = "/home/ise/ISE-FiltroFIR/FiltroFIR/module_BinCa2.vhd";
extern char *IEEE_P_1242562249;



static void work_a_2926621779_3897078077_p_0(char *t0)
{
    char t17[16];
    char t19[16];
    char t24[16];
    char t29[16];
    char t31[16];
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
    char *t27;
    char *t28;
    char *t30;
    char *t32;
    char *t33;
    int t34;
    unsigned int t35;
    unsigned char t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;

LAB0:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (11 - 11);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)2);
    if (t8 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 5009);
    t9 = (t0 + 1032U);
    t10 = *((char **)t9);
    t4 = (11 - 10);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t9 = (t10 + t6);
    t12 = ((IEEE_P_1242562249) + 3080);
    t16 = (t19 + 0U);
    t18 = (t16 + 0U);
    *((int *)t18) = 0;
    t18 = (t16 + 4U);
    *((int *)t18) = 10;
    t18 = (t16 + 8U);
    *((int *)t18) = 1;
    t3 = (10 - 0);
    t13 = (t3 * 1);
    t13 = (t13 + 1);
    t18 = (t16 + 12U);
    *((unsigned int *)t18) = t13;
    t18 = (t24 + 0U);
    t20 = (t18 + 0U);
    *((int *)t20) = 10;
    t20 = (t18 + 4U);
    *((int *)t20) = 0;
    t20 = (t18 + 8U);
    *((int *)t20) = -1;
    t22 = (0 - 10);
    t13 = (t22 * -1);
    t13 = (t13 + 1);
    t20 = (t18 + 12U);
    *((unsigned int *)t20) = t13;
    t11 = xsi_base_array_concat(t11, t17, t12, (char)97, t1, t19, (char)97, t9, t24, (char)101);
    t20 = (t0 + 5020);
    t27 = ((IEEE_P_1242562249) + 3080);
    t28 = (t31 + 0U);
    t30 = (t28 + 0U);
    *((int *)t30) = 0;
    t30 = (t28 + 4U);
    *((int *)t30) = 9;
    t30 = (t28 + 8U);
    *((int *)t30) = 1;
    t26 = (9 - 0);
    t13 = (t26 * 1);
    t13 = (t13 + 1);
    t30 = (t28 + 12U);
    *((unsigned int *)t30) = t13;
    t25 = xsi_base_array_concat(t25, t29, t27, (char)97, t11, t17, (char)97, t20, t31, (char)101);
    t13 = (11U + 11U);
    t14 = (t13 + 10U);
    t7 = (32U != t14);
    if (t7 == 1)
        goto LAB7;

LAB8:    t30 = (t0 + 3168);
    t32 = (t30 + 56U);
    t33 = *((char **)t32);
    t37 = (t33 + 56U);
    t38 = *((char **)t37);
    memcpy(t38, t25, 32U);
    xsi_driver_first_trans_fast(t30);

LAB3:    t1 = (t0 + 3072);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(42, ng0);
    t9 = (t0 + 4988);
    t11 = (t0 + 1032U);
    t12 = *((char **)t11);
    t13 = (11 - 10);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t11 = (t12 + t15);
    t18 = ((IEEE_P_1242562249) + 3080);
    t20 = (t19 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 0;
    t21 = (t20 + 4U);
    *((int *)t21) = 10;
    t21 = (t20 + 8U);
    *((int *)t21) = 1;
    t22 = (10 - 0);
    t23 = (t22 * 1);
    t23 = (t23 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t23;
    t21 = (t24 + 0U);
    t25 = (t21 + 0U);
    *((int *)t25) = 10;
    t25 = (t21 + 4U);
    *((int *)t25) = 0;
    t25 = (t21 + 8U);
    *((int *)t25) = -1;
    t26 = (0 - 10);
    t23 = (t26 * -1);
    t23 = (t23 + 1);
    t25 = (t21 + 12U);
    *((unsigned int *)t25) = t23;
    t16 = xsi_base_array_concat(t16, t17, t18, (char)97, t9, t19, (char)97, t11, t24, (char)101);
    t25 = (t0 + 4999);
    t30 = ((IEEE_P_1242562249) + 3080);
    t32 = (t31 + 0U);
    t33 = (t32 + 0U);
    *((int *)t33) = 0;
    t33 = (t32 + 4U);
    *((int *)t33) = 9;
    t33 = (t32 + 8U);
    *((int *)t33) = 1;
    t34 = (9 - 0);
    t23 = (t34 * 1);
    t23 = (t23 + 1);
    t33 = (t32 + 12U);
    *((unsigned int *)t33) = t23;
    t28 = xsi_base_array_concat(t28, t29, t30, (char)97, t16, t17, (char)97, t25, t31, (char)101);
    t23 = (11U + 11U);
    t35 = (t23 + 10U);
    t36 = (32U != t35);
    if (t36 == 1)
        goto LAB5;

LAB6:    t33 = (t0 + 3168);
    t37 = (t33 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t28, 32U);
    xsi_driver_first_trans_fast(t33);
    goto LAB3;

LAB5:    xsi_size_not_matching(32U, t35, 0);
    goto LAB6;

LAB7:    xsi_size_not_matching(32U, t14, 0);
    goto LAB8;

}

static void work_a_2926621779_3897078077_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(51, ng0);

LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 3232);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3088);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2926621779_3897078077_init()
{
	static char *pe[] = {(void *)work_a_2926621779_3897078077_p_0,(void *)work_a_2926621779_3897078077_p_1};
	xsi_register_didat("work_a_2926621779_3897078077", "isim/tb_top_desing_isim_beh.exe.sim/work/a_2926621779_3897078077.didat");
	xsi_register_executes(pe);
}
