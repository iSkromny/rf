----------------
-- ����� =parameters[1]
local gmode = 1 

-- ����� ����� =parameters[2]
local aixp = 500

-- ������ ����� =parameters[3]
local aitowns = 1

-- ����������� ��������� =parameters[4]
local kef = 100

-- ������� =parameters[5]
local brd = 1

----------------
-- ����������� �������� ���� ��������� �� ��������� [��������� = 1.05 �� ������ 1]
local kr = 1.05

-- ��� ������� �����
local taitwn = { }
local ltwn = 1
-- �������� �� ���� ������������� ������
local isai = false
-- �������� �� �������������� ������ ������������� ������
local isaitwn = false 

-- ��� ���� ������/������
local tmrnd = math.random(0,1)

-- ��������� � ������: ��� ������ ��������� ������ ��� ���
function getScenarioVariables()
	return {
		{
			name = 'ENABLE_CUSTOM_PVP_MOD_UCHENIK',
			value = 1,
		},		
		{
			name = 'EMPIRE_AI_RANGECHEAT',
			value = 1,
		},
		{
			name = 'CLANS_AI_RANGECHEAT',
			value = 1,
		},
		{
			name = 'HORDES_AI_RANGECHEAT',
			value = 1,
		},
		{
			name = 'LEGIONS_AI_RANGECHEAT',
			value = 1,
		},
		{
			name = 'ELVES_AI_RANGECHEAT',
			value = 1,
		},
	}
end
	
----------------
-- �������� � ��������

-- �������� �������
local tntwn = {
'���������',
'���������',
'��������',
'���������',
'����������',
'������������'
}

-- �������� ����
local tnrns = {
'���� � ����������',
'������ � ��������',
'���� ������',
'���� �����'
}

-- �������� ����� 
local tnmch = {
'����� �������',
'��������� ������',
'����������� �������',
'����� ������'
}
-- �������� ����� 
local tdmch = {
'��� ����� �������� ��� ��� � �������� ������� ����� ������.',
'��������� � �� ������.',
'��������� �������� �����, �����, ������ � ������ �������� ��� ������ ������������. ���� ������ � ���� ���� ����������.',
'� ��� �������� ��������!'
}

-- �������� ������� ��������
local tnmcn = {
'������ ������',
'������ �������',
'������ �������'
}
-- �������� ������� ��������
local tdmcn = {
'��� ����� � ������ ������� ����� ������ ������� ��� �� ��������� �����.',
'��� ����� ������ ���� ������� ����, ����� ���� ������?',
'��������, ������� ������� � ��������.'
}

-- �������� ����� �����
local tnmg = {
'����� ������',
'����� ������ �����'

}
-- �������� ����� �����
local tdmg = {
'� ������� ��� ���������� �� ����� ����������. ���������, ����� �� ������ ������� �����. ������ ��� � ����������� ��������.',
'����� ��������� ���� ���������� � ����, ���� ����� ����� ������� � ����?'
}

-- �������� ������� 
local tntrn = {
'������ ������',
'������� ������',
'������ �����������'
}
-- �������� �������
local tdtrn = {
'�� ���� ������, ��� �������, ��� ����� ������������� �� ���� �� �����. ������ ������� � ���� � ������ �������� ���� ������.',
'������ ���� ����������? � �� ������.',
'���� �� ���������� �����, � ����� ��� ������'
}

-- �������� ����� ��������
local tnmrk = {
'�������� ����'
}

-- �������� ����� ��������
local tdmrk = {
'����������� ������, �������!'
}


----------------

-- �����
-- 200x15 ����� ��������������� / ����� ������������ / ����� ����������� / ������� �������� / ������� ������������� / ������� ������� ���� / ������� �������� / ������� ��������� �����
local td15 = {'g001ig0786', 'g001ig0787', 'g001ig0560', 'g001ig0333', 'g001ig0791', 'g001ig0792', 'g001ig0793', 'g001ig0794'} 
local td15_0 = { }
-- 200x5 ������� ������ / ������� �������� / ������� �������� / ������� ������� / ����� ����������� ������� 250
local tb15 = {'g000ig0002', 'g000ig0011', 'g000ig0008', 'g000ig0014', 'g001ig0547'} 
local tb15_0 = { }
-- 400x4 ������� ������ �� ����� ���� / .. ������� / .. ����� / .. ����
local tw15 = {'g000ig0022', 'g000ig0021', 'g000ig0023', 'g000ig0024'} 
local tw15_0 = { }
-- 425x9 ������� ������ �� ������ 400 / .. ������ 400 / ������� ��������� ���� +50�� 325 / ����� ������������� ���� (�� ����.����) 325 / ����� ������������ +25%�� 400 / ����� �������� ������ (�� ����������) 425 / ����� ���������� (�� ���������) 500 / ����� ����������� ���� (�� ���������) 375 / ����� ���������� (�� ��������) 300
local te4 = {'g001ig0125', 'g001ig0036', 'g001ig0127', 'g001ig0709', 'g001ig0490', 'g001ig0711', 'g001ig0712', 'g001ig0710', 'g001ig0708'} 
local te4_0 = { }
-- 450x4 ������� ������� / ������� ���� / ������� �������� / ������� �������� 
local tb30 = {'g000ig0003', 'g000ig0015', 'g000ig0012', 'g000ig0009'} 
local tb30_0 = { }
-- 500x4 ����� �������� / ����� ��������� ����� / ����� ��������� ����� (���� ����.�����) 600 / ������� ������ �� ������ 800 
local te5 = {'g001ig0562', 'g001ig0491', 'g001ig0355', 'g001ig0128'} 
local te5_0 = { }

-- ����� 
-- 100x5 �������� ���� ��� / .. ����� / .. ������� �������� / .. ��� / .. ������ (�� ���������)
local tcry1 = {'g000ig9005', 'g000ig9002', 'g000ig9015', 'g000ig9003', 'g000ig9010'} 
local tcry1_0 = { }
-- 125-125 / ����� �������� -15 ����� / ���������� ����� / ����� ����� / ����� ���� / ����� ���� / ����� ��� / ����� �������� ���� / ����� ����� / .. ��������� / .. ���������� ��������� / .. ���������� ������� / .. ��������� ���� / .. ������ / .. ������ / .. ����� (35��)
local torb1 = {'g000ig9013', 'g001ig0650', 'g001ig0302', 'g001ig0300', 'g001ig0303', 'g001ig0304', 'g001ig0301', 'g001ig0299', 'g001ig0189', 'g001ig0192', 'g001ig0191', 'g001ig0187', 'g001ig0188', 'g001ig0190', 'g000ig9034'} 
local torb1_0 = { }
-- 126-225
local torb2 = {'g001ig0476', 'g001ig0471', 'g000ig9031', 'g001ig0470', 'g001ig0458', 'g000ig9029', 'g001ig0466', 'g001ig0489', 'g001ig0469', 'g000ig9022', 'g001ig0468', 'g001ig0467', 'g000ig9033', 'g001ig0651'} 
local torb2_0 = { }
-- 226-300 
local torb3 = {'g000ig9024', 'g000ig9017', 'g001ig0474', 'g000ig9027', 'g001ig0724', 'g001ig0456', 'g001ig0459', 'g001ig0457', 'g001ig0475', 'g001ig0178', 'g001ig0176', 'g001ig0461', 'g001ig0177', 'g001ig0453', 'g000ig9036', 'g001ig0477'} 
local torb3_0 = { }
-- 301-450�1 ��� ����� ������ �� ������ 450
local torb4 = {'g001ig0294', 'g001ig0297', 'g001ig0472', 'g001ig0473', 'g000ig9019', 'g000ig9007', 'g001ig0056', 'g001ig0054', 'g001ig0055', 'g001ig0053', 'g001ig0058', 'g001ig0057', 'g001ig0452', 'g001ig0464', 'g000ig9016', 'g001ig0446', 'g001ig0295', 'g001ig0496', 'g001ig0653', 'g001ig0448', 'g001ig0061'} 
local torb4_0 = { }
-- 450�2-600_����� �������� + ����� ���������� 450 (������ 6) + 60 ����� ������ (7,8,9) + ������ (10)
local torb5 = {'g001ig0134', 'g001ig0132', 'g001ig0133', 'g001ig0131', 'g001ig0137', 'g001ig0135', 'g000ig9028', 'g001ig0731', 'g001ig0732', 'g001ig0181', 'g001ig0454', 'g001ig0462', 'g000ig9011', 'g001ig0444', 'g001ig0450', 'g000ig9042', 'g001ig0157', 'g001ig0183', 'g001ig0443'} 
local torb5_0 = { }
-- 600�2-750 + 75 ����� ������ 600 (������ 4) + ����� ��������� ���������� +100���_����� 825 (5) + ����� ������ �� ������ 875 (6) + ����� ���������� ����� -75������ 1000 (7) + ����� ����������� 75���_������ (8) + ����� ��������� ���������� 100���_����� 825 (9)
local torb6 = {'g000ig9023', 'g000ig9030', 'g000ig9032', 'g000ig9001', 'g001ig0455', 'g001ig0059', 'g000ig9026', 'g000ig9018', 'g001ig0451', 'g001ig0725', 'g001ig0479', 'g001ig0654', 'g001ig0478', 'g001ig0480', 'g001ig0441', 'g001ig0465', 'g001ig0062', 'g001ig0652', 'g000ig9043'} 
local torb6_0 = { }
-- 751-1250 ����� ����� -50%���_����� 1825 + ����� ���������� (� �����) 1350 + ����� ������� 35����_�_����� 1275 + ����� ���������� ����� 50��_�_����� 1875  + ����� �������� -33%����_����� 2075 + ����� ������ 35�����_�_����� 1275 + ����� ������� +25����_����� 1675 (������ 7)
local torbx1 = {'g000ig9014', 'g001ig0296', 'g000ig9041', 'g000ig9012', 'g000ig9008', 'g000ig9038', 'g000ig9020', 'g001ig0613', 'g001ig0455', 'g000ig9025', 'g000ig9040', 'g001ig0449', 'g001ig0447', 'g001ig0136', 'g000ig9004'} 
local torbx1_0 = { }
-- 1251-6100 + ����� ����� 850 + ����� �������� ��� 850 + ����� ����� ��� 1225 � �������� ������ (������ 3) � ������ ����� ����...
local torbx2 = {'g001ig0463', 'g001ig0460', 'g001ig0442', 'g000ig9004', 'g001ig0445', 'g001ig0305', 'g001ig0729', 'g001ig0730', 'g001ig0203', 'g000ig9006', 'g000ig9009', 'g000ig9021', 'g000ig9039'} 
local torbx2_0 = { }

--������
-- 100-125
local tscr1 = {'g000ig5043', 'g001ig0407', 'g000ig5047', 'g000ig5042', 'g000ig5041', 'g000ig5044', 'g000ig5045', 'g000ig5024', 'g000ig5002', 'g000ig5097', 'g000ig5021', 'g000ig5004', 'g000ig5062', 'g000ig5027', 'g001ig0247', 'g001ig0195', 
			   'g000ig5025', 'g000ig5061', 'g000ig5098', 'g000ig5065', 'g000ig5023', 'g000ig5003', 'g000ig5064', 'g000ig5106', 'g000ig5063', 'g000ig5120', 'g000ig5107', 'g001ig0250', 'g000ig5101', 'g000ig5068', 'g001ig0248', 'g000ig5022'} 
local tscr1_0 = { }
-- 150-200
local tscr2 = {'g000ig5050', 'g000ig5049', 'g000ig5052', 'g000ig5048', 'g000ig5059', 'g000ig5046', 'g001ig0254', 'g000ig5030', 'g000ig5119', 'g001ig0091', 'g000ig5026', 'g001ig0092', 'g000ig5009', 'g000ig5007', 'g000ig5070', 'g000ig5028', 'g000ig5102', 
			   'g001ig0256', 'g000ig5104', 'g001ig0117', 'g000ig5008', 'g000ig5066', 'g000ig5103', 'g001ig0253', 'g000ig5069', 'g001ig0492', 'g000ig5029', 'g001ig0072', 'g001ig0252', 'g001ig0255', 'g001ig0702', 'g000ig5074', 'g000ig5105', 'g000ig5067'} 
local tscr2_0 = { }
-- 225-299 + ������ �� ������ � ����� 200 (������ 7) � "��������� ������" � "����������� ������" 300 (���� 2) ��� �� ������ �� ������
local tscr3 = {'g000ig5005', 'g000ig5001', 'g000ig5010', 'g000ig5016', 'g000ig5011', 'g001ig0251', 'g001ig0249', 'g001ig0095', 'g001ig0103', 'g001ig0577', 'g001ig0093', 'g001ig0571', 'g001ig0568', 'g001ig0084',
			   'g000ig5018', 'g000ig5110', 'g001ig0194', 'g001ig0580', 'g001ig0569', 'g001ig0576', 'g001ig0578', 'g001ig0123', 'g001ig0573', 'g001ig0574', 'g000ig5093', 'g001ig0579', 'g000ig5081'} 
local tscr3_0 = { }
-- 300-399 + "������ �����", "������ ����", "������������� ������", "����������", "�������", "������������� ������" 275 (������ 6)
local tscr4 = {'g000ig5012', 'g000ig5013', 'g000ig5034', 'g000ig5111', 'g000ig5114', 'g000ig5073', 'g000ig5054', 'g000ig5082', 'g000ig5085', 'g001ig0703', 'g000ig5109', 'g000ig5033',
			   'g001ig0698', 'g000ig5014', 'g000ig5072', 'g001ig0094', 'g001ig0085', 'g001ig0701', 'g001ig0704', 'g001ig0193', 'g001ig0076', 'g001ig0075', 'g001ig0074', 'g001ig0077'} 
local tscr4_0 = { }
-- 400-599 + ������� ������ �� 600, ������ 750 (������ 6) ��� �4 ����!
local tscr5 = {'g001ig0160', 'g001ig0159', 'g001ig0161', 'g001ig0163', 'g001ig0162', 'g001ig0164', 'g000ig5090', 'g000ig5089', 'g000ig5057', 'g000ig5056', 'g000ig5116', 'g000ig5020',
			   'g000ig5037', 'g000ig5086', 'g001ig0706', 'g000ig5112', 'g001ig0705', 'g000ig5077', 'g000ig5113', 'g001ig0699', 'g000ig5031', 'g000ig5071', 'g000ig5108', 'g001ig0697'} 
local tscr5_0 = { }
-- 600-799 + �� ����� 33% 575 + ������ �� ������ 400 + ������������� 525 (������ 10) + ���� ��� 800 (���������) + ��� �5 ����!!
local tscr6 = {'g000ig5091', 'g000ig5055', 'g000ig5036', 'g000ig5076', 'g000ig5079', 'g000ig5039', 'g000ig5017', 'g000ig5115', 'g000ig5035', 'g000ig5075',
			   'g000ig5060', 'g000ig5019', 'g000ig5118', 'g000ig5080', 'g001ig0586', 'g000ig5015', 'g001ig0078', 'g000ig5095', 'g000ig5096', 'g000ig5083'} 
local tscr6_0 = { }

-- �������������
-- 250 ����� ���
local tmana1 = {'g001ig0481','g001ig0485','g001ig0482','g001ig0483','g001ig0484'}
local tmana1_0 = { }
-- 500 ���
local tmana2 = {'g001ig0146','g001ig0150','g001ig0147','g001ig0148','g001ig0149'}
local tmana2_0 = { }
-- 1000 ������� ��� + ����� ��� ����������
local tmana3 = {'g001ig0277','g001ig0281','g001ig0278','g001ig0279','g001ig0280','g001ig0486'}
local tmana3_0 = { }
-- 1500 ��������
local tmana4 = {'g001ig0283','g001ig0287','g001ig0284','g001ig0285','g001ig0286',}
local tmana4_0 = { }

--�����
-- 200-350 �1 ����� ������ / ����� ��������� / ���� �����������
local tp0r = {'g001ig0083','g001ig0532','g001ig0026'} 
local tp0r_0 = { }
-- 300-600 [������+�����5] "���� ��������" (���) / "���� �����" (-10 ���) ����� ������ ����� (+2 ����) / ������� ������� ����������� (-75���) / "������ ����" (���.����) / "����� ���������" (-10 ����) / ����� �������� / ������� ����������������� + �����5% 
local tp1r = {'g001ig0501', 'g001ig0520', 'g001ig0533', 'g001ig0534', 'g001ig0505', 'g001ig0519', 'g001ig0514', 'g001ig0561', 'g001ig0315', 'g001ig0307', 'g001ig0309', 'g001ig0313', 'g001ig0311', 'g001ig0317'} 
local tp1r_0 = { }
-- 600x7 [�����!] "������� ����" (������) / ����� ����������� (����) / ����� ���������� (�����) / ����� ���������� (������) / ����� ����� (������) / ������� ���������� ���� / ������� �������� (����) 
local tp2p = {'g001ig0528', 'g001ig0524', 'g001ig0526', 'g001ig0527', 'g001ig0531', 'g001ig0529', 'g001ig0525'} 
local tp2p_0 = { }
-- 600-750 [�����10! + �����-����� �� ������750]  ������� �������������� (+10 ��������) / ������� ���������� (+10% ��) / ������� ���� (+10 ����) / ������� ������������ (+10 ���) / ������� ��������� (+10 �����) + "����� ������" (������) / ����� ����������� (-10����) / / ����� ���������� ������ (-10����)
local tp3s = {'g000ig0010', 'g000ig0007', 'g000ig0016', 'g000ig0013', 'g000ig0004', 'g001ig0503', 'g001ig0517', 'g001ig0516','g001ig0320', 'g001ig0325', 'g001ig0326', 'g001ig0323', 'g001ig0322', 'g001ig0321'} 
local tp3s_0 = { }
-- 800-900 [������ + �����5���] ����� ����� (+10 ����) + ����� ������ (���������) / ����� ������������� (��������) / ����� ��������� (��.����) / ����� ������������ (-20����)
local tp4r = {'g001ig0548', 'g001ig0034', 'g001ig0511', 'g001ig0536', 'g001ig0598', 'g001ig0521','g001ig0551', 'g001ig0553', 'g001ig0554', 'g001ig0552'} 
local tp4r_0 = { }
-- 1000+ [�����15 + ������] + ������� ������ ���������1175 (+45 �����) + ����� ����������1800 (�� �����) / ����� ��������� ����1500 (�� ������)
local tp5s = {'g001ig0377', 'g001ig0356', 'g001ig0324', 'g001ig0308', 'g001ig0316', 'g001ig0314', 'g001ig0310', 'g001ig0312', 'g001ig0599', 'g001ig0522', 'g001ig0600', 'g001ig0537', 'g001ig0565', 'g001ig0035'} 
local tp5s_0 = { }

-- 400 �2 [�����-����� �� �������������] 
local tpzm = {'g001ig0354', 'g001ig0334', 'g001ig0352', 'g001ig0348', 'g001ig0346', 'g001ig0344', 'g001ig0350'} 
local tpzm_0 = { }
-- 400 [�����-����� �� ����� + �� ��������] 
local tpzd = {'g001ig0332', 'g001ig0328', 'g001ig0330', 'g001ig0338', 'g001ig0342', 'g001ig0340', 'g001ig0336'} 
local tpzd_0 = { }

-- 325 [�����_�����]
local tp3m = {'g001ig0027', 'g001ig0028', 'g001ig0029', 'g001ig0030', 'g001ig0031'} 
local tp3m_0 = { }
-- 525 [�����_�����]
local tp5m = {'g001ig0025', 'g001ig0024', 'g001ig0022', 'g001ig0021', 'g001ig0023'} 
local tp5m_0 = { }
-- 700-800 [�����_�����]
local tp7m = {'g001ig0563', 'g001ig0564', 'g001ig0583', 'g001ig0009', 'g001ig0011', 'g001ig0012', 'g001ig0013', 'g001ig0014', 'g001ig0015'} 
local tp7m_0 = { }

-- 2000-3000 [����� ����] ��� ���� �5_144 
local tpxr = {'g001ig0523', 'g001ig0752', 'g001ig0538', 'g001ig0723'} 
local tpxr_0 = { }

