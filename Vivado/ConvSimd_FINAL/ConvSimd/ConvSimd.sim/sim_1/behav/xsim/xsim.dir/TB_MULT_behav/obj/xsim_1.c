/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_1036(char*, char *);
extern void execute_1037(char*, char *);
extern void execute_16(char*, char *);
extern void execute_17(char*, char *);
extern void execute_18(char*, char *);
extern void execute_19(char*, char *);
extern void execute_20(char*, char *);
extern void execute_21(char*, char *);
extern void execute_22(char*, char *);
extern void execute_23(char*, char *);
extern void execute_24(char*, char *);
extern void execute_25(char*, char *);
extern void execute_26(char*, char *);
extern void execute_27(char*, char *);
extern void execute_28(char*, char *);
extern void execute_29(char*, char *);
extern void execute_30(char*, char *);
extern void execute_31(char*, char *);
extern void execute_32(char*, char *);
extern void execute_33(char*, char *);
extern void execute_34(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_41(char*, char *);
extern void execute_42(char*, char *);
extern void execute_45(char*, char *);
extern void execute_46(char*, char *);
extern void execute_49(char*, char *);
extern void execute_50(char*, char *);
extern void execute_53(char*, char *);
extern void execute_176(char*, char *);
extern void execute_297(char*, char *);
extern void execute_418(char*, char *);
extern void execute_539(char*, char *);
extern void execute_660(char*, char *);
extern void execute_781(char*, char *);
extern void execute_902(char*, char *);
extern void execute_1023(char*, char *);
extern void execute_1024(char*, char *);
extern void execute_1025(char*, char *);
extern void execute_1026(char*, char *);
extern void execute_1027(char*, char *);
extern void execute_1028(char*, char *);
extern void execute_1029(char*, char *);
extern void execute_1030(char*, char *);
extern void execute_1031(char*, char *);
extern void execute_1032(char*, char *);
extern void execute_1033(char*, char *);
extern void execute_1034(char*, char *);
extern void execute_1035(char*, char *);
extern void execute_36(char*, char *);
extern void execute_40(char*, char *);
extern void execute_55(char*, char *);
extern void execute_58(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_3(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[58] = {(funcp)execute_1036, (funcp)execute_1037, (funcp)execute_16, (funcp)execute_17, (funcp)execute_18, (funcp)execute_19, (funcp)execute_20, (funcp)execute_21, (funcp)execute_22, (funcp)execute_23, (funcp)execute_24, (funcp)execute_25, (funcp)execute_26, (funcp)execute_27, (funcp)execute_28, (funcp)execute_29, (funcp)execute_30, (funcp)execute_31, (funcp)execute_32, (funcp)execute_33, (funcp)execute_34, (funcp)execute_37, (funcp)execute_38, (funcp)execute_41, (funcp)execute_42, (funcp)execute_45, (funcp)execute_46, (funcp)execute_49, (funcp)execute_50, (funcp)execute_53, (funcp)execute_176, (funcp)execute_297, (funcp)execute_418, (funcp)execute_539, (funcp)execute_660, (funcp)execute_781, (funcp)execute_902, (funcp)execute_1023, (funcp)execute_1024, (funcp)execute_1025, (funcp)execute_1026, (funcp)execute_1027, (funcp)execute_1028, (funcp)execute_1029, (funcp)execute_1030, (funcp)execute_1031, (funcp)execute_1032, (funcp)execute_1033, (funcp)execute_1034, (funcp)execute_1035, (funcp)execute_36, (funcp)execute_40, (funcp)execute_55, (funcp)execute_58, (funcp)execute_59, (funcp)execute_60, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_3};
const int NumRelocateId= 58;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/TB_MULT_behav/xsim.reloc",  (void **)funcTab, 58);
	iki_vhdl_file_variable_register(dp + 119856);
	iki_vhdl_file_variable_register(dp + 119912);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/TB_MULT_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/TB_MULT_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/TB_MULT_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/TB_MULT_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/TB_MULT_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
