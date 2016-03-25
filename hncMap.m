function c = hncMap(xAB, M)

 c=zeros(size(xAB));
 switch M
     case 2
         c(abs(xAB)<1)=1;
     case 4
 end