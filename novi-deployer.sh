#!/bin/bash

branch_name="develop"

echo '................................'
echo 'Step 1: Switch to root ... '
echo '................................'

sudo su -

echo '................................'
echo 'Step 2: Updating branch '${branch_name}' ... '
echo '................................'

git fetch
git checkout $branch_name
git reset --hard origin/$branch_name

echo '................................'
echo 'Step 3: Enter novitat environment ... '
echo '................................'

# source /home/ubuntu/.bash_profile workon novitat

echo '................................'
echo 'Step 4: Run bower install ... '
echo '................................'

bower install

echo '................................'
echo 'Step 5: Run Django Pipeline ... '
echo '................................'

# Django Pipeline runner ...

echo '................................'
echo 'Step 6: Run application requirements ... '
echo '................................'

pip install -r requirements.txt

echo '................................'
echo 'Step 7: Run application migrations  ... '
echo '................................'

./manage.py migrate

echo '................................'
echo 'Step 8: Restart application ... '
echo '................................'

# sudo supervisorctl restart novitat

echo '................................'
echo 'Step 9: DONE! ... '
echo '................................'




