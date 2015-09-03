function  exp_with_mean
    %{
    R = exprnd(5,1,1000);
    sum = 0;
    [r w]  = size(R);
    for i = 1:1000
        sum = sum + R(i);
    end
    
    disp(['The mean is =' num2str(sum/1000)]);
    %}
    
    %-ln(rand())/lambda; 
  
    ln = @(x)(log(x));
    sum = 0;
    for i = 1:1000
            X = -ln(rand()) * 5.6;
             myVar = ceil(X*100)/100;  
            sum = sum + myVar;
            disp(num2str(myVar));
       
    end
    
    disp(['The mean is =' num2str(sum/1000)]);
end