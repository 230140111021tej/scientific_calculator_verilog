`include "calc.v"

module sctb;
    reg clk;
    reg rst;
    reg [3:0] op_code;
    reg [15:0] a, b;
    reg [7:0] angle;
    wire [15:0] result;
    wire valid;

    // Instantiate calculator
    sc DUT(
        clk, rst, op_code, a, b, angle, result, valid
    );

    initial begin
        clk = 0; rst = 0; op_code = 0; a = 0; b = 0; angle = 0;
    end

    always #5 clk = ~clk; // Simple clock

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, sctb);

        $display("\n==== SCIENTIFIC CALCULATOR TESTBENCH ====\n");

        // Addition tests
        op_code = 4'b0000; a = 10; b = 20; angle = 0; #10;
        $display("Addition:         %d + %d = %d", a, b, result);
        op_code = 4'b0000; a = 0; b = 0; angle = 0; #10;
        $display("Addition:         %d + %d = %d", a, b, result);
        op_code = 4'b0000; a = 1000; b = 500; angle = 0; #10;
        $display("Addition:         %d + %d = %d", a, b, result);

        // Multiplication tests
        op_code = 4'b0001; a = 7; b = 6; angle = 0; #10;
        $display("Multiplication:   %d * %d = %d", a, b, result);
        op_code = 4'b0001; a = 0; b = 123; angle = 0; #10;
        $display("Multiplication:   %d * %d = %d", a, b, result);
        op_code = 4'b0001; a = 50; b = 2; angle = 0; #10;
        $display("Multiplication:   %d * %d = %d", a, b, result);

        // Square tests
        op_code = 4'b0010; a = 5; b = 0; angle = 0; #10;
        $display("Square:           %d^2 = %d", a, result);
        op_code = 4'b0010; a = 0; b = 0; angle = 0; #10;
        $display("Square:           %d^2 = %d", a, result);
        op_code = 4'b0010; a = 12; b = 0; angle = 0; #10;
        $display("Square:           %d^2 = %d", a, result);

        // Sqrt tests (only for perfect squares)
        op_code = 4'b0011; a = 16; b = 0; angle = 0; #10;
        $display("Square Root:      sqrt(%d) = %d", a, result);
        op_code = 4'b0011; a = 9; b = 0; angle = 0; #10;
        $display("Square Root:      sqrt(%d) = %d", a, result);
        op_code = 4'b0011; a = 1; b = 0; angle = 0; #10;
        $display("Square Root:      sqrt(%d) = %d", a, result);
        op_code = 4'b0011; a = 4; b = 0; angle = 0; #10;
        $display("Square Root:      sqrt(%d) = %d", a, result);

        // Power tests
        op_code = 4'b0100; a = 3; b = 3; angle = 0; #10;
        $display("Power:            %d^%d = %d", a, b, result);
        op_code = 4'b0100; a = 2; b = 4; angle = 0; #10;
        $display("Power:            %d^%d = %d", a, b, result);
        op_code = 4'b0100; a = 10; b = 1; angle = 0; #10;
        $display("Power:            %d^%d = %d", a, b, result);
        op_code = 4'b0100; a = 5; b = 0; angle = 0; #10;
        $display("Power:            %d^%d = %d", a, b, result);

        // Sine tests
        op_code = 4'b0101; a = 0; b = 0; angle = 0; #10;
        $display("Sine:             sin(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0101; a = 0; b = 0; angle = 30; #10;
        $display("Sine:             sin(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0101; a = 0; b = 0; angle = 45; #10;
        $display("Sine:             sin(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0101; a = 0; b = 0; angle = 60; #10;
        $display("Sine:             sin(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0101; a = 0; b = 0; angle = 90; #10;
        $display("Sine:             sin(%0d deg) = %0d (scale 1000)", angle, result);

        // Cosine tests
        op_code = 4'b0110; a = 0; b = 0; angle = 0; #10;
        $display("Cosine:           cos(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0110; a = 0; b = 0; angle = 30; #10;
        $display("Cosine:           cos(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0110; a = 0; b = 0; angle = 45; #10;
        $display("Cosine:           cos(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0110; a = 0; b = 0; angle = 60; #10;
        $display("Cosine:           cos(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0110; a = 0; b = 0; angle = 90; #10;
        $display("Cosine:           cos(%0d deg) = %0d (scale 1000)", angle, result);

        // Tangent tests
        op_code = 4'b0111; a = 0; b = 0; angle = 0; #10;
        $display("Tangent:          tan(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0111; a = 0; b = 0; angle = 30; #10;
        $display("Tangent:          tan(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0111; a = 0; b = 0; angle = 45; #10;
        $display("Tangent:          tan(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0111; a = 0; b = 0; angle = 60; #10;
        $display("Tangent:          tan(%0d deg) = %0d (scale 1000)", angle, result);
        op_code = 4'b0111; a = 0; b = 0; angle = 90; #10;
        $display("Tangent:          tan(%0d deg) = %0d (scale 1000)", angle, result);

        $display("\n==== END OF TESTBENCH ====\n");

        #20 $finish;
    end
endmodule
