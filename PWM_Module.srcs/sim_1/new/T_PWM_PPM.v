`timescale 1ns / 1ps


module T_PWM_PPM();
reg  rst,clk1,clk2,IN1,IN2; 
reg  [0:7]analog_signal;
wire  PWM,PPM;
wire [0:7]OUT;
counter M1(OUT,clk1,rst);
PWM_PPM FINAL(PWM,PPM,analog_signal,rst,clk1,clk2,IN1,IN2);
initial begin clk1=0;forever #1clk1=~clk1;end
initial begin clk2=0;forever #10clk2=~clk2;end
initial #6000$finish;
initial fork
#2 rst=1'b1;
#4 rst=1'b0;
#6 rst=1'b1;
#6 IN1=0;
#6 IN2=1;
#6 analog_signal=8'd205;
//#50 analog_signal=8'd100;
join
endmodule
