#include<stdio.h>
#include<stdlib.h>
#include<string.h>
typedef struct{
	char studentid[20];
	char name[20];
	char gender[10];
	char department[50];
	int age;
	float height;
	float weight;
	float chest;
	char year[5];
	char month[3];
	char day[3];	
}PhysicalExamination;
typedef struct{
	char studentid[20];
	char name[20];
	char gender[10];
	char department[50];
	char diagnosis[200];
	char year[5];
	char month[3];
	char day[3];
}MedicalHistory; 
void registerPhysicalExamination(){              //登记体检信息
	PhysicalExamination pe;
	FILE *file = fopen("physicalexamination.txt","a");
	if(file == NULL){
		perror("无法打开文件");
		return;
	}
	printf("学号:");
	scanf("%s",pe.studentid);
	printf("姓名:");
	scanf("%s",pe.name);
	printf("性别:");
	scanf("%s",pe.gender);
	printf("系别:");
	scanf("%s",pe.department);
		do{
			printf("年龄:");
			float temp_age;
			if(scanf("%f",&temp_age) != 1 || temp_age <= 0 || temp_age != (float)((int)temp_age) ){
				printf("输入错误，请输入正整数年龄\n");
				while(getchar() != '\n');
			}else{
				pe.age = (int)temp_age;
				break;
			}
		}while(1);
		do{
			printf("身高（米）:");
			if(scanf("%f",&pe.height) != 1 || pe.height <= 0){
				printf("输入错误，请输入正确的身高值\n");
				while(getchar() != '\n');
			}
		}while(pe.height <= 0);
		do{
			printf("体重（千克）:");
			if(scanf("%f",&pe.weight) != 1 || pe.weight <= 0){
				printf("输入错误，请输入正确的体重值。\n");
				while(getchar() != '\n');
			}
		}while(pe.weight <= 0);		
		do{
			printf("胸围（厘米）:");
			if(scanf("%f",&pe.chest) != 1 || pe.chest <= 0){
				printf("输入错误，请输入正确的胸围值\n");
				while(getchar() != '\n');
			}
		}while(pe.chest <= 0);
	printf("年份:");
	scanf("%s",pe.year);
	printf("月:");
	scanf("%s",pe.month);
	printf("日:");
	scanf("%s",pe.day); 
	fprintf(file,"%s %s %s %s %d %f %f %f %s %s %s\n",
	pe.studentid,pe.name,pe.gender,pe.department,pe.age,pe.height,pe.weight,pe.chest,pe.year,pe.month,pe.day);
	fclose(file);
	printf("体检信息登记成功\n");
} 
void registerMedicalHistory(){     //登记病历信息
	MedicalHistory mh;
	FILE *file = fopen("medicalhistory.txt","a");
	if(file == NULL){
		perror("无法打开文件");
		return;	
	}
	printf("学号:");
	scanf("%s",mh.studentid);
	printf("姓名:");
	scanf("%s",mh.name);
	printf("性别:");
	scanf("%s",mh.gender);
	printf("系别:");
	scanf("%s",mh.department);
	getchar();
	printf("诊断:");
	scanf("%[^\n]",mh.diagnosis);
	printf("年份:");
	scanf("%s",mh.year);
	printf("月:");
	scanf("%s",mh.month);
	printf("日:");
	scanf("%s",mh.day); 
	fprintf(file,"%s %s %s %s %s %s %s %s\n",mh.studentid,mh.name,mh.gender,mh.department,mh.diagnosis,mh.year,mh.month,mh.day);
	fclose(file);
	printf("病历信息登记成功\n");
}
void modifyPhysicalExamination(){        //修改体检信息 
	char studentid[20];
	char year[5];
	int flag = 0; 
	PhysicalExamination pe;
	FILE *file = fopen("physicalexamination.txt","r");
	FILE *tempfile = fopen("temp.txt","w");
	if(file == NULL || tempfile == NULL){
		perror("无法打开文件");
		return; 
	}
	printf("要修改的学生学号:");
	scanf("%s",studentid);
	printf("输入年份:");
	scanf("%s",year);
	while(fscanf(file,"%s %s %s %s %d %f %f %f %s %s %s\n",pe.studentid,pe.name,pe.gender,pe.department,&pe.age,&pe.height,&pe.weight,&pe.chest,pe.year,pe.month,pe.day) != EOF){
		if (strcmp(pe.studentid,studentid) == 0 && strcmp(pe.year,year) == 0){	
			flag = 1;	
		    printf("新的学号:");
			scanf("%s",pe.studentid);
			printf("新的姓名:");
			scanf("%s",pe.name);
			printf("新的性别:");
			scanf("%s",pe.gender);
			printf("新的系别:");
			scanf("%s",pe.department);
			do{
				printf("新的年龄:");
				float temp_age;
				if(scanf("%f",&temp_age) != 1 || temp_age <= 0 || temp_age !=(int)temp_age ){
					printf("输入错误，请输入正整数年龄\n");
					while(getchar() != '\n');
				}else{
					pe.age = (int)temp_age;
					break;
				}
			}while(1);
			do{
				printf("新的身高（米）:");
				if(scanf("%f",&pe.height) != 1 || pe.height <= 0){
					printf("输入错误，请输入正确的身高值\n");
					while(getchar() != '\n');
				}
			}while(pe.height <= 0);
			do{
				printf("新的体重（千克）:");
				if(scanf("%f",&pe.weight) != 1 || pe.weight <= 0){
					printf("输入错误，请输入正确的体重值。\n");
					while(getchar() != '\n');
				}
			}while(pe.weight <= 0);	
			do{
				printf("新的胸围（厘米）:");
				if(scanf("%f",&pe.chest) != 1 || pe.chest <= 0){
					printf("输入错误，请输入正确的胸围值\n");
					while(getchar() != '\n');
				}
			}while(pe.chest <= 0);
			printf("新的年份:");
			scanf("%s",pe.year);
			printf("新的月份:");
			scanf("%s",pe.month);
			printf("新的日期:");
			scanf("%s",pe.day);	
		}
		fprintf(tempfile,"%s %s %s %s %d %f %f %f %s %s %s\n",pe.studentid,pe.name,pe.gender,pe.department,pe.age,pe.height,pe.weight,pe.chest,pe.year,pe.month,pe.day);
	}
	fclose(file);
	fclose(tempfile);
	if(flag == 0){
		remove("temp.txt");
		printf("未找到指定的学生记录。\n");
	}else{
		remove("physicalexamination.txt");
		rename("temp.txt","physicalexamination.txt");
		printf("体检信息修改成功\n"); 
	}
}
void modifyMedicalHistory(){			//修改病历信息 
	char studentid[20];
	char year[5];
	int flag = 0;
	MedicalHistory mh;
	FILE *file = fopen("medicalhistory.txt","r");
	FILE *tempfile = fopen("temp.txt","w");
	if(file == NULL || tempfile == NULL){
		perror("无法打开文件");
		return; 
	}
	printf("要修改的学生学号:");
	scanf("%s",studentid);
	printf("输入年份:");
	scanf("%s",year);
	while(fscanf(file,"%s %s %s %s %s %s %s %s\n",mh.studentid,mh.name,mh.gender,mh.department,mh.diagnosis,mh.year,mh.month,mh.day) != EOF){
		if (strcmp(mh.studentid,studentid) == 0 && strcmp(mh.year,year)){
			flag = 1;
			printf("新的学号:");
			scanf("%s",mh.studentid);
			printf("新的姓名:");
			scanf("%s",mh.name);
			printf("新的性别:");
			scanf("%s",mh.gender);
			printf("新的系别:");
			scanf("%s",mh.department);
			printf("新的诊断:");
			scanf("%[^\n]",mh.diagnosis);
			printf("%s",mh.year);
			printf("新的月份：");
			scanf("%s",mh.month);
			printf("新的日期：");
			scanf("%s",mh.day);	
		}
		fprintf(tempfile,"%s %s %s %s %s %s %s %s\n",	mh.studentid,mh.name,mh.gender,mh.department,mh.diagnosis,mh.year,mh.month,mh.day);
	}
	fclose(file);
	fclose(tempfile);
	if(flag == 0){
		printf("未找到指定学生记录。\n");
		remove("temp.txt");
	}else{
			remove("medicalhistory.txt");
			rename("temp.txt","medicalhistory.txt");
			printf("病历信息修改成功\n"); 
	}
}
void deletePhysicalExamination(){           //删除体检信息 
	char studentid[20];
	char year[5];
	int flag = 0;
	PhysicalExamination pe;
	FILE *file = fopen("physicalexamination.txt","r");
	FILE *tempfile = fopen("temp.txt","w");
	if(file == NULL || tempfile == NULL){
		perror("无法打开文件");
		return; 
	}
	printf("要删除的学生号：");
	scanf("%s",studentid);
	printf("输入年份:");
	scanf("%s",year);
	while(fscanf(file,"%s %s %s %s %d %f %f %f %s %s %s\n",pe.studentid,pe.name,pe.gender,pe.department,&pe.age,&pe.height,&pe.weight,&pe.chest,pe.year,pe.month,pe.day) != EOF) {
		if(strcmp(pe.studentid,studentid)!= 0 || strcmp(pe.year,year) !=0){
			fprintf(tempfile,"%s %s %s %s %d %f %f %f %s %s %s\n",
			pe.studentid,pe.name,pe.gender,pe.department,pe.age,pe.height,pe.weight,pe.chest,pe.year,pe.month,pe.day);
		}else{
			flag = 1;
		}
	}
	fclose(file);
	fclose(tempfile);
	if(flag == 0){
		printf("未找到指定学生记录。\n");
		remove("temp.txt");
	}else{
		remove("physicalexamination.txt");
		rename("temp.txt","physicalexamination.txt");
		printf("体检信息删除成功\n");
	}	
}
void deleteMedicalHistory(){                   //删除病历信息 
	char studentid[20];
	char year[5];
	int flag = 0;
	MedicalHistory mh;
	FILE *file = fopen("medicalhistory.txt","r");
	FILE *tempfile = fopen("tempfile.txt","w");
	if(file == NULL || tempfile == NULL){
		perror("无法打开文件");
		return;
	}
	printf("要删除的学生号：");
	scanf("%s",studentid);
	printf("输入年份:");
	scanf("%s",year);
	while(fscanf(file,"%s %s %s %s %s %s %s %s\n",mh.studentid,mh.name,mh.gender,mh.department,mh.diagnosis,mh.year,mh.month,mh.day) != EOF) {
		if(strcmp(mh.studentid,studentid) == 0 && strcmp(mh.year,year) == 0){
			flag = 1;
		}else{
			fprintf(tempfile,"%s %s %s %s %s %s %s %s\n",mh.studentid,mh.name,mh.gender,mh.department,mh.diagnosis,mh.year,mh.month,mh.day);
		}
	}
	fclose(file);
	fclose(tempfile);
	if(flag == 0){
		printf("未找到指定学生记录。\n");
		remove("temp.txt");
	}else{
		remove("medicalhistory.txt");
		rename("temp.txt","medicalhistory.txt");
		printf("病历信息删除成功\n");
	}	
}
void queryStudentInfo(){             //查询学生信息
	char choice;
	char studentid[20];
	int flag = 0;
	printf("选择查询类型（P：所有人体检信息，M：所有人病历信息，A：个人体检信息，B：个人病历信息）：");
	scanf("%s",&choice);
	if(choice =='p' || choice == 'P'){
		PhysicalExamination pe;
		FILE *file = fopen("physicalexamination.txt","r");
		if(file == NULL){
			perror("无法打开文件"); 
			return; 
		}
		printf("学号\t姓名\t性别\t系别\t年龄\t身高\t体重\t胸围\t日期\n");
		while(fscanf(file,"%s %s %s %s %d %f %f %f %s %s %s\n",	pe.studentid,pe.name,pe.gender,pe.department,&pe.age,&pe.height,&pe.weight,&pe.chest,pe.year,pe.month,pe.day) != EOF){
			printf("%s\t%s\t%s\t%s\t%d\t%.2f\t%.2f\t%.2f\t%s-%s-%s\n",pe.studentid,pe.name,pe.gender,pe.department,pe.age,pe.height,pe.weight,pe.chest,pe.year,pe.month,pe.day);	
		}
		fclose(file);
	}
	else if(choice == 'm' || choice == 'M'){
		MedicalHistory mh;
		FILE *file = fopen("medicalhistory.txt","r");
		if(file == NULL){
			perror("无法打开文件");
			return; 
		}
		printf("学号\t姓名\t性别\t系别\t诊断\t日期\n");
		while(fscanf(file,"%s %s %s %s %s %s %s %s\n",mh.studentid,mh.name,mh.gender,mh.department,mh.diagnosis,mh.year,mh.month,mh.day) != EOF){
			printf("%s\t%s\t%s\t%s\t%s\t%s-%s-%s\n",mh.studentid,mh.name,mh.gender,mh.department,mh.diagnosis,mh.year,mh.month,mh.day);
		}
		fclose(file);
	}else if(choice == 'a' || choice == 'A'){
		PhysicalExamination pe;
		printf("输入要查找的学号：");
		scanf("%s",studentid); 
		FILE *file = fopen("physicalexamination.txt","r");
		if(file == NULL){
			perror("无法打开文件。");
			return; 
		}
		while(fscanf(file,"%s %s %s %s %d %f %f %f %s %s %s\n",pe.studentid,pe.name,pe.gender,pe.department,&pe.age,&pe.height,&pe.weight,&pe.chest,pe.year,pe.month,pe.day) != EOF){
			if(strcmp(studentid,pe.studentid) == 0){
				flag = 1;
				printf("%s %s %s %s %d %.2f %.2f %.2f %s-%s-%s\n",pe.studentid,pe.name,pe.gender,pe.department,pe.age,pe.height,pe.weight,pe.chest,pe.year,pe.month,pe.day);	
			}
		}
		fclose(file);
		if(flag == 0){
			printf("未找到指定学生记录。\n");
		}
	}else if(choice == 'b' ||choice == 'B'){
		MedicalHistory mh;
		printf("输入要查找的学号：");
		scanf("%s",studentid);
		FILE *file = fopen("medicalhistory.txt","r");
		if(file == NULL){
			perror("无法打开文件");
			return; 
		}
		while(fscanf(file,"%s %s %s %s %s %s %s %s\n",mh.studentid,mh.name,mh.gender,mh.department,mh.diagnosis,mh.year,mh.month,mh.day) != EOF){
			if(strcmp(studentid,mh.studentid) == 0){
				flag = 1;
				printf("%s %s %s %s %s %s %s %s %s\n",mh.studentid,mh.name,mh.gender,mh.department,mh.diagnosis,mh.year,mh.month,mh.day);
			}
		}
		fclose(file);
		if(flag == 0){
			printf("未找到指定学生记录。\n");
		}
	}
	else{
		printf("无效选择\n"); 
	}
}
void statisticsPhysicalExamination(){
	char choice;
	printf("选择查询信息（G.一般统计，D.动态分析）：");
	scanf("%s",&choice);
	if(choice == 'g' || choice == 'G'){
		int sumage = 0;
		float sumht,sumwt,sumch;
		float avght,avgwt,avgch,avgage;
		PhysicalExamination pe;
		int count = 0;
		FILE *file = fopen("physicalexamination.txt","r");
		if(file == NULL){
			perror("无法打开文件");
			return;
		}
		while(fscanf(file,"%s %s %s %s %d %f %f %f %s %s %s\n",	pe.studentid,pe.name,pe.gender,pe.department,&pe.age,&pe.height,&pe.weight,&pe.chest,pe.year,pe.month,pe.day) != EOF){
			count ++;
			sumage += pe.age;
			sumht += pe.height;
			sumwt += pe.weight;
			sumch += pe.chest;
		}
		fclose(file);
		avght = sumht/count;
		avgwt = sumwt/count;
		avgch = sumch/count;
		printf("体检信息记录总数:%d\n平均年龄为：%.2f\n平均身高为：%.2f\n平均体重为：%.2f\n平均胸围为：%.2f\n",	count,avgage,avght,avgwt,avgch);	
	}else if(choice == 'd' || choice == 'D'){
		char studentid[20];
		float weight[10];
		float chest[10];
		int year[10],month[10],day[10];
		PhysicalExamination pe;
		int count = 0;
		int flag = 0;
		printf("要查询的学号：");
		scanf("%s",studentid);
		FILE *file =  fopen("physicalexamination.txt","r");
		if(file == NULL){
			perror("无法打开文件");
			return;
		}
		while( fscanf(file,"%s %s %s %s %d %f %f %f %s %s %s",	pe.studentid,pe.name,pe.gender,pe.department,&pe.age,&pe.height,&pe.weight,&pe.chest,pe.year,pe.month,pe.day) != EOF){
			if(strcmp(studentid, pe.studentid) == 0){
				if(count < 10){
					weight[count] = pe.weight;
					chest[count] = pe.chest;
					sscanf(pe.year,"%d",&year[count]);
					sscanf(pe.month,"%d",&month[count]);
					sscanf(pe.day,"%d",&day[count]);
					count++;
					flag=1;
				}else{
					printf("超出最大记录数（10条）");
					break;
				}
			}
		}
		fclose(file);
		if(flag == 1){
			float w_sum_growth,c_sum_growth;
			for(int i = 1;i < count;i++){
				w_sum_growth += weight[i]  - weight[i-1];
				c_sum_growth += chest[i]  - chest[i-1];	
			}
			float w_total_growth = weight[count - 1] - weight[0];          //计算总增长量
		    float c_total_growth = chest[count - 1] - chest[0];
		    int start_year = year[0],end_year = year[count - 1];         //计算时间段
		    int start_month = month[0],end_month = month[count - 1];
		    int start_day = day[0],end_day = day[count - 1];
		    int total_years = end_year - start_year;
		    if(end_month < start_month || end_month ==start_month && end_day < start_day){
		    	total_years--;
			}
			float w_average_growth_per_year = w_sum_growth/total_years;	        //计算平均年增长值
			float c_average_growth_per_year = c_sum_growth/total_years;
			float w_growth_rate =  (w_total_growth/total_years)*100;            //计算年增长率
			float c_growth_rate =  (c_total_growth/total_years)*100;
			printf("体重年增长值为%.2f，胸围年增长值为%.2f，体重年增长率为%.2f%%,胸围年增长率为%.2f%%。\n",w_average_growth_per_year,c_average_growth_per_year,w_growth_rate,c_growth_rate);
		}else{
			printf("未找到学生信息。");
			return;
		}
	}
}

