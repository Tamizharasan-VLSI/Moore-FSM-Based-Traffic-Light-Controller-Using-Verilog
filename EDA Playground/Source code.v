module traffic_light_controller(
  input clk,rst,
  output reg [2:0] M1,MT,M2,S);
  
  parameter s0 = 3'b000,
   s1 = 3'b001,
   s2 = 3'b010,
   s3 = 3'b011,
   s4 = 3'b100,
  s5 = 3'b101;
  
  reg [4:0] count;
  reg [2:0] current_state,next_state;
  
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      current_state <= s0;
    count <= -1;
    end
    else begin
      current_state <= next_state;
      if(next_state != current_state)
        count<=0;
      else
        count<=count+1;
  end
  end
  
  
   always@(*)begin
   case(current_state)
    
      s0:begin
        if(count == 7)
          next_state = s1;
        else 
          next_state = s0;
      end
      
      s1:begin
        if(count == 2)
          next_state = s2; 
        else 
          next_state = s1;
      end
      
   s2:begin
     if(count== 7)
          next_state = s3;
     else 
          next_state = s2; 
   end
  
       s3:begin
         if(count ==2)
          next_state = s4;
         else 
          next_state = s3;
    end
      
       s4:begin
         if(count==7)
          next_state = s5;
         else 
          next_state = s4;
    end
      
       s5:begin
         if(count==2)
          next_state = s0;
         else 
          next_state = s5;
      end
      
        default: next_state = s0;
      
   endcase
   end


always@(*)begin
  if (rst) begin
    M1 = 3'b000;
    MT = 3'b000;
    M2 = 3'b000;
    S  = 3'b000;
  end
  else begin
  case(current_state)
    s0:begin
      M1 = 001;
      MT = 100;
      M2 = 001;
      S = 100;
    end
    
    s1:begin
      M1 = 001;
      MT = 100;
      M2 = 010;
      S = 100;
    end
    
    s2:begin
      M1 = 001;
      MT = 001;
      M2 = 100;
      S = 100;
    end
    
    s3:begin
      M1 = 010;
      MT = 010;
      M2 = 100;
      S = 100;
    end
    
    s4:begin
      M1 = 100;
      MT = 100;
      M2 = 100;
      S = 001;
    end
    
    s5:begin
      M1 = 100;
      MT = 100;
      M2 = 100;
      S = 010;
    end

  endcase
  end
end
  
  endmodule
  






