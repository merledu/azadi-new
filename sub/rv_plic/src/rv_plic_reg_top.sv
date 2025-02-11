// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Modified by MERL, for Azadi SoC

module rv_plic_reg_top import rv_plic_reg_pkg::*; (
  input logic clk_i,
  input logic rst_ni,

  // Below Regster interface can be changed
  input  tlul_pkg::tlul_h2d_t tl_i,
  output tlul_pkg::tlul_d2h_t tl_o,
  // To HW
  output rv_plic_reg_pkg::rv_plic_reg2hw_t reg2hw, // Write
  input  rv_plic_reg_pkg::rv_plic_hw2reg_t hw2reg, // Read

  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);

  localparam int AW = 10;
  localparam int DW = 32;
  localparam int DBW = DW/8; // Byte Width

  // register signals
  logic           reg_we;
  logic           reg_re;
  logic [AW-1:0]  reg_addr;
  logic [DW-1:0]  reg_wdata;
  logic [DBW-1:0] reg_be;
  logic [DW-1:0]  reg_rdata;
  logic           reg_error;

  logic           addrmiss, wr_err;

  logic [DW-1:0]  reg_rdata_next;

  tlul_pkg::tlul_h2d_t tl_reg_h2d;
  tlul_pkg::tlul_d2h_t tl_reg_d2h;

  assign tl_reg_h2d = tl_i;
  assign tl_o       = tl_reg_d2h;

  tlul_adapter_reg #(
    .RegAw(AW),
    .RegDw(DW)
  ) u_reg_if (
    .clk_i,
    .rst_ni,

    .tl_i (tl_reg_h2d),
    .tl_o (tl_reg_d2h),

    .we_o    (reg_we),
    .re_o    (reg_re),
    .addr_o  (reg_addr),
    .wdata_o (reg_wdata),
    .be_o    (reg_be),
    .rdata_i (reg_rdata),
    .error_i (reg_error)
  );

  assign reg_rdata = reg_rdata_next ;
  assign reg_error = (devmode_i & addrmiss) | wr_err ;

  // Define SW related signals
  // Format: <reg>_<field>_{wd|we|qs}
  //        or <reg>_{wd|we|qs} if field == 1 or 0
  logic ip_0_p_0_qs;
  logic ip_0_p_1_qs;
  logic ip_0_p_2_qs;
  logic ip_0_p_3_qs;
  logic ip_0_p_4_qs;
  logic ip_0_p_5_qs;
  logic ip_0_p_6_qs;
  logic ip_0_p_7_qs;
  logic ip_0_p_8_qs;
  logic ip_0_p_9_qs;
  logic ip_0_p_10_qs;
  logic ip_0_p_11_qs;
  logic ip_0_p_12_qs;
  logic ip_0_p_13_qs;
  logic ip_0_p_14_qs;
  logic ip_0_p_15_qs;
  logic ip_0_p_16_qs;
  logic ip_0_p_17_qs;
  logic ip_0_p_18_qs;
  logic ip_0_p_19_qs;
  logic ip_0_p_20_qs;
  logic ip_0_p_21_qs;
  logic ip_0_p_22_qs;
  logic ip_0_p_23_qs;
  logic ip_0_p_24_qs;
  logic ip_0_p_25_qs;
  logic ip_0_p_26_qs;
  logic ip_0_p_27_qs;
  logic ip_0_p_28_qs;
  logic ip_0_p_29_qs;
  logic ip_0_p_30_qs;
  logic ip_0_p_31_qs;
  logic ip_1_p_32_qs;
  logic ip_1_p_33_qs;
  logic ip_1_p_34_qs;
  logic ip_1_p_35_qs;
  logic ip_1_p_36_qs;
  logic ip_1_p_37_qs;
  logic ip_1_p_38_qs;
  logic ip_1_p_39_qs;
  logic ip_1_p_40_qs;
  logic ip_1_p_41_qs;
  logic ip_1_p_42_qs;
  logic ip_1_p_43_qs;
  logic ip_1_p_44_qs;
  logic ip_1_p_45_qs;
  logic ip_1_p_46_qs;
  logic ip_1_p_47_qs;
  logic ip_1_p_48_qs;

  logic le_0_le_0_qs;
  logic le_0_le_0_wd;
  logic le_0_le_0_we;
  logic le_0_le_1_qs;
  logic le_0_le_1_wd;
  logic le_0_le_1_we;
  logic le_0_le_2_qs;
  logic le_0_le_2_wd;
  logic le_0_le_2_we;
  logic le_0_le_3_qs;
  logic le_0_le_3_wd;
  logic le_0_le_3_we;
  logic le_0_le_4_qs;
  logic le_0_le_4_wd;
  logic le_0_le_4_we;
  logic le_0_le_5_qs;
  logic le_0_le_5_wd;
  logic le_0_le_5_we;
  logic le_0_le_6_qs;
  logic le_0_le_6_wd;
  logic le_0_le_6_we;
  logic le_0_le_7_qs;
  logic le_0_le_7_wd;
  logic le_0_le_7_we;
  logic le_0_le_8_qs;
  logic le_0_le_8_wd;
  logic le_0_le_8_we;
  logic le_0_le_9_qs;
  logic le_0_le_9_wd;
  logic le_0_le_9_we;
  logic le_0_le_10_qs;
  logic le_0_le_10_wd;
  logic le_0_le_10_we;
  logic le_0_le_11_qs;
  logic le_0_le_11_wd;
  logic le_0_le_11_we;
  logic le_0_le_12_qs;
  logic le_0_le_12_wd;
  logic le_0_le_12_we;
  logic le_0_le_13_qs;
  logic le_0_le_13_wd;
  logic le_0_le_13_we;
  logic le_0_le_14_qs;
  logic le_0_le_14_wd;
  logic le_0_le_14_we;
  logic le_0_le_15_qs;
  logic le_0_le_15_wd;
  logic le_0_le_15_we;
  logic le_0_le_16_qs;
  logic le_0_le_16_wd;
  logic le_0_le_16_we;
  logic le_0_le_17_qs;
  logic le_0_le_17_wd;
  logic le_0_le_17_we;
  logic le_0_le_18_qs;
  logic le_0_le_18_wd;
  logic le_0_le_18_we;
  logic le_0_le_19_qs;
  logic le_0_le_19_wd;
  logic le_0_le_19_we;
  logic le_0_le_20_qs;
  logic le_0_le_20_wd;
  logic le_0_le_20_we;
  logic le_0_le_21_qs;
  logic le_0_le_21_wd;
  logic le_0_le_21_we;
  logic le_0_le_22_qs;
  logic le_0_le_22_wd;
  logic le_0_le_22_we;
  logic le_0_le_23_qs;
  logic le_0_le_23_wd;
  logic le_0_le_23_we;
  logic le_0_le_24_qs;
  logic le_0_le_24_wd;
  logic le_0_le_24_we;
  logic le_0_le_25_qs;
  logic le_0_le_25_wd;
  logic le_0_le_25_we;
  logic le_0_le_26_qs;
  logic le_0_le_26_wd;
  logic le_0_le_26_we;
  logic le_0_le_27_qs;
  logic le_0_le_27_wd;
  logic le_0_le_27_we;
  logic le_0_le_28_qs;
  logic le_0_le_28_wd;
  logic le_0_le_28_we;
  logic le_0_le_29_qs;
  logic le_0_le_29_wd;
  logic le_0_le_29_we;
  logic le_0_le_30_qs;
  logic le_0_le_30_wd;
  logic le_0_le_30_we;
  logic le_0_le_31_qs;
  logic le_0_le_31_wd;
  logic le_0_le_31_we;
  logic le_1_le_32_qs;
  logic le_1_le_32_wd;
  logic le_1_le_32_we;
  logic le_1_le_33_qs;
  logic le_1_le_33_wd;
  logic le_1_le_33_we;
  logic le_1_le_34_qs;
  logic le_1_le_34_wd;
  logic le_1_le_34_we;
  logic le_1_le_35_qs;
  logic le_1_le_35_wd;
  logic le_1_le_35_we;
  logic le_1_le_36_qs;
  logic le_1_le_36_wd;
  logic le_1_le_36_we;
  logic le_1_le_37_qs;
  logic le_1_le_37_wd;
  logic le_1_le_37_we;
  logic le_1_le_38_qs;
  logic le_1_le_38_wd;
  logic le_1_le_38_we;
  logic le_1_le_39_qs;
  logic le_1_le_39_wd;
  logic le_1_le_39_we;
  logic le_1_le_40_qs;
  logic le_1_le_40_wd;
  logic le_1_le_40_we;
  logic le_1_le_41_qs;
  logic le_1_le_41_wd;
  logic le_1_le_41_we;
  logic le_1_le_42_qs;
  logic le_1_le_42_wd;
  logic le_1_le_42_we;
  logic le_1_le_43_qs;
  logic le_1_le_43_wd;
  logic le_1_le_43_we;
  logic le_1_le_44_qs;
  logic le_1_le_44_wd;
  logic le_1_le_44_we;
  logic le_1_le_45_qs;
  logic le_1_le_45_wd;
  logic le_1_le_45_we;
  logic le_1_le_46_qs;
  logic le_1_le_46_wd;
  logic le_1_le_46_we;
  logic le_1_le_47_qs;
  logic le_1_le_47_wd;
  logic le_1_le_47_we;
  logic le_1_le_48_qs;
  logic le_1_le_48_wd;
  logic le_1_le_48_we;

  logic [1:0] prio0_qs;
  logic [1:0] prio0_wd;
  logic prio0_we;
  logic [1:0] prio1_qs;
  logic [1:0] prio1_wd;
  logic prio1_we;
  logic [1:0] prio2_qs;
  logic [1:0] prio2_wd;
  logic prio2_we;
  logic [1:0] prio3_qs;
  logic [1:0] prio3_wd;
  logic prio3_we;
  logic [1:0] prio4_qs;
  logic [1:0] prio4_wd;
  logic prio4_we;
  logic [1:0] prio5_qs;
  logic [1:0] prio5_wd;
  logic prio5_we;
  logic [1:0] prio6_qs;
  logic [1:0] prio6_wd;
  logic prio6_we;
  logic [1:0] prio7_qs;
  logic [1:0] prio7_wd;
  logic prio7_we;
  logic [1:0] prio8_qs;
  logic [1:0] prio8_wd;
  logic prio8_we;
  logic [1:0] prio9_qs;
  logic [1:0] prio9_wd;
  logic prio9_we;
  logic [1:0] prio10_qs;
  logic [1:0] prio10_wd;
  logic prio10_we;
  logic [1:0] prio11_qs;
  logic [1:0] prio11_wd;
  logic prio11_we;
  logic [1:0] prio12_qs;
  logic [1:0] prio12_wd;
  logic prio12_we;
  logic [1:0] prio13_qs;
  logic [1:0] prio13_wd;
  logic prio13_we;
  logic [1:0] prio14_qs;
  logic [1:0] prio14_wd;
  logic prio14_we;
  logic [1:0] prio15_qs;
  logic [1:0] prio15_wd;
  logic prio15_we;
  logic [1:0] prio16_qs;
  logic [1:0] prio16_wd;
  logic prio16_we;
  logic [1:0] prio17_qs;
  logic [1:0] prio17_wd;
  logic prio17_we;
  logic [1:0] prio18_qs;
  logic [1:0] prio18_wd;
  logic prio18_we;
  logic [1:0] prio19_qs;
  logic [1:0] prio19_wd;
  logic prio19_we;
  logic [1:0] prio20_qs;
  logic [1:0] prio20_wd;
  logic prio20_we;
  logic [1:0] prio21_qs;
  logic [1:0] prio21_wd;
  logic prio21_we;
  logic [1:0] prio22_qs;
  logic [1:0] prio22_wd;
  logic prio22_we;
  logic [1:0] prio23_qs;
  logic [1:0] prio23_wd;
  logic prio23_we;
  logic [1:0] prio24_qs;
  logic [1:0] prio24_wd;
  logic prio24_we;
  logic [1:0] prio25_qs;
  logic [1:0] prio25_wd;
  logic prio25_we;
  logic [1:0] prio26_qs;
  logic [1:0] prio26_wd;
  logic prio26_we;
  logic [1:0] prio27_qs;
  logic [1:0] prio27_wd;
  logic prio27_we;
  logic [1:0] prio28_qs;
  logic [1:0] prio28_wd;
  logic prio28_we;
  logic [1:0] prio29_qs;
  logic [1:0] prio29_wd;
  logic prio29_we;
  logic [1:0] prio30_qs;
  logic [1:0] prio30_wd;
  logic prio30_we;
  logic [1:0] prio31_qs;
  logic [1:0] prio31_wd;
  logic prio31_we;
  logic [1:0] prio32_qs;
  logic [1:0] prio32_wd;
  logic prio32_we;
  logic [1:0] prio33_qs;
  logic [1:0] prio33_wd;
  logic prio33_we;
  logic [1:0] prio34_qs;
  logic [1:0] prio34_wd;
  logic prio34_we;
  logic [1:0] prio35_qs;
  logic [1:0] prio35_wd;
  logic prio35_we;
  logic [1:0] prio36_qs;
  logic [1:0] prio36_wd;
  logic prio36_we;
  logic [1:0] prio37_qs;
  logic [1:0] prio37_wd;
  logic prio37_we;
  logic [1:0] prio38_qs;
  logic [1:0] prio38_wd;
  logic prio38_we;
  logic [1:0] prio39_qs;
  logic [1:0] prio39_wd;
  logic prio49_we;
  logic [1:0] prio40_qs;
  logic [1:0] prio40_wd;
  logic prio40_we;
  logic [1:0] prio41_qs;
  logic [1:0] prio41_wd;
  logic prio41_we;
  logic [1:0] prio42_qs;
  logic [1:0] prio42_wd;
  logic prio42_we;
  logic [1:0] prio43_qs;
  logic [1:0] prio43_wd;
  logic prio43_we;
  logic [1:0] prio44_qs;
  logic [1:0] prio44_wd;
  logic prio44_we;
  logic [1:0] prio45_qs;
  logic [1:0] prio45_wd;
  logic prio45_we;
  logic [1:0] prio46_qs;
  logic [1:0] prio46_wd;
  logic prio46_we;
  logic [1:0] prio47_qs;
  logic [1:0] prio47_wd;
  logic prio47_we;
  logic [1:0] prio48_qs;
  logic [1:0] prio48_wd;
  logic prio48_we;

  logic ie0_0_e_0_qs;
  logic ie0_0_e_0_wd;
  logic ie0_0_e_0_we;
  logic ie0_0_e_1_qs;
  logic ie0_0_e_1_wd;
  logic ie0_0_e_1_we;
  logic ie0_0_e_2_qs;
  logic ie0_0_e_2_wd;
  logic ie0_0_e_2_we;
  logic ie0_0_e_3_qs;
  logic ie0_0_e_3_wd;
  logic ie0_0_e_3_we;
  logic ie0_0_e_4_qs;
  logic ie0_0_e_4_wd;
  logic ie0_0_e_4_we;
  logic ie0_0_e_5_qs;
  logic ie0_0_e_5_wd;
  logic ie0_0_e_5_we;
  logic ie0_0_e_6_qs;
  logic ie0_0_e_6_wd;
  logic ie0_0_e_6_we;
  logic ie0_0_e_7_qs;
  logic ie0_0_e_7_wd;
  logic ie0_0_e_7_we;
  logic ie0_0_e_8_qs;
  logic ie0_0_e_8_wd;
  logic ie0_0_e_8_we;
  logic ie0_0_e_9_qs;
  logic ie0_0_e_9_wd;
  logic ie0_0_e_9_we;
  logic ie0_0_e_10_qs;
  logic ie0_0_e_10_wd;
  logic ie0_0_e_10_we;
  logic ie0_0_e_11_qs;
  logic ie0_0_e_11_wd;
  logic ie0_0_e_11_we;
  logic ie0_0_e_12_qs;
  logic ie0_0_e_12_wd;
  logic ie0_0_e_12_we;
  logic ie0_0_e_13_qs;
  logic ie0_0_e_13_wd;
  logic ie0_0_e_13_we;
  logic ie0_0_e_14_qs;
  logic ie0_0_e_14_wd;
  logic ie0_0_e_14_we;
  logic ie0_0_e_15_qs;
  logic ie0_0_e_15_wd;
  logic ie0_0_e_15_we;
  logic ie0_0_e_16_qs;
  logic ie0_0_e_16_wd;
  logic ie0_0_e_16_we;
  logic ie0_0_e_17_qs;
  logic ie0_0_e_17_wd;
  logic ie0_0_e_17_we;
  logic ie0_0_e_18_qs;
  logic ie0_0_e_18_wd;
  logic ie0_0_e_18_we;
  logic ie0_0_e_19_qs;
  logic ie0_0_e_19_wd;
  logic ie0_0_e_19_we;
  logic ie0_0_e_20_qs;
  logic ie0_0_e_20_wd;
  logic ie0_0_e_20_we;
  logic ie0_0_e_21_qs;
  logic ie0_0_e_21_wd;
  logic ie0_0_e_21_we;
  logic ie0_0_e_22_qs;
  logic ie0_0_e_22_wd;
  logic ie0_0_e_22_we;
  logic ie0_0_e_23_qs;
  logic ie0_0_e_23_wd;
  logic ie0_0_e_23_we;
  logic ie0_0_e_24_qs;
  logic ie0_0_e_24_wd;
  logic ie0_0_e_24_we;
  logic ie0_0_e_25_qs;
  logic ie0_0_e_25_wd;
  logic ie0_0_e_25_we;
  logic ie0_0_e_26_qs;
  logic ie0_0_e_26_wd;
  logic ie0_0_e_26_we;
  logic ie0_0_e_27_qs;
  logic ie0_0_e_27_wd;
  logic ie0_0_e_27_we;
  logic ie0_0_e_28_qs;
  logic ie0_0_e_28_wd;
  logic ie0_0_e_28_we;
  logic ie0_0_e_29_qs;
  logic ie0_0_e_29_wd;
  logic ie0_0_e_29_we;
  logic ie0_0_e_30_qs;
  logic ie0_0_e_30_wd;
  logic ie0_0_e_30_we;
  logic ie0_0_e_31_qs;
  logic ie0_0_e_31_wd;
  logic ie0_0_e_31_we;
  logic ie0_1_e_32_qs;
  logic ie0_1_e_32_wd;
  logic ie0_1_e_32_we;
  logic ie0_1_e_33_qs;
  logic ie0_1_e_33_wd;
  logic ie0_1_e_33_we;
  logic ie0_1_e_34_qs;
  logic ie0_1_e_34_wd;
  logic ie0_1_e_34_we;
  logic ie0_1_e_35_qs;
  logic ie0_1_e_35_wd;
  logic ie0_1_e_35_we;
  logic ie0_1_e_36_qs;
  logic ie0_1_e_36_wd;
  logic ie0_1_e_36_we;
  logic ie0_1_e_37_qs;
  logic ie0_1_e_37_wd;
  logic ie0_1_e_37_we;
  logic ie0_1_e_38_qs;
  logic ie0_1_e_38_wd;
  logic ie0_1_e_38_we;
  logic ie0_1_e_39_qs;
  logic ie0_1_e_39_wd;
  logic ie0_1_e_39_we;
  logic ie0_1_e_40_qs;
  logic ie0_1_e_40_wd;
  logic ie0_1_e_40_we;
  logic ie0_1_e_41_qs;
  logic ie0_1_e_41_wd;
  logic ie0_1_e_41_we;
  logic ie0_1_e_42_qs;
  logic ie0_1_e_42_wd;
  logic ie0_1_e_42_we;
  logic ie0_1_e_43_qs;
  logic ie0_1_e_43_wd;
  logic ie0_1_e_43_we;
  logic ie0_1_e_44_qs;
  logic ie0_1_e_44_wd;
  logic ie0_1_e_44_we;
  logic ie0_1_e_45_qs;
  logic ie0_1_e_45_wd;
  logic ie0_1_e_45_we;
  logic ie0_1_e_46_qs;
  logic ie0_1_e_46_wd;
  logic ie0_1_e_46_we;
  logic ie0_1_e_47_qs;
  logic ie0_1_e_47_wd;
  logic ie0_1_e_47_we;
  logic ie0_1_e_48_qs;
  logic ie0_1_e_48_wd;
  logic ie0_1_e_48_we;

  logic [1:0] threshold0_qs;
  logic [1:0] threshold0_wd;
  logic threshold0_we;
  logic [5:0] cc0_qs;
  logic [5:0] cc0_wd;
  logic cc0_we;
  logic cc0_re;
  logic msip0_qs;
  logic msip0_wd;
  logic msip0_we;

  ///////////////////////
  // Register instances
  ///////////////////////

  // Subregister 0 of Multireg ip
  // R[ip_0]: V(False)
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_0 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[0].de),
    .d      (hw2reg.ip[0].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_0_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_1 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[1].de),
    .d      (hw2reg.ip[1].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_1_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_2 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[2].de),
    .d      (hw2reg.ip[2].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_2_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_3 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[3].de),
    .d      (hw2reg.ip[3].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_3_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_4 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[4].de),
    .d      (hw2reg.ip[4].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_4_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_5 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[5].de),
    .d      (hw2reg.ip[5].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_5_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_6 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[6].de),
    .d      (hw2reg.ip[6].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_6_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_7 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[7].de),
    .d      (hw2reg.ip[7].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_7_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_8 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[8].de),
    .d      (hw2reg.ip[8].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_8_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_9 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[9].de),
    .d      (hw2reg.ip[9].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_9_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_10 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[10].de),
    .d      (hw2reg.ip[10].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_10_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_11 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[11].de),
    .d      (hw2reg.ip[11].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_11_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_12 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[12].de),
    .d      (hw2reg.ip[12].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_12_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_13 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[13].de),
    .d      (hw2reg.ip[13].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_13_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_14 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[14].de),
    .d      (hw2reg.ip[14].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_14_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_15 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[15].de),
    .d      (hw2reg.ip[15].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_15_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_16 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[16].de),
    .d      (hw2reg.ip[16].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_16_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_17 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[17].de),
    .d      (hw2reg.ip[17].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_17_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_18 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[18].de),
    .d      (hw2reg.ip[18].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_18_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_19 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[19].de),
    .d      (hw2reg.ip[19].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_19_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_20 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[20].de),
    .d      (hw2reg.ip[20].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_20_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_21 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[21].de),
    .d      (hw2reg.ip[21].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_21_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_22 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[22].de),
    .d      (hw2reg.ip[22].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_22_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_23 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[23].de),
    .d      (hw2reg.ip[23].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_23_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_24 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[24].de),
    .d      (hw2reg.ip[24].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_24_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_25 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[25].de),
    .d      (hw2reg.ip[25].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_25_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_26 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[26].de),
    .d      (hw2reg.ip[26].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_26_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_27 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[27].de),
    .d      (hw2reg.ip[27].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_27_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_28 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[28].de),
    .d      (hw2reg.ip[28].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_28_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_29 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[29].de),
    .d      (hw2reg.ip[29].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_29_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_30 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[30].de),
    .d      (hw2reg.ip[30].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_30_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_0_p_31 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[31].de),
    .d      (hw2reg.ip[31].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_0_p_31_qs)
  );


  // Subregister 32 of Multireg ip
  // R[ip_1]: V(False)
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_32 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[32].de),
    .d      (hw2reg.ip[32].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_32_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_33 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[33].de),
    .d      (hw2reg.ip[33].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_33_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_34 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[34].de),
    .d      (hw2reg.ip[34].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_34_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_35 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[35].de),
    .d      (hw2reg.ip[35].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_35_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_36 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[36].de),
    .d      (hw2reg.ip[36].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_36_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_37 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[37].de),
    .d      (hw2reg.ip[37].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_37_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_38 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[38].de),
    .d      (hw2reg.ip[38].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_38_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_39 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[39].de),
    .d      (hw2reg.ip[39].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_39_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_40 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[40].de),
    .d      (hw2reg.ip[40].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_40_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_41 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[41].de),
    .d      (hw2reg.ip[41].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_41_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_42 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[42].de),
    .d      (hw2reg.ip[42].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_42_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_43 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[43].de),
    .d      (hw2reg.ip[43].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_43_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_44 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[44].de),
    .d      (hw2reg.ip[44].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_44_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_45 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[45].de),
    .d      (hw2reg.ip[45].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_45_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_46 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[46].de),
    .d      (hw2reg.ip[46].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_46_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_47 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[47].de),
    .d      (hw2reg.ip[47].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_47_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_ip_1_p_48 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.ip[48].de),
    .d      (hw2reg.ip[48].d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (ip_1_p_48_qs)
  );

  // Subregister 0 of Multireg le
  // R[le_0]: V(False)
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_0 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_0_we),
    .wd     (le_0_le_0_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[0].q ),

    // to register interface (read)
    .qs     (le_0_le_0_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_1 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_1_we),
    .wd     (le_0_le_1_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[1].q ),

    // to register interface (read)
    .qs     (le_0_le_1_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_2 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_2_we),
    .wd     (le_0_le_2_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[2].q ),

    // to register interface (read)
    .qs     (le_0_le_2_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_3 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_3_we),
    .wd     (le_0_le_3_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[3].q ),

    // to register interface (read)
    .qs     (le_0_le_3_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_4 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_4_we),
    .wd     (le_0_le_4_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[4].q ),

    // to register interface (read)
    .qs     (le_0_le_4_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_5 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_5_we),
    .wd     (le_0_le_5_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[5].q ),

    // to register interface (read)
    .qs     (le_0_le_5_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_6 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_6_we),
    .wd     (le_0_le_6_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[6].q ),

    // to register interface (read)
    .qs     (le_0_le_6_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_7 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_7_we),
    .wd     (le_0_le_7_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[7].q ),

    // to register interface (read)
    .qs     (le_0_le_7_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_8 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_8_we),
    .wd     (le_0_le_8_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[8].q ),

    // to register interface (read)
    .qs     (le_0_le_8_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_9 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_9_we),
    .wd     (le_0_le_9_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[9].q ),

    // to register interface (read)
    .qs     (le_0_le_9_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_10 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_10_we),
    .wd     (le_0_le_10_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[10].q ),

    // to register interface (read)
    .qs     (le_0_le_10_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_11 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_11_we),
    .wd     (le_0_le_11_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[11].q ),

    // to register interface (read)
    .qs     (le_0_le_11_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_12 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_12_we),
    .wd     (le_0_le_12_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[12].q ),

    // to register interface (read)
    .qs     (le_0_le_12_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_13 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_13_we),
    .wd     (le_0_le_13_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[13].q ),

    // to register interface (read)
    .qs     (le_0_le_13_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_14 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_14_we),
    .wd     (le_0_le_14_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[14].q ),

    // to register interface (read)
    .qs     (le_0_le_14_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_15 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_15_we),
    .wd     (le_0_le_15_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[15].q ),

    // to register interface (read)
    .qs     (le_0_le_15_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_16 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_16_we),
    .wd     (le_0_le_16_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[16].q ),

    // to register interface (read)
    .qs     (le_0_le_16_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_17 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_17_we),
    .wd     (le_0_le_17_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[17].q ),

    // to register interface (read)
    .qs     (le_0_le_17_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_18 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_18_we),
    .wd     (le_0_le_18_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[18].q ),

    // to register interface (read)
    .qs     (le_0_le_18_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_19 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_19_we),
    .wd     (le_0_le_19_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[19].q ),

    // to register interface (read)
    .qs     (le_0_le_19_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_20 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_20_we),
    .wd     (le_0_le_20_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[20].q ),

    // to register interface (read)
    .qs     (le_0_le_20_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_21 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_21_we),
    .wd     (le_0_le_21_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[21].q ),

    // to register interface (read)
    .qs     (le_0_le_21_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_22 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_22_we),
    .wd     (le_0_le_22_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[22].q ),

    // to register interface (read)
    .qs     (le_0_le_22_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_23 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_23_we),
    .wd     (le_0_le_23_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[23].q ),

    // to register interface (read)
    .qs     (le_0_le_23_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_24 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_24_we),
    .wd     (le_0_le_24_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[24].q ),

    // to register interface (read)
    .qs     (le_0_le_24_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_25 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_25_we),
    .wd     (le_0_le_25_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[25].q ),

    // to register interface (read)
    .qs     (le_0_le_25_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_26 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_26_we),
    .wd     (le_0_le_26_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[26].q ),

    // to register interface (read)
    .qs     (le_0_le_26_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_27 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_27_we),
    .wd     (le_0_le_27_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[27].q ),

    // to register interface (read)
    .qs     (le_0_le_27_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_28 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_28_we),
    .wd     (le_0_le_28_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[28].q ),

    // to register interface (read)
    .qs     (le_0_le_28_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_29 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_29_we),
    .wd     (le_0_le_29_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[29].q ),

    // to register interface (read)
    .qs     (le_0_le_29_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_30 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_30_we),
    .wd     (le_0_le_30_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[30].q ),

    // to register interface (read)
    .qs     (le_0_le_30_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_0_le_31 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_0_le_31_we),
    .wd     (le_0_le_31_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[31].q ),

    // to register interface (read)
    .qs     (le_0_le_31_qs)
  );


  // Subregister 32 of Multireg le
  // R[le_1]: V(False)
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_32 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_32_we),
    .wd     (le_1_le_32_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[32].q ),

    // to register interface (read)
    .qs     (le_1_le_32_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_33 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_33_we),
    .wd     (le_1_le_33_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[33].q ),

    // to register interface (read)
    .qs     (le_1_le_33_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_34 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_34_we),
    .wd     (le_1_le_34_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[34].q ),

    // to register interface (read)
    .qs     (le_1_le_34_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_35 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_35_we),
    .wd     (le_1_le_35_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[35].q ),

    // to register interface (read)
    .qs     (le_1_le_35_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_36 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_36_we),
    .wd     (le_1_le_36_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[36].q ),

    // to register interface (read)
    .qs     (le_1_le_36_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_37 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_37_we),
    .wd     (le_1_le_37_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[37].q ),

    // to register interface (read)
    .qs     (le_1_le_37_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_38 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_38_we),
    .wd     (le_1_le_38_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[38].q ),

    // to register interface (read)
    .qs     (le_1_le_38_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_39 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_39_we),
    .wd     (le_1_le_39_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[39].q ),

    // to register interface (read)
    .qs     (le_1_le_39_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_40 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_40_we),
    .wd     (le_1_le_40_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[40].q ),

    // to register interface (read)
    .qs     (le_1_le_40_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_41 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_41_we),
    .wd     (le_1_le_41_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[41].q ),

    // to register interface (read)
    .qs     (le_1_le_41_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_42 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_42_we),
    .wd     (le_1_le_42_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[42].q ),

    // to register interface (read)
    .qs     (le_1_le_42_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_43 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_43_we),
    .wd     (le_1_le_43_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[43].q ),

    // to register interface (read)
    .qs     (le_1_le_43_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_44 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_44_we),
    .wd     (le_1_le_44_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[44].q ),

    // to register interface (read)
    .qs     (le_1_le_44_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_45 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_45_we),
    .wd     (le_1_le_45_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[45].q ),

    // to register interface (read)
    .qs     (le_1_le_45_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_46 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_46_we),
    .wd     (le_1_le_46_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[46].q ),

    // to register interface (read)
    .qs     (le_1_le_46_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_47 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_47_we),
    .wd     (le_1_le_47_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[47].q ),

    // to register interface (read)
    .qs     (le_1_le_47_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_le_1_le_48 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (le_1_le_48_we),
    .wd     (le_1_le_48_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.le[48].q ),

    // to register interface (read)
    .qs     (le_1_le_48_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio0 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio0_we),
    .wd     (prio0_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio0.q ),

    // to register interface (read)
    .qs     (prio0_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio1 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio1_we),
    .wd     (prio1_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio1.q ),

    // to register interface (read)
    .qs     (prio1_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio2 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio2_we),
    .wd     (prio2_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio2.q ),

    // to register interface (read)
    .qs     (prio2_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio3 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio3_we),
    .wd     (prio3_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio3.q ),

    // to register interface (read)
    .qs     (prio3_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio4 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio4_we),
    .wd     (prio4_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio4.q ),

    // to register interface (read)
    .qs     (prio4_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio5 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio5_we),
    .wd     (prio5_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio5.q ),

    // to register interface (read)
    .qs     (prio5_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio6 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio6_we),
    .wd     (prio6_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio6.q ),

    // to register interface (read)
    .qs     (prio6_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio7 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio7_we),
    .wd     (prio7_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio7.q ),

    // to register interface (read)
    .qs     (prio7_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio8 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio8_we),
    .wd     (prio8_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio8.q ),

    // to register interface (read)
    .qs     (prio8_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio9 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio9_we),
    .wd     (prio9_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio9.q ),

    // to register interface (read)
    .qs     (prio9_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio10 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio10_we),
    .wd     (prio10_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio10.q ),

    // to register interface (read)
    .qs     (prio10_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio11 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio11_we),
    .wd     (prio11_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio11.q ),

    // to register interface (read)
    .qs     (prio11_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio12 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio12_we),
    .wd     (prio12_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio12.q ),

    // to register interface (read)
    .qs     (prio12_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio13 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio13_we),
    .wd     (prio13_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio13.q ),

    // to register interface (read)
    .qs     (prio13_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio14 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio14_we),
    .wd     (prio14_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio14.q ),

    // to register interface (read)
    .qs     (prio14_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio15 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio15_we),
    .wd     (prio15_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio15.q ),

    // to register interface (read)
    .qs     (prio15_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio16 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio16_we),
    .wd     (prio16_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio16.q ),

    // to register interface (read)
    .qs     (prio16_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio17 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio17_we),
    .wd     (prio17_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio17.q ),

    // to register interface (read)
    .qs     (prio17_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio18 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio18_we),
    .wd     (prio18_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio18.q ),

    // to register interface (read)
    .qs     (prio18_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio19 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio19_we),
    .wd     (prio19_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio19.q ),

    // to register interface (read)
    .qs     (prio19_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio20 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio20_we),
    .wd     (prio20_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio20.q ),

    // to register interface (read)
    .qs     (prio20_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio21 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio21_we),
    .wd     (prio21_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio21.q ),

    // to register interface (read)
    .qs     (prio21_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio22 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio22_we),
    .wd     (prio22_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio22.q ),

    // to register interface (read)
    .qs     (prio22_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio23 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio23_we),
    .wd     (prio23_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio23.q ),

    // to register interface (read)
    .qs     (prio23_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio24 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio24_we),
    .wd     (prio24_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio24.q ),

    // to register interface (read)
    .qs     (prio24_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio25 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio25_we),
    .wd     (prio25_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio25.q ),

    // to register interface (read)
    .qs     (prio25_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio26 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio26_we),
    .wd     (prio26_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio26.q ),

    // to register interface (read)
    .qs     (prio26_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio27 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio27_we),
    .wd     (prio27_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio27.q ),

    // to register interface (read)
    .qs     (prio27_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio28 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio28_we),
    .wd     (prio28_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio28.q ),

    // to register interface (read)
    .qs     (prio28_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio29 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio29_we),
    .wd     (prio29_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio29.q ),

    // to register interface (read)
    .qs     (prio29_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio30 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio30_we),
    .wd     (prio30_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio30.q ),

    // to register interface (read)
    .qs     (prio30_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio31 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio31_we),
    .wd     (prio31_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio31.q ),

    // to register interface (read)
    .qs     (prio31_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio32 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio32_we),
    .wd     (prio32_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio32.q ),

    // to register interface (read)
    .qs     (prio32_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio33 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio33_we),
    .wd     (prio33_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio33.q ),

    // to register interface (read)
    .qs     (prio33_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio34 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio34_we),
    .wd     (prio34_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio34.q ),

    // to register interface (read)
    .qs     (prio34_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio35 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio35_we),
    .wd     (prio35_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio35.q ),

    // to register interface (read)
    .qs     (prio35_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio36 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio36_we),
    .wd     (prio36_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio36.q ),

    // to register interface (read)
    .qs     (prio36_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio37 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio37_we),
    .wd     (prio37_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio37.q ),

    // to register interface (read)
    .qs     (prio37_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio38 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio38_we),
    .wd     (prio38_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio38.q ),

    // to register interface (read)
    .qs     (prio38_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio39 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio39_we),
    .wd     (prio39_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio39.q ),

    // to register interface (read)
    .qs     (prio39_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio40 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio40_we),
    .wd     (prio40_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio40.q ),

    // to register interface (read)
    .qs     (prio40_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio41 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio41_we),
    .wd     (prio41_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio41.q ),

    // to register interface (read)
    .qs     (prio41_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio42 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio42_we),
    .wd     (prio42_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio42.q ),

    // to register interface (read)
    .qs     (prio42_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio43 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio43_we),
    .wd     (prio43_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio43.q ),

    // to register interface (read)
    .qs     (prio43_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio44 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio44_we),
    .wd     (prio44_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio44.q ),

    // to register interface (read)
    .qs     (prio44_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio45 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio45_we),
    .wd     (prio45_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio45.q ),

    // to register interface (read)
    .qs     (prio45_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio46 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio46_we),
    .wd     (prio46_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio46.q ),

    // to register interface (read)
    .qs     (prio46_qs)
  );

  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_prio48 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (prio48_we),
    .wd     (prio48_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.prio48.q ),

    // to register interface (read)
    .qs     (prio48_qs)
  );

  // Subregister 0 of Multireg ie0
  // R[ie0_0]: V(False)
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_0 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_0_we),
    .wd     (ie0_0_e_0_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[0].q ),

    // to register interface (read)
    .qs     (ie0_0_e_0_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_1 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_1_we),
    .wd     (ie0_0_e_1_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[1].q ),

    // to register interface (read)
    .qs     (ie0_0_e_1_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_2 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_2_we),
    .wd     (ie0_0_e_2_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[2].q ),

    // to register interface (read)
    .qs     (ie0_0_e_2_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_3 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_3_we),
    .wd     (ie0_0_e_3_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[3].q ),

    // to register interface (read)
    .qs     (ie0_0_e_3_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_4 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_4_we),
    .wd     (ie0_0_e_4_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[4].q ),

    // to register interface (read)
    .qs     (ie0_0_e_4_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_5 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_5_we),
    .wd     (ie0_0_e_5_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[5].q ),

    // to register interface (read)
    .qs     (ie0_0_e_5_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_6 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_6_we),
    .wd     (ie0_0_e_6_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[6].q ),

    // to register interface (read)
    .qs     (ie0_0_e_6_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_7 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_7_we),
    .wd     (ie0_0_e_7_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[7].q ),

    // to register interface (read)
    .qs     (ie0_0_e_7_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_8 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_8_we),
    .wd     (ie0_0_e_8_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[8].q ),

    // to register interface (read)
    .qs     (ie0_0_e_8_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_9 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_9_we),
    .wd     (ie0_0_e_9_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[9].q ),

    // to register interface (read)
    .qs     (ie0_0_e_9_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_10 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_10_we),
    .wd     (ie0_0_e_10_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[10].q ),

    // to register interface (read)
    .qs     (ie0_0_e_10_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_11 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_11_we),
    .wd     (ie0_0_e_11_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[11].q ),

    // to register interface (read)
    .qs     (ie0_0_e_11_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_12 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_12_we),
    .wd     (ie0_0_e_12_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[12].q ),

    // to register interface (read)
    .qs     (ie0_0_e_12_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_13 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_13_we),
    .wd     (ie0_0_e_13_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[13].q ),

    // to register interface (read)
    .qs     (ie0_0_e_13_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_14 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_14_we),
    .wd     (ie0_0_e_14_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[14].q ),

    // to register interface (read)
    .qs     (ie0_0_e_14_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_15 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_15_we),
    .wd     (ie0_0_e_15_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[15].q ),

    // to register interface (read)
    .qs     (ie0_0_e_15_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_16 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_16_we),
    .wd     (ie0_0_e_16_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[16].q ),

    // to register interface (read)
    .qs     (ie0_0_e_16_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_17 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_17_we),
    .wd     (ie0_0_e_17_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[17].q ),

    // to register interface (read)
    .qs     (ie0_0_e_17_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_18 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_18_we),
    .wd     (ie0_0_e_18_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[18].q ),

    // to register interface (read)
    .qs     (ie0_0_e_18_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_19 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_19_we),
    .wd     (ie0_0_e_19_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[19].q ),

    // to register interface (read)
    .qs     (ie0_0_e_19_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_20 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_20_we),
    .wd     (ie0_0_e_20_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[20].q ),

    // to register interface (read)
    .qs     (ie0_0_e_20_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_21 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_21_we),
    .wd     (ie0_0_e_21_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[21].q ),

    // to register interface (read)
    .qs     (ie0_0_e_21_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_22 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_22_we),
    .wd     (ie0_0_e_22_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[22].q ),

    // to register interface (read)
    .qs     (ie0_0_e_22_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_23 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_23_we),
    .wd     (ie0_0_e_23_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[23].q ),

    // to register interface (read)
    .qs     (ie0_0_e_23_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_24 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_24_we),
    .wd     (ie0_0_e_24_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[24].q ),

    // to register interface (read)
    .qs     (ie0_0_e_24_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_25 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_25_we),
    .wd     (ie0_0_e_25_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[25].q ),

    // to register interface (read)
    .qs     (ie0_0_e_25_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_26 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_26_we),
    .wd     (ie0_0_e_26_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[26].q ),

    // to register interface (read)
    .qs     (ie0_0_e_26_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_27 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_27_we),
    .wd     (ie0_0_e_27_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[27].q ),

    // to register interface (read)
    .qs     (ie0_0_e_27_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_28 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_28_we),
    .wd     (ie0_0_e_28_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[28].q ),

    // to register interface (read)
    .qs     (ie0_0_e_28_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_29 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_29_we),
    .wd     (ie0_0_e_29_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[29].q ),

    // to register interface (read)
    .qs     (ie0_0_e_29_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_30 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_30_we),
    .wd     (ie0_0_e_30_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[30].q ),

    // to register interface (read)
    .qs     (ie0_0_e_30_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_0_e_31 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_0_e_31_we),
    .wd     (ie0_0_e_31_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[31].q ),

    // to register interface (read)
    .qs     (ie0_0_e_31_qs)
  );


  // Subregister 32 of Multireg ie0
  // R[ie0_1]: V(False)
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_32 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_32_we),
    .wd     (ie0_1_e_32_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[32].q ),

    // to register interface (read)
    .qs     (ie0_1_e_32_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_33 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_33_we),
    .wd     (ie0_1_e_33_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[33].q ),

    // to register interface (read)
    .qs     (ie0_1_e_33_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_34 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_34_we),
    .wd     (ie0_1_e_34_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[34].q ),

    // to register interface (read)
    .qs     (ie0_1_e_34_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_35 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_35_we),
    .wd     (ie0_1_e_35_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[35].q ),

    // to register interface (read)
    .qs     (ie0_1_e_35_qs)
  );
  
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_36 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_36_we),
    .wd     (ie0_1_e_36_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[36].q ),

    // to register interface (read)
    .qs     (ie0_1_e_36_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_37 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_37_we),
    .wd     (ie0_1_e_37_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[37].q ),

    // to register interface (read)
    .qs     (ie0_1_e_37_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_38 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_38_we),
    .wd     (ie0_1_e_38_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[38].q ),

    // to register interface (read)
    .qs     (ie0_1_e_38_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_39 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_39_we),
    .wd     (ie0_1_e_39_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[39].q ),

    // to register interface (read)
    .qs     (ie0_1_e_39_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_40 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_40_we),
    .wd     (ie0_1_e_40_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[40].q ),

    // to register interface (read)
    .qs     (ie0_1_e_40_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_41 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_41_we),
    .wd     (ie0_1_e_41_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[41].q ),

    // to register interface (read)
    .qs     (ie0_1_e_41_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_42 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_42_we),
    .wd     (ie0_1_e_42_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[42].q ),

    // to register interface (read)
    .qs     (ie0_1_e_42_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_43 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_43_we),
    .wd     (ie0_1_e_43_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[43].q ),

    // to register interface (read)
    .qs     (ie0_1_e_43_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_44 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_44_we),
    .wd     (ie0_1_e_44_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[44].q ),

    // to register interface (read)
    .qs     (ie0_1_e_44_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_45 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_45_we),
    .wd     (ie0_1_e_45_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[45].q ),

    // to register interface (read)
    .qs     (ie0_1_e_45_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_46 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_46_we),
    .wd     (ie0_1_e_46_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[46].q ),

    // to register interface (read)
    .qs     (ie0_1_e_46_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_47 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_47_we),
    .wd     (ie0_1_e_47_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[47].q ),

    // to register interface (read)
    .qs     (ie0_1_e_47_qs)
  );

  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ie0_1_e_48 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ie0_1_e_48_we),
    .wd     (ie0_1_e_48_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.ie0[48].q ),

    // to register interface (read)
    .qs     (ie0_1_e_48_qs)
  );

  // R[threshold0]: V(False)
  prim_subreg #(
    .DW      (2),
    .SWACCESS("RW"),
    .RESVAL  (2'h0)
  ) u_threshold0 (
    .clk_i   (clk_i   ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (threshold0_we),
    .wd     (threshold0_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.threshold0.q ),

    // to register interface (read)
    .qs     (threshold0_qs)
  );

  // R[cc0]: V(True)
  prim_subreg_ext #(
    .DW    (6)
  ) u_cc0 (
    .re     (cc0_re),
    .we     (cc0_we),
    .wd     (cc0_wd),
    .d      (hw2reg.cc0.d),
    .qre    (reg2hw.cc0.re),
    .qe     (reg2hw.cc0.qe),
    .q      (reg2hw.cc0.q ),
    .qs     (cc0_qs)
  );

  // R[msip0]: V(False)
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_msip0 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (msip0_we),
    .wd     (msip0_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.msip0.q ),

    // to register interface (read)
    .qs     (msip0_qs)
  );

  logic [57:0] addr_hit;
  always_comb begin
    addr_hit = '0;
    addr_hit[  0] = (reg_addr == RV_PLIC_IP_0_OFFSET);
    addr_hit[  1] = (reg_addr == RV_PLIC_IP_1_OFFSET);
    addr_hit[  2] = (reg_addr == RV_PLIC_LE_0_OFFSET);
    addr_hit[  3] = (reg_addr == RV_PLIC_LE_1_OFFSET);
    addr_hit[  4] = (reg_addr == RV_PLIC_PRIO0_OFFSET);
    addr_hit[  5] = (reg_addr == RV_PLIC_PRIO1_OFFSET);
    addr_hit[  6] = (reg_addr == RV_PLIC_PRIO2_OFFSET);
    addr_hit[  7] = (reg_addr == RV_PLIC_PRIO3_OFFSET);
    addr_hit[  8] = (reg_addr == RV_PLIC_PRIO4_OFFSET);
    addr_hit[  9] = (reg_addr == RV_PLIC_PRIO5_OFFSET);
    addr_hit[ 10] = (reg_addr == RV_PLIC_PRIO6_OFFSET);
    addr_hit[ 11] = (reg_addr == RV_PLIC_PRIO7_OFFSET);
    addr_hit[ 12] = (reg_addr == RV_PLIC_PRIO8_OFFSET);
    addr_hit[ 13] = (reg_addr == RV_PLIC_PRIO9_OFFSET);
    addr_hit[ 14] = (reg_addr == RV_PLIC_PRIO10_OFFSET);
    addr_hit[ 15] = (reg_addr == RV_PLIC_PRIO11_OFFSET);
    addr_hit[ 16] = (reg_addr == RV_PLIC_PRIO12_OFFSET);
    addr_hit[ 17] = (reg_addr == RV_PLIC_PRIO13_OFFSET);
    addr_hit[ 18] = (reg_addr == RV_PLIC_PRIO14_OFFSET);
    addr_hit[ 19] = (reg_addr == RV_PLIC_PRIO15_OFFSET);
    addr_hit[ 20] = (reg_addr == RV_PLIC_PRIO16_OFFSET);
    addr_hit[ 21] = (reg_addr == RV_PLIC_PRIO17_OFFSET);
    addr_hit[ 22] = (reg_addr == RV_PLIC_PRIO18_OFFSET);
    addr_hit[ 23] = (reg_addr == RV_PLIC_PRIO19_OFFSET);
    addr_hit[ 24] = (reg_addr == RV_PLIC_PRIO20_OFFSET);
    addr_hit[ 25] = (reg_addr == RV_PLIC_PRIO21_OFFSET);
    addr_hit[ 26] = (reg_addr == RV_PLIC_PRIO22_OFFSET);
    addr_hit[ 27] = (reg_addr == RV_PLIC_PRIO23_OFFSET);
    addr_hit[ 28] = (reg_addr == RV_PLIC_PRIO24_OFFSET);
    addr_hit[ 29] = (reg_addr == RV_PLIC_PRIO25_OFFSET);
    addr_hit[ 30] = (reg_addr == RV_PLIC_PRIO26_OFFSET);
    addr_hit[ 31] = (reg_addr == RV_PLIC_PRIO27_OFFSET);
    addr_hit[ 32] = (reg_addr == RV_PLIC_PRIO28_OFFSET);
    addr_hit[ 33] = (reg_addr == RV_PLIC_PRIO29_OFFSET);
    addr_hit[ 34] = (reg_addr == RV_PLIC_PRIO30_OFFSET);
    addr_hit[ 35] = (reg_addr == RV_PLIC_PRIO31_OFFSET);
    addr_hit[ 36] = (reg_addr == RV_PLIC_PRIO32_OFFSET);
    addr_hit[ 37] = (reg_addr == RV_PLIC_PRIO33_OFFSET);
    addr_hit[ 38] = (reg_addr == RV_PLIC_PRIO34_OFFSET);
    addr_hit[ 39] = (reg_addr == RV_PLIC_PRIO35_OFFSET);
    addr_hit[ 40] = (reg_addr == RV_PLIC_PRIO36_OFFSET);
    addr_hit[ 41] = (reg_addr == RV_PLIC_PRIO37_OFFSET);
    addr_hit[ 42] = (reg_addr == RV_PLIC_PRIO38_OFFSET);
    addr_hit[ 43] = (reg_addr == RV_PLIC_PRIO39_OFFSET);
    addr_hit[ 44] = (reg_addr == RV_PLIC_PRIO40_OFFSET);
    addr_hit[ 45] = (reg_addr == RV_PLIC_PRIO41_OFFSET);
    addr_hit[ 46] = (reg_addr == RV_PLIC_PRIO42_OFFSET);
    addr_hit[ 47] = (reg_addr == RV_PLIC_PRIO43_OFFSET);
    addr_hit[ 48] = (reg_addr == RV_PLIC_PRIO44_OFFSET);
    addr_hit[ 49] = (reg_addr == RV_PLIC_PRIO45_OFFSET);
    addr_hit[ 50] = (reg_addr == RV_PLIC_PRIO46_OFFSET);
    addr_hit[ 51] = (reg_addr == RV_PLIC_PRIO47_OFFSET);
    addr_hit[ 52] = (reg_addr == RV_PLIC_PRIO48_OFFSET);
    addr_hit[ 53] = (reg_addr == RV_PLIC_IE0_0_OFFSET);
    addr_hit[ 54] = (reg_addr == RV_PLIC_IE0_1_OFFSET);
    addr_hit[ 55] = (reg_addr == RV_PLIC_THRESHOLD0_OFFSET);
    addr_hit[ 56] = (reg_addr == RV_PLIC_CC0_OFFSET);
    addr_hit[ 57] = (reg_addr == RV_PLIC_MSIP0_OFFSET);
  end

  assign addrmiss = (reg_re || reg_we) ? ~|addr_hit : 1'b0 ;

  // Check sub-word write is permitted
  always_comb begin
    wr_err = 1'b0;
    wr_err = (reg_we &
              ((addr_hit[  0] & (|(RV_PLIC_PERMIT[  0] & ~reg_be))) |
               (addr_hit[  1] & (|(RV_PLIC_PERMIT[  1] & ~reg_be))) |
               (addr_hit[  2] & (|(RV_PLIC_PERMIT[  2] & ~reg_be))) |
               (addr_hit[  3] & (|(RV_PLIC_PERMIT[  3] & ~reg_be))) |
               (addr_hit[  4] & (|(RV_PLIC_PERMIT[  4] & ~reg_be))) |
               (addr_hit[  5] & (|(RV_PLIC_PERMIT[  5] & ~reg_be))) |
               (addr_hit[  6] & (|(RV_PLIC_PERMIT[  6] & ~reg_be))) |
               (addr_hit[  7] & (|(RV_PLIC_PERMIT[  7] & ~reg_be))) |
               (addr_hit[  8] & (|(RV_PLIC_PERMIT[  8] & ~reg_be))) |
               (addr_hit[  9] & (|(RV_PLIC_PERMIT[  9] & ~reg_be))) |
               (addr_hit[ 10] & (|(RV_PLIC_PERMIT[ 10] & ~reg_be))) |
               (addr_hit[ 11] & (|(RV_PLIC_PERMIT[ 11] & ~reg_be))) |
               (addr_hit[ 12] & (|(RV_PLIC_PERMIT[ 12] & ~reg_be))) |
               (addr_hit[ 13] & (|(RV_PLIC_PERMIT[ 13] & ~reg_be))) |
               (addr_hit[ 14] & (|(RV_PLIC_PERMIT[ 14] & ~reg_be))) |
               (addr_hit[ 15] & (|(RV_PLIC_PERMIT[ 15] & ~reg_be))) |
               (addr_hit[ 16] & (|(RV_PLIC_PERMIT[ 16] & ~reg_be))) |
               (addr_hit[ 17] & (|(RV_PLIC_PERMIT[ 17] & ~reg_be))) |
               (addr_hit[ 18] & (|(RV_PLIC_PERMIT[ 18] & ~reg_be))) |
               (addr_hit[ 19] & (|(RV_PLIC_PERMIT[ 19] & ~reg_be))) |
               (addr_hit[ 20] & (|(RV_PLIC_PERMIT[ 20] & ~reg_be))) |
               (addr_hit[ 21] & (|(RV_PLIC_PERMIT[ 21] & ~reg_be))) |
               (addr_hit[ 22] & (|(RV_PLIC_PERMIT[ 22] & ~reg_be))) |
               (addr_hit[ 23] & (|(RV_PLIC_PERMIT[ 23] & ~reg_be))) |
               (addr_hit[ 24] & (|(RV_PLIC_PERMIT[ 24] & ~reg_be))) |
               (addr_hit[ 25] & (|(RV_PLIC_PERMIT[ 25] & ~reg_be))) |
               (addr_hit[ 26] & (|(RV_PLIC_PERMIT[ 26] & ~reg_be))) |
               (addr_hit[ 27] & (|(RV_PLIC_PERMIT[ 27] & ~reg_be))) |
               (addr_hit[ 28] & (|(RV_PLIC_PERMIT[ 28] & ~reg_be))) |
               (addr_hit[ 29] & (|(RV_PLIC_PERMIT[ 29] & ~reg_be))) |
               (addr_hit[ 30] & (|(RV_PLIC_PERMIT[ 30] & ~reg_be))) |
               (addr_hit[ 31] & (|(RV_PLIC_PERMIT[ 31] & ~reg_be))) |
               (addr_hit[ 32] & (|(RV_PLIC_PERMIT[ 32] & ~reg_be))) |
               (addr_hit[ 33] & (|(RV_PLIC_PERMIT[ 33] & ~reg_be))) |
               (addr_hit[ 34] & (|(RV_PLIC_PERMIT[ 34] & ~reg_be))) |
               (addr_hit[ 35] & (|(RV_PLIC_PERMIT[ 35] & ~reg_be))) |
               (addr_hit[ 36] & (|(RV_PLIC_PERMIT[ 36] & ~reg_be))) |
               (addr_hit[ 37] & (|(RV_PLIC_PERMIT[ 37] & ~reg_be))) |
               (addr_hit[ 38] & (|(RV_PLIC_PERMIT[ 38] & ~reg_be))) |
               (addr_hit[ 39] & (|(RV_PLIC_PERMIT[ 39] & ~reg_be))) |
               (addr_hit[ 40] & (|(RV_PLIC_PERMIT[ 40] & ~reg_be))) |
               (addr_hit[ 41] & (|(RV_PLIC_PERMIT[ 41] & ~reg_be))) |
               (addr_hit[ 42] & (|(RV_PLIC_PERMIT[ 42] & ~reg_be))) |
               (addr_hit[ 43] & (|(RV_PLIC_PERMIT[ 43] & ~reg_be))) |
               (addr_hit[ 44] & (|(RV_PLIC_PERMIT[ 44] & ~reg_be))) |
               (addr_hit[ 45] & (|(RV_PLIC_PERMIT[ 45] & ~reg_be))) |
               (addr_hit[ 46] & (|(RV_PLIC_PERMIT[ 46] & ~reg_be))) |
               (addr_hit[ 47] & (|(RV_PLIC_PERMIT[ 47] & ~reg_be))) |
               (addr_hit[ 48] & (|(RV_PLIC_PERMIT[ 48] & ~reg_be))) |
               (addr_hit[ 49] & (|(RV_PLIC_PERMIT[ 49] & ~reg_be))) |
               (addr_hit[ 50] & (|(RV_PLIC_PERMIT[ 50] & ~reg_be))) |
               (addr_hit[ 51] & (|(RV_PLIC_PERMIT[ 51] & ~reg_be))) |
               (addr_hit[ 52] & (|(RV_PLIC_PERMIT[ 52] & ~reg_be))) |
               (addr_hit[ 53] & (|(RV_PLIC_PERMIT[ 53] & ~reg_be))) |
               (addr_hit[ 54] & (|(RV_PLIC_PERMIT[ 54] & ~reg_be))) |
               (addr_hit[ 55] & (|(RV_PLIC_PERMIT[ 55] & ~reg_be))) |
               (addr_hit[ 56] & (|(RV_PLIC_PERMIT[ 56] & ~reg_be))) |
               (addr_hit[ 57] & (|(RV_PLIC_PERMIT[ 57] & ~reg_be)))));
  end

  assign le_0_le_0_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_0_wd = reg_wdata[0];

  assign le_0_le_1_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_1_wd = reg_wdata[1];

  assign le_0_le_2_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_2_wd = reg_wdata[2];

  assign le_0_le_3_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_3_wd = reg_wdata[3];

  assign le_0_le_4_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_4_wd = reg_wdata[4];

  assign le_0_le_5_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_5_wd = reg_wdata[5];

  assign le_0_le_6_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_6_wd = reg_wdata[6];

  assign le_0_le_7_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_7_wd = reg_wdata[7];

  assign le_0_le_8_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_8_wd = reg_wdata[8];

  assign le_0_le_9_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_9_wd = reg_wdata[9];

  assign le_0_le_10_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_10_wd = reg_wdata[10];

  assign le_0_le_11_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_11_wd = reg_wdata[11];

  assign le_0_le_12_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_12_wd = reg_wdata[12];

  assign le_0_le_13_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_13_wd = reg_wdata[13];

  assign le_0_le_14_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_14_wd = reg_wdata[14];

  assign le_0_le_15_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_15_wd = reg_wdata[15];

  assign le_0_le_16_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_16_wd = reg_wdata[16];

  assign le_0_le_17_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_17_wd = reg_wdata[17];

  assign le_0_le_18_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_18_wd = reg_wdata[18];

  assign le_0_le_19_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_19_wd = reg_wdata[19];

  assign le_0_le_20_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_20_wd = reg_wdata[20];

  assign le_0_le_21_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_21_wd = reg_wdata[21];

  assign le_0_le_22_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_22_wd = reg_wdata[22];

  assign le_0_le_23_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_23_wd = reg_wdata[23];

  assign le_0_le_24_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_24_wd = reg_wdata[24];

  assign le_0_le_25_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_25_wd = reg_wdata[25];

  assign le_0_le_26_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_26_wd = reg_wdata[26];

  assign le_0_le_27_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_27_wd = reg_wdata[27];

  assign le_0_le_28_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_28_wd = reg_wdata[28];

  assign le_0_le_29_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_29_wd = reg_wdata[29];

  assign le_0_le_30_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_30_wd = reg_wdata[30];

  assign le_0_le_31_we = addr_hit[2] & reg_we & ~wr_err;
  assign le_0_le_31_wd = reg_wdata[31];

  assign le_1_le_32_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_32_wd = reg_wdata[0];

  assign le_1_le_33_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_33_wd = reg_wdata[1];

  assign le_1_le_34_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_34_wd = reg_wdata[2];

  assign le_1_le_35_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_35_wd = reg_wdata[3];
  
  assign le_1_le_36_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_36_wd = reg_wdata[4];

  assign le_1_le_37_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_37_wd = reg_wdata[5];

  assign le_1_le_38_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_38_wd = reg_wdata[6];

  assign le_1_le_39_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_39_wd = reg_wdata[7];

  assign le_1_le_40_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_40_wd = reg_wdata[8];

  assign le_1_le_41_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_41_wd = reg_wdata[9];

  assign le_1_le_42_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_42_wd = reg_wdata[10];

  assign le_1_le_43_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_43_wd = reg_wdata[11];

  assign le_1_le_44_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_44_wd = reg_wdata[12];

  assign le_1_le_45_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_45_wd = reg_wdata[13];

  assign le_1_le_46_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_46_wd = reg_wdata[14];

  assign le_1_le_47_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_47_wd = reg_wdata[15];

  assign le_1_le_48_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_48_wd = reg_wdata[16];

  assign le_1_le_49_we = addr_hit[3] & reg_we & ~wr_err;
  assign le_1_le_49_wd = reg_wdata[17];

  // Priority
  assign prio0_we = addr_hit[4] & reg_we & ~wr_err;
  assign prio0_wd = reg_wdata[1:0];

  assign prio1_we = addr_hit[5] & reg_we & ~wr_err;
  assign prio1_wd = reg_wdata[1:0];

  assign prio2_we = addr_hit[6] & reg_we & ~wr_err;
  assign prio2_wd = reg_wdata[1:0];

  assign prio3_we = addr_hit[7] & reg_we & ~wr_err;
  assign prio3_wd = reg_wdata[1:0];

  assign prio4_we = addr_hit[8] & reg_we & ~wr_err;
  assign prio4_wd = reg_wdata[1:0];

  assign prio5_we = addr_hit[9] & reg_we & ~wr_err;
  assign prio5_wd = reg_wdata[1:0];

  assign prio6_we = addr_hit[10] & reg_we & ~wr_err;
  assign prio6_wd = reg_wdata[1:0];

  assign prio7_we = addr_hit[11] & reg_we & ~wr_err;
  assign prio7_wd = reg_wdata[1:0];

  assign prio8_we = addr_hit[12] & reg_we & ~wr_err;
  assign prio8_wd = reg_wdata[1:0];

  assign prio9_we = addr_hit[13] & reg_we & ~wr_err;
  assign prio9_wd = reg_wdata[1:0];

  assign prio10_we = addr_hit[14] & reg_we & ~wr_err;
  assign prio10_wd = reg_wdata[1:0];

  assign prio11_we = addr_hit[15] & reg_we & ~wr_err;
  assign prio11_wd = reg_wdata[1:0];

  assign prio12_we = addr_hit[16] & reg_we & ~wr_err;
  assign prio12_wd = reg_wdata[1:0];

  assign prio13_we = addr_hit[17] & reg_we & ~wr_err;
  assign prio13_wd = reg_wdata[1:0];

  assign prio14_we = addr_hit[18] & reg_we & ~wr_err;
  assign prio14_wd = reg_wdata[1:0];

  assign prio15_we = addr_hit[19] & reg_we & ~wr_err;
  assign prio15_wd = reg_wdata[1:0];

  assign prio16_we = addr_hit[20] & reg_we & ~wr_err;
  assign prio16_wd = reg_wdata[1:0];

  assign prio17_we = addr_hit[21] & reg_we & ~wr_err;
  assign prio17_wd = reg_wdata[1:0];

  assign prio18_we = addr_hit[22] & reg_we & ~wr_err;
  assign prio18_wd = reg_wdata[1:0];

  assign prio19_we = addr_hit[23] & reg_we & ~wr_err;
  assign prio19_wd = reg_wdata[1:0];

  assign prio20_we = addr_hit[24] & reg_we & ~wr_err;
  assign prio20_wd = reg_wdata[1:0];

  assign prio21_we = addr_hit[25] & reg_we & ~wr_err;
  assign prio21_wd = reg_wdata[1:0];

  assign prio22_we = addr_hit[26] & reg_we & ~wr_err;
  assign prio22_wd = reg_wdata[1:0];

  assign prio23_we = addr_hit[27] & reg_we & ~wr_err;
  assign prio23_wd = reg_wdata[1:0];

  assign prio24_we = addr_hit[28] & reg_we & ~wr_err;
  assign prio24_wd = reg_wdata[1:0];

  assign prio25_we = addr_hit[29] & reg_we & ~wr_err;
  assign prio25_wd = reg_wdata[1:0];

  assign prio26_we = addr_hit[30] & reg_we & ~wr_err;
  assign prio26_wd = reg_wdata[1:0];

  assign prio27_we = addr_hit[31] & reg_we & ~wr_err;
  assign prio27_wd = reg_wdata[1:0];

  assign prio28_we = addr_hit[32] & reg_we & ~wr_err;
  assign prio28_wd = reg_wdata[1:0];

  assign prio29_we = addr_hit[33] & reg_we & ~wr_err;
  assign prio29_wd = reg_wdata[1:0];

  assign prio30_we = addr_hit[34] & reg_we & ~wr_err;
  assign prio30_wd = reg_wdata[1:0];

  assign prio31_we = addr_hit[35] & reg_we & ~wr_err;
  assign prio31_wd = reg_wdata[1:0];

  assign prio32_we = addr_hit[36] & reg_we & ~wr_err;
  assign prio32_wd = reg_wdata[1:0];

  assign prio33_we = addr_hit[37] & reg_we & ~wr_err;
  assign prio33_wd = reg_wdata[1:0];

  assign prio34_we = addr_hit[38] & reg_we & ~wr_err;
  assign prio34_wd = reg_wdata[1:0];

  assign prio35_we = addr_hit[39] & reg_we & ~wr_err;
  assign prio35_wd = reg_wdata[1:0];
  
  assign prio36_we = addr_hit[40] & reg_we & ~wr_err;
  assign prio36_wd = reg_wdata[1:0];

  assign prio37_we = addr_hit[41] & reg_we & ~wr_err;
  assign prio37_wd = reg_wdata[1:0];

  assign prio38_we = addr_hit[42] & reg_we & ~wr_err;
  assign prio38_wd = reg_wdata[1:0];

  assign prio39_we = addr_hit[43] & reg_we & ~wr_err;
  assign prio39_wd = reg_wdata[1:0];

  assign prio40_we = addr_hit[44] & reg_we & ~wr_err;
  assign prio40_wd = reg_wdata[1:0];

  assign prio41_we = addr_hit[45] & reg_we & ~wr_err;
  assign prio41_wd = reg_wdata[1:0];

  assign prio42_we = addr_hit[46] & reg_we & ~wr_err;
  assign prio42_wd = reg_wdata[1:0];

  assign prio43_we = addr_hit[47] & reg_we & ~wr_err;
  assign prio43_wd = reg_wdata[1:0];

  assign prio44_we = addr_hit[48] & reg_we & ~wr_err;
  assign prio44_wd = reg_wdata[1:0];

  assign prio45_we = addr_hit[49] & reg_we & ~wr_err;
  assign prio45_wd = reg_wdata[1:0];

  assign prio46_we = addr_hit[50] & reg_we & ~wr_err;
  assign prio46_wd = reg_wdata[1:0];

  assign prio47_we = addr_hit[51] & reg_we & ~wr_err;
  assign prio47_wd = reg_wdata[1:0];

  assign prio48_we = addr_hit[52] & reg_we & ~wr_err;
  assign prio48_wd = reg_wdata[1:0];

  // Interupt Enables
  assign ie0_0_e_0_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_0_wd = reg_wdata[0];

  assign ie0_0_e_1_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_1_wd = reg_wdata[1];

  assign ie0_0_e_2_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_2_wd = reg_wdata[2];

  assign ie0_0_e_3_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_3_wd = reg_wdata[3];

  assign ie0_0_e_4_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_4_wd = reg_wdata[4];

  assign ie0_0_e_5_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_5_wd = reg_wdata[5];

  assign ie0_0_e_6_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_6_wd = reg_wdata[6];

  assign ie0_0_e_7_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_7_wd = reg_wdata[7];

  assign ie0_0_e_8_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_8_wd = reg_wdata[8];

  assign ie0_0_e_9_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_9_wd = reg_wdata[9];

  assign ie0_0_e_10_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_10_wd = reg_wdata[10];

  assign ie0_0_e_11_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_11_wd = reg_wdata[11];

  assign ie0_0_e_12_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_12_wd = reg_wdata[12];

  assign ie0_0_e_13_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_13_wd = reg_wdata[13];

  assign ie0_0_e_14_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_14_wd = reg_wdata[14];

  assign ie0_0_e_15_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_15_wd = reg_wdata[15];

  assign ie0_0_e_16_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_16_wd = reg_wdata[16];

  assign ie0_0_e_17_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_17_wd = reg_wdata[17];

  assign ie0_0_e_18_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_18_wd = reg_wdata[18];

  assign ie0_0_e_19_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_19_wd = reg_wdata[19];

  assign ie0_0_e_20_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_20_wd = reg_wdata[20];

  assign ie0_0_e_21_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_21_wd = reg_wdata[21];

  assign ie0_0_e_22_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_22_wd = reg_wdata[22];

  assign ie0_0_e_23_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_23_wd = reg_wdata[23];

  assign ie0_0_e_24_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_24_wd = reg_wdata[24];

  assign ie0_0_e_25_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_25_wd = reg_wdata[25];

  assign ie0_0_e_26_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_26_wd = reg_wdata[26];

  assign ie0_0_e_27_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_27_wd = reg_wdata[27];

  assign ie0_0_e_28_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_28_wd = reg_wdata[28];

  assign ie0_0_e_29_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_29_wd = reg_wdata[29];

  assign ie0_0_e_30_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_30_wd = reg_wdata[30];

  assign ie0_0_e_31_we = addr_hit[53] & reg_we & ~wr_err;
  assign ie0_0_e_31_wd = reg_wdata[31];

  assign ie0_1_e_32_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_32_wd = reg_wdata[0];

  assign ie0_1_e_33_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_33_wd = reg_wdata[1];

  assign ie0_1_e_34_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_34_wd = reg_wdata[2];

  assign ie0_1_e_35_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_35_wd = reg_wdata[3];
  
  assign ie0_1_e_36_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_36_wd = reg_wdata[4];

  assign ie0_1_e_37_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_37_wd = reg_wdata[5];

  assign ie0_1_e_38_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_38_wd = reg_wdata[6];

  assign ie0_1_e_39_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_39_wd = reg_wdata[7];

  assign ie0_1_e_40_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_40_wd = reg_wdata[8];

  assign ie0_1_e_41_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_41_wd = reg_wdata[9];

  assign ie0_1_e_42_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_42_wd = reg_wdata[10];

  assign ie0_1_e_43_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_43_wd = reg_wdata[11];

  assign ie0_1_e_44_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_44_wd = reg_wdata[12];

  assign ie0_1_e_45_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_45_wd = reg_wdata[13];

  assign ie0_1_e_46_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_46_wd = reg_wdata[14];

  assign ie0_1_e_47_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_47_wd = reg_wdata[15];

  assign ie0_1_e_48_we = addr_hit[54] & reg_we & ~wr_err;
  assign ie0_1_e_48_wd = reg_wdata[16];
  
  assign threshold0_we = addr_hit[55] & reg_we & ~wr_err;
  assign threshold0_wd = reg_wdata[1:0];

  assign cc0_we = addr_hit[56] & reg_we & ~wr_err;
  assign cc0_wd = reg_wdata[7:0];
  assign cc0_re = addr_hit[56] && reg_re;

  assign msip0_we = addr_hit[57] & reg_we & ~wr_err;
  assign msip0_wd = reg_wdata[0];

  // Read data return
  always_comb begin
    reg_rdata_next = '0;
    unique case (1'b1)
      addr_hit[0]: begin
        reg_rdata_next[0] = ip_0_p_0_qs;
        reg_rdata_next[1] = ip_0_p_1_qs;
        reg_rdata_next[2] = ip_0_p_2_qs;
        reg_rdata_next[3] = ip_0_p_3_qs;
        reg_rdata_next[4] = ip_0_p_4_qs;
        reg_rdata_next[5] = ip_0_p_5_qs;
        reg_rdata_next[6] = ip_0_p_6_qs;
        reg_rdata_next[7] = ip_0_p_7_qs;
        reg_rdata_next[8] = ip_0_p_8_qs;
        reg_rdata_next[9] = ip_0_p_9_qs;
        reg_rdata_next[10] = ip_0_p_10_qs;
        reg_rdata_next[11] = ip_0_p_11_qs;
        reg_rdata_next[12] = ip_0_p_12_qs;
        reg_rdata_next[13] = ip_0_p_13_qs;
        reg_rdata_next[14] = ip_0_p_14_qs;
        reg_rdata_next[15] = ip_0_p_15_qs;
        reg_rdata_next[16] = ip_0_p_16_qs;
        reg_rdata_next[17] = ip_0_p_17_qs;
        reg_rdata_next[18] = ip_0_p_18_qs;
        reg_rdata_next[19] = ip_0_p_19_qs;
        reg_rdata_next[20] = ip_0_p_20_qs;
        reg_rdata_next[21] = ip_0_p_21_qs;
        reg_rdata_next[22] = ip_0_p_22_qs;
        reg_rdata_next[23] = ip_0_p_23_qs;
        reg_rdata_next[24] = ip_0_p_24_qs;
        reg_rdata_next[25] = ip_0_p_25_qs;
        reg_rdata_next[26] = ip_0_p_26_qs;
        reg_rdata_next[27] = ip_0_p_27_qs;
        reg_rdata_next[28] = ip_0_p_28_qs;
        reg_rdata_next[29] = ip_0_p_29_qs;
        reg_rdata_next[30] = ip_0_p_30_qs;
        reg_rdata_next[31] = ip_0_p_31_qs;
      end

      addr_hit[1]: begin
        reg_rdata_next[0] = ip_1_p_32_qs;
        reg_rdata_next[1] = ip_1_p_33_qs;
        reg_rdata_next[2] = ip_1_p_34_qs;
        reg_rdata_next[3] = ip_1_p_35_qs;
        reg_rdata_next[4] = ip_1_p_36_qs;
        reg_rdata_next[5] = ip_1_p_37_qs;
        reg_rdata_next[6] = ip_1_p_38_qs;
        reg_rdata_next[7] = ip_1_p_39_qs;
        reg_rdata_next[8] = ip_1_p_40_qs;
        reg_rdata_next[9] = ip_1_p_41_qs;
        reg_rdata_next[10] = ip_1_p_42_qs;
        reg_rdata_next[11] = ip_1_p_43_qs;
        reg_rdata_next[12] = ip_1_p_44_qs;
        reg_rdata_next[13] = ip_1_p_45_qs;
        reg_rdata_next[14] = ip_1_p_46_qs;
        reg_rdata_next[15] = ip_1_p_47_qs;
        reg_rdata_next[16] = ip_1_p_48_qs;

      end
      addr_hit[2]: begin
        reg_rdata_next[0] = le_0_le_0_qs;
        reg_rdata_next[1] = le_0_le_1_qs;
        reg_rdata_next[2] = le_0_le_2_qs;
        reg_rdata_next[3] = le_0_le_3_qs;
        reg_rdata_next[4] = le_0_le_4_qs;
        reg_rdata_next[5] = le_0_le_5_qs;
        reg_rdata_next[6] = le_0_le_6_qs;
        reg_rdata_next[7] = le_0_le_7_qs;
        reg_rdata_next[8] = le_0_le_8_qs;
        reg_rdata_next[9] = le_0_le_9_qs;
        reg_rdata_next[10] = le_0_le_10_qs;
        reg_rdata_next[11] = le_0_le_11_qs;
        reg_rdata_next[12] = le_0_le_12_qs;
        reg_rdata_next[13] = le_0_le_13_qs;
        reg_rdata_next[14] = le_0_le_14_qs;
        reg_rdata_next[15] = le_0_le_15_qs;
        reg_rdata_next[16] = le_0_le_16_qs;
        reg_rdata_next[17] = le_0_le_17_qs;
        reg_rdata_next[18] = le_0_le_18_qs;
        reg_rdata_next[19] = le_0_le_19_qs;
        reg_rdata_next[20] = le_0_le_20_qs;
        reg_rdata_next[21] = le_0_le_21_qs;
        reg_rdata_next[22] = le_0_le_22_qs;
        reg_rdata_next[23] = le_0_le_23_qs;
        reg_rdata_next[24] = le_0_le_24_qs;
        reg_rdata_next[25] = le_0_le_25_qs;
        reg_rdata_next[26] = le_0_le_26_qs;
        reg_rdata_next[27] = le_0_le_27_qs;
        reg_rdata_next[28] = le_0_le_28_qs;
        reg_rdata_next[29] = le_0_le_29_qs;
        reg_rdata_next[30] = le_0_le_30_qs;
        reg_rdata_next[31] = le_0_le_31_qs;
      end

      addr_hit[3]: begin
        reg_rdata_next[0] = le_1_le_32_qs;
        reg_rdata_next[1] = le_1_le_33_qs;
        reg_rdata_next[2] = le_1_le_34_qs;
        reg_rdata_next[3] = le_1_le_35_qs;
        reg_rdata_next[4] = le_1_le_36_qs;
        reg_rdata_next[5] = le_1_le_37_qs;
        reg_rdata_next[6] = le_1_le_38_qs;
        reg_rdata_next[7] = le_1_le_39_qs;
        reg_rdata_next[8] = le_1_le_40_qs;
        reg_rdata_next[9] = le_1_le_41_qs;
        reg_rdata_next[10] = le_1_le_42_qs;
        reg_rdata_next[11] = le_1_le_43_qs;
        reg_rdata_next[12] = le_1_le_44_qs;
        reg_rdata_next[13] = le_1_le_45_qs;
        reg_rdata_next[14] = le_1_le_46_qs;
        reg_rdata_next[15] = le_1_le_47_qs;
        reg_rdata_next[16] = le_1_le_48_qs;
      end
      addr_hit[4]: begin
        reg_rdata_next[1:0] = prio0_qs;
      end

      addr_hit[5]: begin
        reg_rdata_next[1:0] = prio1_qs;
      end

      addr_hit[6]: begin
        reg_rdata_next[1:0] = prio2_qs;
      end

      addr_hit[7]: begin
        reg_rdata_next[1:0] = prio3_qs;
      end

      addr_hit[8]: begin
        reg_rdata_next[1:0] = prio4_qs;
      end

      addr_hit[9]: begin
        reg_rdata_next[1:0] = prio5_qs;
      end

      addr_hit[10]: begin
        reg_rdata_next[1:0] = prio6_qs;
      end

      addr_hit[11]: begin
        reg_rdata_next[1:0] = prio7_qs;
      end

      addr_hit[12]: begin
        reg_rdata_next[1:0] = prio8_qs;
      end

      addr_hit[13]: begin
        reg_rdata_next[1:0] = prio9_qs;
      end

      addr_hit[14]: begin
        reg_rdata_next[1:0] = prio10_qs;
      end

      addr_hit[15]: begin
        reg_rdata_next[1:0] = prio11_qs;
      end

      addr_hit[16]: begin
        reg_rdata_next[1:0] = prio12_qs;
      end

      addr_hit[17]: begin
        reg_rdata_next[1:0] = prio13_qs;
      end

      addr_hit[18]: begin
        reg_rdata_next[1:0] = prio14_qs;
      end

      addr_hit[19]: begin
        reg_rdata_next[1:0] = prio15_qs;
      end

      addr_hit[20]: begin
        reg_rdata_next[1:0] = prio16_qs;
      end

      addr_hit[21]: begin
        reg_rdata_next[1:0] = prio17_qs;
      end

      addr_hit[22]: begin
        reg_rdata_next[1:0] = prio18_qs;
      end

      addr_hit[23]: begin
        reg_rdata_next[1:0] = prio19_qs;
      end

      addr_hit[24]: begin
        reg_rdata_next[1:0] = prio20_qs;
      end

      addr_hit[25]: begin
        reg_rdata_next[1:0] = prio21_qs;
      end

      addr_hit[26]: begin
        reg_rdata_next[1:0] = prio22_qs;
      end

      addr_hit[27]: begin
        reg_rdata_next[1:0] = prio23_qs;
      end

      addr_hit[28]: begin
        reg_rdata_next[1:0] = prio24_qs;
      end

      addr_hit[29]: begin
        reg_rdata_next[1:0] = prio25_qs;
      end

      addr_hit[30]: begin
        reg_rdata_next[1:0] = prio26_qs;
      end

      addr_hit[31]: begin
        reg_rdata_next[1:0] = prio27_qs;
      end

      addr_hit[32]: begin
        reg_rdata_next[1:0] = prio28_qs;
      end

      addr_hit[33]: begin
        reg_rdata_next[1:0] = prio29_qs;
      end

      addr_hit[34]: begin
        reg_rdata_next[1:0] = prio30_qs;
      end

      addr_hit[35]: begin
        reg_rdata_next[1:0] = prio31_qs;
      end

      addr_hit[36]: begin
        reg_rdata_next[1:0] = prio32_qs;
      end

      addr_hit[37]: begin
        reg_rdata_next[1:0] = prio33_qs;
      end

      addr_hit[38]: begin
        reg_rdata_next[1:0] = prio34_qs;
      end

      addr_hit[39]: begin
        reg_rdata_next[1:0] = prio35_qs;
      end
      
      addr_hit[40]: begin
        reg_rdata_next[1:0] = prio36_qs;
      end

      addr_hit[41]: begin
        reg_rdata_next[1:0] = prio37_qs;
      end

      addr_hit[42]: begin
        reg_rdata_next[1:0] = prio38_qs;
      end
      
      addr_hit[43]: begin
        reg_rdata_next[1:0] = prio39_qs;
      end

      addr_hit[44]: begin
        reg_rdata_next[1:0] = prio40_qs;
      end

      addr_hit[45]: begin
        reg_rdata_next[1:0] = prio41_qs;
      end

      addr_hit[46]: begin
        reg_rdata_next[1:0] = prio42_qs;
      end

      addr_hit[47]: begin
        reg_rdata_next[1:0] = prio43_qs;
      end

      addr_hit[48]: begin
        reg_rdata_next[1:0] = prio44_qs;
      end

      addr_hit[49]: begin
        reg_rdata_next[1:0] = prio45_qs;
      end

      addr_hit[50]: begin
        reg_rdata_next[1:0] = prio46_qs;
      end

      addr_hit[51]: begin
        reg_rdata_next[1:0] = prio47_qs;
      end

      addr_hit[52]: begin
        reg_rdata_next[1:0] = prio48_qs;
      end

      addr_hit[53]: begin
        reg_rdata_next[0] = ie0_0_e_0_qs;
        reg_rdata_next[1] = ie0_0_e_1_qs;
        reg_rdata_next[2] = ie0_0_e_2_qs;
        reg_rdata_next[3] = ie0_0_e_3_qs;
        reg_rdata_next[4] = ie0_0_e_4_qs;
        reg_rdata_next[5] = ie0_0_e_5_qs;
        reg_rdata_next[6] = ie0_0_e_6_qs;
        reg_rdata_next[7] = ie0_0_e_7_qs;
        reg_rdata_next[8] = ie0_0_e_8_qs;
        reg_rdata_next[9] = ie0_0_e_9_qs;
        reg_rdata_next[10] = ie0_0_e_10_qs;
        reg_rdata_next[11] = ie0_0_e_11_qs;
        reg_rdata_next[12] = ie0_0_e_12_qs;
        reg_rdata_next[13] = ie0_0_e_13_qs;
        reg_rdata_next[14] = ie0_0_e_14_qs;
        reg_rdata_next[15] = ie0_0_e_15_qs;
        reg_rdata_next[16] = ie0_0_e_16_qs;
        reg_rdata_next[17] = ie0_0_e_17_qs;
        reg_rdata_next[18] = ie0_0_e_18_qs;
        reg_rdata_next[19] = ie0_0_e_19_qs;
        reg_rdata_next[20] = ie0_0_e_20_qs;
        reg_rdata_next[21] = ie0_0_e_21_qs;
        reg_rdata_next[22] = ie0_0_e_22_qs;
        reg_rdata_next[23] = ie0_0_e_23_qs;
        reg_rdata_next[24] = ie0_0_e_24_qs;
        reg_rdata_next[25] = ie0_0_e_25_qs;
        reg_rdata_next[26] = ie0_0_e_26_qs;
        reg_rdata_next[27] = ie0_0_e_27_qs;
        reg_rdata_next[28] = ie0_0_e_28_qs;
        reg_rdata_next[29] = ie0_0_e_29_qs;
        reg_rdata_next[30] = ie0_0_e_30_qs;
        reg_rdata_next[31] = ie0_0_e_31_qs;
      end

      addr_hit[54]: begin
        reg_rdata_next[0] = ie0_1_e_32_qs;
        reg_rdata_next[1] = ie0_1_e_33_qs;
        reg_rdata_next[2] = ie0_1_e_34_qs;
        reg_rdata_next[3] = ie0_1_e_35_qs;
        reg_rdata_next[4] = ie0_1_e_36_qs;
        reg_rdata_next[5] = ie0_1_e_37_qs;
        reg_rdata_next[6] = ie0_1_e_38_qs;
        reg_rdata_next[7] = ie0_1_e_39_qs;
        reg_rdata_next[8] = ie0_1_e_40_qs;
        reg_rdata_next[9] = ie0_1_e_41_qs;
        reg_rdata_next[10] = ie0_1_e_42_qs;
        reg_rdata_next[11] = ie0_1_e_43_qs;
        reg_rdata_next[12] = ie0_1_e_44_qs;
        reg_rdata_next[13] = ie0_1_e_45_qs;
        reg_rdata_next[14] = ie0_1_e_46_qs;
        reg_rdata_next[15] = ie0_1_e_47_qs;
        reg_rdata_next[16] = ie0_1_e_48_qs;
      end

      addr_hit[55]: begin
        reg_rdata_next[1:0] = threshold0_qs;
      end

      addr_hit[56]: begin
        reg_rdata_next[7:0] = cc0_qs;
      end

      addr_hit[57]: begin
        reg_rdata_next[0] = msip0_qs;
      end

      default: begin
        reg_rdata_next = '1;
      end
    endcase
  end

endmodule
