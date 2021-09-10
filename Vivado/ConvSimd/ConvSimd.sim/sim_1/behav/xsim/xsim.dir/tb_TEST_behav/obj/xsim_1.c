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
extern void execute_279(char*, char *);
extern void execute_280(char*, char *);
extern void execute_17(char*, char *);
extern void execute_21(char*, char *);
extern void execute_22(char*, char *);
extern void execute_256(char*, char *);
extern void execute_259(char*, char *);
extern void execute_66(char*, char *);
extern void execute_68(char*, char *);
extern void execute_70(char*, char *);
extern void execute_72(char*, char *);
extern void execute_77(char*, char *);
extern void execute_80(char*, char *);
extern void execute_84(char*, char *);
extern void execute_86(char*, char *);
extern void execute_88(char*, char *);
extern void execute_90(char*, char *);
extern void execute_251(char*, char *);
extern void execute_252(char*, char *);
extern void execute_105(char*, char *);
extern void execute_109(char*, char *);
extern void execute_108(char*, char *);
extern void execute_111(char*, char *);
extern void execute_116(char*, char *);
extern void execute_119(char*, char *);
extern void execute_122(char*, char *);
extern void execute_125(char*, char *);
extern void execute_128(char*, char *);
extern void execute_130(char*, char *);
extern void execute_131(char*, char *);
extern void execute_132(char*, char *);
extern void execute_137(char*, char *);
extern void execute_140(char*, char *);
extern void execute_142(char*, char *);
extern void execute_146(char*, char *);
extern void execute_148(char*, char *);
extern void execute_153(char*, char *);
extern void execute_155(char*, char *);
extern void execute_160(char*, char *);
extern void execute_161(char*, char *);
extern void execute_164(char*, char *);
extern void execute_166(char*, char *);
extern void execute_168(char*, char *);
extern void execute_264(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[46] = {(funcp)execute_279, (funcp)execute_280, (funcp)execute_17, (funcp)execute_21, (funcp)execute_22, (funcp)execute_256, (funcp)execute_259, (funcp)execute_66, (funcp)execute_68, (funcp)execute_70, (funcp)execute_72, (funcp)execute_77, (funcp)execute_80, (funcp)execute_84, (funcp)execute_86, (funcp)execute_88, (funcp)execute_90, (funcp)execute_251, (funcp)execute_252, (funcp)execute_105, (funcp)execute_109, (funcp)execute_108, (funcp)execute_111, (funcp)execute_116, (funcp)execute_119, (funcp)execute_122, (funcp)execute_125, (funcp)execute_128, (funcp)execute_130, (funcp)execute_131, (funcp)execute_132, (funcp)execute_137, (funcp)execute_140, (funcp)execute_142, (funcp)execute_146, (funcp)execute_148, (funcp)execute_153, (funcp)execute_155, (funcp)execute_160, (funcp)execute_161, (funcp)execute_164, (funcp)execute_166, (funcp)execute_168, (funcp)execute_264, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_1};
const int NumRelocateId= 46;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_TEST_behav/xsim.reloc",  (void **)funcTab, 46);
	iki_vhdl_file_variable_register(dp + 33464);
	iki_vhdl_file_variable_register(dp + 33520);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_TEST_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_TEST_behav/xsim.reloc");
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
    iki_set_sv_type_file_path_name("xsim.dir/tb_TEST_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_TEST_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_TEST_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
