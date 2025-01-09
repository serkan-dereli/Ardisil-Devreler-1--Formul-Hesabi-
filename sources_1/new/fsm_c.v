
module fsm_c(
    input clk,rst,
    input [4:0] a_in,b_in,
    output [4:0] c_out
    );
    
    localparam s0=3'b000;
    localparam s1=3'b001;
    localparam s2=3'b010;
    localparam s3=3'b011;
    localparam s4=3'b100;
    localparam s5=3'b101;
    localparam s6=3'b110;
    localparam s7=3'b111;
    
    //tasarýmdaki genel sinyal tanýmlamalarý
    reg [2:0] durum;
    reg [4:0] ax,bx,cx;
    reg [4:0] i1,i2,i3;
    
    //tam toplayýcý sinyalleri
    reg [4:0] ta,tb;
    wire [4:0] ts;
    wire [5:0] c; 
    assign c[0]=1'b0;
    genvar i,j;
    for(i=0;i<5;i=i+1)
    begin
        tam_toplayici topla(
            .a(ta[i]),
            .b(tb[i]),
            .cin(c[i]),
            .s(ts[i]),
            .cout(c[i+1])
        );
    end
    
    //tam çýkarýcý sinyaller
    reg [4:0] ca,cb;
    wire [4:0] cd;
    wire [5:0] b;
    assign b[0]=1'b0;
    for(j=0;j<5;j=j+1)
    begin
        tam_cikarici cikar(
            .a(ca[j]),
            .b(cb[j]),
            .bin(b[j]),
            .d(cd[j]),
            .bout(b[j+1])
        );
    end
    
    assign c_out=cx;
    
    //reset=0 iken devre ilk duruma geçecek
    always @(posedge clk)
    begin
        if(rst==1'b0) begin
            durum<=s0;
        end
        else begin
            case(durum)
                s0:begin
                    //giriþ sinyalleri içeri alýnýyor
                    ax<=a_in;
                    bx<=b_in;
                    durum<=s1;
                end
                
                s1: begin
                    //2*t (t+t) iþlemi yapýlýyor
                    if(ax>bx) begin
                        ta<=ax;
                        tb<=ax;
                    end
                    else begin
                        ta<=bx;
                        tb<=bx;
                    end
                    durum<=s2;                  
                end
                
                s2: begin
                    //a+a veya b+b nin sonucu alýnýyor
                    i1<=ts;
                    durum<=s3;
                end
                
                s3: begin
                    ta<=ax;
                    tb<=bx;
                    durum<=s4;
                end
                
                s4: begin
                    //a+b'nin sonucu alýnýyor
                    i2<=ts;
                    durum<=s5;
                end
                
                s5: begin
                    //i1-i2 iþlemi yapýlýyor
                    ca<=i1;
                    cb<=i2;
                    durum<=s6;
                end
                
                s6: begin
                    i3<=cd;
                    durum<=s7;
                end
                
                s7:begin
                    cx<=i3;
                end
            endcase
        end        
    end  
    
endmodule