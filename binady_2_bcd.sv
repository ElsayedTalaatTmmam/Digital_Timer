module binady_2_bcd(
input [7:0] i_data,
output [3:0] o_units, o_tens, o_hunds
);
wire [3:0] in_c1, out_c1;
wire [3:0] in_c2, out_c2;
wire [3:0] in_c3, out_c3;
wire [3:0] in_c4, out_c4;
wire [3:0] in_c5, out_c5;
wire [3:0] in_c6, out_c6;
wire [3:0] in_c7, out_c7;
assign in_c1 = {1'b0, i_data[7:5]};
assign in_c2 = {out_c1[2:0], i_data[4]};
assign in_c3 = {out_c2[2:0], i_data[3]};
assign in_c4 = {out_c3[2:0], i_data[2]};
assign in_c5 = {out_c4[2:0], i_data[1]};
assign in_c6 = {1'b0, out_c1[3], out_c2[3], out_c3[3]};
assign in_c7 = {out_c6[2:0], out_c4[3]};
assign {o_hunds, o_tens, o_units} = {2'b00, out_c6[3], out_c7[3:0], out_c5[3:0],
i_data[0]};
add3 c1(
.i_data(in_c1),
.o_converted_data(out_c1)
);
add3 c2(
.i_data(in_c2),
.o_converted_data(out_c2)
);
add3 c3(
.i_data(in_c3),
.o_converted_data(out_c3)
);
add3 c4(
.i_data(in_c4),
.o_converted_data(out_c4)
);
add3 c5(
.i_data(in_c5),
.o_converted_data(out_c5)
);
add3 c6(
.i_data(in_c6),
.o_converted_data(out_c6)
);
add3 c7(
.i_data(in_c7),
.o_converted_data(out_c7)
);
endmodule