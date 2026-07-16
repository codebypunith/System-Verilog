module process();
  
  process my_thread; // my thread 1
  process p; // my_thread 2
  
  initial 
    begin
      fork
        begin
          my_thread = process::self(); // Capture handle of this specific thread
      
          $display("Process_1 is running...\[%0t]", $time);
          
          #10;
          $display("Process_1 is running...\[%0t]", $time);
     
          #10;
          $display("Process_1 is running...\[%0t]", $time);
    
          #10;
          $display("Process_1 is running...\[%0t]", $time);
    
          #10;
          $display("Process_1 is running...\[%0t]", $time);      
    
          #10;
          $display("Process_1 is running...\[%0t]", $time);
     
          #10;
          $display("Process_1 is running...\[%0t]", $time);
    
          #10;
          $display("Process_1 is running...\[%0t]", $time);
    
          #10;      
          $display("This line won't execute if killed.");
        end
      join_none
    
      #20; // Give the thread some time to start
      my_thread.suspend();  
   
      #30; //  simulation skips this 30ns, suspends thread(fork-join/begin-end)
      // the fork thread will not consume any time until it is resumed(here upto 30 ns)
      
      // #100; // uncomment this to see the suspend process behaviour
      my_thread.resume();
 
      #30; 
      // #100; // uncomment this to see the complete process(fork thread) execution
      my_thread.kill();  // like disable fork

    end
  

  initial
    begin
      
      fork
        begin
          p = process::self(); // Capture handle of this specific thread
          forever 
            begin
              #10;
              $display("Process_2, Time = %0t", $time);
            end
        end
      join_none

      #35;
      p.suspend();

      #20;
      p.resume();

      #40;
      p.kill();
  
    end

 
endmodule: process
