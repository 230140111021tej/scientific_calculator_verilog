// Single file for scientific calculator modules

module alu (
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [3:0] op_code,
    output reg [15:0] result
);
    // basic ALU operations
    always @(*) begin
        case(op_code)
            4'b0000: result = a + b;       // add
            4'b0001: result = a * b;       // multiply
            4'b0010: result = a - b;       // subtract
            4'b0011: result = (b != 0) ? a / b : 0; // divide
            4'b0100: result = a & b;       // AND
            4'b0101: result = a | b;       // OR
            4'b0110: result = a ^ b;       // XOR
            4'b0111: result = ~a;          // NOT
            default: result = 0;
        endcase
    end
endmodule

// square of a number
module square(
    input wire [15:0] a,
    output wire [15:0] result
);
    assign result = a * a;
endmodule

// simple square root (only few values)
module sqrt(
    input wire [15:0] a,
    output reg [15:0] result
);
    always @(*) begin
        case(a)
            0:  result = 0;
            1:  result = 1;
            4:  result = 2;
            9:  result = 3;
            16: result = 4;
            default: result = 0;
        endcase
    end
endmodule

// power function (small demo)
module power(
    input wire [15:0] a,
    input wire [15:0] b,
    output reg [15:0] result
);
    reg [31:0] result_ext;
    reg [31:0] temp;
    integer i;

    always @(*) begin
        result_ext = 32'd1;
        temp = {16'd0, a};

        for (i = 0; i < 16; i = i + 1) begin
            if (b[i])
                result_ext = result_ext * temp;
            temp = temp * temp;
        end

        result = result_ext[15:0];
    end
endmodule

// sine lookup table (scaled)
module trig_lut (
    input wire [7:0] angle,
    output reg [15:0] result
);
    always @(*) begin
        case(angle)
            0:  result = 0;
            30: result = 500;
            45: result = 707;
            60: result = 866;
            90: result = 1000;
            default: result = 0;
        endcase
    end
endmodule

// cosine lookup table
module trig_lut_cos (
    input wire [7:0] angle,
    output reg [15:0] result
);
    always @(*) begin
        case(angle)
            0:  result = 1000;
            30: result = 866;
            45: result = 707;
            60: result = 500;
            90: result = 0;
            default: result = 0;
        endcase
    end
endmodule

// tangent lookup table
module trig_lut_tan (
    input wire [7:0] angle,
    output reg [15:0] result
);
    always @(*) begin
        case(angle)
            0:  result = 0;
            30: result = 577;
            45: result = 1000;
            60: result = 1732;
            90: result = 0;
            default: result = 0;
        endcase
    end
endmodule

// top module
module sc (
    input wire clk,
    input wire rst,
    input wire [3:0] op_code,
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [7:0] angle,
    output reg [15:0] result,
    output reg valid
);

    wire [15:0] alu_out, square_out, sqrt_out, pow_out;
    wire [15:0] sin_out, cos_out, tan_out;
    wire [15:0] mem_out;

    // module connections
    alu     U_ALU(a, b, op_code, alu_out);
    square  U_SQUARE(a, square_out);
    sqrt    U_SQRT(a, sqrt_out);
    power   U_POWER(a, b, pow_out);

    trig_lut     U_SIN(angle, sin_out);
    trig_lut_cos U_COS(angle, cos_out);
    trig_lut_tan U_TAN(angle, tan_out);

    assign mem_out = 0;

    // select output based on operation
    always @(*) begin
        valid = 1;
        case (op_code)
            4'b0000: result = alu_out;
            4'b0001: result = alu_out;
            4'b0010: result = square_out;
            4'b0011: result = sqrt_out;
            4'b0100: result = pow_out;
            4'b0101: result = sin_out;
            4'b0110: result = cos_out;
            4'b0111: result = tan_out;
            default: begin
                result = 0;
                valid = 0;
            end
        endcase
    end
endmodule
