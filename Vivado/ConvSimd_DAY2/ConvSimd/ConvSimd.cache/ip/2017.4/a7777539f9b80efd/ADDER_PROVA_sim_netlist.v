// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Sep 10 11:13:50 2021
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
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [16:0]S;

  wire [15:0]A;
  wire [15:0]B;
  wire [16:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "0000000000000000" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "17" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(1'b0),
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
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
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
  wire [16:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "0000000000000000" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "17" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(1'b0),
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
bkT6E5fbgDlbuWAtBmGwQOUyjK56dQiwqB/uHQzFns5fNxmSCHMjEVl9lwHWBLAWKkK9l/NROCig
mE2bGGDfx7i0AoVTmZUL79ogls7lnxVrhN/PR/0G52lj6xVkNgH1VlKXPWHezfMKhWG16w627LEw
W+1h1HMBVtQ45mHTlcTobm7uh5j+KUw/e7W5JUGliVmtbFexYxPmJZP4nJtwbVATfvwwcoIbEFqU
cmQwyFIZaH+EfgEUcv9o/vPwQAI4Nq+C5L6eCG2H/4mgRGAFCPEyrB5z2m9x2D/RXwEKqBkEkLtW
0m7Ls2yaAXN4SaykAypWu4GM3YwLu9T5JeiEBw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
IRc0wlnNitPbF1vxl8O9QBVntIx95prPGg4PTWxzBD0QfCJOAHWmwyLAwF1cbvFsbGXOu3fkbG+f
S/v7FnF0wMd2/ExLX9dt4re92yqJs3R4HLYSTTQtteVvg1+9s5OhHAdhtj8IAeOsLAkAViJg24d0
aaeJEPq04lPYnRk3mKR7pbrnPmmAbHG/2M5x89XSu+OIAncnMbdp5nO2msYzs7KNV4ojCnOOT9qn
PzGqSHWhYNBb7ss6U+0hN37thodg31ylzPft4a5BHFJjXjD77U/6uPCO0Z7HNknU4BysMha0xnnr
MRsEIGkcKr09O/L5FcHgBypBZD1NBuCOxOZ1Mg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9808)
`pragma protect data_block
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
nAnpbA==
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
