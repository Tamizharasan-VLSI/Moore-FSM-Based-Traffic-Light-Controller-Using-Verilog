module tb;
  reg clk,rst;
  wire [2:0] M1,MT,M2,S;
  
  traffic_light_controller dut (clk,rst,M1,MT,M2,S);
  
  always#5 clk = ~clk;
  
  
  function [80*8:0] color (input [2:0]l);
    case(l)
      3'b001: color = "GREEN";
      3'b010: color = "YELLOW";
      3'b100: color = "RED";
      3'b000: color = "OFF";
    endcase
  endfunction
  
  initial begin
    clk = 1;
    rst = 1;
    #20;
    rst = 0;
    #1200;
    rst=1;
    #10;$finish;
  end
 
endmodule

