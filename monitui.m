clear
clc

%���ɳ�ʼ��
sol_new2=1;%��1����ռ䣨��ʼ�⣩
sol_new1=2-sol_new2^2;
sol_current1 = sol_new1; 
sol_best1 = sol_new1;
sol_current2 = sol_new2; 
sol_best2 = sol_new2;
E_current = inf;
E_best = inf;

rand('state',sum(clock)); %��ʼ�������������
t=90; %��ʼ�¶�
tf=89.9; %�����¶�
a = 0.99; %�¶��½�����

while t>=tf%��7����������
    for r=1:1000 %�˻����
        
        %��������Ŷ���3���½�Ĳ���
        sol_new2=sol_new2+rand*0.2;
        sol_new1=2-sol_new2^2;
        
        %����Ƿ�����Լ��
        if sol_new1^2-sol_new2>=0 && -sol_new1-sol_new2^2+2==0 && sol_new1>=0 &&sol_new2>=0
        else
            sol_new2=rand*2;
            sol_new1=2-sol_new2^2;
            continue;
        end
        
        %�˻����
        E_new=sol_new1^2+sol_new2^2+8;%��2��Ŀ�꺯��
        if E_new<E_current%��5������׼��
                E_current=E_new;
                sol_current1=sol_new1;
                sol_current2=sol_new2;
                if E_new<E_best
                    %����ȴ��������õĽⱣ������
                    E_best=E_new;
                    sol_best1=sol_new1;
                    sol_best2=sol_new2;
                end
        else
                if rand<exp(-(E_new-E_current)/t)%��4�����ۺ�����
                    E_current=E_new;
                    sol_current1=sol_new1;
                    sol_current2=sol_new2;
                else
                    sol_new1=sol_current1;
                    sol_new2=sol_current2;
                end
        end
        plot(r,E_best,'*')
        hold on
    end
    t=t*a;%��6������
end

disp('���Ž�Ϊ��')
disp(sol_best1)
disp(sol_best2)
disp('Ŀ�����ʽ����Сֵ���ڣ�')
disp(E_best)