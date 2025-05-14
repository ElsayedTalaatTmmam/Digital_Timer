module timer #(parameter CLK_FREQ = 32'd50_000_000)(
input wire i_clk, // Clock signal
input wire i_rst, // Reset signal
output reg [6:0] o_hours, // Hours (00-99)
output reg [5:0] o_minutes, // Minutes (00-59)
output reg [5:0] o_seconds // Seconds (00-59)
);
reg [25:0] counter_r; // 26-bit counter_r to count 1 second
localparam SEC = CLK_FREQ - 1'b1;
always @(posedge i_clk or posedge i_rst) begin
if (i_rst) begin
// i_rst all values
counter_r <= 0;
o_hours <= 0;
o_minutes <= 0;
o_seconds <= 0;
end else begin
// Increment counter_r every clock cycle
counter_r <= counter_r + 1;
// Check if 1 second (assuming i_clk is 50 MHz, modify as necessary)
if (counter_r == SEC) begin
counter_r <= 0; // i_rst counter_r
o_seconds <= o_seconds + 1; // Increment o_seconds
// Check for minute overflow
if (o_seconds == 6'd59) begin
o_seconds <= 0;
o_minutes <= o_minutes + 1;
// Check for hour overflow
if (o_minutes == 6'd59) begin
o_minutes <= 0;
o_hours <= o_hours + 1;
// Check for 100-hour overflow
if (o_hours == 7'd99) begin

o_hours <= 0;
end
end
end
end
end
end
endmodule