-- 400 [������] ��� ���� �1_144 / ����� �������� ���� (+5����) / ������� ����������� (+15%�����) / ����� ���� ��������� ����600 / ���� �������� ���� / ���� �������������
local tpxs = {'g001ig0513', 'g001ig0130', 'g001ig0033', 'g001ig0662', 'g001ig0661'} 
local tpxs_0 = { }

--������
--300 
local twand1  = {'g000ig6001', 'g001ig0384', 'g000ig6019', 'g001ig0385', 'g000ig6002', 'g001ig0383', 'g001ig0386', 'g001ig0387', 'g000ig6006', 'g001ig0379'} 
local twand1_0 = { }
--375 
local twand2 = {'g000ig6012', 'g001ig0381', 'g001ig0397', 'g001ig0395', 'g001ig0405', 'g001ig0402', 'g001ig0396', 'g001ig0399', 'g001ig0394'} 
local twand2_0 = { }
--450-525 ��� 30 ����� + ����� ����750
local twand3 = {'g001ig0392', 'g001ig0382', 'g001ig0391', 'g001ig0118', 'g001ig0406', 'g000ig6007', 'g000ig6003', 'g001ig0400', 'g001ig0122', 'g001ig0119', 'g001ig0121', 'g001ig0120','g001ig0097'} 
local twand3_0 = { }
--600 +15%
local twand4 = {'g001ig0380', 'g000ig6013', 'g000ig6021', 'g001ig0403', 'g001ig0404', 'g001ig0401', 'g001ig0398'} 
local twand4_0 = { }
--750-900 ��� 15 �� �����
local twand5 = {'g000ig6020', 'g000ig6015', 'g001ig0096', 'g000ig6014', 'g001ig0393', 'g001ig0098', 'g000ig6011'} 
local twand5_0 = { }
--1125-
local twand6 = {'g000ig6016', 'g001ig0388', 'g000ig6010', 'g000ig6009', 'g001ig0664'} 
local twand6_0 = { }

--���������
--300-375 + ����� 475
local ttal1 = {'g001ig0260', 'g001ig0267', 'g001ig0273', 'g001ig0265', 'g001ig0269', 'g001ig0266', 'g001ig0264', 'g001ig0261', 'g001ig0268', 'g000ig9101', 'g001ig0272', 'g001ig0257', 'g001ig0271'} 
local ttal1_0 = { }
--600- ���� �1 + ��������� �2 + ����� + ������1450 + ����.���. ���� ������� 1550
local ttal2 = {'g001ig0082', 'g001ig0270', 'g000ig9107', 'g001ig0262', 'g000ig9114', 'g001ig0258', 'g000ig9113', 'g001ig0263'} 
local ttal2_0 = { }
--1000-1375 �������� + ���� �2 + ������ ('g001ig0275', 'g001ig0276' ����� �����������������, ������ ��������� - �������� �� ����� �������)
local ttal3 = {'g001ig0274', 'g001ig0306', 'g001ig0063', 'g001ig0298', 'g000ig9121'} 
local ttal3_0 = { }
--1500- ���� �3 + ���� �2+ ��������� + ���� �4���� ('g001ig0259' �������� ������ ����� - �������� �� ����� �������)
local ttal4 = {'g000ig9124', 'g000ig9141', 'g000ig9138', 'g000ig9129', 'g000ig9115','g001ig0186','g001ig0184'} 
local ttal4_0 = { }
--2000-3025 ���� �3 + ���� ���� �4 + ������ �3 + ���� �4
local ttal5 = {'g000ig9126', 'g000ig9116', 'g001ig0064', 'g000ig9109', 'g000ig9127', 'g000ig9110', 'g000ig9125', 'g000ig9134', 'g000ig9102', 'g000ig9105', 'g000ig9108', 'g000ig9103'} 
local ttal5_0 = { }
--3200 �������� + ���� �4 + �������� �4
local ttal6 = {'g000ig9106', 'g001ig0067', 'g000ig9130', 'g000ig9037', 'g001ig0066', 'g001ig0201', 'g001ig0202', 'g000ig9120', 'g000ig9136', 'g000ig9131', 'g000ig9128', 'g000ig9133', 'g001ig0065'} 
local ttal6_0 = { }
-- 4000 ���� �4
local ttalx1 = {'g000ig9104', 'g000ig9118', 'g000ig9139', 'g000ig9111', 'g001ig0185', 'g000ig9112', 'g000ig9119', 'g001ig0068'} 
local ttalx1_0 = { }
-- 8000
local ttalx2 = {'g000ig9117', 'g000ig9135', 'g001ig0069', 'g001ig0070', 'g001ig0198', 'g001ig0199', 'g001ig0200'} 
local ttalx2_0 = { }

--������
--800 + ������ ��������400
local ttrav1 = {'g001ig0108', 'g001ig0110', 'g001ig0105', 'g001ig0107', 'g001ig0109', 'g001ig0106', 'g001ig0113', 'g000ig8003'} 
local ttrav1_0 = { }
--1200-1600
local ttrav2 = {'g001ig0111', 'g000ig1011', 'g000ig8004', 'g001ig0549', 'g001ig0114'} 
local ttrav2_0 = { }
--1750-2250
local ttrav3 = {'g001ig0115', 'g001ig0112', 'g001ig0550', 'g001ig0050', 'g001ig0606', 'g000ig8005', 'g000ig1010'} 
local ttrav3_0 = { }

--��������
--800-1150
local tjewel1 = {'g001ig0493', 'g001ig0497', 'g001ig0495', 'g001ig0494', 'g000ig4006', 'g000ig4008', 'g001ig0719'} 
local tjewel1_0 = { }
--1250-1500 + ����� �����900
local tjewel2 = {'g000ig4005', 'g000ig4002', 'g000ig4004', 'g001ig0428', 'g000ig3022', 'g000ig3008', 'g001ig0099', 'g001ig0601'} 
local tjewel2_0 = { }
--1501-1999 + ����� ��������_1400 + ������ �����2200 
local tjewel3 = {'g001ig0101', 'g001ig0104', 'g000ig4001', 'g001ig0422', 'g000ig4007', 'g001ig0429', 'g000ig2006', 'g001ig0539', 'g001ig0735', 'g001ig0421'} 
local tjewel3_0 = { }
--2000-2500
local tjewel4 = {'g001ig0420', 'g001ig0425', 'g000ig4003', 'g001ig0426', 'g001ig0423', 'g001ig0427', 'g001ig0610', 'g001ig0544', 'g000ig3020', 'g001ig0419'} 
local tjewel4_0 = { }
--2501-3300
local tjewel5 = {'g001ig0790', 'g001ig0545', 'g001ig0424', 'g001ig0660', 'g001ig0541', 'g001ig0540', 'g001ig0116', 'g001ig0038', 'g001ig0784', 'g001ig0156', 'g001ig0037'} 
local tjewel5_0 = { }
--3301-4750
local tjewel6 = {'g001ig0602', 'g001ig0597', 'g001ig0605', 'g000ig7010', 'g000ig3005', 'g001ig0543', 'g001ig0542', 'g001ig0430', 'g001ig0749'} 
local tjewel6_0 = { }

--������
--1000
local tban1 = {'g000ig1005', 'g001ig0051', 'g000ig1001', 'g001ig0142', 'g001ig0140', 'g001ig0141', 'g001ig0139', 'g001ig0145', 'g001ig0143', 'g000ig1007', 'g000ig1003'} 
local tban1_0 = { }
--1500-2000 5����!
local tban2 = {'g001ig0153', 'g001ig0498', 'g001ig0587', 'g001ig0500', 'g001ig0360'} 
local tban2_0 = { }
--3000 + ����� ������ �� ������2000 + ����� ������� ������3500 + ����� ��������3500 + ���� ������ �������3500
local tban3 = {'g001ig0144', 'g001ig0293', 'g000ig1004', 'g001ig0289', 'g001ig0357', 'g000ig1002', 'g000ig1006', 'g000ig1008', 'g001ig0292', 'g001ig0373', 'g001ig0375', 'g001ig0367'} 
local tban3_0 = { }
--3500 + ����� ������ ����4000
local tban4 = {'g001ig0371', 'g001ig0362', 'g001ig0364', 'g001ig0361', 'g001ig0370', 'g001ig0665', 'g001ig0363', 'g001ig0372', 'g001ig0369', 'g001ig0374', 'g001ig0365', 'g001ig0366', 'g001ig0588'} 
local tban4_0 = { }
--4000-5000
local tban5 = {'g001ig0499', 'g001ig0656', 'g000ig1016', 'g000ig1017', 'g001ig0368', 'g001ig0359', 'g001ig0655', 'g001ig0358', 'g001ig0052', 'g000ig1015', 'g001ig0290', 'g001ig0291'} 
local tban5_0 = { }

--���������
--650-1000 4�����!
local tart1 = {'g001ig0418', 'g000ig2001', 'g000ig3001', 'g001ig0100'} 
local tart1_0 = { }
--1250-2000 4�����!
local tart2 = {'g001ig0582', 'g000ig2002', 'g000ig3002', 'g001ig0182'} 
local tart2_0 = { }
--1500-2000 [5������+6�����] + ������ �������1200 + ������ ������1350 
local tart3 = {'g000ig2007', 'g001ig0044', 'g001ig0611', 'g000ig3018', 'g000ig9035', 'g000ig2003', 'g001ig0721', 'g001ig0589', 'g001ig0594', 'g000ig3017', 'g000ig3003'} 
local tart3_0 = { }
--2100-2400 + ������ �������2900 + ����� ��3000 + ������ ���������3150 + ���� ����������� ������3500
local tart4 = {'g001ig0155', 'g001ig0046', 'g001ig0558', 'g000ig2004', 'g001ig0557', 'g001ig0047', 'g001ig0593', 'g001ig0591', 'g001ig0071', 'g001ig0487', 'g001ig0173', 'g001ig0417', 'g000ig3004', 'g001ig0045', 'g001ig0048', 'g001ig0609', 'g001ig0585', 'g001ig0416', 'g001ig0603', 'g001ig0590', 'g001ig0693', 'g001ig0196'} 
local tart4_0 = { }
--2450+
local tart5 = {'g001ig0789', 'g000ig2005', 'g001ig0604', 'g001ig0612', 'g001ig0039', 'g001ig0720', 'g001ig0737', 'g001ig0592', 'g001ig0040', 'g001ig0559', 'g001ig0060', 'g001ig0041', 'g001ig0179', 'g001ig0411', 'g000ig3019', 'g001ig0413', 'g000ig9137', 'g001ig0197'}
local tart5_0 = { }
--3660+
local tart6 = {'g001ig0124', 'g001ig0736', 'g001ig0043', 'g001ig0657', 'g001ig0174', 'g001ig0410', 'g000ig3007', 'g001ig0102', 'g000ig3006', 'g001ig0488', 'g001ig0412', 'g001ig0415'}
local tart6_0 = { }
--2100-2500 [��������] �������� ����2100 / ��� ������2100 / ������ �������� ����2500 / ������ ��������2500 / ��������� �����2500 / ����� ������2650 / ����������� ������� ������2600
local tartxk = {'g000ig3015', 'g000ig3016', 'g001ig0409', 'g000ig3021', 'g001ig0158', 'g001ig0042', 'g001ig0414'} 
local tartxk_0 = { }

----------------
-- ���� ��� ���� �4 �6 --  ����� �������� �����1000 (5 ���+���) / ����� ������� ������� (+10 �����) /  ����� �������� � ����� (���+5����) / ����� ����������������900 (+15 ����) / ����� ���������� �����975 (+25 ����)
local truint4s = {'g001ig0504', 'g001ig0515', 'g001ig0502', 'g001ig0518', 'g001ig0318'} 

----------------
-- �������
-- 700-1500 �����1: ������ ������ / �������� / ������ ���� ������ / ���������� / ������������� / ��������� / ���-������� / ���-��������� / ����������
local tmercf1 = {'g000uu7607','g000uu7608','g000uu8041','g000uu7588','g000uu8276','g000uu8306','g000uu5012','g001uu7546','g001uu8284'}
-- 1501-3000 �����2: �������� 2900 / ��������� 2100 / ����� 2950 / ����� 1650 / ����� �������� 2500 / ��������� ������ / ������ 1400
local tmercf2 = {'g001uu7560','g001uu7613','g000uu6108','g000uu8151','g000uu5032','g000uu6106','g000uu5040'}
-- 700-1500 ���1: �������-��������� / ��������������� ������� / ���� ������ / ������-�������� / ����-������� / �������� �������� / ������� �������� / �.������� / c.����
local tmercb1 = {'g000uu6109','g000uu2032','g001uu7617','g000uu8274','g000uu7590','g000uu8169','g000uu8168','g000uu8170','g000uu8171'}
--1300-3000 ���2: ������� ������� 1900 / ����� 2200 / ����������� �������� 2800 / �� 2800 / �� 2800 / ����� ���������� 2500 / ������ 1575 / ������� 1300 / ��� ����� / �������� ����
local tmercb2 = {'g000uu8174','g000uu8218','g000uu7567','g000uu8237','g000uu7566','g000uu9000','g000uu8275','g000uu8045','g000uu8005','g001uu8282'}

----------------
--����������
local tmage1 = {'g000ss0180','g000ss0043','g000ss0041','g000ss0044','g000ss0045','g000ss0024','g000ss0002','g000ss0005','g000ss0001','g000ss0097','g000ss0021','g000ss0004','g000ss0062','g000ss0178','g000ss0177','g000ss0192','g000ss0025','g000ss0061','g000ss0098','g000ss0191','g000ss0065','g000ss0003','g000ss0023','g000ss0064','g000ss0106','g000ss0063','g000ss0182','g000ss0181','g000ss0101','g000ss0179','g000ss0022'}
local tmage2 = {'g000ss0154','g000ss0050','g000ss0049','g000ss0048','g000ss0046','g000ss0122','g000ss0127','g000ss0185','g000ss0125','g000ss0030','g000ss0156','g000ss0026','g000ss0130','g000ss0123','g000ss0010','g000ss0121','g000ss0009','g000ss0007','g000ss0070','g000ss0028','g000ss0102','g000ss0176','g000ss0187','g000ss0027','g000ss0104','g000ss0131','g000ss0124','g000ss0129','g000ss0153','g000ss0157','g000ss0008','g000ss0066','g000ss0103','g000ss0184','g000ss0069','g000ss0029','g000ss0126','g000ss0183','g000ss0186','g000ss0155','g000ss0068','g000ss0128','g000ss0128','g000ss0067'}
local tmage3 = {'g000ss0052','g000ss0054','g000ss0089','g000ss0085','g000ss0109','g000ss0175','g000ss0033','g000ss0149','g000ss0147','g000ss0014','g000ss0072','g000ss0200','g000ss0034','g000ss0197','g000ss0144','g000ss0011','g000ss0110','g000ss0201','g000ss0111','g000ss0198','g000ss0150','g000ss0031','g000ss0031','g000ss0140','g000ss0071','g000ss0139','g000ss0138','g000ss0141','g000ss0108','g000ss0073','g000ss0012','g000ss0013','g000ss0093','g000ss0107','g000ss0216','g000ss0074','g000ss0081'}
local tmage4 = {'g000ss0221','g000ss0206','g000ss0090','g000ss0057','g000ss0056','g000ss0218','g000ss0091','g000ss0214','g000ss0055','g000ss0036','g000ss0082','g000ss0116','g000ss0217','g000ss0172','g000ss0161','g000ss0160','g000ss0162','g000ss0164','g000ss0163','g000ss0167','g000ss0170','g000ss0169','g000ss0168','g000ss0076','g000ss0086','g000ss0220','g000ss0016','g000ss0112','g000ss0037','g000ss0209','g000ss0219','g000ss0077','g000ss0151','g000ss0152','g000ss0114','g000ss0113','g000ss0205','g000ss0213','g000ss0017','g000ss0207','g000ss0115','g000ss0211','g000ss0158','g000ss0202','g000ss0203','g000ss0035','g000ss0075','g000ss0208'}

----------------
--���� ������
--������ ������� � ������12: Incantare Adipem Diaboli" �����.��� / ��������� ������ / ����������� ������� / ������������ / ��������� �������� / �������� �� ���� / ���� // ������ ������� / Incantare Hellhound / ����������� ������� / ����������� ������
local tscrps12 = {'g001ig0407','g001ig0095','g000ig5119','g000ig5009','g000ig5027','g001ig0072','g000ig5022','g000ig5068','g000ig5030','g000ig5041','g000ig5119','g001ig0103'}
--������ ������35: "���������" 25% 200 / "��������" 25% 200 / ���������� -30% 125 / ���������� -30% 125 
local tscrps35 = {'g000ig5006','g000ig5100','g000ig5099','g000ig5099'}

----------------

-- ���������
function rnd(...)
    return (select(math.random(select('#', ...)), ...))
end

-- ���������� ������
function mix(tblmg)
		for i = #tblmg, 2, -1 do
			local j = math.random(i)
			tblmg[i], tblmg[j] = tblmg[j], tblmg[i]
		end
end

