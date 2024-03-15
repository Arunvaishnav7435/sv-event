//SV Topics : Synchronizatin
//Problem statement : using event to synchronize concurrent initial blocks
​
//======================================
​
module test;
  
  event e1;    //instantiating an event
  
    initial begin
      #100;
      ->e1;     //triggering the event
      #5;
      $stop;
    end
  
    initial begin
      wait(e1.triggered);       //waiting for event
      $display($time," current time");
    end
    
    initial begin
      #100;
      @(e1.triggered);  //does not work in same simulation time
      $display("this will not be printed");
    end
  
    initial begin
      #100;
      
      wait(e1.triggered);       //waiting for event
      $display($time," but this will be printed");
    end
endmodule
