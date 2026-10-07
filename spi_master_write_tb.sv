// Code your testbench here
// or browse Examples
// TEST BENCH 

module spi_tb();
  reg clk, reset;
  reg [15:0] data_in;
  
  wire spi_data, spi_cs_l, spi_sclk;
  wire [4:0] counter;
  
// Top module instantiation
  spi_state tt1(clk, reset, data_in, spi_sclk, spi_data, spi_cs_l, counter);
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, spi_tb);
    end
  
  
//   System Clock Generation
  initial begin
    clk = 0;
    
    forever #5 clk = ~clk; // 100MHz from FPGA or any controller
    
  end
  
  
  initial begin
    reset = 1'b1; // active low reset
    data_in = 1'b0;
    
    
    #10; reset = 1'b0;
    
    #10; data_in = 16'hA569;
    
    #335; data_in = 16'h2563;
    
    #50; $finish();
    
  end
  
endmodule
