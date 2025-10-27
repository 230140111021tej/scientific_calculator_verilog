// Single file: All modules for Scientific Calculator

module alu (
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [3:0] op_code,
    output reg [15:0] result
);
    always @(*) begin
        case(op_code)
            4'b0000: result = a + b;       // Addition
            4'b0001: result = a * b;       // Multiplication
            4'b0010: result = a - b;       // Subtraction
            4'b0011: result = (b != 0) ? a / b : 0; // Division
            4'b0100: result = a & b;
            4'b0101: result = a | b;
            4'b0110: result = a ^ b;
            4'b0111: result = ~a;
            default: result = 0;
        endcase
    end
endmodule

module square(
    input wire [15:0] a,
    output wire [15:0] result
);
    assign result = a * a;
endmodule

// Very simple integer sqrt for demo (returns for perfect squares)
module sqrt(
    input wire [15:0] a,
    output reg [15:0] result
);
    always @(*) begin
        case(a)
            0: result = 0;
            1: result = 1;
            4: result = 2;
            9: result = 3;
            16: result = 4;
            default: result = 0;
        endcase
    end
endmodule

// Only handles small integer powers for demo
module power(
    input wire [15:0] a,
    input wire [15:0] b,
    output reg [15:0] result
);
    // Wider internal registers to hold intermediate products
    reg [31:0] result_ext;
    reg [31:0] temp;
    integer i;

    // Use exponentiation-by-squaring with a fixed loop bound (16 bits)
    // This is synthesizable because the loop bound is a constant.
    always @(*) begin
        result_ext = 32'd1;
        temp = {16'd0, a}; // zero-extend 'a' into 32 bits

        // fixed-iteration loop (0..15) - synthesizable
        for (i = 0; i < 16; i = i + 1) begin
            if (b[i])
                result_ext = result_ext * temp;
            temp = temp * temp;
        end

        // Truncate to 16 bits for the module's output width
        result = result_ext[15:0];
    end
endmodule

module trig_lut (
    input wire [7:0] angle,       // 0-90 degrees
    output reg [15:0] result      // Fixed-point, scale=1000
);
    always @(*) begin
        case(angle)
            0: result = 0;
            30: result = 500;
            45: result = 707;
            60: result = 866;
            90: result = 1000;
            default: result = 0;
        endcase
    end
endmodule

module trig_lut_cos (
    input wire [7:0] angle,       // 0-90 degrees
    output reg [15:0] result      // Fixed-point, scale=1000
);
    always @(*) begin
        case(angle)
            0: result = 1000;
            30: result = 866;
            45: result = 707;
            60: result = 500;
            90: result = 0;
            default: result = 0;
        endcase
    end
endmodule

module trig_lut_tan (
    input wire [7:0] angle,       // 0-90 degrees
    output reg [15:0] result      // Fixed-point, scale=1000
);
    always @(*) begin
        case(angle)
            0: result = 0;
            30: result = 577;   // tan(30) ≈ 0.577
            45: result = 1000;  // tan(45) = 1.0
            60: result = 1732;  // tan(60) ≈ 1.732
            90: result = 0;     // tan(90) is undefined; set to 0 for demo
            default: result = 0;
        endcase
    end
endmodule

module sc (
    input wire clk,
    input wire rst,
    input wire [3:0] op_code,      // Operation select
    input wire [15:0] a,           // Operand/input 1
    input wire [15:0] b,           // Operand/input 2
    input wire [7:0] angle,        // For trig operations (degrees, 0-180)
    output reg [15:0] result,      // Fixed-point output
    output reg valid
);

    wire [15:0] alu_out, square_out, sqrt_out, pow_out;
    wire [15:0] sin_out, cos_out, tan_out;
    wire [15:0] mem_out;

    // Instantiate ALU
    alu U_ALU(a, b, op_code, alu_out);

    // Instantiate Scientific blocks
    square U_SQUARE(a, square_out);
    sqrt U_SQRT(a, sqrt_out);
    power U_POWER(a, b, pow_out);

    // Instantiate Trig LUTs (fixed-point: scale = 1000)
    trig_lut U_SIN(angle, sin_out);
    trig_lut_cos U_COS(angle, cos_out);
    trig_lut_tan U_TAN(angle, tan_out);

    // Simple memory block (not implemented here)
    assign mem_out = 0;

    always @(*) begin
        valid = 1;
        case (op_code)
            4'b0000: result = alu_out;       // Addition
            4'b0001: result = alu_out;       // Multiplication
            4'b0010: result = square_out;    // Square
            4'b0011: result = sqrt_out;      // Square Root
            4'b0100: result = pow_out;       // Power
            4'b0101: result = sin_out;       // Sine
            4'b0110: result = cos_out;       // Cosine
            4'b0111: result = tan_out;       // Tangent
            default: begin
                result = 0;
                valid = 0;
            end
        endcase
    end
endmodule
