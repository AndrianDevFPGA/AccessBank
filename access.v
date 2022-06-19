/*
  Name : Rakotojaona Nambinina
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description : Accessing bank example of state Machine 
*/
module access (
              clk,
              rst,
              tx,
              paswrd,
              access
              );
  input clk;
  input rst;
  input tx;
  input [3:0] paswrd;
  output reg access;
  
  integer state;
  integer counter ;
  
  always @ (posedge clk)
    begin
      if (rst)
        begin
          access <= 0;
          state <= 0;
          counter <= 0;
        end 
      else
       begin
         counter <= counter + 1;
         case (state)
           0:
             begin
               counter <= 0;
               if (tx)
                 begin
                   state <= 1;
                 end 
             end 
           1:
             begin
               counter <= 0;
               if (paswrd == 4'd5 || paswrd == 4'd6)
                 begin
                   state <= 2;
                 end 
             end 
           2:
             begin
               if (counter == 5'd5)
                 begin
                   state <= 0;
                 end
             end 
         endcase
       end 
    end 

  always @ (negedge clk)
    begin
      case (state)
        0:
          begin
            access <= 0;
          end 
        1:
          begin
            access <= 0;
          end
        2:
          begin
            access <= 1;
          end 
      endcase
    end 
endmodule

/*

module tbAccess(

    );
    
  reg clk;
  reg rst;
  reg tx;
  reg [3:0] paswrd;
  wire  access;
     access dut(
              clk,
              rst,
              tx,
              paswrd,
              access
              );
  
  initial
    begin
      clk = 0;
      rst = 1;
      tx =0;
      paswrd = 4'd3;
      #10
      rst =0;
      #50
      tx = 1;
      #30
      paswrd = 4'd5;
    end 
    
  always
    begin
      #5 clk = ! clk;
    end 
  
endmodule

*/