-- ������� ���� �������
function rndx(tabl,tabl0)
	x = math.random(1, #tabl)
	table.insert(tabl0, tabl[x])
	y = tabl[x]
	table.remove(tabl, x)
	return y
end

-- ������� ���� ������� (����� ������� �������)
function rndy(tabl)
	x = math.random(1, #tabl)
	y = tabl[x]
	table.remove(tabl, x)
	return y
end

----------------
--�������� � �������� �����/����
function nametwnrns(ttwrn)
	if next(ttwrn) ~= nil then
		x = math.random(1, #ttwrn)
		y = ttwrn[x]	
		table.remove(ttwrn, x)
		return y
	end
end

-- ��� �������/�������� �����/������/�����/�������
function xnm(tmrc)
	if next(tmrc) ~= nil then
		return math.random(1, #tmrc)	
	end
end

--�������� � �������� �����/������/�����/�������
function namemrmcmg(x,ttwrn)
	if next(ttwrn) ~= nil then
		y = ttwrn[x]
		table.remove(ttwrn, x)
		return y
	end
end

----------------

-- ��.�����
function d15() if next(td15) == nil then td15 = td15_0 td15_0 = { } end return rndx(td15,td15_0) end
function b15() if next(tb15) == nil then tb15 = tb15_0 tb15_0 = { } end return rndx(tb15,tb15_0) end
function w15() if next(tw15) == nil then tw15 = tw15_0 tw15_0 = { } end return rndx(tw15,tw15_0) end
function e4() if next(te4) == nil then te4 = te4_0 te4_0 = { } end return rndx(te4,te4_0) end
function b30() if next(tb30) == nil then tb30 = tb30_0 tb30_0 = { } end return rndx(tb30,tb30_0) end
function e5() if next(te5) == nil then te5 = te5_0 te5_0 = { } end return rndx(te5,te5_0) end
-- ��.�����
function cry1() if next(tcry1) == nil then tcry1 = tcry1_0 tcry1_0 = { } end return rndx(tcry1,tcry1_0) end
function orb1() if next(torb1) == nil then torb1 = torb1_0 torb1_0 = { } end return rndx(torb1,torb1_0) end
function orb2() if next(torb2) == nil then torb2 = torb2_0 torb2_0 = { } end return rndx(torb2,torb2_0) end
function orb3() if next(torb3) == nil then torb3 = torb3_0 torb3_0 = { } end return rndx(torb3,torb3_0) end
function orb4() if next(torb4) == nil then torb4 = torb4_0 torb4_0 = { } end return rndx(torb4,torb4_0) end
function orb5() if next(torb5) == nil then torb5 = torb5_0 torb5_0 = { } end return rndx(torb5,torb5_0) end
function orb6() if next(torb6) == nil then torb6 = torb6_0 torb6_0 = { } end return rndx(torb6,torb6_0) end
function orbx1() if next(torbx1) == nil then torbx1 = torbx1_0 torbx1_0 = { } end return rndx(torbx1,torbx1_0) end
function orbx2() if next(torbx2) == nil then torbx2 = torbx2_0 torbx2_0 = { } end return rndx(torbx2,torbx2_0) end
-- ��.������
function scr1() if next(tscr1) == nil then tscr1 = tscr1_0 tscr1_0 = { } end return rndx(tscr1,tscr1_0) end
function scr2() if next(tscr2) == nil then tscr2 = tscr2_0 tscr2_0 = { } end return rndx(tscr2,tscr2_0) end
function scr3() if next(tscr3) == nil then tscr3 = tscr3_0 tscr3_0 = { } end return rndx(tscr3,tscr3_0) end
function scr4() if next(tscr4) == nil then tscr4 = tscr4_0 tscr4_0 = { } end return rndx(tscr4,tscr4_0) end
function scr5() if next(tscr5) == nil then tscr5 = tscr5_0 tscr5_0 = { } end return rndx(tscr5,tscr5_0) end
function scr6() if next(tscr6) == nil then tscr6 = tscr6_0 tscr6_0 = { } end return rndx(tscr6,tscr6_0) end
-- ��.�������������
function mana1() if next(tmana1) == nil then tmana1 = tmana1_0 tmana1_0 = { } end return rndx(tmana1,tmana1_0) end
function mana2() if next(tmana2) == nil then tmana2 = tmana2_0 tmana2_0 = { } end return rndx(tmana2,tmana2_0) end
function mana3() if next(tmana3) == nil then tmana3 = tmana3_0 tmana3_0 = { } end return rndx(tmana3,tmana3_0) end
function mana4() if next(tmana4) == nil then tmana4 = tmana4_0 tmana4_0 = { } end return rndx(tmana4,tmana4_0) end
-- ��.�����
function p0r() if next(tp0r) == nil then tp0r = tp0r_0 tp0r_0 = { } end return rndx(tp0r,tp0r_0) end
function p1r() if next(tp1r) == nil then tp1r = tp1r_0 tp1r_0 = { } end return rndx(tp1r,tp1r_0) end
function p2p() if next(tp2p) == nil then tp2p = tp2p_0 tp2p_0 = { } end return rndx(tp2p,tp2p_0) end
function p3s() if next(tp3s) == nil then tp3s = tp3s_0 tp3s_0 = { } end return rndx(tp3s,tp3s_0) end
function p3m() if next(tp3m) == nil then tp3m = tp3m_0 tp3m_0 = { } end return rndx(tp3m,tp3m_0) end
function p4r() if next(tp4r) == nil then tp4r = tp4r_0 tp4r_0 = { } end return rndx(tp4r,tp4r_0) end
function p5s() if next(tp5s) == nil then tp5s = tp5s_0 tp5s_0 = { } end return rndx(tp5s,tp5s_0) end
function p5m() if next(tp5m) == nil then tp5m = tp5m_0 tp5m_0 = { } end return rndx(tp5m,tp5m_0) end
function p7m() if next(tp7m) == nil then tp7m = tp7m_0 tp7m_0 = { } end return rndx(tp7m,tp7m_0) end
function pzm() if next(tpzm) == nil then tpzm = tpzm_0 tpzm_0 = { } end return rndx(tpzm,tpzm_0) end
function pzd() if next(tpzd) == nil then tpzd = tpzd_0 tpzd_0 = { } end return rndx(tpzd,tpzd_0) end
function pzw() if next(tpzw) == nil then tpzw = tpzw_0 tpzw_0 = { } end return rndx(tpzw,tpzw_0) end
function pxr() if next(tpxr) == nil then tpxr = tpxr_0 tpxr_0 = { } end return rndx(tpxr,tpxr_0) end
function pxs() if next(tpxs) == nil then tpxs = tpxs_0 tpxs_0 = { } end return rndx(tpxs,tpxs_0) end
-- ��.������
function wand1() if next(twand1) == nil then twand1 = twand1_0 twand1_0 = { } end return rndx(twand1,twand1_0) end
function wand2() if next(twand2) == nil then twand2 = twand2_0 twand2_0 = { } end return rndx(twand2,twand2_0) end
function wand3() if next(twand3) == nil then twand3 = twand3_0 twand3_0 = { } end return rndx(twand3,twand3_0) end
function wand4() if next(twand4) == nil then twand4 = twand4_0 twand4_0 = { } end return rndx(twand4,twand4_0) end
function wand5() if next(twand5) == nil then twand5 = twand5_0 twand5_0 = { } end return rndx(twand5,twand5_0) end
function wand6() if next(twand6) == nil then twand6 = twand6_0 twand6_0 = { } end return rndx(twand6,twand6_0) end
--��.���������
function tal1() if next(ttal1) == nil then ttal1 = ttal1_0 ttal1_0 = { } end return rndx(ttal1,ttal1_0) end
function tal2() if next(ttal2) == nil then ttal2 = ttal2_0 ttal2_0 = { } end return rndx(ttal2,ttal2_0) end
function tal3() if next(ttal3) == nil then ttal3 = ttal3_0 ttal3_0 = { } end return rndx(ttal3,ttal3_0) end
function tal4() if next(ttal4) == nil then ttal4 = ttal4_0 ttal4_0 = { } end return rndx(ttal4,ttal4_0) end
function tal5() if next(ttal5) == nil then ttal5 = ttal5_0 ttal5_0 = { } end return rndx(ttal5,ttal5_0) end
function tal6() if next(ttal6) == nil then ttal6 = ttal6_0 ttal6_0 = { } end return rndx(ttal6,ttal6_0) end
function talx1() if next(ttalx1) == nil then ttalx1 = ttalx1_0 ttalx1_0 = { } end return rndx(ttalx1,ttalx1_0) end
function talx2() if next(ttalx2) == nil then ttalx2 = ttalx2_0 ttalx2_0 = { } end return rndx(ttalx2,ttalx2_0) end
-- ��.������
function trav1() if next(ttrav1) == nil then ttrav1 = ttrav1_0 ttrav1_0 = { } end return rndx(ttrav1,ttrav1_0) end
function trav2() if next(ttrav2) == nil then ttrav2 = ttrav2_0 ttrav2_0 = { } end return rndx(ttrav2,ttrav2_0) end
function trav3() if next(ttrav3) == nil then ttrav3 = ttrav3_0 ttrav3_0 = { } end return rndx(ttrav3,ttrav3_0) end
--��.��������
function jewel1() if next(tjewel1) == nil then tjewel1 = tjewel1_0 tjewel1_0 = { } end return rndx(tjewel1,tjewel1_0) end
function jewel2() if next(tjewel2) == nil then tjewel2 = tjewel2_0 tjewel2_0 = { } end return rndx(tjewel2,tjewel2_0) end
function jewel3() if next(tjewel3) == nil then tjewel3 = tjewel3_0 tjewel3_0 = { } end return rndx(tjewel3,tjewel3_0) end
function jewel4() if next(tjewel4) == nil then tjewel4 = tjewel4_0 tjewel4_0 = { } end return rndx(tjewel4,tjewel4_0) end
function jewel5() if next(tjewel5) == nil then tjewel5 = tjewel5_0 tjewel5_0 = { } end return rndx(tjewel5,tjewel5_0) end
function jewel6() if next(tjewel6) == nil then tjewel6 = tjewel6_0 tjewel6_0 = { } end return rndx(tjewel6,tjewel6_0) end
--��.������
function ban1() if next(tban1) == nil then tban1 = tban1_0 tban1_0 = { } end return rndx(tban1,tban1_0) end
function ban2() if next(tban2) == nil then tban2 = tban2_0 tban2_0 = { } end return rndx(tban2,tban2_0) end
function ban3() if next(tban3) == nil then tban3 = tban3_0 tban3_0 = { } end return rndx(tban3,tban3_0) end
function ban4() if next(tban4) == nil then tban4 = tban4_0 tban4_0 = { } end return rndx(tban4,tban4_0) end
function ban5() if next(tban5) == nil then tban5 = tban5_0 tban5_0 = { } end return rndx(tban5,tban5_0) end
--��.���������
function art1() if next(tart1) == nil then tart1 = tart1_0 tart1_0 = { } end return rndx(tart1,tart1_0) end
function art2() if next(tart2) == nil then tart2 = tart2_0 tart2_0 = { } end return rndx(tart2,tart2_0) end
function art3() if next(tart3) == nil then tart3 = tart3_0 tart3_0 = { } end return rndx(tart3,tart3_0) end
function art4() if next(tart4) == nil then tart4 = tart4_0 tart4_0 = { } end return rndx(tart4,tart4_0) end
function art5() if next(tart5) == nil then tart5 = tart5_0 tart5_0 = { } end return rndx(tart5,tart5_0) end
function art6() if next(tart6) == nil then tart6 = tart6_0 tart6_0 = { } end return rndx(tart6,tart6_0) end
function artxk() if next(tartxk) == nil then tartxk = tartxk_0 tartxk_0 = { } end return rndx(tartxk,tartxk_0) end
----------------

-- �. �������� �1: ������1, �����11, �����12 - � ������
function gtdr1()
	tdr1 = {}
	table.insert(tdr1, p2p()) -- �. �� �����
	table.insert(tdr1, art2())
	table.insert(tdr1, jewel2())
	table.insert(tdr1, ban1())
end

-- �. �������� �2: ������2�, ������2�, �����2�, �����2� - � ������
function gtdr2()
	tdr2 = {}
	table.insert(tdr2, art3())
	table.insert(tdr2, jewel3())
	table.insert(tdr2, trav2())
	table.insert(tdr2, ban2())
end

-- �. �������� �3: ������3, �����31, �����32 - � ������
function gtdr3()
	tdr3 = {}
	table.insert(tdr3, p4r())
	table.insert(tdr3, art4())
	table.insert(tdr3, jewel4())
	table.insert(tdr3, ban3())
end

-- �. �������� �4: ������4, �����41, �����42 - � ������
function gtdr4()
	tdr4 = {}
	table.insert(tdr4, art5())
	table.insert(tdr4, jewel5())
	table.insert(tdr4, trav3())
	table.insert(tdr4, ban4())
end

-- �. �������� �5: ������5, �����51, �����52 - � ������
function gtdr5()
	tdr5 = {}
	table.insert(tdr5, pxr())
	table.insert(tdr5, art6())
	table.insert(tdr5, jewel6())
	table.insert(tdr5, ban5())
end

----------------

-- ������� ������
function getPlayesubRace(race)
	if race == Race.Human then
		return Subrace.Human
	elseif race == Race.Dwarf then
		return Subrace.Dwarf
	elseif race == Race.Undead then
		return Subrace.Undead
	elseif race == Race.Heretic then
		return Subrace.Heretic
	elseif race == Race.Elf then
		return Subrace.Elf
	end
end

-- ��������� �������
function rsub()
	local radn = math.random(0,4)
	if radn == 0 then
	return {Subrace.Human, Subrace.Neutral, Subrace.NeutralHuman, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --����
	elseif radn == 1 then
	return {Subrace.Elf, Subrace.Neutral, Subrace.NeutralElf, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --�����
	elseif radn == 2 then
	return {Subrace.Heretic, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --������
	elseif radn == 3 then
	return {Subrace.Dwarf, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --�����
	elseif radn == 4 then
	return {Subrace.Undead, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --������
	end
end

-- ��������� ������� ������ �� ������ + ������
function rsubnu()
	local radn = math.random(0,3)
	if radn == 0 then
	return {Subrace.Human, Subrace.Neutral, Subrace.NeutralHuman, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.NeutralWater} --����
	elseif radn == 1 then
	return {Subrace.Elf, Subrace.Neutral, Subrace.NeutralElf, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.NeutralWater} --�����
	elseif radn == 2 then
	return {Subrace.Heretic, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.NeutralWater} --������
	elseif radn == 3 then
	return {Subrace.Dwarf, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.NeutralWater} --�����
	end
end

-- ������� ������ ������� �� ������
function rsubdr()
	return {Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf}
end

-- ����� ����� (�� ���������)
function ms(scenarioSize,s96,s120,s144)
	if scenarioSize == 96 then
		return s96
	elseif scenarioSize == 120 then
		return s120
	elseif scenarioSize == 144 then
		return s144
	end
end

-- ����� �� ��������� ��������� ����� ������ �� ��� 1.25/2 � 1.2/2 (���� ������/�����)
function vs(scenarioSize,scons)
	if scenarioSize == 96 then
		return scons
	elseif scenarioSize == 120 then
		return scons*1.125
	elseif scenarioSize == 144 then
		return scons*1.125*1.1
	end
end

-- ������� ���
function vbrd()
	if brd == 1 then
		return Border.Water
	elseif brd == 2 then
		return Border.Close 
	elseif brd == 3 then
		return Border.SemiOpen
	elseif brd == 4  then
		return rnd(Border.Water, Border.Water, Border.Close, Border.SemiOpen)
	end
end

-- ���� ������� ��� ����/��_����
function isw(vwater, vnowater)
	if brd == 1 then return vwater else return vnowater end
end

-- ����� �� ������ ��� �
function CapSpell(playerRace)
	sphmn = {rndy({'g000ss0004','g000ss0001'}), rndy({'g000ss0157','g000ss0008'})}
	spdw = {rndy({'g000ss0024','g000ss0025'}), rndy({'g000ss0028','g000ss0157'})}
	spun = {rndy({'g000ss0062','g000ss0061'}), rndy({'g000ss0067','g000ss0066'})}
	sphr = {rndy({'g000ss0043','g000ss0041'}), rndy({'g000ss0048','g000ss0046'})}
	spelf = {rndy({'g000ss0097','g000ss0098'}), rndy({'g000ss0104','g000ss0103'})}
	
	if playerRace == Race.Human then return sphmn
	elseif playerRace == Race.Dwarf then return spdw
	elseif playerRace == Race.Undead then return spun
	elseif playerRace == Race.Heretic then return sphr
	elseif playerRace == Race.Elf then return spelf
	end
end

-- ��� ���� ������� ����� (��� ����)
function mixtaitwn(scenarioSize)
	if scenarioSize == 96 and aitowns == 2 then taitwn = {0,0,1} -- aitowns == 2 ��� 1 �����
	elseif scenarioSize == 96 and aitowns == 3 then taitwn = {0,1,1}
	elseif scenarioSize == 96 and aitowns == 4 then taitwn = {1,1,1}
	elseif scenarioSize == 120 and aitowns == 2 then taitwn = {0,0,0,1}
	elseif scenarioSize == 120 and aitowns == 3 then taitwn = {0,0,1,1}
	elseif scenarioSize == 120 and aitowns == 4 then taitwn = {0,1,1,1}
	elseif scenarioSize == 144 and aitowns == 2 then taitwn = {0,0,0,0,1}
	elseif scenarioSize == 144 and aitowns == 3 then taitwn = {0,0,0,1,1}
	elseif scenarioSize == 144 and aitowns == 4 then taitwn = {0,0,1,1,1}
	end
	ltwn = 1
end

-- ���� ����� true, ��� false
function aitr(zoneId)
	-- ���� �� ���� �-������1
	if gmode == 1 and zoneId ~= 0 and zoneId ~= 5 and zoneId ~= 13 and zoneId ~= 14
	-- ���� (� � �����) �� ���� �-������1
	or gmode == 2 and zoneId ~= 0 and zoneId ~= 5 and zoneId ~= 13 and zoneId ~= 14
	-- ���� �� ���� �-������1 � �-������2
	or gmode == 3 and zoneId ~= 0 and zoneId ~= 5 and zoneId ~= 13 and zoneId ~= 14
								  and zoneId ~= 1 and zoneId ~= 6 and zoneId ~= 15 and zoneId ~= 16
	-- ���� (� � �����) �� ���� �-������1 � �-������2
	or gmode == 4 and zoneId ~= 0 and zoneId ~= 5 and zoneId ~= 13 and zoneId ~= 14
								  and zoneId ~= 1 and zoneId ~= 6 and zoneId ~= 15 and zoneId ~= 16
	-- ���� �� ���� �-������1 � �-������2 � �-������3
	or gmode == 5 and zoneId ~= 0 and zoneId ~= 5 and zoneId ~= 13 and zoneId ~= 14
								  and zoneId ~= 1 and zoneId ~= 6 and zoneId ~= 15 and zoneId ~= 16
								  and zoneId ~= 2 and zoneId ~= 7 and zoneId ~= 17 and zoneId ~= 18
	then
		return true
	else
		return false
	end
end

-- ���� ����� = 1.5, ��� ��� ������� = 1 (��� ���������� ������� � ����)
function a2(zoneId)
	-- ���� �� ���� �-������1
	if aitr(zoneId) == true then
		return 1.5
	elseif aitr(zoneId) == false then
		return 1
	end
end

-- ��������� �� 0 ���� ���� ��������
function fpr(zoneId)
	-- ���� �� ���� �-������1
	if aitr(zoneId) == true then
		return pr(1)
	elseif aitr(zoneId) == false then
		return 0
	end
end

-- ������ �����
function twnrace(scenarioSize, playerRace, zoneId)	
	-- ���� �� ���� �-������1
	if gmode == 1 and aitowns ~= 1 and zoneId ~= 0 and zoneId ~= 5 and zoneId ~= 13 and zoneId ~= 14
	-- ���� (� � �����) �� ���� �-������1
	or gmode == 2 and aitowns ~= 1 and zoneId ~= 0 and zoneId ~= 5 and zoneId ~= 13 and zoneId ~= 14
	-- ���� �� ���� �-������1 � �-������2
	or gmode == 3 and aitowns ~= 1 and zoneId ~= 0 and zoneId ~= 5 and zoneId ~= 13 and zoneId ~= 14
								   and zoneId ~= 1 and zoneId ~= 6 and zoneId ~= 15 and zoneId ~= 16
	-- ���� (� � �����) �� ���� �-������1 � �-������2
	or gmode == 4 and aitowns ~= 1 and zoneId ~= 0 and zoneId ~= 5 and zoneId ~= 13 and zoneId ~= 14
								   and zoneId ~= 1 and zoneId ~= 6 and zoneId ~= 15 and zoneId ~= 16
	-- ���� �� ���� �-������1 � �-������2 � �-������3
	or gmode == 5 and aitowns ~= 1 and zoneId ~= 0 and zoneId ~= 5 and zoneId ~= 13 and zoneId ~= 14
								   and zoneId ~= 1 and zoneId ~= 6 and zoneId ~= 15 and zoneId ~= 16
								   and zoneId ~= 2 and zoneId ~= 7 and zoneId ~= 17 and zoneId ~= 18
	then
		if taitwn[ltwn] == 1 then
			ltwn = ltwn + 1
			isaitwn = true
			return playerRace
		else 
			ltwn = ltwn + 1
			isaitwn = false
			return Race.Neutral
		end
	else 
		isaitwn = false
		return Race.Neutral
	end
end

-- ����� ������� ��������� ������� �����
function subaigar(playerRace)
	if isaitwn == false then
		return rsubnu()
	elseif isaitwn == true then
		return {getPlayesubRace(playerRace)}
	end
end

--����� �����
function ldrai(race)
	if isaitwn == false then
		return {}
	elseif isaitwn == true then
		if race == Race.Human then return
			{'g000uu8248','g000uu0019','g000uu0020'}
		elseif race == Race.Dwarf then return
			{'g000uu0045','g000uu0044','g000uu8249'}
		elseif race == Race.Undead then return
			{'g000uu8253','g000uu8252','g000uu0096'}
		elseif race == Race.Heretic then return
			{'g000uu8250','g000uu0070','g000uu0071'}
		elseif race == Race.Elf then return
			{'g000uu8009','g000uu8251','g000uu8011'}
		end	
	end
end


--����� ��������
function ldrod(race)
	if race == Race.Human then return
		{'g000uu0022'}
	elseif race == Race.Dwarf then return
		{'g000uu0047'}
	elseif race == Race.Undead then return
		{'g000uu0099'}
	elseif race == Race.Heretic then return
		{'g000uu0073'}
	elseif race == Race.Elf then return
		{'g000uu8012'}
	end
end

--���� � ������ �������� ��� ������ ����
function valrod(race)
	if race == Race.Human then return
		40+22
	elseif race == Race.Dwarf then return
		50+35
	elseif race == Race.Undead then return
		45+25
	elseif race == Race.Heretic then return
		50+25
	elseif race == Race.Elf then return
		40+25
	end
end

--��� ����������
function pr(objpr)
	if gmode == 7 then
		return 0
	else
		return objpr
	end
end

--��� �������� ������
function ordguard()
	if gmode == 1 or gmode == 2 or gmode == 3 or gmode == 4 or gmode == 5 then
		return Order.Guard
	elseif gmode == 6 or gmode == 7 then
		return Order.Stand
	end
end

-- ����� ����� �� ������� ���� kef < 100
function valfdr(kefmore, kefless)
	if kefmore*kef/kr >= 590 then
		return kefmore
	elseif kefmore*kef/kr < 590 then 
		return kefless/kef
	end
end
----------------
----------------

-- �������
function Capital01(zoneId, playerRace)
	local Cap01 = { }
	local startXP = 50
	local startRes = 5
	local startHeal100 = 5
	local startHeal75 = 5
	local startHeal50 = 5
	local startHeal25 = 5
	
	-- ���� ���� �� XP ��������� �� �����������
	if 
		gmode == 1 and zoneId ~= 0
		or gmode == 2 and zoneId ~= 0
		or gmode == 3 and zoneId == 2
		or gmode == 3 and zoneId == 3
		or gmode == 4 and zoneId == 2
		or gmode == 4 and zoneId == 3
		or gmode == 5 and zoneId == 3
	then
		Cap01.spells = CapSpell(playerRace) -- �����
		startXP = aixp
		startRes = 7
		startHeal100 = 10
		startHeal75 = 10
		startHeal50 = 5
		startHeal25 = 5
	end
	Cap01 = {
		aiPriority = pr(0),
		gapMask = 13,		
		garrison = { 
			subraceTypes = { getPlayesubRace(playerRace) },
			value = { min = startXP, max = startXP },
			loot = {
				items = {						
					{ id = 'g000ig0001', min = startRes, max = startRes}, --���
					{ id = 'g000ig0006', min = startHeal100, max = startHeal100 }, --���100
					{ id = 'g001ig0378', min = startHeal75, max = startHeal75 }, --���75
					{ id = 'g000ig0005', min = startHeal50, max = startHeal50 }, --���50
					{ id = 'g001ig0180', min = startHeal25, max = startHeal25 }, --���25

					{ id = 'g000ig0008', min = 1, max = 1 }, --��������15
					{ id = 'g000ig0011', min = 1, max = 1 }, --���15
					{ id = b15(), min = 1, max = 1}, -- ��.�����15
					{ id = b15(), min = 1, max = 1}, -- ��.�����15
					{ id = b15(), min = 1, max = 1}, -- ��.�����15
					
					{ id = 'g000ig0021', min = 1, max = 1 }, -- ���� ������
					{ id = 'g000ig0024', min = 1, max = 1 }, -- ���� �����
					{ id = w15(), min = 1, max = 1}, -- ��.����
					{ id = w15(), min = 1, max = 1}, -- ��.����
					{ id = w15(), min = 1, max = 1}, -- ��.����	

					{ id = orb1(), min = 1, max = 1}, -- ����� �1	
					{ id = orb2(), min = 1, max = 1}, -- ����� �2	

					{ id = scr1(), min = 1, max = 1}, -- ������ �1
					{ id = rndy(tscrps12), min = 1, max = 1}, -- ���� ������
					
					
				}
			},
		},
	}	
	if 
		gmode == 1 and zoneId ~= 0 
		or gmode == 2 and zoneId ~= 0 
		or gmode == 3 and zoneId == 2
		or gmode == 3 and zoneId == 3
		or gmode == 4 and zoneId == 2
		or gmode == 4 and zoneId == 3
		or gmode == 5 and zoneId == 3
	then
		Cap01.spells = CapSpell(playerRace) -- �����

	end	
	return Cap01
end

-- ����� �1
function Town01(scenarioSize, playerRace, zoneId)
    local zoneTowns = {}   
	local valTnRace = vs(scenarioSize,150)
	local valTn = vs(scenarioSize,150/a2(zoneId))
	if scenarioSize == 120 or scenarioSize == 144 then
    zoneTowns[1] = {			
		name = nametwnrns(tntwn),
		aiPriority = pr(5),
		owner = twnrace(scenarioSize, playerRace, zoneId),
		tier = 1,
	}
	if isaitwn == false then -- ��� �
		zoneTowns[1].stack = {
			aiPriority = pr(5),
			subraceTypes = rsubnu(),
			value = { min = valTn*kef/kr, max = valTn*kef*kr },
			loot = {
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					{ id = 'g001ig0180', min = 1, max = 1 }, --���25
					{ id = d15(), min = 1, max = 1 }, --��.�������
					{ id = b15(), min = 1, max = 1 }, --��.�����15
					{ id = rnd(orb1(),scr1()), min = 1, max = 1 }, --��.�����150 / ��.������100-125
					{ id = rnd('g001ig0431',mana1()), min = 1, max = 1 }, -- ������ 75 / ��.�����					
					{ id = rnd(jewel1(), p1r(), trav1()), min = 1, max = 1 }, -- ����� �1 / ����� �1 / ������ �1
				}
			}
		}
	elseif isaitwn == true then -- ��� �
		zoneTowns[1].stack = {
			aiPriority = pr(5),
			order = Order.Normal,
			subraceTypes = subaigar(playerRace),
			value = { min = valTnRace*kef/kr, max = valTnRace*kef*kr },
			leaderIds = ldrai(playerRace),
			loot = {
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					{ id = 'g001ig0180', min = 1, max = 1 }, --���25
					{ id = d15(), min = 1, max = 1 }, --��.�������
					{ id = b15(), min = 1, max = 1 }, --��.�����15
					{ id = rnd(orb1(),scr1()), min = 1, max = 1 }, --��.�����150 / ��.������100-125
					{ id = rnd('g001ig0431',mana1()), min = 1, max = 1 }, -- ������ 75 / ��.�����					
					{ id = rnd(jewel1(), p1r(), trav1()), min = 1, max = 1 }, -- ����� �1 / ����� �1 / ������ �1
				}
			}
		}
	end
	end
	
	if scenarioSize == 144 then
        zoneTowns[2] = {			
			name = nametwnrns(tntwn),
			aiPriority = pr(5),
			owner = twnrace(scenarioSize, playerRace, zoneId),
			tier = 1,
		}
		if isaitwn == false then -- ��� �
			zoneTowns[2].stack = {
				aiPriority = pr(5),
				subraceTypes = rsubnu(),
				value = { min = valTn*kef/kr, max = valTn*kef*kr },
				loot = {
					items = {
						{ id = 'g000ig0001', min = 1, max = 1 }, --���
						{ id = 'g000ig0006', min = 1, max = 1 }, --���100
						{ id = 'g001ig0180', min = 1, max = 1 }, --���25
						{ id = d15(), min = 1, max = 1 }, --��.�������
						{ id = b15(), min = 1, max = 1 }, --��.�����15
						{ id = rnd(orb1(),scr1()), min = 1, max = 1 }, --��.�����150 / ��.������100-125
						{ id = rnd('g001ig0431',mana1()), min = 1, max = 1 }, -- ������ 75 / ��.�����
						{ id = rnd(tal1(), p1r(), art1()), min = 1, max = 1 }, -- ����� �1 / ����� �1 / ��� �1
					}
				}
			}
		elseif isaitwn == true then -- ��� �
			zoneTowns[2].stack = {
				aiPriority = pr(5),
				order = Order.Normal,
				subraceTypes = subaigar(playerRace),
				value = { min = valTnRace*kef/kr, max = valTnRace*kef*kr },
				leaderIds = ldrai(playerRace),
				loot = {
					items = {
						{ id = 'g000ig0001', min = 1, max = 1 }, --���
						{ id = 'g000ig0006', min = 1, max = 1 }, --���100
						{ id = 'g001ig0180', min = 1, max = 1 }, --���25
						{ id = d15(), min = 1, max = 1 }, --��.�������
						{ id = b15(), min = 1, max = 1 }, --��.�����15
						{ id = orb1(), min = 1, max = 1 }, --��.�����150
						{ id = scr1(), min = 1, max = 1 }, --��.������100-125
						{ id = rnd('g001ig0431',mana1()), min = 1, max = 1 }, -- ������ 75 / ��.�����
						{ id = rnd(tal1(), p1r(), art1()), min = 1, max = 1 }, -- ����� �1 / ����� �1 / ��� �1
					}
				}
			}
		end
    end   
    return zoneTowns
end

-- ����� �2
function Town2(scenarioSize, playerRace, zoneId)
    local zoneTowns = {}  
	local valTnRace = vs(scenarioSize,350)
	local valTn = vs(scenarioSize,350/a2(zoneId))
    zoneTowns[1] = {
		gapMask = 15,		
		name = nametwnrns(tntwn),
		aiPriority = pr(5),
		owner = twnrace(scenarioSize, playerRace, zoneId),
		tier = 2,
	}
	if isaitwn == false then -- ��� �
		zoneTowns[1].stack = {
			aiPriority = pr(5),
			subraceTypes = rsubnu(),
			value = { min = valTn*kef/kr, max = valTn*kef*kr },
			loot = {
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					{ id = 'g000ig0005', min = 1, max = 1 }, --���50
					{ id = b15(), min = 1, max = 1 }, --��.�����15
					{ id = w15(), min = 1, max = 1 }, --��.����
					{ id = rnd(orb2(),scr2()), min = 1, max = 1 }, --��.�����200-245 / ��.������150-200
					{ id = rnd('g000ig7002',mana2()), min = 1, max = 1 }, -- ���������� ������ 100 | ��.���
					{ id = rnd(art2(),p2p(),wand2()), min = 1, max = 1 }, -- ���� �2 / ����� �2 / ����� �2
				}
			}
		}	
	elseif isaitwn == true then -- ��� �
		zoneTowns[1].stack = {
			aiPriority = pr(5),
			order = Order.Normal,
			subraceTypes = subaigar(playerRace),
			value = { min = valTnRace*kef/kr, max = valTnRace*kef*kr },
			leaderIds = ldrai(playerRace),
			loot = {
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					{ id = 'g000ig0005', min = 1, max = 1 }, --���50
					{ id = b15(), min = 1, max = 1 }, --��.�����15
					{ id = w15(), min = 1, max = 1 }, --��.����
					{ id = rnd(orb2(),scr2()), min = 1, max = 1 }, --��.�����200-245 / ��.������150-200
					{ id = rnd('g000ig7002',mana2()), min = 1, max = 1 }, -- ���������� ������ 100 | ��.���
					{ id = rnd(art2(),p2p(),wand2()), min = 1, max = 1 }, -- ���� �2 / ����� �2 / ����� �2
				}
			}
		}	
	end
    return zoneTowns
end

-- ����� �3
function Town3(scenarioSize, playerRace, zoneId)
    local zoneTowns = {}   
	local valTnRace = vs(scenarioSize,650)
	local valTn = vs(scenarioSize,650/a2(zoneId))
    zoneTowns[1] = {
		name = nametwnrns(tntwn),
		aiPriority = pr(5),
		owner = twnrace(scenarioSize, playerRace, zoneId),
		tier = 3,
	}
	if isaitwn == false then  -- ��� �
		zoneTowns[1].stack = {
			aiPriority = pr(5),
			subraceTypes = rsubnu(),
			value = { min = valTn*kef/kr, max = valTn*kef*kr },
			loot = {
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					{ id = 'g001ig0378', min = 1, max = 1 }, --���75
					{ id = w15(), min = 1, max = 1 }, --��.����
					{ id = e4(), min = 1, max = 1 }, --��.�����
					{ id = rnd(orb3(),scr3()), min = 1, max = 1 }, --��.�����300-399 / ��.������225-299
					{ id = rnd('g001ig0432',mana2()), min = 1, max = 1 }, -- ������� 125 | ��.���
					{ id = rnd(p3s(),tal3(),trav2(),ban2()), min = 1, max = 1 }, -- ����� �3 / ����� �3 / ������ �2 / ����� �2
				}
			}
		}	
	elseif isaitwn == true then -- ��� �
		zoneTowns[1].stack = {
			aiPriority = pr(5),
			order = Order.Normal,
			subraceTypes = subaigar(playerRace),
			value = { min = valTnRace*kef/kr, max = valTnRace*kef*kr },
			leaderIds = ldrai(playerRace),
			loot = {
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					{ id = 'g001ig0378', min = 1, max = 1 }, --���75
					{ id = w15(), min = 1, max = 1 }, --��.����
					{ id = e4(), min = 1, max = 1 }, --��.�����
					{ id = rnd(orb3(),scr3()), min = 1, max = 1 }, --��.�����300-399 / ��.������225-299	
					{ id = rnd('g001ig0432',mana2()), min = 1, max = 1 }, -- ������� 125 | ��.���
					{ id = rnd(p3s(),tal3(),trav2(),ban2()), min = 1, max = 1 }, -- ����� �3 / ����� �3 / ������ �2 / ����� �2

				}
			}
		}	
	end
    return zoneTowns
end

-- ����� �4
function Town4(scenarioSize)
    local zoneTowns = {}   
	local valTn = vs(scenarioSize,1150)
	zoneTowns[1] = {
		gapMask = 11,		
		name = nametwnrns(tntwn),
		aiPriority = pr(4),
		tier = 4,
		garrison = {
			subraceTypes = rsubnu(),
			value = { min = valTn*kef/kr, max = valTn*kef*kr },
			loot = {
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 2, max = 2 }, --���100
					{ id = e4(), min = 1, max = 1 }, --��.�����
					{ id = b30(), min = 1, max = 1 }, --��.�����30
					{ id = rnd(orb4(),scr4()), min = 1, max = 1 }, --��.�����400-499 / ��.������300-399
					{ id = rnd('g000ig7003',mana3()), min = 1, max = 1 }, --������� 150 | ��.�������
					{ id = rnd(p4r(),wand4(),jewel4(),art4()), min = 1, max = 1 }, -- ����� �4 / ����� �4 / ����� �4 / ��� �4
				}
			}
		}
	}	
    return zoneTowns
end

-- ����� �5
function Town5(scenarioSize)
	local valTn = vs(scenarioSize,2050)
    return {
		{
			name = nametwnrns(tntwn),
			aiPriority = pr(3),
			tier = 5,
			garrison = {
				subraceTypes = rsubnu(),
				value = { min = valTn*kef/kr, max = valTn*kef*kr },
				loot = {
					items = {
						{ id = 'g000ig0001', min = 2, max = 2 }, --���
						{ id = 'g000ig0006', min = 2, max = 2 }, --���100
						{ id = b30(), min = 1, max = 1 }, --��.�����30
						{ id = e5(), min = 1, max = 1 }, --��.������������
						{ id = rnd(orb5(),scr5()), min = 1, max = 1 }, --��.�����500-699 / ��.������400-599
						{ id = rnd('g000ig7006','g001ig0151'), min = 1, max = 1 }, -- ������ 300 | ��� ����������
						{ id = rnd(p5s(),jewel5(),ban4()), min = 1, max = 1 }, -- ����� �5 / ����� �5 / ����� �5
					}
				}
			}
		}
	}	
end

----------------

-- ����� �1
function Ruin01(scenarioSize,zoneId)
    local zoneRuins = {}   
	local valRn = { min = vs(scenarioSize,150/a2(zoneId))*kef/kr, max = vs(scenarioSize,150/a2(zoneId))*kef*kr }
	local valGl = { min = 250, max = 300}
	local tir1 = { p1r(), tal1(), wand1(), trav1(), art1() }
	mix(tir1)
    zoneRuins[1] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir1[1], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsub(),		
			value = valRn,
		}
	}
    zoneRuins[2] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir1[2], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsub(),		
			value = valRn,
		}
	}
    zoneRuins[3] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir1[3], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsub(),		
			value = valRn,
		}
	}
	if scenarioSize == 120 or scenarioSize == 144 then 
		zoneRuins[4] = {
			name = nametwnrns(tnrns),
			aiPriority = pr(3),
			gold = valGl,
			loot = {
				items = {
					{id = tir1[4], min = 1, max = 1},
				},
			},
			guard = {
				subraceTypes = rsub(),		
				value = valRn,
			}
		}
		zoneRuins[5] = {
			name = nametwnrns(tnrns),
			aiPriority = pr(3),
			gold = valGl,
			loot = {
				items = {
					{id = tir1[5], min = 1, max = 1},
				},
			},
			guard = {
				subraceTypes = rsub(),		
				value = valRn,
			}
		}
	end
	if scenarioSize == 144 then 
		zoneRuins[6] = {
			name = nametwnrns(tnrns),
			aiPriority = pr(3),
			gold = valGl,
			loot = {
				items = {
					{id = pxs(), min = 1, max = 1},
				},
			},
			guard = {
				subraceTypes = rsub(),		
				value = valRn,
			}
		}
	end
	return zoneRuins
