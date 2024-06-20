`timescale 1ns / 1ps

//counter module
module counter(output reg[0:7]OUT,input clk ,rst);
always@(posedge clk,negedge rst)begin
if(rst==0) OUT<=8'b00000000;
else if (OUT==8'b11111111) OUT<=8'b00000000;
else OUT<=OUT+8'b00000001;
end
endmodule

//comparator module
module comparator(output reg L,E,S,input [0:7]counter,analog_signal);
always@(counter,analog_signal)begin
if(counter<analog_signal)begin
L=1'b0;
E=1'b0;
S=1'b1;
end
else if(counter>analog_signal)begin
L=1'b1;
E=1'b0;
S=1'b0;
end
else if(counter==analog_signal)begin
L=1'b0;
E=1'b1;
S=1'b0;
end
end
endmodule

//DFF module
module dff(output reg q,input clk,rst,d);
always@(posedge clk,negedge rst)
if(rst==1'b0) q<=1'b0;
else q<=d;
endmodule

//MUX module
module MUX(output OUT,input select,IN1,IN2);
assign OUT=select?IN1:IN2;
endmodule

//PWM module
module PWM_PPM(output PWM,PPM,input [0:7]analog_signal,input rst,clk1,clk2,IN1,IN2);
wire [0:7]OUT;
wire L,S,E,w1,w2;
counter    M1(OUT,clk1,rst);
comparator M2(L,E,S,OUT,analog_signal);
MUX        M3(PWM,L,IN1,IN2);
dff        M4(w1,clk2,rst,L);
or         G1(w2,S,E);
and        G2(PPM,w1,w2);
endmodule 