`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 23:00:29
// Design Name: 
// Module Name: p_226_1
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


typedef enum {RED,BLUE,BLACK,WHITE} color_t;

virtual class sport_coupe;
color_t color;

 virtual function void print();
  $display("I am %s sport_coupe",color.name());
 endfunction
endclass

class K extends sport_coupe;
 virtual function void print();
  $display("I am %s K motors",color.name());
 endfunction
endclass

class M extends sport_coupe;
 virtual function void print(); 
  $display("I am %s M motors",color.name());
 endfunction
endclass

module p_226_1;
task print_all(sport_coupe cars[]);
 for(int i=0;i<cars.size();i++)
  cars[i].print;
endtask

initial begin
 K k;
 M m;
 sport_coupe cars[4];
//cars=new(4);
k=new();
k.color=BLUE;
m=new();
m.color=WHITE;
 cars[0]=m;
cars[1]=k;
cars[2]=m;
cars[3]=k;
print_all(cars);
end
endmodule
