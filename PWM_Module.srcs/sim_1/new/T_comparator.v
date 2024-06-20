`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2024 03:44:36 PM
// Design Name: 
// Module Name: T_comparator
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


module T_comparator();
wire L,E,S;
reg[0:7]counter,analog_signal;
comparator M2(L,E,S,counter,analog_signal);
initial #200$finish;
initial fork
#10 counter=8'b00000001;
#10 analog_signal =8'b00000001;
#20 counter=8'b00000001;
#20 analog_signal =8'b00000010;
#30 counter=8'b00000010;
#30 analog_signal =8'b00000001;
join
endmodule
