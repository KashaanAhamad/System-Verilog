`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 23:41:43
// Design Name: 
// Module Name: p_138_processor_ins
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module p_138_processor_ins( );

//declare variables src1,src2, aluin1,aluin2,alu_op,alu_operation
 
typedef enum bit [2:0] {
    ADD = 3'b001,
    SUB = 3'b010,
    NOT_OP = 3'b011,
    AND_OP = 3'b100,
    OR_OP  = 3'b101,
    XOR_OP = 3'b110
  } alu_opcode_t;

// Arrays to hold generated data
  int src1[0:4], src2[0:4];
  alu_opcode_t alu_op[0:4];

  // Variables sent to DUT
  int aluin1, aluin2;
  alu_opcode_t alu_operation;

task gen();
for(int i=0;i<=4;i++)
	begin
		src1[i]=$random;
		src2[i]=$random;
		alu_op[i] = alu_opcode_t'($urandom_range(1,6));

		$display("Generated: src1[%0d]=%0d src2[%0d]=%0d alu_op=%0d",
                i, src1[i], i, src2[i], alu_op[i]);
	end
endtask

task send();
for(int i=0;i<=4;i++)
	begin
		aluin1=src1[i];
		$display("sending src1[%d]=%d to aluin1",i,src1[i]);

		aluin2=src2[i];
		$display("ending src2[%d]=%d to aluin2",i,src2[i]);

		alu_operation=alu_op[i];
		$display("Sending alu_op[%d]=%d to alu_operation",i,alu_op[i]);
		
		#10;   // Delay between transactions
	end
endtask

initial begin
	gen();
	#5;
	send();
	#10;
	$finish;
end
endmodule
