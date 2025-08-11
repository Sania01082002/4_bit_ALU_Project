module alu_4bit(
  input [3:0]A,
  input [3:0]B,
  input [2:0]opcode,
  output reg [3:0]result,
  output reg carry);
  
  always@(*) begin
    carry=0;
    case(opcode)
      3'b000:{carry,result}=A+B;
      3'b001:{carry,result}=A-B;
      3'b010:result=A&B;
      3'b011:result=A|B;
      3'b100:result=A^B;
      default:result=4'b0000;
    endcase
  end
endmodule
  
