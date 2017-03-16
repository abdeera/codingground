k = 1;begin=1;val1=0;val2=0;fid = fopen('numbers.txt', 'w');
for i = 2: 100
    feu = 0;
    for j = 2: i / 2
        if mod(i, j) == 0
            feu = 1;
            break;
        end
    end
    if feu == 0
        l(k) = i;
        k = k + 1;
    end
end
for  i = 1: k - 1
    tmp = 1;
    for  j = 1: 20
        tmp = tmp * l(i);
        if tmp >= 100
            m(i) = j;
            break
        end
    end
end
for ii = 1: k
    vect(ii) = 0;
end
for ii = 0: (k - 2)
    m(k - ii) = m(k - ii - 1);
    l(k - ii) = l(k - ii - 1);
end
for bb=0:1000000
    if begin==0
    fid = fopen('draft.txt', 'w');
    end
    m(1) = 1;o=1;oo=1;
    if begin==0
        for cc=0:10000
        val1=input('\nenter a number \n');val2=input('\nenter a second number \n');nb1=val1;nb2=val2;val1=min(nb1,nb2);val2=max(nb1,nb2);
        if val1==1 | val2>=100
            fprintf('enter valid values\n');
        else
            break;
        end
        end
    end
    for jj = 1: 6885
        cunt = 0;tmp = 1;feu = 0; nb1=0;nb2=0;
        for i= 2: (k)
            if (vect(i) == mod(vect(i) + floor(((mod(vect(i - 1) - 1, m(i - 1)) + 1) / m(i - 1))), m(i)))
                feu = 1;
            end
            if feu == 0
                vect(i) = mod(vect(i) + floor(((mod(vect(i - 1) - 1, m(i - 1)) + 1) / m(i - 1))), m(i));current = i;
            end
            tmp = tmp * l(i) ^ vect(i);
            if tmp > 10000
                if feu == 1
                    for ll = 2: current
                        if m(ll)~=0
                            vect(ll) = m(ll) - 1;
                        end
                    end
                    break;
                end
            end
        end
        if tmp < 10000 & tmp ~= 1
            kk=k;lim=1;
            for iii = 2: k
                if vect(iii)~=0
                    kk=iii+1;mm(iii) = vect(iii)  +1;lim=lim*(mm(iii));
                else
                    mm(iii)=0;
                end
                vectt(iii) = 0;
            end
            if kk>k
                kk= k;
            end
            mm(1) = 1;vectt(1) = 0;
            for jjj = 1: lim + 1
                tmpp = 1;feu = 0;tmmp = 1;ilast=1;
                for ii = 2: (kk)
                    if mm(ii)~=0
                        if(jjj~=1 )
                            if (vectt(ii) == mod(vectt(ii) + floor(((mod(vectt(ilast) - 1, mm(ilast)) + 1) / mm(ilast))), mm(ii)))
                                feu = 1;
                            end
                            if feu == 0
                                vectt(ii) = mod(vectt(ii) + floor((mod(vectt(ilast) - 1, mm(ilast)) + 1) / mm(ilast)), mm(ii));currentt = ii;
                            end
                        end
                        tmpp = tmpp * l(ii) ^ vectt(ii);tmmp = tmmp * l(ii) ^ (vect(ii) - vectt(ii));
                        if tmpp > 100 | tmmp > 100 | tmpp == 1 | tmmp == 1
                            if feu == 1
                                if tmpp> 100
                                    for ll = 2: currentt
                                        if mm(ll)~=0
                                            vectt(ll) = mm(ll) - 1;
                                        end
                                    end
                                end
                                break;
                            end
                        end
                        ilast=ii;
                    end
                end
                if tmpp < 100 & tmmp < 100 & tmpp ~= 1 & tmmp ~= 1
                    if begin==1
                        fprintf('-  %d %%  -\n',floor(100*jj/6885));
                    end
                    sum = tmpp + tmmp;prem = 0;sec = 0;niv = k;
                    for iij = 0: niv - 2
                        if l(k - iij) <= sum
                            niv = k - iij;break;
                        end
                    end
                    if(sum>100)
                        prem=1000;
                    end
                    last = 2;
                    for iij = 2: niv
                        if prem ~= 0 | sec ~= 0
                            break;
                        end
                        if l(iij) == sum - 2
                            prem = sum-2;break;
                        end
                        for iijj = 0: niv - 2
                            if(niv-iijj<iij)
                                break;
                            end
                            if(prem ~= 0|sec ~= 0)
                                break;
                            end
                            if l(niv - iijj) == sum - 2
                                prem = sum-2;break;
                            end
                            for ji = l(iij - 1) + 1: l(iij) - 1
                                if l(niv - iijj) == sum - ji
                                    if l(last) * l(last) == ji
                                        if l(niv - iijj) * l(last) > 100
                                            sec = l(niv - iijj) ;prem=l(last);break;
                                        end
                                        if last~= k
                                            last = last + 1;
                                        end
                                    end
                                end
                            end
                            if l(niv - iijj) <= sum - l(iij)
                                if l(niv - iijj) == sum - l(iij)
                                    prem= l(iij) ;break;
                                end
                                niv = niv - iijj;
                                break;
                            end
                        end
                    end
                    res(o) = tmmp;res(o+1) = tmpp;ress(o) = prem;ress(o+1) = sec;o = o + 2;
                    if prem == 0 & sec == 0
                        valeur=tmmp;
                        if tmmp~=nb1 & tmmp~=nb2
                            cunt = cunt + 1;nb1=min(tmmp,tmpp);nb2=max(tmmp,tmpp);
                        end
                    end
                end
                for ij = 2: kk
                    if vectt(ij) ~= mm(ij) - 1 & mm(ij) ~= 0
                        break;
                    end
                end
                if ij == kk
                    break;
                end
            end
        end
        res(o)=0;ress(o)=cunt;o=o+1;
        if (vect(k) == m(k) - 1)
            for ijij = 2: k
                if vect(ijij)  ~= m(ijij) - 1
                    break;
                end
            end
            if ijij == k
                break;
            end
        end
        if(cunt>1 | cunt==0)
            for ij=0:2:o-3
                if res(o-2-ij)==0
                    o=o-1-ij;
                    break
                end
                if ress(o-2-ij)==0 & ress(o-2-ij-1)==0
                    if begin==0 & val1==min(res(o-2-ij-1),res(o-2-ij)) & val2==max(res(o-2-ij-1),res(o-2-ij))
                        fprintf('(x=%d ,y=%d) is rejected because there exists (x0,y0)  :\n',res(o-2-ij-1),res(o-2-ij));
                    end
                    fprintf(fid,'(x=%d ,y=%d) is rejected because there exists (x0,y0)  :\n',res(o-2-ij-1),res(o-2-ij));
                    for iij=0:2:o-3
                        if res(o-2-iij)==0
                            break
                        end
                        if res(o-2-ij)~=res(o-2-iij) & res(o-2-ij)~=res(o-2-iij-1)
                            if ress(o-2-iij)==0 & ress(o-2-iij-1)==0
                                if begin==0 & val1==min(res(o-2-ij-1),res(o-2-ij)) & val2==max(res(o-2-ij-1),res(o-2-ij))
                                    fprintf('(x0=%d ,y0=%d ) where xy = x0*y0  and they both verify conditions \nthe proctor wouldnt say  "Now I can determine them."!\n\n',res(o-2-iij-1),res(o-2-iij));break;
                                end
                            fprintf(fid,'(x0=%d ,y0=%d ) where xy = x0*y0  and they both verify conditions \nthe proctor wouldnt say  "Now I can determine them."!\n\n',res(o-2-iij-1),res(o-2-iij));break;
                            end
                        end
                    end
                else
                    if begin==0 & val1==min(res(o-2-ij-1),res(o-2-ij)) & val2==max(res(o-2-ij-1),res(o-2-ij))
                        fprintf('(x=%d ,y=%d) is rejected because   :\n',res(o-2-ij-1),res(o-2-ij));
                    end
                    fprintf(fid,'(x=%d ,y=%d) is rejected because   :\n',res(o-2-ij-1),res(o-2-ij));
                    if ress(o-2-ij)==0
                        if ress(o-2-ij-1)==1000
                            if begin==0 & val1==min(res(o-2-ij-1),res(o-2-ij)) & val2==max(res(o-2-ij-1),res(o-2-ij))
                                fprintf('x+y = %d bigger than 100 \n\n\n',res(o-2-ij-1)+res(o-2-ij));
                                break;
                            end
                        fprintf(fid,'x+y = %d bigger than 100 \n\n\n',res(o-2-ij-1)+res(o-2-ij));
                        else
                            if begin==0 & val1==min(res(o-2-ij-1),res(o-2-ij)) & val2==max(res(o-2-ij-1),res(o-2-ij))
                                if res(o-2-ij)==ress(o-3-ij) | res(o-3-ij)==ress(o-2-ij-1)
                                    fprintf('%d and %d are primes \nthe proctor wudnt say  "I cannot determine the two numbers."!\n\n',ress(o-2-ij-1),res(o-2-ij-1)+res(o-2-ij)-ress(o-3-ij));
                                else
                                    fprintf('x+y-k = %d and k = %d primes \nthe summer wudnt say  "I knew that."!\n\n',ress(o-2-ij-1),res(o-2-ij-1)+res(o-2-ij)-ress(o-3-ij));
                                end
                                break;
                            end
                            if res(o-2-ij)==ress(o-3-ij) | res(o-3-ij)==ress(o-2-ij-1)
                                fprintf(fid,'%d and %d are primes \nthe proctor wudnt say  "I cannot determine the two numbers."!\n\n',ress(o-2-ij-1),res(o-2-ij-1)+res(o-2-ij)-ress(o-3-ij));
                            else
                                fprintf(fid,'x+y-k = %d and k = %d primes \nthe summer wudnt say  "I knew that."!\n\n',ress(o-2-ij-1),res(o-2-ij-1)+res(o-2-ij)-ress(o-3-ij));
                            end
                        end
                    else
                        if ress(o-2-ij-1)+ress(o-2-ij)==res(o-2-ij-1)+res(o-2-ij)
                            if begin==0 & val1==min(res(o-2-ij-1),res(o-2-ij)) & val2==max(res(o-2-ij-1),res(o-2-ij))
                                fprintf('it exists a prime number k=%d where (x+y-k)*k = %d*%d =%d  bigger than 100 \nthe summer wudnt say  "I knew that."!\n\n',min(ress(o-2-ij-1),ress(o-2-ij)),res(o-2-ij-1)+res(o-2-ij)-min(ress(o-2-ij-1),ress(o-2-ij)),min(ress(o-2-ij-1),ress(o-2-ij)),ress(o-2-ij-1)*ress(o-2-ij));
                                break;
                            end
                            fprintf(fid,'it exists a prime number k=%d where (x+y-k)*k = %d*%d =%d  bigger than 100 \nthe summer wudnt say  "I knew that."!\n\n',min(ress(o-2-ij-1),ress(o-2-ij)),res(o-2-ij-1)+res(o-2-ij)-min(ress(o-2-ij-1),ress(o-2-ij)),min(ress(o-2-ij-1),ress(o-2-ij)),ress(o-2-ij-1)*ress(o-2-ij));
                        else
                            if begin==0 & val1==min(res(o-2-ij-1),res(o-2-ij)) & val2==max(res(o-2-ij-1),res(o-2-ij))
                                fprintf('it exists a number n=%d , where the smallest prime number k=%d < n verifies (x+y-n)*k = %d*%d = %d  bigger than 100 \nthe summer wudnt say  "I knew that."!\n\n',res(o-2-ij-1)+res(o-2-ij)-max(ress(o-2-ij-1),ress(o-2-ij)),min(ress(o-2-ij-1),ress(o-2-ij)),max(ress(o-2-ij-1),ress(o-2-ij)),min(ress(o-2-ij-1),ress(o-2-ij)),ress(o-2-ij-1)*ress(o-2-ij));
                                break;
                            end
                        fprintf(fid,'it exists a number n=%d , where the smallest prime number k=%d < n verifies (x+y-n)*k = %d*%d = %d  bigger than 100 \nthe summer wudnt say  "I knew that."!\n\n',res(o-2-ij-1)+res(o-2-ij)-max(ress(o-2-ij-1),ress(o-2-ij)),min(ress(o-2-ij-1),ress(o-2-ij)),max(ress(o-2-ij-1),ress(o-2-ij)),min(ress(o-2-ij-1),ress(o-2-ij)),ress(o-2-ij-1)*ress(o-2-ij));
                        end
                    end
                end

            end

        elseif(cunt==1)
            feu=0;
            for iij=0:2:o-3
                if (o-2-iij<2)
                    break
                end
                if res(o-2-iij)==0
                    if iij==2 |(iij==4 & res(o-2)==res(o-5) & res(o-3)==res(o-4))
                        if begin==0 & val1==min(nb1,nb2) & val2==max(nb1,nb2)
                            fprintf('(x=%d ,y=%d) is rejected because x * y dont have other valid factors \nthe proctor wudnt say  "I cannot determine the two numbers."!\n\n',nb1,nb2);feu=1;
                            break;
                        end
                    fprintf(fid,'(x=%d ,y=%d) is rejected because x * y dont have other valid factors  \nthe proctor wudnt say  "I cannot determine the two numbers."!\n\n',nb1,nb2);feu=1;
                    end
                    break;
                end
                if ress(o-2-iij-1)~=0 & res(o-2-iij)~=0 & res(o-3-iij)~=0
                    if begin==0 & val1==min(res(o-2-iij-1),res(o-2-iij)) & val2==max(res(o-2-iij-1),res(o-2-iij))
                        fprintf('(x=%d ,y=%d) is rejected because   :\n',res(o-2-iij-1),res(o-2-iij));
                    end
                    fprintf(fid,'(x=%d ,y=%d) is rejected because   :\n',res(o-2-iij-1),res(o-2-iij));
                    if ress(o-2-iij)==0
                        if ress(o-2-iij-1)==1000
                            if begin==0 & val1==min(res(o-2-iij-1),res(o-2-iij)) & val2==max(res(o-2-iij-1),res(o-2-iij))
                                fprintf('x+y = %d bigger than 100 \n\n\n',res(o-2-iij-1)+res(o-2-iij));
                                break;
                            end
                        fprintf(fid,'x+y = %d bigger than 100 \n\n\n',res(o-2-iij-1)+res(o-2-iij));
                        else
                            if begin==0 & val1==min(res(o-2-iij-1),res(o-2-iij)) & val2==max(res(o-2-iij-1),res(o-2-iij))
                                if res(o-2-iij)==ress(o-3-iij) | res(o-3-iij)==ress(o-2-iij-1)
                                fprintf('%d and %d are primes \nthe proctor wudnt say  "I cannot determine the two numbers."!\n\n',ress(o-2-iij-1),res(o-2-iij-1)+res(o-2-iij)-ress(o-3-iij));
                                else
                                fprintf('x+y-k = %d and k = %d primes \nthe summer wudnt say  "I knew that."!\n\n',ress(o-2-iij-1),res(o-2-iij-1)+res(o-2-iij)-ress(o-3-iij));
                                end
                                break;
                            end
                        if res(o-2-iij)==ress(o-3-iij) | res(o-3-iij)==ress(o-2-iij-1)
                                fprintf(fid,'%d and %d are primes \nthe proctor wudnt say  "I cannot determine the two numbers."!\n\n',ress(o-2-iij-1),res(o-2-iij-1)+res(o-2-iij)-ress(o-3-iij));
                        else
                                fprintf(fid,'x+y-k = %d and k = %d primes \nthe summer wudnt say  "I knew that."!\n\n',ress(o-2-iij-1),res(o-2-iij-1)+res(o-2-iij)-ress(o-3-iij));
                        end
                        end
                    else
                        if ress(o-2-iij-1)+ress(o-2-iij)==res(o-2-iij-1)+res(o-2-iij)
                            if begin==0 & val1==min(res(o-2-iij-1),res(o-2-iij)) & val2==max(res(o-2-iij-1),res(o-2-iij))
                                fprintf('it exists a prime number k=%d where (x+y-k)*k = %d*%d =%d  bigger than 100 \nthe summer wudnt say  "I knew that."!\n\n',min(ress(o-2-iij-1),ress(o-2-iij)),res(o-2-iij-1)+res(o-2-iij)-min(ress(o-2-iij-1),ress(o-2-iij)),min(ress(o-2-iij-1),ress(o-2-iij)),ress(o-2-iij-1)*ress(o-2-iij));
                                break;
                            end
                        fprintf(fid,'it exists a prime number k=%d where (x+y-k)*k = %d*%d =%d  bigger than 100 \nthe summer wudnt say  "I knew that."!\n\n',min(ress(o-2-iij-1),ress(o-2-iij)),res(o-2-iij-1)+res(o-2-iij)-min(ress(o-2-iij-1),ress(o-2-iij)),min(ress(o-2-iij-1),ress(o-2-iij)),ress(o-2-iij-1)*ress(o-2-iij));
                        else
                            if begin==0 & val1==min(res(o-2-iij-1),res(o-2-iij)) & val2==max(res(o-2-iij-1),res(o-2-iij))
                                fprintf('it exists a number n=%d , where the smallest prime number k=%d < n verifies (x+y-n)*k = %d*%d = %d  bigger than 100 \nthe summer wudnt say  "I knew that."!\n\n',res(o-2-iij-1)+res(o-2-iij)-max(ress(o-2-iij-1),ress(o-2-iij)),min(ress(o-2-iij-1),ress(o-2-iij)),max(ress(o-2-iij-1),ress(o-2-iij)),min(ress(o-2-iij-1),ress(o-2-iij)),ress(o-2-iij-1)*ress(o-2-iij));
                                break;
                            end
                        fprintf(fid,'it exists a number n=%d , where the smallest prime number k=%d < n verifies (x+y-n)*k = %d*%d = %d  bigger than 100 \nthe summer wudnt say  "I knew that."!\n\n',res(o-2-iij-1)+res(o-2-iij)-max(ress(o-2-iij-1),ress(o-2-iij)),min(ress(o-2-iij-1),ress(o-2-iij)),max(ress(o-2-iij-1),ress(o-2-iij)),min(ress(o-2-iij-1),ress(o-2-iij)),ress(o-2-iij-1)*ress(o-2-iij));
                        end
                    end
                end

            end
            if feu~=1
                rest(oo)=nb1;rest(oo+1)=nb2;oo=oo+2;
                for iij= 0:2:oo-3
                    if (nb1==rest(oo-2-iij) & nb2==rest(oo-iij-1))|(nb2==rest(oo-2-iij) & nb1==rest(oo-iij-1))
                    else
                        if (nb1-rest(oo-2-iij)==rest(oo-1-iij)-nb1 | nb2-rest(oo-1-iij)==rest(oo-2-iij)-nb1 )
                            if begin==0 & ( (val1==min(rest(oo-iij-1),rest(oo-2-iij)) & val2==max(rest(oo-iij-1),rest(oo-2-iij))) | (val1==min(nb1,nb2) & val2==max(nb1,nb2)) )
                                fprintf('(x=%d ,y=%d) and (x0=%d ,y0=%d )  where x-x0 = y0-y = %d are rejected because they both verify conditions \nthe summer wouldnt say "So can I."!\n\n',nb1,nb2,rest(oo-iij-1),rest(oo-2-iij),nb1-rest(oo-iij-1));
                                break;
                            end
                            fprintf(fid,'(x=%d ,y=%d) and (x0=%d ,y0=%d )  where x-x0 = y0-y = %d are rejected because they both verify conditions \nthe summer wouldnt say "So can I."!\n\n',nb1,nb2,rest(oo-iij-1),rest(oo-2-iij),nb1-rest(oo-iij-1));
                            break;
                        end
                    end
                end
            end
        end
    end
    for ij= 2:2:oo-5
        nb1=rest(oo-ij);nb2=rest(oo-ij+1);feu=1;
        for iij= ij:2:oo-3
            if (nb1-rest(oo-2-iij)==rest(oo-1-iij)-nb1 | nb2-rest(oo-1-iij)==rest(oo-2-iij)-nb1 )
                feu=0;rest(oo-iij-1)=0;rest(oo-2-iij)=0;
            end
        end
        if feu==0
            rest(oo-ij)=0;rest(oo-ij+1)=0;
        end
    end
    if begin==1
        for ij= 2:2:oo-5
            nb1=rest(oo-ij);nb2=rest(oo-ij+1);
            if nb1~=0 & nb2~=0
                fprintf('numbers searched for are :\n\n');
                nb1
                nb2
                break;
            end
        end
        begin=0;
    end
    fclose(fid);
end
