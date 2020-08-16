// Traffic Light Controller Testbench
// Created by Nitheesh Kumar - Aug 16 2020

module traffic_test();

// Inputs

reg clk, reset;

// Outputs

wire [2:0] NS, WE;

// DUT Instantiation

traffic_light_controller T1 (.clk(clk),.reset(reset),.NS(NS),.WE(WE));

always #5 clk=~clk;

initial begin
clk=0;
reset=0;
#20 reset=1;
#10000 reset=0;
#20 $finish;
end

endmodule