end

-- ����� �2
function Ruin2(scenarioSize,zoneId)
    local zoneRuins = {}   
	local valRn = { min = vs(scenarioSize,350/a2(zoneId))*kef/kr, max = vs(scenarioSize,350/a2(zoneId))*kef*kr }
	local valGl = { min = 350, max = 400}
	local tir2 = { p2p(), tal2(), jewel2(), ban1() }
	mix(tir2)
    zoneRuins[1] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir2[1], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsub(),		
			value = valRn,
		}
	}
    zoneRuins[2] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir2[2], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsub(),		
			value = valRn,
		}
	}
	if scenarioSize == 120 or scenarioSize == 144 then 
		zoneRuins[3] = {
			name = nametwnrns(tnrns),
			aiPriority = pr(3),
			gold = valGl,
			loot = {
				items = {
					{id = tir2[3], min = 1, max = 1},
				},
			},
			guard = {
				subraceTypes = rsub(),		
				value = valRn,
			}
		}
	end
	if scenarioSize == 144 then 
		zoneRuins[4] = {
			name = nametwnrns(tnrns),
			aiPriority = pr(3),
			gold = valGl,
			loot = {
				items = {
					{id = tir2[4], min = 1, max = 1},
				},
			},
			guard = {
				subraceTypes = rsub(),		
				value = valRn,
			}
		}
	end
	return zoneRuins
end

-- ����� �3
function Ruin3(scenarioSize,zoneId)
    local zoneRuins = {}   
	local valRn = { min = vs(scenarioSize,650/a2(zoneId))*kef/kr, max = vs(scenarioSize,650/a2(zoneId))*kef*kr }
	local valGl = { min = 450, max = 500}
	local tir3 = { trav2(), jewel3(), wand3(), ban2(), art3() }
	mix(tir3)
    zoneRuins[1] = {
		name = nametwnrns(tnrns),
		aiPrio25rity = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir3[1], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsubnu(),		
			value = valRn,
		}
	}
    zoneRuins[2] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir3[2], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsubnu(),		
			value = valRn,
		}
	}
    zoneRuins[3] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir3[3], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsubnu(),		
			value = valRn,
		}
	}
	if scenarioSize == 120 or scenarioSize == 144 then 
		zoneRuins[4] = {
			name = nametwnrns(tnrns),
			aiPriority = pr(3),
			gold = valGl,
			loot = {
				items = {
					{id = tir3[4], min = 1, max = 1},
				},
			},
			guard = {
				subraceTypes = rsubnu(),		
				value = valRn,
			}
		}
	end
	if scenarioSize == 144 then 
		zoneRuins[5] = {
			name = nametwnrns(tnrns),
			aiPriority = pr(3),
			gold = valGl,
			loot = {
				items = {
					{id = tir3[5], min = 1, max = 1},
				},
			},
			guard = {
				subraceTypes = rsubnu(),		
				value = valRn,
			}
		}
	end
	return zoneRuins
end

