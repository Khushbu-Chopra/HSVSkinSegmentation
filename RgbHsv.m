X=load('Skin_NonSkin.txt');
x=X(:,:);
b=x(:,1);
g=x(:,2);
r=x(:,3);
y=x(:,4);
b=b/255;
g=g/255;
r=r/255;
v=size(b);
h=size(b);
s=size(b);
for i=1:245057
    var_R=r(i);
    var_G=g(i);
    var_B=b(i);
    var_Min = min(min(var_R,var_G),var_B);   %Min. value of RGB
    var_Max = max(max(var_R,var_G),var_B);   %Max. value of RGB
    del_Max = var_Max - var_Min;           %Delta RGB value

    v(i)=var_Max;

    if( del_Max == 0 )                     %This is a gray, no chroma..
        h(i) = 0;
        s(i) = 0;
    else                                    %Chromatic data...
       s(i) = del_Max / var_Max;
       del_R = ( ( ( var_Max - var_R ) / 6 ) + ( del_Max / 2 ) ) / del_Max;
       del_G = ( ( ( var_Max - var_G ) / 6 ) + ( del_Max / 2 ) ) / del_Max;
       del_B = ( ( ( var_Max - var_B ) / 6 ) + ( del_Max / 2 ) ) / del_Max;
        if(var_R == var_Max )
           h(i) = del_B - del_G; 
        elseif ( var_G == var_Max )
           h(i) = ( 1 / 3 ) + del_R - del_B; 
        elseif ( var_B == var_Max ) 
           h(i) = ( 2 / 3 ) + del_G - del_R;
        end
        if( h(i) < 0 ) 
            h(i)=h(i)+1;
        elseif ( h(i) > 1 ) 
            h(i)=h(i)-1;
        end
    end
end
fid = fopen('hsvSkin_NonSkin.txt','wt');  
for i=1:245057
    fprintf(fid,'%d %d %d %d\n',h(i),s(i),v(i),y(i));  % The format string is applied to each element of a
end
fclose(fid);

