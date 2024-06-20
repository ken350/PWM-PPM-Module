`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2024 03:42:41 PM
// Design Name: 
// Module Name: T_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module T_counter();
reg clk,rst;
wire [0:7]OUT;
counter M1(OUT,clk ,rst);
initial begin clk=1'b0;forever#1clk=~clk;end
initial#3000$finish;
initial begin
#2 rst=1'b0;
#2 rst=1'b1;
#2 rst=1'b0;
#2 rst=1'b1;
end
endmodule
