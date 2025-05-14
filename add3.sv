module add3(
input [3:0] i_data,
output reg [3:0] o_converted_data
);
always@(*) begin
if(i_data<=4)
o_converted_data = i_data;
else if((i_data >= 4'd5) && (i_data <= 4'd9))
o_converted_data = i_data + 2'b11;
else
o_converted_data = 4'b0;
end
endmodule