// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Sep 10 11:13:51 2021
// Host        : DESKTOP-NDG2QTT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA_sim_netlist.v
// Design      : ADDER_PROVA
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ADDER_PROVA,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module ADDER_PROVA
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
  ADDER_PROVA_c_addsub_v12_0_11 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module ADDER_PROVA_c_addsub_v12_0_11
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
  ADDER_PROVA_c_addsub_v12_0_11_viv xst_addsub
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
X8cWB1H+CZ+Xa1AFtuf5D16oThIZyWfcVyvQsM8fnQkBalQeobCDOItZCvINmgYRvsnvUZTyPoF5
uNMjlC0g4B+xGDiq0ydrXyrRQo2T+8p1+66xzg77APJ/+ABMard1kXvjKATdJuJTbPPgsROqmN2P
fzl6sz4+Ae/6E2UoTvOqGEBZ6c27JSPKBEp1XzXiIQ5yUPQ5yUiUpsUC2zVmQnLe+wDh2AeaQHVD
LXxirfDlwd55gi0jtTNl4eomLMhyIJtHJaJbSSw06dW5+PdFebGkjLI00Qs/NKMvbvx0+ihhRS7N
lhPv9QT1+9g5ns14BVm7SDcB/uuT7s+C7P75Tg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ei8odkza+USAvRUs2K38dEzkvpfhqu2+jjtsf4kwj4YsW4Qp10HVlJgMNqM/HQ2Nq4imTRid9Ewl
JMadMBglqP/eNKwI9DAU2f6Mf/XuWNhUtxiVhcj2PkWpgiTMsfJyhUVHF68EVyvEix1TWFCJhXuh
j+XvHae2Dw4+IBN8HBK4OXyDH2iiuGchVie1VGob87AZEu8IGW8HyzazkKj6XqiAw4X94I/7CKXz
1vC0MFA1hL/9P7O6O04wut/J2eezC5Pf2g9+Rt192gED6UW8rP/Khh6hsvQyf2uzGVdC9G34hVbb
OZDttdWinK7627Un1t2LcqSZrkIUK4L0hsehUA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9808)
`pragma protect data_block
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
rZdqew==
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