-- ����� �4
function Ruin4(scenarioSize)
    local zoneRuins = {}   
	local valRn = { min = vs(scenarioSize,1150)*kef/kr, max = vs(scenarioSize,1150)*kef*kr }
	local valGl = { min = 550, max = 600}
	local tir4 = { p4r(), tal4(), jewel4(), ban3(), art4() }
	mix(tir4)
    zoneRuins[1] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir4[1], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsubnu(),		
			value = valRn,
		}
	}
    zoneRuins[2] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir4[2], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsubnu(),		
			value = valRn,
		}
	}
    zoneRuins[3] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir4[3], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsubnu(),		
			value = valRn,
		}
	}
   zoneRuins[4] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir4[4], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsubnu(),		
			value = valRn,
		}
	}
	if scenarioSize == 120 or scenarioSize == 144 then 
		zoneRuins[5] = {
			name = nametwnrns(tnrns),
			aiPriority = pr(3),
			gold = valGl,
			loot = {
				items = {
					{id = tir4[5], min = 1, max = 1},
				},
			},
			guard = {
				subraceTypes = rsubnu(),		
				value = valRn,
			}
		}
	end
	if  scenarioSize == 144 then 
		zoneRuins[6] = {
			name = nametwnrns(tnrns),
			aiPriority = pr(3),
			gold = valGl,
			loot = {
				items = {
					{id = rndy(truint4s), min = 1, max = 1},
				},
			},
			guard = {
				subraceTypes = rsubnu(),		
				value = valRn,
			}
		}
	end
	return zoneRuins
end

-- ����� �5
function Ruin5(scenarioSize)
    local zoneRuins = {}   
	local valRn = { min = vs(scenarioSize,2050)*kef/kr, max = vs(scenarioSize,2050)*kef*kr }
	local valGl = { min = 650, max = 700}
	local tir5 = { p5s(), wand5(), tal5(), trav3(), art5() }
	mix(tir5)
    zoneRuins[1] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir5[1], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsubnu(),		
			value = valRn,
		}
	}
    zoneRuins[2] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir5[2], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsubnu(),		
			value = valRn,
		}
	}
    zoneRuins[3] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir5[3], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsubnu(),		
			value = valRn,
		}
	}
    zoneRuins[4] = {
		name = nametwnrns(tnrns),
		aiPriority = pr(3),
		gold = valGl,
		loot = {
			items = {
				{id = tir5[4], min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsubnu(),		
			value = valRn,
		}
	}
	if scenarioSize == 120 or scenarioSize == 144 then 
		zoneRuins[5] = {
			name = nametwnrns(tnrns),
			aiPriority = pr(3),
			gold = valGl,
			loot = {
				items = {
					{id = tir5[5], min = 1, max = 1},
				},
			},
			guard = {
				subraceTypes = rsubnu(),		
				value = valRn,
			}
		}
	end
	if scenarioSize == 144 then 
		zoneRuins[6] = {
			name = nametwnrns(tnrns),
			aiPriority = pr(3),
			gold = valGl,
			loot = {
				items = {
					{id = pxr(), min = 1, max = 1},
				},
			},
			guard = {
				subraceTypes = rsubnu(),		
				value = valRn,
			}
		}
	end
	return zoneRuins
end

----------------

-- ����� �1
function Merch01(scenarioSize,playerRace)
	local x = xnm(tnmch)
    local zoneMerchs = {}   
		zoneMerchs[1] =	{
			name = namemrmcmg(x,tnmch),
			description = namemrmcmg(x,tdmch),
			aiPriority = pr(1),
			goods = {
				items = {
					{ id = 'g000ig0001', min = 3, max = 3 }, --���
					{ id = 'g000ig0006', min = 3, max = 3 }, --���100
					{ id = 'g001ig0180', min = 3, max = 3 }, --���25

					{ id = 'g000ig0002', min = 1, max = 1 }, --������15
					{ id = 'g000ig0014', min = 1, max = 1 }, --�����15
					{ id = 'g000ig0011', min = 1, max = 1 }, --���15
					{ id = 'g000ig0008', min = 1, max = 1 }, --��������15

					{ id = 'g000ig0021', min = 1, max = 1 }, -- ���� ������
					{ id = 'g000ig0022', min = 1, max = 1 }, -- ���� ����
					{ id = 'g000ig0023', min = 1, max = 1 }, -- ���� �����
					{ id = 'g000ig0024', min = 1, max = 1 }, -- ���� �����

					{ id = orb1(), min = 1, max = 1 }, -- ����� �1
					{ id = scr1(), min = 1, max = 1 }, -- ������ �1
					{ id = p0r(), min = 1, max = 1 }, -- ����� 200

					{ id = trav1(), min = 1, max = 1 }, -- ������ �1
					{ id = jewel1(), min = 1, max = 1 }, -- ����� �1
					{ id = art1(), min = 1, max = 1 }, -- ��� �1					
					{ id = rndy(tdr1), min = 1, max = 1 }, -- ������-�������1
				}
			},
			guard = mobrod(playerRace),
		}
		if scenarioSize == 120 or scenarioSize == 144 then
			local x = xnm(tnmch)
			zoneMerchs[2] =	{
				name = namemrmcmg(x,tnmch),
				description = namemrmcmg(x,tdmch),
				aiPriority = pr(1),
				goods = {
					items = {
						{ id = 'g000ig0001', min = 3, max = 3 }, --���
						{ id = 'g000ig0006', min = 3, max = 3 }, --���100
						{ id = 'g001ig0180', min = 3, max = 3 }, --���25

						{ id = 'g000ig0002', min = 1, max = 1 }, --������15
						{ id = 'g000ig0014', min = 1, max = 1 }, --�����15
						{ id = 'g000ig0011', min = 1, max = 1 }, --���15
						{ id = 'g000ig0008', min = 1, max = 1 }, --��������15

						{ id = 'g000ig0021', min = 1, max = 1 }, -- ���� ������
						{ id = 'g000ig0022', min = 1, max = 1 }, -- ���� ����
						{ id = 'g000ig0023', min = 1, max = 1 }, -- ���� �����
						{ id = 'g000ig0024', min = 1, max = 1 }, -- ���� �����

						{ id = pzm(), min = 1, max = 1 }, -- �����-���� �� ���-���
						{ id = orb1(), min = 1, max = 1 }, -- ����� �1				
						{ id = scr1(), min = 1, max = 1 }, -- ������ �1
						{ id = p0r(), min = 1, max = 1 }, -- ����� 200
						
						{ id = wand1(), min = 1, max = 1 }, -- ����� �1
						{ id = tal1(), min = 1, max = 1 }, -- �����1						
						{ id = rndy(tdr1), min = 1, max = 1 }, -- ������-������� 1
					}
				},
				guard = {
					order = ordguard(),
					subraceTypes = rsub(),
					aiPriority = pr(3),
					value = { min = 150*kef/kr, max = 150*kef*kr },
					loot = {
						items = {
							{ id = rnd('g000ig7001',mana1()), min = 1, max = 1 }, -- 50 ��������� ������ / ��.����� ���
							{ id = 'g000ig0005', min = 1, max = 1 }, --���50						
						}
					}
				}
			}		
		end
	return zoneMerchs
end

-- ����� �2
function Merch2(zoneId)
	local x = xnm(tnmch)
	return	{
		{
			name = namemrmcmg(x,tnmch),
			description = namemrmcmg(x,tdmch),
			aiPriority = pr(1),
			goods = {
				items = {
					{ id = 'g000ig0001', min = 3, max = 3 }, --���
					{ id = 'g000ig0006', min = 3, max = 3 }, --���100
					{ id = 'g000ig0005', min = 3, max = 3 }, --���50

					{ id = 'g000ig0002', min = 1, max = 1 }, --������15
					{ id = 'g000ig0014', min = 1, max = 1 }, --�����15
					{ id = 'g000ig0011', min = 1, max = 1 }, --���15
					{ id = 'g000ig0008', min = 1, max = 1 }, --��������15

					{ id = 'g000ig0021', min = 1, max = 1 }, -- ���� ������
					{ id = 'g000ig0022', min = 1, max = 1 }, -- ���� ����
					{ id = 'g000ig0023', min = 1, max = 1 }, -- ���� �����
					{ id = 'g000ig0024', min = 1, max = 1 }, -- ���� �����

					{ id = scr1(), min = 1, max = 1 }, -- ������ �1
					{ id = orb2(), min = 1, max = 1 }, -- ����� �2				
					{ id = pzm(), min = 1, max = 1 }, -- �����-���� �� ���-���

					{ id = tal2(), min = 1, max = 1 }, -- ����� �2				
					{ id = art2(), min = 1, max = 1 }, -- ��� �2				
					{ id = rnd(p2p(),wand2(),jewel2(),ban1()), min = 1, max = 1 }, -- ����� �2 / ����� �2 / ����� �2 / ����� �1	
					{ id = rndy(tdr2), min = 1, max = 1 }, -- ������-������� 2					
				}
			},
			guard = {
				order = ordguard(),
				subraceTypes = rsub(),
				aiPriority = pr(3),
				value = { min = 350*kef/kr, max = 350*kef*kr },
				loot = {
					items = {
						{ id = rnd('g001ig0431',mana1()), min = 1, max = 1 }, -- 75 ������ / ��.�����
						{ id = 'g001ig0378', min = 1, max = 1 }, --���75
					}
				}
			}
		}
	}		
end

-- ����� �3
function Merch3(scenarioSize)
	local x = xnm(tnmch)
    local zoneMerchs = {}   
		zoneMerchs[1] =	{
			name = namemrmcmg(x,tnmch),
			description = namemrmcmg(x,tdmch),
			aiPriority = pr(1),
			goods = {
				items = {
					{ id = 'g000ig0001', min = 3, max = 3 }, --���
					{ id = 'g000ig0006', min = 3, max = 3 }, --���100
					{ id = 'g001ig0378', min = 3, max = 3 }, --���75

					{ id = 'g000ig0002', min = 1, max = 1 }, --������15
					{ id = 'g000ig0014', min = 1, max = 1 }, --�����15
					{ id = 'g000ig0011', min = 1, max = 1 }, --���15
					{ id = 'g000ig0008', min = 1, max = 1 }, --��������15

					{ id = 'g000ig0021', min = 1, max = 1 }, -- ���� ������
					{ id = 'g000ig0022', min = 1, max = 1 }, -- ���� ����
					{ id = 'g000ig0023', min = 1, max = 1 }, -- ���� �����
					{ id = 'g000ig0024', min = 1, max = 1 }, -- ���� �����

					{ id = scr2(), min = 1, max = 1 }, -- ������ �2
					{ id = p3m(), min = 1, max = 1 }, -- ����� ����� �1
					{ id = pzd(), min = 1, max = 1 }, -- �����-���� �� ��������

					{ id = p3s(), min = 1, max = 1 }, -- ����� �3
					{ id = tal3(), min = 1, max = 1 }, -- ����� �3
					{ id = rnd(trav2(), jewel3(), ban2(), art3()), min = 1, max = 1 }, -- ������ �2 / ����� �3 / ����� �3 / ��� �3 
					{ id = rndy(tdr3), min = 1, max = 1 }, -- ������-������� 3					
				}
			},
			guard = {
				order = ordguard(),
				subraceTypes = rsubnu(),
				aiPriority = pr(3),
				value = { min = 550*kef/kr, max = 550*kef*kr },
				loot = {
					items = {
						{ id = rnd('g000ig7002',mana2()), min = 1, max = 1 }, -- 100 ���������� ������ / ��.���
						{ id = 'g000ig0006', min = 1, max = 1 }, --���100
						{ id = 'g000ig0005', min = 1, max = 1 }, --���50
					}
				}
			}
		}
		if scenarioSize == 144 then
			local x = xnm(tnmch)
			zoneMerchs[2] =	{
				name = namemrmcmg(x,tnmch),
				description = namemrmcmg(x,tdmch),
				aiPriority = pr(1),
				goods = {
					items = {
						{ id = 'g000ig0001', min = 3, max = 3 }, --���
						{ id = 'g000ig0006', min = 3, max = 3 }, --���100
						{ id = 'g001ig0378', min = 3, max = 3 }, --���75

						{ id = 'g000ig0002', min = 1, max = 1 }, --������15
						{ id = 'g000ig0014', min = 1, max = 1 }, --�����15
						{ id = 'g000ig0011', min = 1, max = 1 }, --���15
						{ id = 'g000ig0008', min = 1, max = 1 }, --��������15

						{ id = 'g000ig0021', min = 1, max = 1 }, -- ���� ������
						{ id = 'g000ig0022', min = 1, max = 1 }, -- ���� ����
						{ id = 'g000ig0023', min = 1, max = 1 }, -- ���� �����
						{ id = 'g000ig0024', min = 1, max = 1 }, -- ���� �����

						{ id = orb3(), min = 1, max = 1 }, -- ����� �3				
						{ id = p3m(), min = 1, max = 1 }, -- ����� ����� �1
						{ id = pzd(), min = 1, max = 1 }, -- �����-���� �� ��������

						{ id = wand3(), min = 1, max = 1 }, -- ����� �3
						{ id = rnd(trav2(),art3()), min = 1, max = 1 }, -- ������ �2 / ��� �3
						{ id = rnd(jewel3(),ban2()), min = 1, max = 1 }, -- ����� �3 / ����� �3
						{ id = rndy(tdr3), min = 1, max = 1 }, -- ������-������� 3					
					}
				},
				guard = {
					order = ordguard(),
					subraceTypes = rsubnu(),
					aiPriority = pr(3),
					value = { min = 550*kef/kr, max = 550*kef*kr },
					loot = {
						items = {
							{ id = rnd('g000ig7002',mana2()), min = 1, max = 1 }, -- 100 ���������� ������ / ��.���
							{ id = 'g001ig0378', min = 2, max = 2 }, --���75
						}
					}
				}
			}		
		end
	return zoneMerchs
end

-- ����� �4
function Merch4(scenarioSize)
	local x = xnm(tnmch)
    local zoneMerchs = {}   
		zoneMerchs[1] =	{
			name = namemrmcmg(x,tnmch),
			description = namemrmcmg(x,tdmch),
			aiPriority = pr(1),
			goods = {
				items = {
					{ id = 'g000ig0001', min = 3, max = 3 }, --���
					{ id = 'g000ig0006', min = 3, max = 3 }, --���100
					{ id = 'g001ig0378', min = 3, max = 3 }, --���75
					
					{ id = 'g000ig0002', min = 1, max = 1 }, --������15
					{ id = 'g000ig0014', min = 1, max = 1 }, --�����15
					{ id = 'g000ig0011', min = 1, max = 1 }, --���15
					{ id = 'g000ig0008', min = 1, max = 1 }, --��������15

					{ id = 'g000ig0021', min = 1, max = 1 }, -- ���� ������
					{ id = 'g000ig0022', min = 1, max = 1 }, -- ���� ����
					{ id = 'g000ig0023', min = 1, max = 1 }, -- ���� �����
					{ id = 'g000ig0024', min = 1, max = 1 }, -- ���� �����

					{ id = scr2(), min = 1, max = 1 }, -- ������ �2
					{ id = orb4(), min = 1, max = 1 }, -- ����� �4
					{ id = pzd(), min = 1, max = 1 }, -- �����-���� �� ��������

					{ id = wand4(), min = 1, max = 1 }, -- ����� �4
					{ id = art4(), min = 1, max = 1 }, -- ��� �4
					{ id = rnd(jewel4(),ban3()), min = 1, max = 1 }, -- ����� �4 / ����� �4
					{ id = rndy(tdr4), min = 1, max = 1 }, -- ������-������� 4					
				}
			},
			guard = {
--				order = ordguard(),
				subraceTypes = rsubnu(),
				aiPriority = pr(3),
				value = { min = 1000*kef/kr, max = 1000*kef*kr },
				loot = {
					items = {
						{ id = rnd('g001ig0432',mana2()), min = 1, max = 1 }, -- 125 ������� / ��.���
						{ id = 'g000ig0006', min = 1, max = 1 }, --���100
						{ id = 'g000ig0005', min = 1, max = 1 }, --���50
						{ id = b15(), min = 1, max = 1 }, --��.�����15
						{ id = w15(), min = 1, max = 1 }, --��.����
					}
				}
			}
		}
		if scenarioSize == 120 or scenarioSize == 144 then
			local x = xnm(tnmch)
			zoneMerchs[2] =	{
				name = namemrmcmg(x,tnmch),
				description = namemrmcmg(x,tdmch),
				aiPriority = pr(1),
				goods = {
					items = {
						{ id = 'g000ig0001', min = 3, max = 3 }, --���
						{ id = 'g000ig0006', min = 3, max = 3 }, --���100
						{ id = 'g001ig0378', min = 3, max = 3 }, --���75

						{ id = 'g000ig0002', min = 1, max = 1 }, --������15
						{ id = 'g000ig0014', min = 1, max = 1 }, --�����15
						{ id = 'g000ig0011', min = 1, max = 1 }, --���15
						{ id = 'g000ig0008', min = 1, max = 1 }, --��������15

						{ id = 'g000ig0021', min = 1, max = 1 }, -- ���� ������
						{ id = 'g000ig0022', min = 1, max = 1 }, -- ���� ����
						{ id = 'g000ig0023', min = 1, max = 1 }, -- ���� �����
						{ id = 'g000ig0024', min = 1, max = 1 }, -- ���� �����

						{ id = orb3(), min = 1, max = 1 }, -- ����� �3				
						{ id = pzd(), min = 1, max = 1 }, -- �����-���� �� ��������
						{ id = p5m(), min = 1, max = 1 }, -- ����� ����� �2

						{ id = p4r(), min = 1, max = 1 }, -- ����� �4
						{ id = tal4(), min = 1, max = 1 }, -- ����� �4
						{ id = rnd(jewel4(),ban3()), min = 1, max = 1 }, -- ����� �4 / ����� �4
						{ id = rndy(tdr4), min = 1, max = 1 }, -- ������-������� 4					
					}
				},
				guard = {
--					order = ordguard(),
					subraceTypes = rsubnu(),
					aiPriority = pr(3),
					value = { min = 1000*kef/kr, max = 1000*kef*kr },
					loot = {
						items = {
							{ id = rnd('g001ig0432',mana2()), min = 1, max = 1 }, -- 125 ������� / ��.���
							{ id = 'g000ig0001', min = 3, max = 3 }, --���
							{ id = 'g000ig0006', min = 1, max = 1 }, --���100
							{ id = w15(), min = 1, max = 1 }, --��.����
						}
					}
				}
			}		
		end
	return zoneMerchs
end

-- ����� �5
function Merch5(scenarioSize)
	local x = xnm(tnmch)
    local zoneMerchs = {}   
		zoneMerchs[1] =	{
			name = namemrmcmg(x,tnmch),
			description = namemrmcmg(x,tdmch),
			aiPriority = pr(1),
			goods = {
				items = {
					{ id = 'g000ig0001', min = 3, max = 3 }, --���
					{ id = 'g000ig0006', min = 3, max = 3 }, --���100
					{ id = 'g000ig0018', min = 1, max = 1 }, --���200

					{ id = 'g000ig0002', min = 1, max = 1 }, --������15
					{ id = 'g000ig0014', min = 1, max = 1 }, --�����15
					{ id = 'g000ig0011', min = 1, max = 1 }, --���15
					{ id = 'g000ig0008', min = 1, max = 1 }, --��������15

					{ id = 'g000ig0021', min = 1, max = 1 }, -- ���� ������
					{ id = 'g000ig0022', min = 1, max = 1 }, -- ���� ����
					{ id = 'g000ig0023', min = 1, max = 1 }, -- ���� �����
					{ id = 'g000ig0024', min = 1, max = 1 }, -- ���� �����

					{ id = scr3(), min = 1, max = 1 }, -- ������ �3
					{ id = pzd(), min = 1, max = 1 }, -- �����-���� �� ��������
					{ id = p7m(), min = 1, max = 1 }, -- ����� ����� �3

					{ id = jewel5(), min = 1, max = 1 }, -- ����� �5
					{ id = trav3(), min = 1, max = 1 }, -- ������ �3
					{ id = rnd(ban4(),art5()), min = 1, max = 1 }, -- ����� �5 / �������� �5
					{ id = rndy(tdr5), min = 1, max = 1 }, -- ������-������� 5				
				}
			},
			guard = {
--				order = ordguard(),
				subraceTypes = rsubnu(),
				aiPriority = pr(3),
				value = { min = 1650*kef/kr, max = 1650*kef*kr },
				loot = {
					items = {
						{ id = rnd('g000ig7005',mana3()), min = 1, max = 1 }, -- 250 ����� / ��.�������
						{ id = 'g000ig0001', min = 1, max = 1 }, --���
						{ id = 'g000ig0006', min = 1, max = 1 }, --���100
						{ id = 'g001ig0378', min = 1, max = 1 }, --���75
						{ id = b15(), min = 1, max = 1 }, --��.�����15
						{ id = w15(), min = 1, max = 1 }, --��.����
					}
				}
			}
		}
		if scenarioSize == 120 or scenarioSize == 144 then
			local x = xnm(tnmch)
			zoneMerchs[2] =	{
				name = namemrmcmg(x,tnmch),
				description = namemrmcmg(x,tdmch),
				aiPriority = pr(1),
				goods = {
					items = {
						{ id = 'g000ig0001', min = 3, max = 3 }, --���
						{ id = 'g000ig0006', min = 3, max = 3 }, --���100
						{ id = 'g000ig0018', min = 1, max = 1 }, --���200

						{ id = 'g000ig0002', min = 1, max = 1 }, --������15
						{ id = 'g000ig0014', min = 1, max = 1 }, --�����15
						{ id = 'g000ig0011', min = 1, max = 1 }, --���15
						{ id = 'g000ig0008', min = 1, max = 1 }, --��������15

						{ id = 'g000ig0021', min = 1, max = 1 }, -- ���� ������
						{ id = 'g000ig0022', min = 1, max = 1 }, -- ���� ����
						{ id = 'g000ig0023', min = 1, max = 1 }, -- ���� �����
						{ id = 'g000ig0024', min = 1, max = 1 }, -- ���� �����

						{ id = orb4(), min = 1, max = 1 }, -- ����� �4				
						{ id = pzd(), min = 1, max = 1 }, -- �����-���� �� ��������
						{ id = p5m(), min = 1, max = 1 }, -- ����� ����� �2

						{ id = p5s(), min = 1, max = 1 }, -- ����� �5
						{ id = wand5(), min = 1, max = 1 }, -- ����� �5
						{ id = tal5(), min = 1, max = 1 }, -- ����� �5
						{ id = rndy(tdr5), min = 1, max = 1 }, -- ������-������� 5				
					}
				},
				guard = {
--					order = ordguard(),
					subraceTypes = rsubnu(),
					aiPriority = pr(3),
					value = { min = 1650*kef/kr, max = 1650*kef*kr },
					loot = {
						items = {
							{ id = rnd('g000ig7005',mana3()), min = 1, max = 1 }, -- 250 ����� / ��.�������
							{ id = 'g000ig0001', min = 1, max = 1 }, --���
							{ id = 'g000ig0006', min = 1, max = 1 }, --���100
							{ id = 'g001ig0378', min = 1, max = 1 }, --���75
							{ id = b15(), min = 1, max = 1 }, --��.�����15
							{ id = w15(), min = 1, max = 1 }, --��.����
						}
					}
				}
			}		
		end
	return zoneMerchs
end


----------------

-- ������ �4
function Trainer4()
	local x = xnm(tntrn)
	return {
		{
			name = namemrmcmg(x,tntrn),
			description = namemrmcmg(x,tdtrn),
			aiPriority = pr(0),
			guard = {
--				order = ordguard(),
				subraceTypes = rsubnu(),
				aiPriority = pr(3),
				value = { min = 1000*kef/kr, max = 1000*kef*kr },
				loot = {
					items = {
						{ id = rnd(e4(),orb3()), min = 1, max = 1 }, -- ��.�.����� / ����� �3
						{ id = rnd(b15(),w15()), min = 1, max = 1 }, -- ��.�����15 / ��.����
						{ id = 'g001ig0378', min = 1, max = 1 }, --���75
						{ id = 'g000ig0005', min = 1, max = 1 }, --���50
					}
				}
			}
		}
	}
end

-- ������ �4
function Mercen4()
	local x = xnm(tnmcn)
	return {
		{
			name = namemrmcmg(x,tnmcn),
			description = namemrmcmg(x,tdmcn),
			aiPriority = pr(2),
			units = {
				{ id = rndy(tmercf1), level = 1, unique = true },
				{ id = rndy(tmercf1), level = 1, unique = true },
				{ id = rndy(tmercf1), level = 1, unique = true },
				{ id = rndy(tmercf2), level = 1, unique = true },
				{ id = rndy(tmercf2), level = 1, unique = true },
				{ id = rndy(tmercb1), level = 1, unique = true },
				{ id = rndy(tmercb1), level = 1, unique = true },
				{ id = rndy(tmercb1), level = 1, unique = true },
				{ id = rndy(tmercb2), level = 1, unique = true },
				{ id = rndy(tmercb2), level = 1, unique = true },
			},
			guard = {
--				order = ordguard(),
				subraceTypes = rsubnu(),
				aiPriority = pr(3),
				value = { min = 1000*kef/kr, max = 1000*kef*kr },
				loot = {
					items = {
						{ id = e4(), min = 1, max = 1 }, -- ��.�.�����
						{ id = rnd(b15(),w15()), min = 1, max = 1 }, -- ��.�����15 / ��.����
						{ id = 'g000ig0001', min = 1, max = 1 }, --���
						{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					}
				}
			}
		}
	}
end

----------------

--����� ����� �3
function Mage3(zoneId)
	local x = xnm(tnmg)
	return {
		{
			aiPriority = fpr(zoneId),
			name = namemrmcmg(x,tnmg),
			description = namemrmcmg(x,tdmg),
			spells =  {
				rndy(tmage1),
				rndy(tmage1),
				rndy(tmage1),
				rndy(tmage2),
				rndy(tmage2),
			},
			guard = {
				order = ordguard(),
				subraceTypes = rsub(),
				aiPriority = pr(3),
				value = { min = 450*kef/kr, max = 450*kef*kr },
				loot = {
					items = {
						{ id = scr2(), min = 1, max = 1 }, -- ������ �2
						{ id = 'g001ig0378', min = 1, max = 1 }, --���75
						{ id = 'g000ig0005', min = 1, max = 1 }, --���50
					}
				}
			}
		}
	}
end

--����� ����� �5
function Mage5()
	local x = xnm(tnmg)
	return {
		{
			aiPriority = pr(1),
			name = namemrmcmg(x,tnmg),
			description = namemrmcmg(x,tdmg),
			spells =  {
				rndy(tmage3),
				rndy(tmage3),
				rndy(tmage3),
				rndy(tmage4),
				rndy(tmage4),
			},
			guard = {
--				order = ordguard(),
				subraceTypes = rsubnu(),
				aiPriority = pr(3),
				value = { min = 1650*kef/kr, max = 1650*kef*kr },
				loot = {
					items = {
						{ id = scr3(), min = 1, max = 1 }, -- ������ �3
						{ id = orb3(), min = 1, max = 1 }, -- ����� �3
						{ id = 'g000ig0001', min = 1, max = 1 }, --���
						{ id = 'g001ig0378', min = 1, max = 1 }, --���75
						{ id = 'g000ig0005', min = 1, max = 1 }, --���50
					}
				}
			}
		}
	}
end

-- ����� �������� �5
function Market5()
local x = xnm(tnmrk)
return {
{
	aiPriority = pr(0),
	name = namemrmcmg(x,tnmrk),
	description = namemrmcmg(x,tdmrk),
	exchangeRates = [[
		function getExchangeRates(visitor)
				local k1 = 3
				local k2 = 1
			return {
				{
					Resource.Gold,
					{
					{ Resource.LifeMana, k1, k2 },
					{ Resource.DeathMana, k1, k2 },
					{ Resource.RunicMana, k1, k2 },
					{ Resource.InfernalMana, k1, k2 },
					{ Resource.GroveMana, k1, k2 }
					}
				},
				{
					Resource.LifeMana,
					{
					{ Resource.Gold, k1, k2 },
					{ Resource.DeathMana, k1, k2 },
					{ Resource.RunicMana, k1, k2 },
					{ Resource.InfernalMana, k1, k2 },
					{ Resource.GroveMana, k1, k2 }
					}
				},
				{
					Resource.DeathMana,
					{
					{ Resource.LifeMana, k1, k2 },
					{ Resource.Gold, k1, k2 },
					{ Resource.RunicMana, k1, k2 },
					{ Resource.InfernalMana, k1, k2 },
					{ Resource.GroveMana, k1, k2 }
					}
				},
				{
					Resource.RunicMana,
					{
					{ Resource.LifeMana, k1, k2 },
					{ Resource.DeathMana, k1, k2 },
					{ Resource.Gold, k1, k2 },
					{ Resource.InfernalMana, k1, k2 },
					{ Resource.GroveMana, k1, k2 }
					}
				},
				{
					Resource.InfernalMana,
					{
					{ Resource.LifeMana, k1, k2 },
					{ Resource.DeathMana, k1, k2 },
					{ Resource.RunicMana, k1, k2 },
					{ Resource.Gold, k1, k2 },
					{ Resource.GroveMana, k1, k2 }
					}
				},
				{
					Resource.GroveMana,
					{
					{ Resource.LifeMana, k1, k2 },
					{ Resource.DeathMana, k1, k2 },
					{ Resource.RunicMana, k1, k2 },
					{ Resource.InfernalMana, k1, k2 },
					{ Resource.Gold, k1, k2 }
					}
				},
			}
		end
]],

			
    stock = {
		{resource = Resource.Gold, value = { min = 3000, max = 3000 }},
		{resource = Resource.LifeMana, value = { min = 1000, max = 1000 }},
		{resource = Resource.DeathMana, value = { min = 1000, max = 1000 }},
		{resource = Resource.InfernalMana, value = { min = 1000, max = 1000 }},
        {resource = Resource.RunicMana, value = { min = 1000, max = 1000 }},
        {resource = Resource.GroveMana, value = { min = 1000, max = 1000 }}
    },
		guard = mob(rsubnu(),3,1200,1,1,0,0,0,rnd('g000ig7003',mana3())), -- ������� / ��.�������
},
}
end


----------------

-- ��������� �1
function Mines01(race,scenarioSize)
	local zoneMines = { }	
    if scenarioSize == 96 then
		zoneMines.gold = 1
	else
		zoneMines.gold = 2
	end
 	if race == Race.Human then
		zoneMines.lifeMana = 2
	elseif race == Race.Dwarf then
		zoneMines.runicMana = 2
	elseif race == Race.Undead then
		zoneMines.deathMana = 2
	elseif race == Race.Heretic then
		zoneMines.infernalMana = 2
	elseif race == Race.Elf then
		zoneMines.groveMana = 2
	end    
    return zoneMines
end

-- ��������� �2
function Mines2(race)
    local zoneMines = { }
    zoneMines.gold = 1
	if race == Race.Human then
		zoneMines.runicMana = 1
	elseif race == Race.Dwarf then
		zoneMines.lifeMana = 1
	elseif race == Race.Undead then
		zoneMines.infernalMana = 1
	elseif race == Race.Heretic then
		zoneMines.deathMana = 1
	elseif race == Race.Elf then
		zoneMines.lifeMana = 1
	end
    return zoneMines
end

-- ��������� �3
function Mines3(race)
    local zoneMines = { }
    zoneMines.gold = 1
	if race == Race.Human then
		zoneMines.lifeMana = 1
		zoneMines.infernalMana = 1
	elseif race == Race.Dwarf then
		zoneMines.runicMana = 1
		zoneMines.deathMana = 1
	elseif race == Race.Undead then
		zoneMines.deathMana = 1
		zoneMines.runicMana = 1
	elseif race == Race.Heretic then
		zoneMines.infernalMana = 1
		zoneMines.lifeMana = 1
	elseif race == Race.Elf then
		zoneMines.groveMana = 1
		zoneMines.deathMana = 1
	end
    return zoneMines
end

-- ��������� �4
function Mines4(scenarioSize)
    local zoneMines = { }
	zoneMines.runicMana = 1
	zoneMines.lifeMana = 1
	zoneMines.deathMana = 1
	zoneMines.groveMana = 1
	zoneMines.infernalMana = 1
    if scenarioSize == 96 then
		zoneMines.gold = 1
	else
		zoneMines.gold = 2
	end
    return zoneMines
end

-- ��������� �5
function Mines5()
	return {
		gold = 2,
		runicMana = 1,
		lifeMana = 1,
		deathMana = 1,
		groveMana = 1,
		infernalMana = 1,
	}
end
----------------

-- ������� �1
function Bags1(scenarioSize)
    local zBags = {}   
	if scenarioSize == 96 then
	zBags = {
		count = 3,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g000ig7001',mana1()), min = 1, max = 1 }, -- ��������� ������ / ��.����� ���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = d15(), min = 1, max = 1 }, --��.�������
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
			}
		}
	}
	elseif scenarioSize == 120 then
	zBags = {
		count = 4,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g000ig7001',mana1()), min = 1, max = 1 }, -- ��������� ������ / ��.����� ���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = d15(), min = 1, max = 1 }, --��.�������
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
			}
		}
	}
		
	elseif scenarioSize == 144 then
	zBags = {
		count = 5,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g000ig7001',mana1()), min = 1, max = 1 }, -- ��������� ������ / ��.����� ���
				{ id = rnd('g000ig7001',mana1()), min = 1, max = 1 }, -- ��������� ������ / ��.����� ���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = d15(), min = 1, max = 1 }, --��.�������
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = w15(), min = 1, max = 1 }, --��.����
			}
		}
	}
	end
	return zBags
