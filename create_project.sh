#! /bin/bash

# 프로젝트 이름 입력
while :
do
        echo -n "enter new project(user) name >>> "
        read project_name
        echo -n "sure to create '/home/$project_name/'? [y/n] >>> "
        read yn
        if [ $yn = "y" ] || [ $yn = "Y" ]
        then
                break
        fi
done

# 유져 / 프로젝트 생성
adduser $project_name

# 템플릿 복사
cp -r /home/ml-dev-template/new_project/www /home/$project_name
echo "created template '/home/$project_name' ..."

# deploy.sh 배포 경로 업데이트
sed -i "s/sample/$project_name/" /home/$project_name/www/deploy.sh
chmod 755 /home/$project_name/www/deploy.sh
echo "set '/home/$project_name/www/deploy.sh' ..."

# python 가상환경 생성
python3 -m venv /home/$project_name/www/venv
echo "created python venv '/home/$project_name/www/venv' ..."

# 유저권한 반영
chown -R $project_name:$project_name /home/$project_name
echo "set project owner & group named '$project_name' ..."