int main(){
int choice;
	while(1){
		printf("\n——————学生健康档案管理系统———————\n");
		printf("——————1.登记体检信息——————————\n");
		printf("——————2.登记病历信息——————————\n");
		printf("——————3.修改体检信息——————————\n");
		printf("——————4.修改病历信息——————————\n");
		printf("——————5.删除体检信息——————————\n");
		printf("——————6.删除病历信息——————————\n");
		printf("——————7.查询学生信息——————————\n");
		printf("——————8.查询统计信息——————————\n");
		printf("——————9.退出系统————————————\n");
		printf("请输入您的选择：");
	if(scanf("%d", &choice) != 1) {    // 清除输入缓冲区
            while(getchar() != '\n');
            printf("无效的输入，请输入数字。\n");
            continue;
    }
	switch(choice){
		case 1:
			registerPhysicalExamination();
			break;
		case 2:
			registerMedicalHistory();
			break;
		case 3:
			modifyPhysicalExamination();
			break;
		case 4:
			modifyMedicalHistory();
			break;
		case 5:
			deletePhysicalExamination();
			break;
		case 6:
			deleteMedicalHistory();
			break;
		case 7:
			queryStudentInfo();
			break;
		case 8:
			statisticsPhysicalExamination();
			break;
		case 9:
			printf("感谢使用本系统，再见\n") ;
			return 0;
		default:
			printf("无效的选择，请重新输入。\n");
		}
	}
	return 0;
}
