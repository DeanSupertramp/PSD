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
extern void execute_15(char*, char *);
extern void execute_20(char*, char *);
extern void execute_21(char*, char *);
extern void execute_255(char*, char *);
extern void execute_258(char*, char *);
extern void execute_65(char*, char *);
extern void execute_67(char*, char *);
extern void execute_69(char*, char *);
extern void execute_71(char*, char *);
extern void execute_76(char*, char *);
extern void execute_79(char*, char *);
extern void execute_83(char*, char *);
extern void execute_85(char*, char *);
extern void execute_87(char*, char *);
extern void execute_89(char*, char *);
extern void execute_250(char*, char *);
extern void execute_251(char*, char *);
extern void execute_104(char*, char *);
extern void execute_108(char*, char *);
extern void execute_107(char*, char *);
extern void execute_110(char*, char *);
extern void execute_115(char*, char *);
extern void execute_118(char*, char *);
extern void execute_121(char*, char *);
extern void execute_124(char*, char *);
extern void execute_127(char*, char *);
extern void execute_129(char*, char *);
extern void execute_130(char*, char *);
extern void execute_131(char*, char *);
extern void execute_136(char*, char *);
extern void execute_139(char*, char *);
extern void execute_141(char*, char *);
extern void execute_145(char*, char *);
extern void execute_147(char*, char *);
extern void execute_152(char*, char *);
extern void execute_154(char*, char *);
extern void execute_159(char*, char *);
extern void execute_160(char*, char *);
extern void execute_163(char*, char *);
extern void execute_165(char*, char *);
extern void execute_167(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[43] = {(funcp)execute_15, (funcp)execute_20, (funcp)execute_21, (funcp)execute_255, (funcp)execute_258, (funcp)execute_65, (funcp)execute_67, (funcp)execute_69, (funcp)execute_71, (funcp)execute_76, (funcp)execute_79, (funcp)execute_83, (funcp)execute_85, (funcp)execute_87, (funcp)execute_89, (funcp)execute_250, (funcp)execute_251, (funcp)execute_104, (funcp)execute_108, (funcp)execute_107, (funcp)execute_110, (funcp)execute_115, (funcp)execute_118, (funcp)execute_121, (funcp)execute_124, (funcp)execute_127, (funcp)execute_129, (funcp)execute_130, (funcp)execute_131, (funcp)execute_136, (funcp)execute_139, (funcp)execute_141, (funcp)execute_145, (funcp)execute_147, (funcp)execute_152, (funcp)execute_154, (funcp)execute_159, (funcp)execute_160, (funcp)execute_163, (funcp)execute_165, (funcp)execute_167, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_1};
const int NumRelocateId= 43;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/reg_file_behav/xsim.reloc",  (void **)funcTab, 43);
	iki_vhdl_file_variable_register(dp + 31312);
	iki_vhdl_file_variable_register(dp + 31368);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/reg_file_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/reg_file_behav/xsim.reloc");
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
    iki_set_sv_type_file_path_name("xsim.dir/reg_file_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/reg_file_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/reg_file_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
