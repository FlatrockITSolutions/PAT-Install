wget raw.github.com/tritakanguyen/PAT/main/PickAssistant.py ~

install(){

	sudo mv ~/PickAssistant.py /usr/local/bin/PickAssistant.py

	if cat ~/.zshrc | grep 'picklist'

	then 

		echo "Pick Assistant Tool is ready to use."

	else{ 
		echo "alias picklist='python3 /usr/local/bin/PickAssistant.py'" >> ~/.zshrc
		source ~/.zshrc
		echo "Pick Assistant Tool is ready to use."} }

if ls /usr/local/bin | grep PickAssistant.py

then

	if diff ~/PickAssistant.py /usr/local/bin/PickAssistant.py

	then 
		install

	else
		echo "PickAssistant is up to date."
		sudo rm ~/PickAssistant.py

else
	install
