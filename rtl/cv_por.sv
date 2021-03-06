//-----------------------------------------------------------------------------
//
// FPGA Colecovision
//
// $Id: cv_por.vhd,v 1.1 2006/01/03 15:19:21 arnim Exp $
//
// Wrapper for technology dependent power-on reset circuitry.
//
// Altera Cyclone flavor.
//
// Generate a reset upon power-on for at least 2 clock cycles of main clock.
//
//-----------------------------------------------------------------------------
//
// Copyright (c) 2006, Arnim Laeuger (arnim.laeuger@gmx.net)
//
// All rights reserved
//
// Redistribution and use in source and synthezised forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice,
// this list of conditions and the following disclaimer.
//
// Redistributions in synthesized form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
//
// Neither the name of the author nor the names of other contributors may
// be used to endorse or promote products derived from this software without
// specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
// Please report bugs to the author, but before you do so, please
// make sure that this is not a derivative work and that
// you have the latest version of this file.
//
// SystemVerilog conversion (c) 2022 Frank Bruno (fbruno@asicsolutions.com)
//
//-----------------------------------------------------------------------------

module cv_por
  (
   input        clk_i,
   output logic por_n_o
   );

  logic [1:0]     por_cnt_q;

  // pragma translate_off
  // initialize for simulation only
  // pragma translate_on
  reg             por_n_q;
  // pragma translate_off
  // initialize for simulation only
  // pragma translate_on

  // Specify power-up level of por counter and por source.
  // Refer to "Quartus II Integrated Synthesis", section "Altera Attribute".

  //---------------------------------------------------------------------------
  // Process por_cnt
  //
  // Purpose:
  //   Generate a power-on reset for 4 clock cycles.
  //

  always @(posedge clk_i) begin : por_cnt
    if (por_cnt_q == 2'b11)
      por_n_q   <= '1;
    else
      por_cnt_q <= por_cnt_q + 1'b1;
  end
  //
  //---------------------------------------------------------------------------

  assign por_n_o = por_n_q;

endmodule
