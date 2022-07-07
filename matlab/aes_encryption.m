function [output] = aes_encryption(plaintext ,initial_roundkey, roundkeys)
% i/p > char, 1x16
% o/p >

plaintext_dec = double(plaintext);

%  INITIAL ROUND
initial_state = bitxor(plaintext_dec, initial_roundkey);

% MAIN ROUND

for i = 1: 10
    % 1. Byte Substitution | sub_bytes
    sub_bytes_output = sub_bytes(initial_state);

    % 2. Shift Rows | shift_rows
    shift_rows_output = shift_rows(sub_bytes_output);

    % 3 Mix Columns | mix_columns
    if(i <= 9)
        mix_columns_output = mix_columns(shift_rows_output);
    end

    % 4 Add Round Key | add_round_key
    add_round_key_output = add_round_key(mix_columns_output, roundkeys{i});
    
    disp("add_round_key_output")
    disp(add_round_key_output)
    output = add_round_key_output;
end

% DEBUG
fprintf('\nplaintext_dec = \n');
disp(plaintext_dec)

% fprintf('\ninitial_roundkey = \n');
% disp(initial_roundkey)
% 
% fprintf('\nroundkeys = \n');
% disp(roundkeys)
% 
% fprintf('\ninitial_state = \n');
% disp(initial_state)
% 
% fprintf('\nsub_bytes_output = \n');
% disp(sub_bytes_output)
% 
% fprintf('\nshift_rows_output = \n');
% disp(shift_rows_output)
% 
% fprintf('\nmix_columns_output = \n');
% disp(mix_columns_output)

fprintf('\noutput = \n');
disp(output)

end