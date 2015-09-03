function Random_Walk(n)

position_x = 0;
position_y = 0;
plot(position_x,position_y,'*');
hold on

left_turn = 0;
right_turn = 0;
forward_turn = 0;

while(n~=0)
   random_probabilty = rand(); 
   % for 40 % probabilty forward Moving
   if(random_probabilty <= 0.40)
       position_y = position_y + 1;
       forward_turn = forward_turn +1;
   end
   % for 30 % probabilty Left Moving
   if(random_probabilty > 0.40 && random_probabilty <= 0.70)
        position_x = position_x - 1;
        left_turn = left_turn +1;
   end
   
    % for 30 % probabilty Right Moving
   if(random_probabilty >0.7)
       position_x = position_x + 1;
       right_turn = right_turn +1;
   end
   
   plot(position_x,position_y,'*');
   hold on
   
   n = n -1;
end
 hold off

disp(['Total Forward Move =' num2str(forward_turn)]);
disp(['Total Left Move =' num2str(left_turn)]);
disp(['Total Right Move =' num2str(right_turn)]);
end