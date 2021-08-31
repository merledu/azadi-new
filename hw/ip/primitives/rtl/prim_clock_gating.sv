// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Abstract primitives wrapper.
//
// This file is a stop-gap until the DV file list is generated by FuseSoC.
// Its contents are taken from the file which would be generated by FuseSoC.
// https://github.com/lowRISC/ibex/issues/893

`ifndef PRIM_DEFAULT_IMPL
  `define PRIM_DEFAULT_IMPL prim_pkg::ImplGeneric
`endif
//`include "AZADI_ROOT/src/brq_core/rtl/prim_pkg.sv"
// `include "/home/merl-lab/fyp2/azadi/src/primitives/rtl/prim_pkg.sv"
module prim_clock_gating (
  input        clk_i,
  input        en_i,
  input        test_en_i,
  output logic clk_o
);
  parameter prim_pkg::impl_e Impl = `PRIM_DEFAULT_IMPL;

  if (Impl == prim_pkg::ImplGeneric) begin : gen_generic
    prim_generic_clock_gating u_impl_generic (
      .*
    );
  end else if (Impl == prim_pkg::ImplXilinx) begin : gen_xilinx
    prim_xilinx_clock_gating u_impl_xilinx (
      .*
    );
  end else begin : gen_failure
    // TODO: Find code that works across tools and causes a compile failure
  end

endmodule
