module digital_timer #(parameter CLK_FREQ = 32'd50_000_000, parameter
COMMON_ANODE = 1)(
input i_clk,
input i_rst,
output [6:0] o_seconds_1,
output [6:0] o_seconds_2,
output [6:0] o_minutes_1,
output [6:0] o_minutes_2,
output [6:0] o_hours_1,
output [6:0] o_hours_2
);
wire [6:0] timer_hours;
wire [5:0] timer_minutes, timer_seconds;
wire [11:0] hours_bcd, minutes_bcd, seconds_bcd;
timer #(.CLK_FREQ(CLK_FREQ)) timer_inst (
.i_clk(i_clk),
.i_rst(i_rst),
.o_hours(timer_hours),
.o_minutes(timer_minutes),
.o_seconds(timer_seconds)
);
binady_2_bcd bcd_inst_hours(
.i_data({1'b0, timer_hours}),
.o_units(hours_bcd[3:0]),
.o_tens(hours_bcd[7:4]),
.o_hunds(hours_bcd[11:8])
);
binady_2_bcd bcd_inst_minutes(
.i_data({2'b0, timer_minutes}),
.o_units(minutes_bcd[3:0]),
.o_tens(minutes_bcd[7:4]),
.o_hunds(minutes_bcd[11:8])
);
binady_2_bcd bcd_inst_seconds(
.i_data({2'b0, timer_seconds}),
.o_units(seconds_bcd[3:0]),
.o_tens(seconds_bcd[7:4]),
.o_hunds(seconds_bcd[11:8])
);
seven_segment_decoder #(.COMMON_ANODE(COMMON_ANODE)) decoder_hours_1 (
.i_data(hours_bcd[3:0]),
.o_display(o_hours_1)
);
seven_segment_decoder #(.COMMON_ANODE(COMMON_ANODE)) decoder_hours_2 (
.i_data(hours_bcd[7:4]),
.o_display(o_hours_2)
);

Eng. Yousef Sherif FPGA Implementation Workshop 2024
seven_segment_decoder #(.COMMON_ANODE(COMMON_ANODE)) decoder_minutes_1 (
.i_data(minutes_bcd[3:0]),
.o_display(o_minutes_1)
);
seven_segment_decoder #(.COMMON_ANODE(COMMON_ANODE)) decoder_minutes_2 (
.i_data(minutes_bcd[7:4]),
.o_display(o_minutes_2)
);
seven_segment_decoder #(.COMMON_ANODE(COMMON_ANODE)) decoder_seconds_1 (
.i_data(seconds_bcd[3:0]),
.o_display(o_seconds_1)
);
seven_segment_decoder #(.COMMON_ANODE(COMMON_ANODE)) decoder_seconds_2 (
.i_data(seconds_bcd[7:4]),
.o_display(o_seconds_2)
);
endmodule