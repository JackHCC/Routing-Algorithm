clc;clear;
n=6;   %���þ����С
temp=1;  %������ʼ��
m=zeros(6);%����n�������
m(1,2)=1;m(1,6)=2;%���þ����з���������ֵ
m(2,1)=1;m(2,3)=4;m(2,6)=4;
m(3,2)=4;m(3,4)=2;m(3,6)=1;
m(4,3)=2;m(4,5)=3;m(4,6)=3;
m(5,4)=3;m(5,6)=5;
m(6,1)=2;m(6,2)=4;m(6,3)=1;m(6,4)=3;m(6,5)=5;

for i=1:n
    for j=1:n
       if(m(i,j)==0)
           m(i,j)=inf;
       end
    end
end
for i=1:n
    m(i,i)=0;
end
pb(1:length(m))=0;pb(temp)=1;%������·���ĵ�Ϊ1��δ�����Ϊ0
d(1:length(m))=0;%��Ÿ������̾���
path(1:length(m))=0;%��Ÿ������·������һ����
while sum(pb)<n %�ж�ÿһ���Ƿ����ҵ����·��
 tb=find(pb==0);%�ҵ���δ�ҵ����·���ĵ�
 fb=find(pb);%�ҳ����ҵ����·���ĵ�
 min=inf;
 for i=1:length(fb)
     for j=1:length(tb)
         plus=d(fb(i))+m(fb(i),tb(j));  %�Ƚ���ȷ���ĵ���������δȷ����ľ���
         if((d(fb(i))+m(fb(i),tb(j)))<min)
             min=d(fb(i))+m(fb(i),tb(j));
             lastpoint=fb(i);
             newpoint=tb(j);
         end
     end
 end
 d(newpoint)=min;
 pb(newpoint)=1;
 path(newpoint)=lastpoint; %��Сֵʱ����֮���ӵ�
end

d
path
