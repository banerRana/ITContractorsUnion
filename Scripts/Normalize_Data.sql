update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, '"', '');
update LCA_Disclosure_Data_2022To2025Q4 set SECONDARY_ENTITY_BUSINESS_NAME  = replace(SECONDARY_ENTITY_BUSINESS_NAME, '"', '');

update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, '  ', ' ');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, ', Inc', ' Inc');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, ',Inc', ' Inc');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, ', INC', ' INC');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, 'INC,', 'INC');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, ', LLC', ' LLC');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, ',LLC', ' LLC');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, 'Inc.', 'Inc');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, 'INC.', 'INC');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, ',INC', ' INC');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_NAME = replace(EMPLOYER_NAME, 'LLC.', 'LLC');


update LCA_Disclosure_Data_2022To2025Q4 set SECONDARY_ENTITY_BUSINESS_NAME = replace(SECONDARY_ENTITY_BUSINESS_NAME, ', Inc', ' Inc');
update LCA_Disclosure_Data_2022To2025Q4 set SECONDARY_ENTITY_BUSINESS_NAME = replace(SECONDARY_ENTITY_BUSINESS_NAME, ',Inc', ' Inc');
update LCA_Disclosure_Data_2022To2025Q4 set SECONDARY_ENTITY_BUSINESS_NAME = replace(SECONDARY_ENTITY_BUSINESS_NAME, ', INC', ' INC');
update LCA_Disclosure_Data_2022To2025Q4 set SECONDARY_ENTITY_BUSINESS_NAME = replace(SECONDARY_ENTITY_BUSINESS_NAME, ', LLC', ' LLC');
update LCA_Disclosure_Data_2022To2025Q4 set SECONDARY_ENTITY_BUSINESS_NAME = replace(SECONDARY_ENTITY_BUSINESS_NAME, ',LLC', ' LLC');
update LCA_Disclosure_Data_2022To2025Q4 set SECONDARY_ENTITY_BUSINESS_NAME = replace(SECONDARY_ENTITY_BUSINESS_NAME, 'Inc.', 'Inc');
update LCA_Disclosure_Data_2022To2025Q4 set SECONDARY_ENTITY_BUSINESS_NAME = replace(SECONDARY_ENTITY_BUSINESS_NAME, 'INC.', 'INC');
update LCA_Disclosure_Data_2022To2025Q4 set SECONDARY_ENTITY_BUSINESS_NAME = replace(SECONDARY_ENTITY_BUSINESS_NAME, ',INC', ' INC');
update LCA_Disclosure_Data_2022To2025Q4 set SECONDARY_ENTITY_BUSINESS_NAME = replace(SECONDARY_ENTITY_BUSINESS_NAME, UNHEX('C29D'), '');
update LCA_Disclosure_Data_2022To2025Q4 set SECONDARY_ENTITY_BUSINESS_NAME = replace(SECONDARY_ENTITY_BUSINESS_NAME, 'œMorgan', 'Morgan');

update LCA_Disclosure_Data_2022To2025Q4 set LAWFIRM_NAME_BUSINESS_NAME = replace(LAWFIRM_NAME_BUSINESS_NAME, ', Inc', ' Inc');
update LCA_Disclosure_Data_2022To2025Q4 set LAWFIRM_NAME_BUSINESS_NAME = replace(LAWFIRM_NAME_BUSINESS_NAME, ',Inc', ' Inc');
update LCA_Disclosure_Data_2022To2025Q4 set LAWFIRM_NAME_BUSINESS_NAME = replace(LAWFIRM_NAME_BUSINESS_NAME, ', INC', ' INC');
update LCA_Disclosure_Data_2022To2025Q4 set LAWFIRM_NAME_BUSINESS_NAME = replace(LAWFIRM_NAME_BUSINESS_NAME, ', LLC', ' LLC');
update LCA_Disclosure_Data_2022To2025Q4 set LAWFIRM_NAME_BUSINESS_NAME = replace(LAWFIRM_NAME_BUSINESS_NAME, ',LLC', ' LLC');
update LCA_Disclosure_Data_2022To2025Q4 set LAWFIRM_NAME_BUSINESS_NAME = replace(LAWFIRM_NAME_BUSINESS_NAME, 'Inc.', 'Inc');
update LCA_Disclosure_Data_2022To2025Q4 set LAWFIRM_NAME_BUSINESS_NAME = replace(LAWFIRM_NAME_BUSINESS_NAME, 'INC.', 'INC');
update LCA_Disclosure_Data_2022To2025Q4 set LAWFIRM_NAME_BUSINESS_NAME = replace(LAWFIRM_NAME_BUSINESS_NAME, ',INC', ' INC');

update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_ADDRESS2 = replace(EMPLOYER_ADDRESS2, '  ', ' ');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_ADDRESS2 = replace(EMPLOYER_ADDRESS2, '  ', ' ');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_ADDRESS2 = replace(EMPLOYER_ADDRESS2, 'STE. ', 'SUITE ');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_ADDRESS2 = replace(EMPLOYER_ADDRESS2, 'Ste. ', 'Suite ');

update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_ADDRESS1 = replace(EMPLOYER_ADDRESS1, 'RD.', 'ROAD');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_ADDRESS1 = replace(EMPLOYER_ADDRESS1, 'RD', 'ROAD');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_ADDRESS1 = replace(EMPLOYER_ADDRESS1, 'Rd.', 'Road');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_ADDRESS1 = replace(EMPLOYER_ADDRESS1, 'Rd', 'Road');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_ADDRESS1 = replace(EMPLOYER_ADDRESS1, 'AVE.', 'AVENUE');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_ADDRESS1 = replace(EMPLOYER_ADDRESS1, 'Ave.', 'Avenue');

update LCA_Disclosure_Data_2022To2025Q4 set WORKSITE_ADDRESS1 = replace(WORKSITE_ADDRESS1, '\n', '');

update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_POC_PHONE = replace(EMPLOYER_POC_PHONE, '+', '');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_POC_PHONE = replace(EMPLOYER_POC_PHONE, '-', '');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_POC_PHONE = replace(EMPLOYER_POC_PHONE, ' ', '');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_POC_PHONE = replace(EMPLOYER_POC_PHONE, '(', '');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_POC_PHONE = replace(EMPLOYER_POC_PHONE, ')', '');

update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_PHONE = replace(EMPLOYER_PHONE, '+', '');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_PHONE = replace(EMPLOYER_PHONE, '-', '');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_PHONE = replace(EMPLOYER_PHONE, ' ', '');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_PHONE = replace(EMPLOYER_PHONE, '(', '');
update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_PHONE = replace(EMPLOYER_PHONE, ')', '');
