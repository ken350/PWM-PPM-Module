`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module T_Dff();
reg clk,rst,d;
wire q;
dff M3(q,clk,rst,d);
initial begin clk=1'b0;forever#1clk=~clk;end
initial #200$finish;
initial begin 
#2 rst=1'b1;
#2 rst=1'b0;
#2 rst=1'b1;
#2 d=1'b1;
#2 d=1'b0;
end
endmodule