end

-- ������� �2
function Bags2(scenarioSize)
    local zBags = {}   
	if scenarioSize == 96 then
	zBags = {
		count = 2,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g001ig0431',mana1()), min = 1, max = 1 }, -- ������ / ��.�����
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = b15(), min = 1, max = 1 }, --��.�����15
			}
		}
	}
	elseif scenarioSize == 120 then
	zBags = {
		count = 3,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g001ig0431',mana1()), min = 1, max = 1 }, -- ������ / ��.�����
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
			}
		}
	}
	elseif scenarioSize == 144 then
	zBags = {
		count = 4,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g001ig0431',mana1()), min = 1, max = 1 }, -- ������ / ��.�����
				{ id = rnd('g000ig7001',mana1()), min = 1, max = 1 }, -- ��������� ������ / ��.����� ���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = w15(), min = 1, max = 1 }, --��.����
			}
		}
	}
	end
	return zBags
end

-- ������� �3
function Bags3(scenarioSize)
    local zBags = {}   
	if scenarioSize == 96 then
	zBags = {
		count = 3,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g000ig7002',mana2()), min = 1, max = 1 }, -- ���������� ������ / ��.���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = e4(), min = 1, max = 1 }, --��.�.�����
			}
		}
	}
	elseif scenarioSize == 120 then
	zBags = {
		count = 4,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g000ig7002',mana2()), min = 1, max = 1 }, -- ���������� ������ / ��.���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = e4(), min = 1, max = 1 }, --��.�.�����
			}
		}
	}
	elseif scenarioSize == 144 then
	zBags = {
		count = 5,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g000ig7002',mana2()), min = 1, max = 1 }, -- ���������� ������ / ��.���
				{ id = rnd('g001ig0431',mana1()), min = 1, max = 1 }, -- ������ / ��.�����
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = e4(), min = 1, max = 1 }, --��.�.�����
			}
		}
	}
	end
	return zBags
end

-- ������� �4
function Bags4(scenarioSize)
    local zBags = {}   
	if scenarioSize == 96 then
	zBags = {
		count = 3,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g001ig0432',mana2()), min = 1, max = 1 }, -- ������� / ��.���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = b30(), min = 1, max = 1 }, --��.�����30				
			}
		}
	}
	elseif scenarioSize == 120 then
	zBags = {
		count = 4,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g001ig0432',mana2()), min = 1, max = 1 }, -- ������� / ��.���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = b30(), min = 1, max = 1 }, --��.�����30	
			}
		}
	}
	elseif scenarioSize == 144 then
	zBags = {
		count = 5,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g001ig0432',mana2()), min = 1, max = 1 }, -- ������� / ��.���
				{ id = rnd('g000ig7002',mana2()), min = 1, max = 1 }, -- ���������� ������ / ��.���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = b30(), min = 1, max = 1 }, --��.�����30
			}
		}
	}
	end
	return zBags
end

-- ������� �5
function Bags5(scenarioSize)
    local zBags = {}   
	if scenarioSize == 96 then
	zBags = {
		count = 3,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g000ig7003',mana3()), min = 1, max = 1 }, -- ������� / ��.�������
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = b30(), min = 1, max = 1 }, --��.�����30		
				{ id = e5(), min = 1, max = 1 }, --��.�����500
			}
		}
	}
	elseif scenarioSize == 120 then
	zBags = {
		count = 4,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g000ig7003',mana3()), min = 1, max = 1 }, -- ������� / ��.�������
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = b30(), min = 1, max = 1 }, --��.�����30		
				{ id = e5(), min = 1, max = 1 }, --��.�����500
			}
		}
	}
	elseif scenarioSize == 144 then
	zBags = {
		count = 5,
		aiPriority = pr(1),
		loot = {
			items = {
				{ id = rnd('g000ig7003',mana3()), min = 1, max = 1 }, -- ������� / ��.�������
				{ id = rnd('g001ig0432',mana2()), min = 1, max = 1 }, -- ������� / ��.���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = w15(), min = 1, max = 1 }, --��.����
				{ id = b30(), min = 1, max = 1 }, --��.�����30		
				{ id = e5(), min = 1, max = 1 }, --��.�����500
			}
		}
	}
	end
	return zBags
end

----------------

-- � �����
function mob(mbsub, mbpr, val, res, h100, h75, h50, h25, i1, i2, i3)
	return {
		count = 1,
		subraceTypes = mbsub,
		aiPriority = pr(mbpr),
		value = { min = val*kef/kr, max = val*kef*kr },
		loot = {
			items = {
				{ id = 'g000ig0001', min = res, max = res }, --���
				{ id = 'g000ig0006', min = h100, max = h100 }, --���100
				{ id = 'g001ig0378', min = h75, max = h75 }, --���75
				{ id = 'g000ig0005', min = h50, max = h50 }, --���50
				{ id = 'g001ig0180', min = h25, max = h25 }, --���25
				{ id = i1, min = 1, max = 1 }, --�������1
				{ id = i2, min = 1, max = 1 }, --�������2
				{ id = i3, min = 1, max = 1 }, --�������3
			}
		}
	}
end

-- � ����� ��� ��� ��� ����� - �� ���������
function mob2( mbsub, mbpr, val, res, h100, h75, h50, h25, i1, i2, i3)
	return {
		count = 1,
		subraceTypes = mbsub,
		aiPriority = pr(mbpr),
		value = { min = val*kef/kr, max = val*kef*kr },
		loot = {
			items = {
				{ id = 'g000ig0001', min = res*a2(zoneId), max = res*a2(zoneId) }, --���
				{ id = 'g000ig0006', min = h100*a2(zoneId), max = h100*a2(zoneId) }, --���100
				{ id = 'g001ig0378', min = h75*a2(zoneId), max = h75*a2(zoneId) }, --���75
				{ id = 'g000ig0005', min = h50*a2(zoneId), max = h50*a2(zoneId) }, --���50
				{ id = 'g001ig0180', min = h25, max = h25 }, --���25
				{ id = i1, min = 1, max = 1 }, --�������1
				{ id = i2, min = 1, max = 1 }, --�������2
				{ id = i3, min = 1, max = 1 }, --�������3
			}
		}
	}
end

-- � ����� ������-3-5
function mobps35()
	return {
		count = 1,
		subraceTypes = isw({Subrace.NeutralWater}, rsubnu()),
		aiPriority = pr(3),
		value = { min = 500*kef/kr, max = 500*kef*kr },
		leaderIds = isw({'g000uu7522','g000uu8138','g000uu5126','g000uu7536'}, {} ),
		loot = {
			items = {
				{ id = rnd('g000ig0001','g000ig0006'), min = 1, max = 1 }, --���/���100
				{ id = cry1(), min = 1, max = 1 }, -- �������� ����
			}
		}
	}
end

