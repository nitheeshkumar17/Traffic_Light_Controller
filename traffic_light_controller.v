// Traffic Light Controller - Finite State Machine
// Created by Nitheesh Kumar - Aug 16 2020

module traffic_light_controller ( 
	input clk,
	input reset,
	output reg [2:0] NS, WE);

// State Parameters

parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101;

// States 

reg [2:0] crt_state, nxt_state;
reg [5:0] count;

// State Counting

always @(posedge clk) begin

if (~reset || count == 6'd42) begin
count <= 6'd0;
end
else begin
count <= count + 6'd1;
end

end

// Current State Logic

always @(posedge clk or negedge reset) begin

if (~reset) begin
crt_state <= s0;
end
else begin
crt_state <= nxt_state;
end

end

// Next State Logic

always @(count or crt_state) begin

case(crt_state)

s0: begin
if (count<6'd15) begin
nxt_state <= s0;
end
else begin
nxt_state <= s1;
end
end

s1: begin
if (count<6'd18) begin 
nxt_state <= s1;
end
else begin
nxt_state <= s2;
end
end

s2: begin
if (count<6'd21) begin 
nxt_state <= s2;
end
else begin
nxt_state <= s3;
end
end

s3: begin
if (count<6'd36) begin 
nxt_state <= s3;
end 
else begin 
nxt_state <= s4;
end
end

s4: begin
if (count<6'd39) begin 
nxt_state <= s4;
end
else begin
nxt_state <= s5;
end
end

s5: begin
if (count<6'd42) begin
nxt_state <= s5;
end
else begin 
nxt_state <= s0;
end
end

endcase

end

// Output Logic

always @(crt_state) begin

case(crt_state)

s0: begin
NS <= 3'b001; //green
WE <= 3'b100; //red
end

s1: begin
NS <= 3'b010; //yellow
WE <= 3'b100; //red
end

s2: begin
NS <= 3'b100; //red
WE <= 3'b100; //red
end

s3: begin
NS <= 3'b100; //red
WE <= 3'b001; //green
end

s4: begin
NS <= 3'b100; //red
WE <= 3'b010; //yellow
end

s5: begin
NS <= 3'b100; //red
WE <= 3'b100; //red
end  

endcase

end

endmodule
