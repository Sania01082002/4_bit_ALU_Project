`include "alu.sv"
module testbench;
  reg [3:0]A;
  reg [3:0]B;
  reg [2:0]opcode;
  wire [3:0]result;
  wire carry;
  reg [5:0]expected;
  
  alu_4bit dut(
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry)
  );
  initial begin
    repeat(20) begin   
      A=$urandom % 16;
      B=$urandom % 16;
      opcode= $urandom % 5;
      #10;// to let the signals settle
      
      case(opcode)
        3'b000:expected=A+B;
        3'b001:expected=A-B;
        3'b010:expected=A&B;
        3'b011:expected=A|B;
        3'b100:expected=A^B;
        default:expected=4'b0000;
      endcase
      
      if({carry,result}==expected[4:0])
        
        $display("Test Pass: a=%d b=%d opcode=%b result=%d carry=%b",A,B,opcode,result,carry);
      else
        
        $display("Test Fail: a=%d b=%d opcode=%b result=%d carry=%b  expected=%d",A,B,opcode,result,carry);
      
      case(opcode)
        3'b000:$display("addition tested");
        3'b001:$display("subtraction tested");
        3'b010:$display("and gate tested");
        3'b011:$display("or gate tested");
        3'b100:$display("xor gate tested");
      endcase
    end
    $finish;
  end
endmodule
