nome = fopen('C:\Users\andry\Desktop\Digitale\TestBench\TestbenchRandom_bis.txt','wt');

fprintf(nome, '\nwait for 100 ns;');
%fprintf(nome, '\nA<="00000000";'); 
%fprintf(nome, '\nwait for 5 ns;');
%fprintf(nome, '\nassert (to_integer(unsigned(P)) = 0) report "Output mismatch. Expected value: 0. Obtained:" & INTEGER*IMAGE(to_integer(unsigned(P))) severity ERROR;');

for i=1:100
%     sel1=randi([0 255]);
%     sel2=randi([0 255]);
    a=randi([0 65536]);
%     b=randi([0 4294967295]);
%     c=randi([0 4294967295]);
%     d=randi([0 4294967295]);
%     fprintf(nome, '\nsel1<="%s";',dec2bin(sel1,8)');
%     fprintf(nome, '\nsel2<="%s";',dec2bin(sel2,8)');
    fprintf(nome, '\nA<="%s";',dec2bin(a,16)');
%     fprintf(nome, '\nB<="%s";',dec2bin(b,32)');
%     fprintf(nome, '\nC<="%s";',dec2bin(c,32)');
%     fprintf(nome, '\nD<="%s";',dec2bin(d,32)');
    fprintf(nome, '\nwait for 10 ns;');
    %fprintf(nome, '\nassert (to_integer(unsigned(P)) = %i) report "Output mismatch. Expected value: %i. Obtained:" & INTEGER*IMAGE(to_integer(unsigned(P))) severity ERROR;',fix(a*0.2989),fix(a*0.2989));
end;

%fprintf(nome,'\nassert FALSE report "end simulation" severity failure;');

fclose(nome);