// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Sep 10 11:10:55 2021
// Host        : DESKTOP-NDG2QTT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ADDER_PROVA_sim_netlist.v
// Design      : ADDER_PROVA
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ADDER_PROVA,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [16:0]S;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [16:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "1" *) 
  (* c_a_width = "16" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "1" *) 
  (* c_b_value = "0000000000000000" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "17" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "16" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "0000000000000000" *) 
(* C_B_WIDTH = "16" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "17" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [15:0]A;
  input [15:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [16:0]S;

  wire \<const0> ;
  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [16:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "1" *) 
  (* c_a_width = "16" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "1" *) 
  (* c_b_value = "0000000000000000" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "17" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
iO2Bdkfy0dqqValMR4KhTWXpD0gDQF+kyoly3tZBTZTVs0CbWJ4Owhu4jxMCf8X2gbWR6iweF6Ks
B5dmLHZTDA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
dbcEbgyZfx3YLmYpvjegvD9sRQCV1qBv0GqFBvCakC3SMR/H82zqo5uv5MZldBGUVmNHnxF3Vejx
zSqxUKfTNc90CS6quuoQe0eeq3T5XSdgwbNtjPZKvJuJTmQKT96yB3CfQOz13fGjaLrn/8NBUBBh
I7OEoGGg7ADph9V3vRg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bD3a4YgAnaoJx9/hljj2C1rODcUhawTVE1gtdPkNj8/YjemaFM6/sF7Q0CXbDJ7a+OBrB5pUgj3O
Vesi4yVmFp+mGmFarftWat5KmZiP3RVWrXwdzMj+f8T7p+lE3iD4njqUxIUz0TsUaNvFeW0xVNNb
OwTEX04nyt5HrU82dltJCclpFxE6yrP9YvI7l328bphwnC63xxk8T3yXwCrvj3VrIYuDT2yMRxrB
TBCv/Fe2f07JQyV73J7+DGAeJG0B1dTHeu48auQT63g1HsYaUXREihEUKgZe70QlOqlPbrr6Quhx
2LXE8LSdCA+FbJ7LlQc/Sgasj3ZYjM5lhEKleQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GCfR7acMSeEtOw1DhZKkUXjh9Uw/vUar7CGDRG9rZcB9NFDtQTltJeuKjFg8eaeKH9HFBMryuX72
/tmzhtFaiSTjr2na4ncL2XV3QRXe7nQaiHdc7cKBcZDvdSSMzOSYcIxLunwLwQTLC7sCvINmlxO1
NXnYzJVL1xb9HP8QVnSYpo1p+gCXcRBZzrOjZjCUnl7F2t3ZZStSGjBEyXVLnV+ouU3+247oJAOa
kC7v+pOtG2ho4KclIg0MGijjPs+jyOFU+b5C+ufQp/zL9GiZ5waCjb/0Y1vkBc9jZKR7YRnv+ASG
ju1uP8oqEXR9742kXRnW4HkMKkCK1MLDgWYdqw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L+AGKmFZ1zoRJFd2cA+zxJhkgQ1R0aEjGQCGRFLNNhLHZXpzGDIjdSLjralBVRJ2rD6UcJutapF5
YaMoV9kphGGG2B07dxBuIimVjOxS3ZQJ7ru59ddfGBxUe9EHrv00Q5hTwoxig0lxqnmjSSnfsDeF
weTIqNnXkG5kqqezKC8a2FvUD5QWQBibhK69OAdmhhIOwZmpfvQKbEKgLX70BzcNlmLnttRL7G+q
XZ3fabZ42+JJHDLiIfveB3Gp2Lf2tzTH1u2xx5aEUr9154pnC9PWIwL3y3VBAT1oHR7ScdoGDOEy
HoYUiDibldOidIeKW0KrTeAIuBNmtM4R0R+RSA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
V5ClnklUs5Wo++EDemG/KeowZlAfqB8SUrvSxPQGrdIwGfUvoCajhuABAWdS/L/pQl7Eyz51aiuw
KzPMrWtQozAEITf1xzvzgKbWZqoi4PQD3rThywFsFq60u8DdvHYM/kEvit0cZVFvG8rAbtlseHLu
0vU1kbrNgxb3bxjOovg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cRqAgScIUeXUwYGfCC0XDtpcc+mFNm3p8oTcFdtIU1nnlMagpBMqRm5ELc+m/Yw8jBwvcvt4tUFv
u/ypEEw+y12B+5Pr6SmnLJ+NVB3Q3Eyh4Q/d7p3jReIIsUxrlENpCTi4PVXMKr1B1Htzm8F8mXDq
y2UV+0SC+4yrBIntsdS0S8jPBERhfJhzNC5z38pPHANtM4wGGIUuKxIALLz1aq+2AjLbEgFHNrzw
2bJiDwRSTwrY4Yx2MSzYJk3O+cQBUe8nJDPx+aGEvDzQ4ZdJMNg2z+iaiE7OTaqK492Jb/1jvU0j
wlI+n35s2rrnc9QgfljdOJuueruPuYDi5vTTxA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YZlvsz39jcuWIBH3EMWnrBqQQeXhd6XQ77iTTMtTPu3i+QclaHMq4Yl439DyTxdR1OQ3YpZcwDzu
IMcqDe/5NsblKiHhOuLjJACRd2Pn2iD1NTQa2YV5YYCQrbOYRh2xeecHcftU0xJe9iovViD3sq1J
wKRNM9n20X8XJFUo6JIKb+I3vILbQDCtBBxP+TGXq7rNu0GeVoGmlRwPeACxfByC9dOh4+C7qyT5
wQ1a9+l69XxYHUHc+hoGbvIn2KlWbEKS/0lnHxXZMrVoSi5iKvWkh3qaiZsz6EXPbSS6LaBifEZT
sFovUDHEgziwK/sigRH2vD76UR1biLumsfphfA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NJcwpWM7T4bIDcuGzTynkwKdlLZ1iKyetWLgA675o8kLeI+ZSzak5Z9M4b+e87tdZ8YNjMsJGmZN
lVTOLKf5AkuSz5scMrgdkatBw/XYDy+JmUhfueR6fRSO7607Q7EbK0/+dIy1uIG6g0SjB0OGjQKs
Ce8MU8CjpevmQy/iZklGNhi8642xJlI+EhquJ+vfiKtBPQ+/re5owO55Qd8LLUtAy+UWklW5mrHm
IW7863aSOYcVJErg4vVfZ74EOv3bU/1E3KBZWsQuDzfEOIePL+YhzaIXoilxYQz7HH21/ZTlW6tQ
1ROghJgYf2ylZS/dkil5uY5wbSkOvOid3WR/wQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13776)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
