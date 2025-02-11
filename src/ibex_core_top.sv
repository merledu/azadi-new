// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Modified by MERL, for Azadi SoC
// TL-UL top wrapper for buraq core

module ibex_core_top #(
  parameter bit                 PMPEnable        = 1'b0,
  parameter int unsigned        PMPGranularity   = 1'b0,
  parameter int unsigned        PMPNumRegions    = 4,
  parameter int unsigned        MHPMCounterNum   = 0,
  parameter int unsigned        MHPMCounterWidth = 40,
  parameter bit                 RV32E            = 1'b0,
  parameter ibex_pkg::rv32m_e   RV32M            = ibex_pkg::RV32MFast,
  parameter ibex_pkg::rv32b_e   RV32B            = ibex_pkg::RV32BNone,
  parameter ibex_pkg::regfile_e RegFile          = ibex_pkg::RegFileFF,
  parameter bit                 BranchTargetALU  = 1'b0,
  parameter bit                 WritebackStage   = 1'b1,
  parameter bit                 ICache           = 1'b0,
  parameter bit                 ICacheECC        = 1'b0,
  parameter bit                 BranchPredictor  = 1'b0,
  parameter bit                 DbgTriggerEn     = 1'b0,
  parameter int unsigned        DbgHwBreakNum    = 1'b1,
  parameter bit                 SecureIbex       = 1'b0,
  parameter int unsigned        DmHaltAddr       = 1'b0,
  parameter int unsigned        DmExceptionAddr  = 1'b0
)(
  input logic                 clk_i,
  input logic                 rst_ni,

  // instruction memory interface 
  input  tlul_pkg::tlul_d2h_t tl_i_i,
  output tlul_pkg::tlul_h2d_t tl_i_o,

  // data memory interface 
  input  tlul_pkg::tlul_d2h_t tl_d_i,
  output tlul_pkg::tlul_h2d_t tl_d_o,

  input  logic [31:0]         hart_id_i,
  input  logic [31:0]         boot_addr_i,

  // Interrupt inputs
  input  logic                irq_software_i,
  input  logic                irq_timer_i,
  input  logic                irq_external_i,
  input  logic [14:0]         irq_fast_i,
  input  logic                irq_nm_i,

  // Debug Interface
  input  logic                debug_req_i,

  // CPU Control Signals
  input  logic                fetch_enable_i,
  output logic                alert_minor_o,
  output logic                alert_major_o,
  output logic                core_sleep_o
);

  localparam int unsigned TO_HOST = 32'h20001FFC;
  always_comb begin
    if (data_req && data_we && data_addr == TO_HOST) begin
      $finish();
    end
  end

  import ibex_pkg::*;

  // Instruction interface (internal)
  logic        instr_req;
  logic        instr_gnt;
  logic        instr_rvalid;
  logic [31:0] instr_addr;
  logic [31:0] instr_rdata;
  logic        instr_err;

  // Data interface (internal)
  logic        data_req;
  logic        data_gnt;
  logic        data_rvalid;
  logic        data_we;
  logic [3:0]  data_be;
  logic [31:0] data_addr;
  logic [31:0] data_wdata;
  logic [31:0] data_rdata;
  logic        data_err;

  `ifdef CORE_NETLIST
  ibex_core ibex_core_i (
  `else
  ibex_core #(
    .PMPEnable        ( PMPEnable        ),
    .PMPGranularity   ( PMPGranularity   ),
    .PMPNumRegions    ( PMPNumRegions    ),
    .MHPMCounterNum   ( MHPMCounterNum   ),
    .MHPMCounterWidth ( MHPMCounterWidth ),
    .RV32E            ( RV32E            ),
    .RV32M            ( RV32M            ),
    .RV32B            ( RV32B            ),
    .RegFile          ( RegFile          ),
    .BranchTargetALU  ( BranchTargetALU  ),
    .WritebackStage   ( WritebackStage   ),
    .ICache           ( ICache           ),
    .ICacheECC        ( ICacheECC        ),
    .BranchPredictor  ( BranchPredictor  ),
    .DbgTriggerEn     ( DbgTriggerEn     ),
    .DbgHwBreakNum    ( DbgHwBreakNum    ),
    .SecureIbex       ( SecureIbex       ),
    .DmHaltAddr       ( DmHaltAddr       ),
    .DmExceptionAddr  ( DmExceptionAddr  )
  ) ibex_core_i (
`endif
    .clk_i          ( clk_i          ),
    .rst_ni         ( rst_ni         ),
    .test_en_i      ( 1'b0           ),
    .hart_id_i      ( hart_id_i      ),
    .boot_addr_i    ( boot_addr_i    ),

    // Instruction memory interface
    .instr_req_o    ( instr_req      ),
    .instr_gnt_i    ( instr_gnt      ),
    .instr_rvalid_i ( instr_rvalid   ),
    .instr_addr_o   ( instr_addr     ),
    .instr_rdata_i  ( instr_rdata    ),
    .instr_err_i    ( instr_err      ),

    // Data memory interface
    .data_req_o     ( data_req       ),
    .data_gnt_i     ( data_gnt       ),
    .data_rvalid_i  ( data_rvalid    ),
    .data_we_o      ( data_we        ),
    .data_be_o      ( data_be        ),
    .data_addr_o    ( data_addr      ),
    .data_wdata_o   ( data_wdata     ),
    .data_rdata_i   ( data_rdata     ),
    .data_err_i     ( data_err       ),

    // Interrupt inputs
    .irq_software_i ( irq_software_i ),
    .irq_timer_i    ( irq_timer_i    ),
    .irq_external_i ( irq_external_i ),
    .irq_fast_i     ( irq_fast_i     ),
    .irq_nm_i       ( irq_nm_i       ),

    // Debug Interface
    .debug_req_i    ( debug_req_i    ),

    // RISC-V Formal Interface
    // Does not comply with the coding standards of _i/_o suffixes, but follows
    // the convention of RISC-V Formal Interface Specification.
    `ifdef RVFI
      .rvfi_valid (),
      .rvfi_order (),
      .rvfi_insn (),
      .rvfi_trap (),
      .rvfi_halt (),
      .rvfi_intr (),
      .rvfi_mode (),
      .rvfi_ixl (),
      .rvfi_rs1_addr (),
      .rvfi_rs2_addr (),
      .rvfi_rs3_addr (),
      .rvfi_rs1_rdata (),
      .rvfi_rs2_rdata (),
      .rvfi_rs3_rdata (),
      .rvfi_rd_addr (),
      .rvfi_rd_wdata (),
      .rvfi_pc_rdata (),
      .rvfi_pc_wdata (),
      .rvfi_mem_addr (),
      .rvfi_mem_rmask (),
      .rvfi_mem_wmask (),
      .rvfi_mem_rdata (),
      .rvfi_mem_wdata (),
    `endif

    // CPU Control Signals
    .fetch_enable_i ( fetch_enable_i ),
    .alert_minor_o  ( alert_minor_o  ),
    .alert_major_o  ( alert_major_o  ),
    .core_sleep_o   ( core_sleep_o   )
  );


  tlul_host_adapter #(
    .MAX_REQS ( 2 )
  ) tlul_iccm_adapter_i (
    .clk_i    ( clk_i         ),
    .rst_ni   ( rst_ni        ),
    .req_i    ( instr_req     ),
    .gnt_o    ( instr_gnt     ),
    .addr_i   ( instr_addr    ),
    .we_i     ( 1'b0          ),
    .wdata_i  ( 32'h0000_0000 ),
    .be_i     ( 4'hF          ),
    .valid_o  ( instr_rvalid  ),
    .rdata_o  ( instr_rdata   ),
    .err_o    ( instr_err     ),
    .tl_h_c_a ( tl_i_o        ),
    .tl_h_c_d ( tl_i_i        )
  );

  tlul_host_adapter #(
    .MAX_REQS ( 2 )
  ) tlul_dccm_adapter_i (
    .clk_i    ( clk_i       ),
    .rst_ni   ( rst_ni      ),
    .req_i    ( data_req    ),
    .gnt_o    ( data_gnt    ),
    .addr_i   ( data_addr   ),
    .we_i     ( data_we     ),
    .wdata_i  ( data_wdata  ),
    .be_i     ( data_be     ),
    .valid_o  ( data_rvalid ),
    .rdata_o  ( data_rdata  ),
    .err_o    ( data_err    ),
    .tl_h_c_a ( tl_d_o      ),
    .tl_h_c_d ( tl_d_i      )
  );

endmodule
