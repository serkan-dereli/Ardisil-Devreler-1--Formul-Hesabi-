`timescale 1ns / 1ps

module tam_cikarici(
    input a,b,bin,
    output d,bout
    );
    
    assign d=(a^b)^bin;
    assign bout=(~a&b)+(~(a^b)&bin);
endmodule
