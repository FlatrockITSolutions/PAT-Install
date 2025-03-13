#!/bin/bash

wget raw.github.com/tritakanguyen/PAT/main/PickAssistant.py ~

if ls /usr/local/bin | grep -q PickAssistant.py; then
    if diff -q ~/PickAssistant.py /usr/local/bin/PickAssistant.py; then
	echo "alias picklist='python3 /usr/local/bin/PickAssistant.py'" >> ~/.zshrc
	source ~/.zshrc > /dev/null
	echo "PickAssistant is up to date."
 	sudo rm ~/PickAssistant.py*
    else
        echo "Pick Assistant is out of date; updating"
        sudo mv ~/PickAssistant.py /usr/local/bin/PickAssistant.py
        if cat ~/.zshrc | grep -q 'picklist'; then
            source ~/.zshrc > /dev/null
	    echo "Pick Assistant Tool is ready to use."
        else
            echo "alias picklist='python3 /usr/local/bin/PickAssistant.py'" >> ~/.zshrc
            source ~/.zshrc > /dev/null
            echo "Pick Assistant Tool is ready to use"
        fi
    fi
else
    sudo mv ~/PickAssistant.py /usr/local/bin/PickAssistant.py
    if cat ~/.zshrc | grep -q 'picklist'; then
    	source ~/.zshrc > /dev/null
        echo "Pick Assistant Tool is ready to use."
    else
        echo "alias picklist='python3 /usr/local/bin/PickAssistant.py'" >> ~/.zshrc
        source ~/.zshrc > /dev/null
        echo "Pick Assistant Tool is ready to use"
    fi
fi
echo "Template: picklist"
