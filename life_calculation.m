function x = life_calculation(life_old,life_new)
living_sum =0;
birth_sum =0;
death_sum =0;
for i =1:8
    for j =1:8
        if(life_old(i,j)==1 && life_new(i,j)==1)
            living_sum = living_sum +1;
        end
        if(life_old(i,j)==0 && life_new(i,j)==1)
            birth_sum = birth_sum +1;
        end
         if(life_old(i,j)==1 && life_new(i,j)==0)
            death_sum = death_sum +1;
        end
       
    end
end
x(1) = living_sum;
x(2) = birth_sum;
x(3) = death_sum;
        
end