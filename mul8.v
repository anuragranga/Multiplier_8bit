module mul8 (Y,A,B);
input [7:0] A,B;
output [16:0] Y; 
wire [16:0] Row0,Row1,Row2,Row3,Row4,Row5,Row6,Row7;
wire [16:0] Y;

wire [7:0] p0,p1,p2,p3,p4,p5,p6,p7;

and a [7:0] (p0,A[0],B);
and b [7:0] (p1,A[1],B);
and c [7:0] (p2,A[2],B);
and d [7:0] (p3,A[3],B);
and e [7:0] (p4,A[4],B);
and f [7:0] (p5,A[5],B);
and g [7:0] (p6,A[6],B);
and h [7:0] (p7,A[7],B);

`ifdef V1

assign Row0 = {7'b0000000,p0}; //both LHS and RHS zeroes are kept for clarity eben thouigh LHS 0's don't have meaning
assign Row1 = {6'b000000,p1,1'b0};
assign Row2 = {5'b00000,p2, 2'b00};
assign Row3 = {4'b0000,p3,3'b000};
assign Row4 = {3'b000,p4,4'b0000};
assign Row5 = {2'b00,p5,5'b00000};
assign Row6 = {1'b0,p6, 6'b000000};
assign Row7 = {p7,7'b0000000};

`endif

`ifdef V1

assign Row0 = p0;
assign Row1 = {p1,1'b0}; //since there is no value to 0's on LHS, so we just keep RHS 0's
assign Row2 = {p2,2'b00};
assign Row3 = {p3,3'b000};
assign Row4 = {p4,4'b0000};
assign Row5 = {p5,5'b00000};
assign Row6 = {p6,6'b000000};
assign Row7 = {p7,7'b0000000};

`endif

`ifdef V3

assign Row0 = p0<<0; // more efficient solving using shift operators
assign Row1 = p1<<1;
assign Row2 = p2<<2;
assign Row3 = p3<<3;
assign Row4 = p4<<4;
assign Row5 = p5<<5;
assign Row6 = p6<<6;
assign Row7 = p7<<7;

`endif

assign Y = Row0+Row1+Row2+Row3+Row4+Row5+Row6+Row7;

endmodule