clc;clear;
n=6;   %设置矩阵大小
temp=1;  %设置起始点
m=zeros(6);%定义n阶零矩阵
m(1,2)=1;m(1,6)=2;%设置矩阵中非零非无穷的值
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
pb(1:length(m))=0;pb(temp)=1;%求出最短路径的点为1，未求出的为0
d(1:length(m))=0;%存放各点的最短距离
path(1:length(m))=0;%存放各点最短路径的上一点标号
while sum(pb)<n %判断每一点是否都已找到最短路径
 tb=find(pb==0);%找到还未找到最短路径的点
 fb=find(pb);%找出已找到最短路径的点
 min=inf;
 for i=1:length(fb)
     for j=1:length(tb)
         plus=d(fb(i))+m(fb(i),tb(j));  %比较已确定的点与其相邻未确定点的距离
         if((d(fb(i))+m(fb(i),tb(j)))<min)
             min=d(fb(i))+m(fb(i),tb(j));
             lastpoint=fb(i);
             newpoint=tb(j);
         end
     end
 end
 d(newpoint)=min;
 pb(newpoint)=1;
 path(newpoint)=lastpoint; %最小值时的与之连接点
end

d
path