-- � ����� ������-4-5
function mobps45()
	return {
		count = 1,
		subraceTypes = isw({Subrace.NeutralWater}, rsubnu()),
		aiPriority = pr(3),
		value = { min = 1000*kef/kr, max = 1000*kef*kr },
		leaderIds = isw({'g000uu5127','g000uu5127','g000uu8230'}, {} ),
		loot = {
			items = {
				{ id = rnd('g000ig0001','g000ig0006'), min = 1, max = 1 }, --���/���100
				{ id = rndy(tscrps35), min = 1, max = 1 }, -- ������ ����
				{ id = rnd('g000ig7002','g000ig7002',mana2()), min = 1, max = 1 }, -- ���������� ������ 100 / ���������� ������ 100 / ��.���
			}
		}
	}
end

-- � �����-�������� �� ����� �1
function mobrod(playerRace)
	return {
		count = 1,
		aiPriority = pr(3),
		order = Order.Normal,
		owner = playerRace,
		subraceTypes = { getPlayesubRace(playerRace) },
		value = { min = valrod(playerRace), max = valrod(playerRace) },
		leaderIds = ldrod(playerRace),
		loot = {
			items = {
				{ id = 'g000ig7009', min = 1, max = 1 }, -- ����������� ������� 500
				{ id = rnd('g000ig7002','g000ig7002',mana2()), min = 1, max = 1 }, -- ���������� ������ 100 / ���������� ������ 100 / ��.���
				{ id = rnd('g000ig7001',mana1()), min = 1, max = 1 }, -- 50 ��������� ������ / ��.����� ���
			}
		}
	}
end


----

-- ����� �1
function stacks1(zoneId, scenarioSize)
	local zmob = {}
	local i = 1
	zmob[i] = mob(rsub(),1,100,0,0,0,0,1,d15()) i=i+1 -- d15
	zmob[i] = mob(rsub(),1,100,0,0,0,0,1,orb1()) i=i+1 -- orb1
	zmob[i] = mob(rsub(),1,100,0,0,0,0,1,rnd('g000ig7001',mana1())) i=i+1 -- v50
	zmob[i] = mob(rsub(),1,100,0,0,0,1,0) i=i+1 -- 50 ���

	zmob[i] = mob(rsub(),3,150,0,0,0,0,1,b15()) i=i+1 -- b15
	zmob[i] = mob(rsub(),3,150,0,0,0,0,1,scr1()) i=i+1 -- scr1
	zmob[i] = mob(rsub(),3,150,0,0,0,1,0,d15()) i=i+1
	zmob[i] = mob(rsub(),3,150,0,0,1,0,0) i=i+1 -- 75 ���

	zmob[i] = mob(rsub(),3,200,0,0,0,0,1,w15()) i=i+1 -- w15
	zmob[i] = mob(rsub(),3,200,0,0,0,1,0,b15()) i=i+1

	zmob[i] = mob(rsubnu(),3,250,1,0,0,0,1) i=i+1 -- ���
	zmob[i] = mob(rsubnu(),3,250,0,0,0,1,0,w15()) i=i+1
	
	zmob[i] = mob(rsubnu(),3,300,0,0,0,1,0,b15(),orb1()) i=i+1

	zmob[i] = mob(rsubnu(),3,350,0,0,1,1,0,scr1(),d15()) i=i+1

	zmob[i] = mob({Subrace.NeutralMarsh},3,450,1,1,0,0,0,rndy(tdr1)) i=i+1 -- ������ 1
	
	if scenarioSize == 120 or scenarioSize == 144 then	
	zmob[i] = mob(rsub(),1,100,0,0,0,0,1,d15()) i=i+1
	zmob[i] = mob(rsub(),1,100,0,0,0,1,0) i=i+1
	
	zmob[i] = mob(rsub(),3,150,0,0,0,1,0,orb1()) i=i+1
	zmob[i] = mob(rsub(),3,150,0,0,0,1,0,rnd('g000ig7001',mana1())) i=i+1
	
	zmob[i] = mob(rsub(),3,200,0,0,0,0,1,w15()) i=i+1
	zmob[i] = mob(rsub(),3,200,0,0,1,0,0,scr1()) i=i+1
	
	zmob[i] = mob(rsubnu(),3,250,1,0,0,0,1) i=i+1

	end	
	if scenarioSize == 144 then	
	zmob[i] = mob(rsub(),1,100,0,0,0,0,1,orb1()) i=i+1
	zmob[i] = mob(rsub(),1,100,0,0,0,1,0) i=i+1
	
	zmob[i] = mob(rsub(),3,150,0,0,0,1,0,d15()) i=i+1
	zmob[i] = mob(rsub(),3,150,0,0,0,1,1) i=i+1
	
	zmob[i] = mob(rsub(),3,200,0,0,0,1,0,scr1()) i=i+1
	zmob[i] = mob(rsub(),3,200,0,0,0,1,0,b15()) i=i+1
	end	
	return zmob
end

-- ����� �2
function stacks2(zoneId,scenarioSize)
	local zmob = {}
	local i = 1
	zmob[i] = mob(rsub(),1,300,0,0,1,0,0,w15()) i=i+1
	zmob[i] = mob(rsub(),1,300,0,0,1,0,0,rnd('g001ig0431',mana1())) i=i+1 -- v75 ������ / ��.�����
	
	zmob[i] = mob(rsub(),3,350,0,0,1,1,0,scr1()) i=i+1

	zmob[i] = mob(rsubnu(),3,400,1,1,0,0,0) i=i+1

	zmob[i] = mob(rsubnu(),3,450,0,1,0,0,0,orb2()) i=i+1 -- ����� ��� +100: ��� = 1/3 �����

	zmob[i] = mob(rsubnu(),3,550,0,0,1,0,0,scr2(),b15()) i=i+1

	zmob[i] = mob(rsubdr(),3,valfdr(750,620),1,1,0,1,0,rndy(tdr2)) i=i+1 -- ������ 2
	
	if scenarioSize == 120 or scenarioSize == 144 then	
	zmob[i] = mob(rsub(),1,300,0,0,0,1,0,b15(),d15()) i=i+1
	
	zmob[i] = mob(rsub(),3,350,1,0,1,0,0) i=i+1

	zmob[i] = mob(rsubnu(),3,400,0,0,0,1,0,orb2()) i=i+1

	zmob[i] = mob(rsubnu(),3,450,0,1,0,0,0,scr1(),w15()) i=i+1

	end	
	if scenarioSize == 144 then	
	zmob[i] = mob(rsub(),1,300,0,0,1,0,0,w15()) i=i+1
	
	zmob[i] = mob(rsub(),3,350,0,0,0,1,0,orb1(),rnd('g001ig0431',mana1())) i=i+1 -- ����� �1 + v75 ������ / ��.�����

	zmob[i] = mob(rsubnu(),3,400,0,0,0,1,0,scr2()) i=i+1

	zmob[i] = mob(rsubnu(),3,450,1,1,0,0,0,b15()) i=i+1
	end	
	return zmob
end

-- ����� �3
function stacks3(zoneId,scenarioSize)
	local zmob = {}
	local i = 1
	zmob[i] = mob(rsub(),1,450,0,1,0,0,0,rnd('g000ig7002',mana2())) i=i+1 -- ����� ��� +100: ��� 1/3 + 25 + 25
	zmob[i] = mob(rsub(),1,450,0,1,0,1,0,b15()) i=i+1
	zmob[i] = mob(rsub(),1,450,0,0,1,1,0,w15()) i=i+1

	zmob[i] = mob(rsub(),3,550,0,0,1,0,0,e4()) i=i+1
	zmob[i] = mob(rsub(),3,550,1,0,1,1,0,d15()) i=i+1

	zmob[i] = mob(rsubnu(),3,650,0,1,0,1,0,scr1(),w15()) i=i+1

	zmob[i] = mob(rsubnu(),3,750,0,0,1,1,0,orb2,b15()) i=i+1

	zmob[i] = mob(rsubnu(),3,850,0,1,0,1,0,orb3()) i=i+1 -- ����� ��� +150: ��� = 1/4 �����

	zmob[i] = mob(rsubnu(),3,1000,0,0,0,0,0,scr3(),'g000ig0018') i=i+1 -- ���200

	zmob[i] = mob(rsubdr(),3,1300,1,1,1,0,0,rndy(tdr3)) i=i+1 -- ������ 3

	if scenarioSize == 120 or scenarioSize == 144 then	
	zmob[i] = mob(rsub(),1,450,0,1,0,0,0,orb2()) i=i+1
	zmob[i] = mob(rsub(),1,450,1,0,1,0,0,scr1()) i=i+1

	zmob[i] = mob(rsub(),3,550,0,0,1,1,0,rnd('g000ig7002',mana2())) i=i+1 -- v100 ���������� ������ / ��.���

	zmob[i] = mob(rsubnu(),3,650,0,1,0,1,0,w15(),b15()) i=i+1

	zmob[i] = mob(rsubnu(),3,750,0,0,1,1,0,orb3()) i=i+1

	zmob[i] = mob(rsubnu(),3,850,1,0,1,1,0,scr2(),d15()) i=i+1
	
	end	
	if scenarioSize == 144 then	
	zmob[i] = mob(rsub(),1,450,0,0,1,1,0,w15()) i=i+1
	zmob[i] = mob(rsub(),1,450,1,0,1,0,0,scr1()) i=i+1

	zmob[i] = mob(rsub(),3,550,0,0,0,0,0,orb2(),'g000ig0018') i=i+1 -- ���200

	zmob[i] = mob(rsubnu(),3,650,0,1,0,1,0,w15(),b15()) i=i+1

	zmob[i] = mob(rsubnu(),3,750,0,0,1,1,0,e4(),b15()) i=i+1
	end	
	return zmob
end

-- ����� �4
function stacks4(scenarioSize)
	local zmob = {}
	local i = 1
	zmob[i] = mob(rsub(),3,850,0,2,0,0,0,w15(),b15()) i=i+1 -- ����� ��� +150: ��� 1/4 + 25 + 50
	zmob[i] = mob(rsub(),3,850,1,1,1,0,0,b15()) i=i+1
	zmob[i] = mob(rsub(),3,850,0,0,1,1,0,e4(),scr1()) i=i+1
	zmob[i] = mob(rsub(),3,850,0,1,1,0,0,scr2(),d15()) i=i+1
	
	zmob[i] = mob(rsubnu(),3,1000,0,2,1,0,0,d15()) i=i+1
	zmob[i] = mob(rsubnu(),3,1000,1,1,1,0,0,w15(),scr1()) i=i+1
	zmob[i] = mob(rsubnu(),3,1000,0,1,1,1,0,rnd('g001ig0432',mana2())) i=i+1 -- v125 ������� / ��.���
	
	zmob[i] = mob(rsubnu(),3,1150,0,1,1,1,0,scr2(),w15()) i=i+1
	zmob[i] = mob(rsubnu(),3,1150,0,1,1,0,0,orb3(),b15()) i=i+1

	zmob[i] = mob(rsubnu(),3,1300,0,0,0,0,0,b30(),'g000ig0018') i=i+1 -- ���200
	
	zmob[i] = mob(rsubnu(),3,1450,0,1,1,1,0,orb4()) i=i+1 -- ����� ��� +200: ��� 1/5 + 25 + 50

	zmob[i] = mob(rsubnu(),3,1650,1,1,1,0,0,scr4()) i=i+1

	zmob[i] = mob(rsubdr(),3,2050,1,2,1,0,0,rndy(tdr4)) i=i+1 -- ������ 4
	
	if scenarioSize == 120 or scenarioSize == 144 then	
	zmob[i] = mob(rsub(),1,850,0,2,0,0,0,b15(),scr1()) i=i+1
	zmob[i] = mob(rsub(),1,850,0,2,0,0,0,rnd('g001ig0432',mana2())) i=i+1 -- v125 ������� / ��.���
	
	zmob[i] = mob(rsubnu(),3,1000,1,0,0,0,0,w15(),'g000ig0018') i=i+1 -- ���200
	zmob[i] = mob(rsubnu(),3,1000,0,1,0,1,0,orb3(),w15()) i=i+1
	
	zmob[i] = mob(rsubnu(),3,1150,0,1,1,1,0,e4(),b15()) i=i+1

	zmob[i] = mob(rsubnu(),3,1300,1,1,1,0,0,scr3()) i=i+1
	
	zmob[i] = mob(rsubnu(),3,1450,1,0,1,1,0,orb4()) i=i+1
	end	
	if scenarioSize == 144 then	
	zmob[i] = mob(rsub(),1,850,0,1,1,0,0,e4()) i=i+1
	zmob[i] = mob(rsub(),1,850,1,1,1,0,0,w15(),d15()) i=i+1
	
	zmob[i] = mob(rsubnu(),3,1000,1,0,0,0,0,scr2(),b15(),'g000ig0018') i=i+1 -- ���200
	zmob[i] = mob(rsubnu(),3,1000,0,1,1,1,0,scr1(),w15()) i=i+1
	
	zmob[i] = mob(rsubnu(),3,1150,0,2,0,0,0,orb3(),b15()) i=i+1

	zmob[i] = mob(rsubnu(),3,1300,0,1,1,1,0,b30()) i=i+1
	
	end	
	return zmob
end

-- ����� �5
function stacks5(scenarioSize)
	local zmob = {}
	local i = 1
	zmob[i] = mob(rsub(),3,1450,1,1,1,1,0,scr2(),d15()) i=i+1
	zmob[i] = mob(rsub(),3,1450,1,1,1,1,0,orb3()) i=i+1
	zmob[i] = mob(rsub(),3,1450,1,1,1,0,0,b30()) i=i+1

	zmob[i] = mob(rsubnu(),3,1650,1,1,1,1,0,rnd('g000ig7005',mana3())) i=i+1 -- v250 ����� / ��.�������
	zmob[i] = mob(rsubnu(),3,1650,1,1,1,1,0,w15(),b15(),e4()) i=i+1
	zmob[i] = mob(rsubnu(),3,1650,1,2,0,1,0,scr2(),w15(),d15()) i=i+1

	zmob[i] = mob(rsubnu(),3,1850,1,2,0,1,0,e4(),w15(),b15()) i=i+1
	zmob[i] = mob(rsubnu(),3,1850,1,1,0,1,0,orb3(),b30()) i=i+1
	zmob[i] = mob(rsubnu(),3,1850,1,0,1,0,0,'g000ig0018') i=i+1 -- ���200

	zmob[i] = mob(rsubnu(),3,2050,1,1,1,1,0,orb4(),b15()) i=i+1
	zmob[i] = mob(rsubnu(),3,2050,1,1,1,0,0,e5()) i=i+1

	zmob[i] = mob(rsubnu(),3,2250,1,1,1,0,0,orb5()) i=i+1

	zmob[i] = mob(rsubnu(),3,2450,1,0,0,1,0,scr5(),'g000ig0018') i=i+1 -- ���200

	zmob[i] = mob(rsubdr(),3,2850,2,2,0,0,0,rndy(tdr5)) i=i+1 -- ������ 5

	if scenarioSize == 120 or scenarioSize == 144 then	
	zmob[i] = mob(rsub(),3,1450,1,1,1,1,0,rnd('g000ig7005',mana3())) i=i+1 -- v250 ����� / ��.�������
	zmob[i] = mob(rsubnu(),3,1450,1,1,1,1,0,e4(),w15()) i=i+1

	zmob[i] = mob(rsubnu(),3,1650,1,1,1,0,0,b30(),d15()) i=i+1
	zmob[i] = mob(rsubnu(),3,1650,1,1,1,0,0,orb4()) i=i+1

	zmob[i] = mob(rsubnu(),3,1850,1,0,0,1,0,orb3(),w15(),b15(),'g000ig0018') i=i+1 -- ���200

	zmob[i] = mob(rsubnu(),3,2050,1,1,2,1,0,scr3(),b15(),d15()) i=i+1

	zmob[i] = mob(rsubnu(),3,2250,1,1,1,0,0,e5(),b15()) i=i+1
	end	
	if scenarioSize == 144 then
	zmob[i] = mob(rsub(),3,1450,1,2,0,0,0,orb3(),w15(),b15()) i=i+1
	zmob[i] = mob(rsub(),3,1450,1,1,1,1,0,e4(),w15()) i=i+1

	zmob[i] = mob(rsubnu(),3,1650,1,1,1,1,0,scr4()) i=i+1
	zmob[i] = mob(rsubnu(),3,1650,1,1,1,0,0,b30(),w15()) i=i+1

	zmob[i] = mob(rsubnu(),3,1850,1,1,0,0,0,'g000ig0018') i=i+1 -- ���200

	zmob[i] = mob(rsubnu(),3,2050,1,1,1,1,0,orb5()) i=i+1
	end	
	return zmob
end

----------------
----------------
-- �������
-- ���� 01 ����
function Zone01(zoneId, playerRace, zoneSize, scenarioSize)
	return {
		id = zoneId,
		race = playerRace,
		size = zoneSize,
		type = Zone.PlayerStart,
		border = Border.Open,
		capital = Capital01(zoneId, playerRace),
		towns = Town01(scenarioSize, playerRace, zoneId), 
		ruins = Ruin01(scenarioSize,zoneId),
		merchants = Merch01(scenarioSize,playerRace),		
		mines = Mines01(playerRace,scenarioSize), 
		bags = Bags1(scenarioSize),
		stacks = stacks1(zoneId, scenarioSize),
	}
end

-- ���� 2
function Zone2(zoneId, playerRace, zoneSize, scenarioSize)
	return {
		id = zoneId,
		race = playerRace,
		size = zoneSize,
		type = Zone.Junction, -- Junction -- Treasure
		border = Border.Open,
		towns = Town2(scenarioSize, playerRace, zoneId), 		
		merchants = Merch2(zoneId),		
		ruins = Ruin2(scenarioSize,zoneId),
		mines = Mines2(playerRace), 
		bags = Bags2(scenarioSize),
		stacks = stacks2(zoneId, scenarioSize),
	}
end

-- ���� 3
function Zone3(zoneId, playerRace, zoneSize, scenarioSize)
	return {
		id = zoneId,
		race = playerRace,
		size = zoneSize,
		type = Zone.Treasure, 
		border = vbrd(),
		gapChance = math.random(30, 70),	
		towns = Town3(scenarioSize, playerRace, zoneId), 		
		ruins = Ruin3(scenarioSize,zoneId),
		merchants = Merch3(scenarioSize),		
		mages = Mage3(zoneId),
		mines = Mines3(playerRace), 
		bags = Bags3(scenarioSize),
		stacks = stacks3(zoneId, scenarioSize),
	}
end

-- ���� 4
function Zone4(zoneId, zoneSize, scenarioSize)	
	dz4 = {
		id = zoneId,
		size = zoneSize,
		type = Zone.Treasure, -- Treasure / Junction
		border = vbrd(),
		gapChance = math.random(30, 60),
		towns = Town4(scenarioSize), 		
		ruins = Ruin4(scenarioSize),	
		merchants = Merch4(scenarioSize),		
		mines = Mines4(scenarioSize), 
		bags = Bags4(scenarioSize),
		stacks = stacks4(scenarioSize),
	}
	if tmrnd == 0 and zoneId == 10 or tmrnd == 0 and zoneId == 12 then
		dz4.trainers = Trainer4()
	end
	if tmrnd == 0 and zoneId == 9 or tmrnd == 0 and zoneId == 11 then
		dz4.mercenaries = Mercen4()
	end
	if tmrnd == 1 and zoneId == 10 or tmrnd == 1 and zoneId == 12 then
		dz4.mercenaries = Mercen4()
	end
	if tmrnd == 1 and zoneId == 9 or tmrnd == 1 and zoneId == 11 then
		dz4.trainers = Trainer4()
	end
	return dz4
end

-- ���� 5 �����
function Zone5(zoneId, zoneSize, scenarioSize)
	return {
		id = zoneId,
		size = zoneSize,
		type = Zone.Treasure, 
		border = vbrd(),
		gapChance = math.random(30, 50),
		towns = Town5(scenarioSize), 		
		ruins = Ruin5(scenarioSize),
		merchants = Merch5(scenarioSize),		
		mages = Mage5(),
		resourceMarkets = Market5(),
		mines = Mines5(), 
		bags = Bags5(scenarioSize),
		stacks = stacks5(scenarioSize),
	}
