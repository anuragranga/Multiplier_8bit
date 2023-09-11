module tb;
reg [7:0] A,B;
wire [16:0] Y;

mul8 INTEL (Y,A,B);

initial
	begin
	repeat(10)
		begin
			{A,B} = $random;
			#10;
			$display (A,"x", B , "=" , Y);
		end
	A= 225;
	B=225;
	#1;
	end
endmodule	