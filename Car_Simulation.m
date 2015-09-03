function Car_Simulation()

    server_status = 0;
    queue_length = 0;
    service_time = 0;
    inter_arrival_time = 0;
    serving_job_no = 0;
    delayed_no_of_car_sum = 0;
    simulation_time = 0;
    police_car_inter_arrival_time = 15;
    regular_car_inter_arrival_time = 0;
    waiting_car_queue = zeros(1,100);
    car_info = zeros(4,1000);
    %car_info(1)| Row 1 = car_type
    %car_info(2)| Row 2  = arrival_time
    %car_info(3)| row 3 = service time
    %car_info(4)| Row 4  = Departure_time
    arrival_time = 0;
    car_tpye = 0;
    next_departure_time = 0;
    delayed_customer = 0;
    while(delayed_customer~=500)     
        i =1;
        ln = @(x)(log(x));
        X =  -ln(rand()) * 5.6;
        regular_car_inter_arrival_time = ceil(X*100)/100;
        inter_arrival_time = regular_car_inter_arrival_time;
        car_info(1,i) = 100 + i;
        if(mod(simulation_time,30) == 15)
            police_car_inter_arrival_time = police_car_inter_arrival_time + 30;
            inter_arrival_time = police_car_inter_arrival_time;
            car_info(1,i) = 500+1;
            
        end
       arrival_time = arrival_time + inter_arrival_time;
       car_info(2,i) = arrival_time;
       
       X =  -ln(rand()) * 4.8;
       service_time = ceil(X*100)/100;
       car_info(3,i) = service_time;
       %arrival Event
       if(arrival_time < next_departure_time )
           %if server is busy
           if(server_status)
               queue_length = queue_length  +1;
               waiting_car_queue(queue_length) = car(1,i);
               
           %if the server is free
           else
               next_deaprture_time = service_time + car(3,i);  
               server_status = 1;
               car_info(3,i) = service_time;
               serving_car  = car(1,i); 
               
           end
           
        %Departure Event
       else
           %if server is busy
           if(server_status)
               server_status = 0;
           end
           queue_length = queue_length -1;
           serving_car = waiting_car_queue(1);
           copy = waiting_car_queue(2:queue_length);
           waiting_car_queue = copy;
           m = 1;
           while(car_info(1,m)~=serving_car) 
               m = m+1;
           end
           next_deaprture_time = car_info(3,m) + next_deaprture_time;
           delayed_customer = delayed_customer + 1;
 
       end
       
       
       simulation_time = simulation_time + 0.1;
       i = i+1;
       disp(i);
       
        
    end





end