end

----------------
-- ������ � �������
function getZones(races, scenarioSize)
	local sizeT01 = 15 -- math.random(15, 16) -- scenarioSize / 7 (15)
	local sizeT2 = 6 -- math.random(6, 7) -- scenarioSize / 17 (6)
	local sizeT3 = 10 -- math.random(10, 11) -- scenarioSize / 14 (10)
	local sizeT4 = 12 -- math.random(12, 13) -- scenarioSize / 10 (12)
	local sizeT5center = 14 -- math.random(14, 15) -- scenarioSize / 9 (14)

	local zones = {}
		
		--������������� ������� ������� �����
		mixtaitwn(scenarioSize)
		for i = #taitwn, 2, -1 do
			local j = math.random(i)
			taitwn[i], taitwn[j] = taitwn[j], taitwn[i]
		end
		--  ���������� ������ ��������
		gtdr1() gtdr2() gtdr3() gtdr4() gtdr5()
		
		--���� ������ ����
		zones[1] = Zone01(0, races[1], sizeT01, scenarioSize) --������� �01 ����1
        zones[6] = Zone3(5, races[1], sizeT3, scenarioSize) --����� �3 ����1
		zones[14] = Zone2(13, races[1], sizeT2, scenarioSize) --�2 ����1
		zones[15] = Zone2(14, races[1], sizeT2, scenarioSize) --�2 ����1

		--�4
        zones[11] = Zone4(10, sizeT4, scenarioSize) --�.������

		--������������� ������� ������� �����
		mixtaitwn(scenarioSize)
		for i = #taitwn, 2, -1 do
			local j = math.random(i)
			taitwn[i], taitwn[j] = taitwn[j], taitwn[i]
		end
		--  ���������� ������ ��������
		gtdr1() gtdr2() gtdr3() gtdr4() gtdr5()

		--���� ������ ����
		zones[2] = Zone01(1, races[2], sizeT01, scenarioSize) --������ �01 ����2
        zones[7] = Zone3(6, races[2], sizeT3, scenarioSize) --����� �3 ����2
		zones[16] = Zone2(15, races[2], sizeT2, scenarioSize) --�2 ����2
		zones[17] = Zone2(16, races[2], sizeT2, scenarioSize) --�2 ����2

		--�4
		zones[12] = Zone4(11, sizeT4, scenarioSize) --�.�����

		--������������� ������� ������� �����
		mixtaitwn(scenarioSize)
		for i = #taitwn, 2, -1 do
			local j = math.random(i)
			taitwn[i], taitwn[j] = taitwn[j], taitwn[i]
		end
		--  ���������� ������ ��������
		gtdr1() gtdr2() gtdr3() gtdr4() gtdr5()

		--���� ������� ����
		zones[3] = Zone01(2, races[3], sizeT01, scenarioSize) --����� �01 ����3
        zones[8] = Zone3(7, races[3], sizeT3, scenarioSize) --������� �3 ����3
		zones[18] = Zone2(17, races[3], sizeT2, scenarioSize) --�2 ����3
		zones[19] = Zone2(18, races[3], sizeT2, scenarioSize) --�2 ����3

        --�4
		zones[13] = Zone4(12, sizeT4, scenarioSize) --����������

		--������������� ������� ������� �����
		mixtaitwn(scenarioSize)
		for i = #taitwn, 2, -1 do
			local j = math.random(i)
			taitwn[i], taitwn[j] = taitwn[j], taitwn[i]
		end
		--  ���������� ������ ��������
		gtdr1() gtdr2() gtdr3() gtdr4() gtdr5()

		--���� �������� ����
		zones[4] = Zone01(3, races[4], sizeT01, scenarioSize) --����� �01 ����4
		zones[9] = Zone3(8, races[4], sizeT3, scenarioSize) --��������� �3 ����4
		zones[20] = Zone2(19, races[4], sizeT2, scenarioSize) --�2 ����4
		zones[21] = Zone2(20, races[4], sizeT2, scenarioSize) --�2 ����4

		--�4
        zones[10] = Zone4(9, sizeT4, scenarioSize) --�����
				
		--�����
        zones[5] = Zone5(4, sizeT5center, scenarioSize) --������

	return zones
end

----------------
-- ������� (������)


-- �������
function getZoneConnections(scenarioSize)
	local connections = {

		--�4-�����
		{ from = 9, to = 4, guard = mobps45() }, { from = 10, to = 4, guard = mobps45() }, { from = 11, to = 4, guard = mobps45() }, { from = 12, to = 4, guard = mobps45() }, 			
		{ from = 9, to = 4 }, { from = 10, to = 4 }, { from = 11, to = 4 }, { from = 12, to = 4 }, 			

		--�3-�����
		{ from = 5, to = 4, guard = mobps35() }, { from = 6, to = 4, guard = mobps35() }, { from = 7, to = 4, guard = mobps35() },  { from = 8, to = 4, guard = mobps35() }, 	
		{ from = 5, to = 4 }, { from = 6, to = 4 }, { from = 7, to = 4 },  { from = 8, to = 4 }, 	

		--�4-�3
		{ from = 9, to = 5 }, { from = 9, to = 8 }, 
		{ from = 9, to = 5 }, { from = 9, to = 8 }, 
		{ from = 10, to = 5 }, { from = 10, to = 6 }, 
		{ from = 10, to = 5 }, { from = 10, to = 6 }, 
		{ from = 11, to = 6 }, { from = 11, to = 7 }, 
		{ from = 11, to = 6 }, { from = 11, to = 7 }, 
		{ from = 12, to = 7 }, { from = 12, to = 8 }, 
		{ from = 12, to = 7 }, { from = 12, to = 8 }, 

		--�2-�3 � �2-�4
		{ from = 13, to = 5 }, { from = 13, to = 9 }, 
		{ from = 14, to = 5 }, { from = 14, to = 10 }, 
		
		{ from = 15, to = 6 }, { from = 15, to = 10	 }, 
		{ from = 16, to = 6 }, { from = 16, to = 11 }, 
			
		{ from = 17, to = 7 }, { from = 17, to = 11 }, 
		{ from = 18, to = 7 }, { from = 18, to = 12 }, 
				
		{ from = 19, to = 8 }, { from = 19, to = 12 },
		{ from = 20, to = 8 }, { from = 20, to = 9 }, 
	
		--�0-�2-�2 � �0-�3 =������_������
		{ from = 0, to = 13, guard = mob(rsub(),3,350,0,0,1,0,0,rnd('g000ig7001',mana1()),rndy(tscrps12)) },
		{ from = 0, to = 14, guard = mob(rsub(),3,350,0,0,1,0,0,rnd('g000ig7001',mana1()),rndy(tscrps12)) },
		{ from = 0, to = 5 },

		{ from = 1, to = 15, guard = mob(rsub(),3,350,0,0,1,0,0,rnd('g000ig7001',mana1()),rndy(tscrps12)) },
		{ from = 1, to = 16, guard = mob(rsub(),3,350,0,0,1,0,0,rnd('g000ig7001',mana1()),rndy(tscrps12)) },
		{ from = 1, to = 6 }, 
		
		{ from = 2, to = 17, guard = mob(rsub(),3,350,0,0,1,0,0,rnd('g000ig7001',mana1()),rndy(tscrps12)) },
		{ from = 2, to = 18, guard = mob(rsub(),3,350,0,0,1,0,0,rnd('g000ig7001',mana1()),rndy(tscrps12)) },
		{ from = 2, to = 7 },
		
		{ from = 3, to = 19, guard = mob(rsub(),3,350,0,0,1,0,0,rnd('g000ig7001',mana1()),rndy(tscrps12)) },
		{ from = 3, to = 20, guard = mob(rsub(),3,350,0,0,1,0,0,rnd('g000ig7001',mana1()),rndy(tscrps12)) },
		{ from = 3, to = 8 }, 
		
	}
	return connections
end

----------------

-- ����������
function getDiplomacyRelations(races)
	if gmode == 2 then
		return {
			{
				raceA = races[2],
				raceB = races[3],
				relation = 100,
				alliance = true,
				permanentAlliance = true,
			},
			{
				raceA = races[2],
				raceB = races[4],
				relation = 100,
				alliance = true,
				permanentAlliance = true,
			},			
			{
				raceA = races[3],
				raceB = races[4],
				relation = 100,
				alliance = true,
				permanentAlliance = true,
			},
			{
				raceA = races[1],
				raceB = races[2],
				relation = 0,
				alwaysAtWar  = true,
			},
			{
				raceA = races[1],
				raceB = races[3],
				relation = 0,
				alwaysAtWar  = true,
			},
			{
				raceA = races[1],
				raceB = races[4],
				relation = 0,
				alwaysAtWar  = true,
			},
		}
	elseif gmode == 4 then
		return {
			{
				raceA = races[3],
				raceB = races[4],
				relation = 100,
				alliance = true,
				permanentAlliance = true,
			},
			{
				raceA = races[1],
				raceB = races[3],
				relation = 0,
				alwaysAtWar  = true,
			},
			{
				raceA = races[1],
				raceB = races[4],
				relation = 0,
				alwaysAtWar  = true,
			},
			{
				raceA = races[2],
				raceB = races[3],
				relation = 0,
				alwaysAtWar  = true,
			},
			{
				raceA = races[2],
				raceB = races[4],
				relation = 0,
				alwaysAtWar  = true,
			},
		}
	else
		return {}
	end
end

----------------

function getTemplateContents(races, scenarioSize, parameters)
	local contents = {}

	if parameters then
		if parameters[1] then
			gmode = parameters[1]
		end
		if parameters[2] then
			aixp = parameters[2]
		end
		if parameters[3] then
			aitowns = parameters[3]
		end
		if parameters[4] then
			kef = parameters[4] / 100
		end
		if parameters[5] then
			brd = parameters[5]
		end
	end
	
	contents.scenarioVariables = getScenarioVariables()
	contents.diplomacy = getDiplomacyRelations(races)
	contents.zones = getZones(races, scenarioSize)
	contents.connections = getZoneConnections()

	return contents
end

----------------

template = {
	name = 'Redfish 1.1',
	description = '������ ���� � ������, ��������� ����������� ������ ���.\n����� ���� � ������ ����� ������ ��� ������-��������.\n������ �������� ���������� � ������������ � ������� ������� � Templates\\Redfish_description.txt\n����� �������: Uchenik\n���������� ����� �-����: 2200700846776804',
	minSize = 96,
	maxSize = 144,
	maxPlayers = 4,
    forest = 50,
    roads = 50,
    startingGold = 0, --600
	iterations = 100000,

	customParameters = {
		{
			name = '����� �������', -- parameters[1]
			values = {
				'����',
				'���� (� � �����)',
				'����',
				'���� (� � �����)',
				'����',
				'����',
				'���� (��� ��)',
			},
			default = gmode
		},
		{
			name = '����� ����', -- parameters[2]
			unit = 'XP',
            min = 0,
            max = 1500,
            step = 100,
			default = aixp,
		},		
		{
			name = '������� ����', -- parameters[3]
			values = {
				'0 �������',
				'1 �����',
				'2 ������',
				'3 ������',
			},
			default = aitowns,
		},	
		{
			name = '���� ��������', -- parameters[4]
			unit = '%',
            min = 50,
            max = 200,
            step = 5,
			default = kef,
		},		
		{
			name = '�������', -- parameters[5]
			values = {
				'��������-����',
				'��������-����',
				'��������-����',
				'���������',
			},
			default = brd,
		},	
	},


forbiddenUnits = {

-- ����������� �����-�������
'g001uu0021', --�������
'g001uu0020', --��������
'g001uu0019', --������ �� ������
'g001uu0022', --��������
'g001uu0045', --�������
'g001uu0044', --����������� �����
'g001uu0046', --������
'g070uu0003', --������
'g001uu0047', --����������
'g001uu0072', --����������
'g070uu0004', --����������
'g001uu0071', --��������
'g001uu0070', --������
'g001uu0073', --���������
'g001uu0098', --�������� �����
'g070uu0001', --���������
'g001uu0097', --���������
'g001uu0096', --������ ������
'g001uu0099', --������
'g001uu8010', --������
'g070uu0002', --������
'g001uu8009', --������ ����
'g001uu8011', --����� ����
'g001uu8012', --������

-- ����� � �������� ���-��� ����� (������ � �������)
'g000uu6002', -- ������ 9950
'g000uu6102', -- ������
'g000uu6011', -- �������� ������� 2790
'g000uu6111', -- �������� �������
'g000uu8001', -- ������� 9995
'g000uu8002', -- ��������� 9995
'g000uu8003', -- ���� ����� 9995
'g000uu8307', -- ��������������� 4740
'g001uu8307', -- ���������������
'g000uu8050', -- �������� ���������� 3360
'g000uu8150', -- �������� ����������
'g000uu8008', -- ������ ���������� 2175
--'g000uu6010', -- ����� 2570
--'g000uu6110', -- �����
--'g000uu7584', -- �������� ����� 1800
--'g000uu8006', -- �������� ������ 3465
--'g001uu7584', -- �������� ����� 1800
--'g000uu7585', -- ������ ������ �. 1600
--'g001uu7585', -- ������ ������
--'g000uu8298', -- ��������� ����� �. 1200
--'g001uu8298', -- ��������� �����

-- ��� ������ �� �������� � ����� �����
'g000uu6005', -- ��� ����� 1760
'g000uu6105', -- ��� ����� �.
'g005uu6002', -- ����� ������������� 1660
'g000uu7503', -- ����� ������������� �.
'g000uu8256', -- �������� ������ 1500


-- ����������� �������-������� � ������� ���-��� �����
'g000uu0017', -- ��������
'g000uu8035', -- ��������
'g000uu7570', -- �������
'g000uu7569', -- �����
'g000uu8264', -- ������
'g000uu0151', -- ���������������
'g000uu0013', -- ���������
'g000uu8214', -- ���������
'g000uu8034', -- ��������� ����������
'g000uu0150', -- ��������
'g003uu8039', -- ����� �����
'g003uu8038', -- ��� ��������
'g000uu8235', -- ��������
'g000uu2002', -- ��������
'g003uu8037', -- ��������� �����

-- ����������� ������ � ������ �������������� 20%
'g000uu5236', -- ����
'g000uu5117', -- ������
'g000uu5101', -- ����������
'g000uu8308', -- ������� �������
'g000uu5130', -- ���������
'g000uu7556', -- ������-����
'g000uu7533', -- �����
'g000uu7510', -- ����� ��� �����
'g000uu7616', -- ���� ����� �����
'g000uu6004', -- ������� ��� �.
'g000uu5201', -- ������ �.
'g000uu7539', -- �������
'g000uu7592', -- ������
'g000uu7516', -- ��� ����� �.
'g000uu5262', -- ������� �.
'g000uu7614', -- �������� ��� �����
'g000uu7553', -- �������-�����

--��� ����������� ������� � ������� ���-��� ����� (������ � �������)
'g000uu8287', -- ��.������ �.
'g000uu8288', -- ��� �������� �.
'g000uu7519', -- ������� �.
'g000uu8215', -- ��������� �.
'g000uu8262', -- �������� �.
'g000uu8289', -- ����� ����� �
'g000uu7521', -- �������� �.
'g000uu5006', -- ������� ������
'g000uu8222', -- ����� �. �����
'g000uu8218', -- �����
'g000uu7544', -- ��������������
'g000uu8213', -- ������-�����
'g001uu8262', -- ��������
'g000uu2021', -- �����������
'g000uu6107', -- ������ ����-����
'g000uu7619', -- ����� ������
'g000uu8044', -- ������ ���� ���� �.
'g000uu8245', -- ����������� ����� 800

--������
'g000uu8266', -- �������--
'g000uu8265', -- ���� �������--
'g000uu8144', -- ������ ���� ���� �.
'g000uu2008', -- ����� ������
'g000uu8318', -- ����� ������ �.
'g000uu2022', -- �����
'g000uu8263', -- �������������

--���. ���������
'g000uu8220', -- ����������
'g000uu8033', -- ������ ����
'g000uu8133', -- ������ ���� �.
'g000uu7605', -- ��������� ���
'g001uu7592', -- ������ 
},

forbiddenItems = {

--�����
'g000ig9006', --����� ����������
'g000ig9039', --����� ����� (�����)
'g000ig9040', --����� �����
'g001ig0460', --����� �������� ��� (���������� ����) 300
'g001ig0463', --����� ����� (����� ����) 300
'g001ig0442', --����� ����� ��� ������������ ����������� ������ � ������� � �������� � ������� 2x2) 400
'g001ig0136', --����� ���������� � ������ 800
'g000ig9009', --����� ������ (���_�����) 800
'g001ig0465', --����� ��������� (2_�����) 800
'g001ig0441', --����� ���������� ���� (-������� �������) 500

--������
'g000ig8005', --����������� ������

--���������
'g001ig0596', --�������
'g001ig0414', --����������� ������� ������ (��������)
'g000ig3015', --�������� ���� (��������)
'g000ig3016', --��� ������ (��������)
'g001ig0158', --��������� ����� (��������)
'g000ig3021', --������ �������� (��������)
'g001ig0581', --������������ �������� (��������)

--��������� � ����� �� ����
'g001ig0175', --�������� ���������� (��������)
'g001ig0204', --����� ���������� (��������)

--������
'g001ig0154', --����� ����������

--������
'g000ig9140', --�������� ������ �������� (���� - �����������)

--������
'g001ig0572', --������ "������������ �����" +20 ����
'g001ig0086', --������ "�������� ����"
'g001ig0700', --������ "Tenebrae insania" ��������� ����� �������� ���� �������� � ������ � ������ ������ ���. 450
'g000ig5040', --������ "����� ������" +50% ����

--������ � ����� �� ����
'g001ig0575', --������ "����������� ����� 
'g001ig0092', --������ "������� ����"
'g001ig0073', --������ "������������� �c�����"
'g001ig0440', --������ "��������� �������� (����� ���������)
'g001ig0439', --������ "Et seminibus discordiae (��������� ��������� �� 1 � ������� 5x5)
'g001ig0095', --������ "��������� ������" 300
'g001ig0103', --������ "����������� ������"
'g001ig0570', --������ "Terra oblivionem" -25% ����� 350
'g001ig0714', --������ "Adflictio ignavia" -50% ������������ 450

--�����
'g001ig0023', --���� ��������������� (�������� �����)
'g001ig0017', --����� ���� ����� (�������� �����)
'g001ig0317', --����� ����������� ������� +15 �������� (����� 400 �����)
'g000ig0020', --������� ���������� +50% �����
'g000ig0019', --������� �������������� +60% ���
'g000ig0017', --������� ������������ +50% �����
'g001ig0126', --������� ���������� (+50% � ��������� ��) 800
'g001ig0129', --����� ���������� +50% 1000
'g001ig0751', --����� ������������ (�� ��������� ����� -20% � �������� ��������� ��, ������� ���) 1000
'g001ig0318', --����� ���������� ����� (25% ��������)

--����� � ����� �� ����
'g001ig0607', --����� ������� ������ (������� ��������� ������ �� 50%) 500
'g001ig0584', --����� ������� (+1 ������� � +10% ����� ���������� ��� �������������� ������ � ������) 400
'g001ig0530', --����� ����������� ���� (������)
'g001ig0010', --���� ������ �� ����� �����
'g001ig0608', --������� ������������ ������ (-�����.��.�� 50%)
'g001ig0017', --����� ���� ������


-- �������� �� �����/��� �����
'g000ig6004', --����� �����������
'g000ig6005', --����� �������
'g001ig0390', --����� �����
'g001ig0389', --����� ����������������
'g001ig0513', --����� �������� ����

'g000ig5032', --������ "����� ��������"
'g000ig5053', --������ "Paraseus"

'g000ig5094', --������ "������ ������"
'g000ig5006', --������ "���������"
'g000ig5100', --������ "��������"
'g000ig5099', --������ "����������"
'g001ig0567', --������ "�������� �����"
'g001ig0566', --������ "�������� ����������"
'g000ig5087', --������ "����� �����"
},
	getContents = getTemplateContents
}