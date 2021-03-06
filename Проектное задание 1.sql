--��� �������� � ���������� ������

CREATE TABLE Operations(���� data, ������������ VARCHAR (355) , �������� VARCHAR (355), ��������_������� VARCHAR (355));

INSERT INTO Operations VALUES 
('27-08-45','�7','�3','5�'),
('27-08-45','�4','�2','2�'),
('27-08-45','�6','�2','2�'),
('27-08-45','�7','�2','6�'),
('27-08-45','�7','�2','4�'),
('28-08-45','�8','�1','1�'),
('28-08-45','�6','�2','4�'),
('28-08-45','�8','�2','6�'),
('28-08-45','�9','�1','1�'),
('28-08-45','�1','�1','3�'),
('28-08-45','�4','�3','7�'),
('29-08-45','�9','�2','6�'),
('30-08-45','�6','�2','2�'),
('31-08-45','�4','�3','7�'),
('01-09-45','�10','�3','7�'),
('01-09-45','�10','�3','5�'),
('01-09-45','�5','�2','4�'),
('01-09-45','�5','�1','1�'),
('01-09-45','�5','�1','1�'),
('01-09-45','�4','�2','4�'),
('01-09-45','�1','�2','2�'),
('01-09-45','�10','�2','6�'),
('01-09-45','�10','�1','1�');

CREATE TABLE nomenklature(������������ VARCHAR (355), ��������_1 VARCHAR (355) , ��������_2 VARCHAR (355), ��������� serial);
INSERT INTO nomenklature VALUES 
('�1','���','��������','100'),
('�2','���','����','200'),
('�3','���','�����������','300'),
('�4','���','������','100'),
('�5','���','�����','200'),
('�6','���','���������� ���','10'),
('�7','��������','����','400'),
('�8','��������','���� � �������','500'),
('�9','��������','������ ��������','400'),
('�10','��������','������ �������','400');


CREATE TABLE meneger(���_��������� VARCHAR (355), ��� VARCHAR (355) , ��� VARCHAR (355),����� VARCHAR (355), ���_�������� serial, ������������ VARCHAR (355));

INSERT INTO meneger VALUES  ('�1','�������� ����� ���������','�������','�������','2030','������'),
('�2','����������� ������ ������������','�������','�������','2027','����'),
('�1','�� �� ���','-','�����','2001','������'),
('�2','R2D2','-','�����','2041','���������'),
('�3','S3PO','-','�����','2030','������'),
('�2','��������� ��������� ������','�������','�������','1799','����'),
('�3','���� �����','�������','�������','1955','����'),
('�4','���� �����','������','�������','1955','����');


CREATE TABLE adress(���_���������_�������� VARCHAR (355), ����� VARCHAR (355));
INSERT INTO adress VALUES
('1�','����, ������� "������ ���������"'),
('2�','����, ������� "������ ���������"'),
('3�','����, ������� "������ ��������"'),
('4�','����, ������� "������ ��������"'),
('5�','�����, ������� "����������� � ���� ������"'),
('6�','������, ������� "������, ���� ������"'),
('7�','��������, ������� "�����"');




--2)�������

--2.1 
--���������� ����� ������� ����������� �� ���� 

select Operations.����, count(Operations.����) as �����_�������_��_���� from operations 
join adress on adress.���_���������_��������=Operations.��������_�������
group by Operations.���� ;



--2.2 
--����� � ������� �������� ������ �����

select meneger.�����, count(meneger.�����) as �����_�������_�_��������� from operations operations
join adress on adress.���_���������_��������=Operations.��������_�������
join meneger on meneger.���_��������� = Operations.��������
group by meneger.�����
order by count(meneger.�����) desc;


--2.3
--������� ������������ ���� �� ��������. 
--����� ��� ��������� ������������ ����� ������������ ������ �� �����, �� ��������� �������� �������� ����������� ������ �������� � ������. 

select adress.�����, meneger.�����, count(meneger.�����) as �����_�������_�_��������� from operations operations
join adress on adress.���_���������_��������=Operations.��������_�������
join meneger on meneger.���_��������� = Operations.��������
group by meneger.�����, adress.�����
order by count(meneger.�����) desc;


--2.4 

--������� ��������� ������� �� ������ �������� ��������������� 

select nomenklature.��������_1, avg(nomenklature.���������) as �������_��������� from operations operations
join adress on adress.���_���������_��������=Operations.��������_�������
join nomenklature on nomenklature.������������= Operations.������������
group by nomenklature.��������_1
order by avg(nomenklature.���������) desc;

--2.5 

--������� �� ����� ������� ������� �������� ���������. 

Select �����, count(���_���������_��������) as �����_��������_���������_��_������� 
from adress
group by �����
order by count(���_���������_��������) desc;

--2.6 

-������� ������� ��� ��������� �������� ���������

Select �����, count(���_���������_��������) as �����_��������_���������_��_������� 
from adress
group by �����
having count(���_���������_��������)> 1
order by count(���_���������_��������) desc;

--2.7

--������ ���������� �� ����� ��������� ���� ��������� ���������� ������

Select (max(����)-min(����)) as �����_����_��_�������_���������_���������� from operations;


--2.8 

--������ ���������� ������� ���������� �������� 

Select count(distinct(���) as �����_���������� from meneger;


--2.9 

--������ ���������� ������� ����� ���� ������� ������� ������

select nomenklature.��������_2, count(nomenklature.��������_2) as �����_������� from operations
join nomenklature on nomenklature.������������= Operations.������������
group by nomenklature.��������_2
order by count(nomenklature.��������_2) desc;

--2.10

--���������� ��� ������� �� �������.


select nomenklature.��������_2, sum(nomenklature.���������) as �����_������� from operations
join nomenklature on nomenklature.������������= Operations.������������
group by nomenklature.��������_2
order by sum(nomenklature.���������) desc;


--3. ������� ������������� View

--3.1 ������ ������������� ������ �������� � ������ ������

CREATE VIEW People as 
select * from operations
join meneger on meneger.���_��������� = Operations.��������
where meneger.����� = '�������';

--3.2 ������ ������������� ���������� ������� ������ ��������� � �������������� ����

CREATE VIEW clasic as 
select * from operations
join meneger on meneger.���_��������� = Operations.��������
where meneger.������������= '����';

--��������� � ��������� ������ Anaconda prompt
--������������� ���������� psycopg2 c ������� �������:
--conda install -c anaconda psycopg2 




