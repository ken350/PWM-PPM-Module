`timescale 1ns / 1ps
/////
module T_MUX();
reg IN1,IN2,select;
wire OUT;
MUX M4(OUT,select,IN1,IN2);
initial #200$finish;
initial fork
#2 IN1=1;
#2 IN2=0;
#5 select=1;
#10 select=0;
join
endmodule
