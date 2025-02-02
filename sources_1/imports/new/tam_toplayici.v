`timescale 1ns / 1ps

module tam_toplayici(
    input a,b,cin,
    output s,cout
    );
    
    assign s = (a^b) ^ cin;
    assign cout = ((a^b) & cin) | (a&b);
endmodule
