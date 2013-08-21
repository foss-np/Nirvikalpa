#!/bin/bash
bold=`tput bold`
normal=`tput sgr0`
echo "What is your name?"
read name
echo
echo "Hi ${bold}${name}${normal}, I thank you for contributing to Nirvikalpa 4.0, Please proceed."
echo
echo "How many folders do you want to create?"
read num
for ((x=1; x<=num; x++));
  {
    echo "Name of folder number" $((x)) ":"
    read folder_name
    cd ../applications
    cp -r SAMPLE $folder_name && cd $folder_name
    #file_name = detail.wiki
    echo "What is the name of the Application?"
    read app_name
    echo "Version of Application: "
    read app_version
    echo "==About ${app_name} [${app_version}]==" >> detail.wiki
    echo "Now, write a short note with some details of the app. eg: type, usage, alternative to, benefits etc"
    read app_details
    echo "${app_details}" >> detail.wiki
    echo "What is the name of image file you have stored in images folder? If you haven't done it then ${bold}plese do it ${normal}and give me ${bold}full name of the image file with extension${normal}:"
    read app_image
    echo "{{images/${app_image}}}" >> detail.wiki
    echo "Now let's add some features of this application!"
    echo "==Features==" >> detail.wiki
    echo "Give one feature of this application: "
    read app_feature
    echo "${app_feature}" >> detail.wiki
    echo "Don\'t be lazy and add another feature if you have one. It would benefit everyone. ${bold}Remember, you are shaping the future of Nirvikalpa 4.0${normal}. It would really be nice if there are at least 3 or 4 features in complete sentence."
    while true
    do
      echo "Add another feature? Enter y/n:"
      read ans
      if [ "$ans" == "y" ]
        then
          echo "Enter feature: "
          read app_feature
          echo "${app_feature}" >> detail.wiki
      elif [ "$ans" == "n" ]
      then
        break
      else
        echo "Wrong option entered, try again"
      fi
    done
    echo "Do you have some related links for this application? (It would be better if you provide at least one related link, related link may include reviews done by some people for this application) Enter y/n:"
    read ans
    if [ "$ans" == "y" ]
    then
      echo "==Related Links==" >> detail.wiki
      while true
      do

        echo "Give me full link: "
        read app_link
        echo "*${app_link}" >> detail.wiki
        echo "Do you have another link? Enter y/n:"
        read ans
        if [[ "$ans" == "n" ]]
        then
          break
        fi
      done
    fi
     echo "Now we will edit the meta file...."
     sleep 1
     echo "URL for home page of the app: "
     read app_home
     echo "HOMEPAGE=${app_home}" >> meta
     echo "Download URL for the app: "
     read app_download
     echo "DOWNLOAD_URL=${app_download}" >> meta
     echo "VERSION=${app_version}" >> meta
     echo "Executable name of the application: (The name of file that will be downloaded):"
     read app_exec
     echo "EXECUTABLE_NAME=${app_exec}" >> meta
     echo "Linux name of the application: "
     read app_linux
     echo "LINUX_NAME=${app_linux}" >> meta
     cd ..
     echo "Congratulations!! ${bold}${app_name}${normal} has been documented. If you want to edit it manually, you can check detail.wiki.sample & meta.sample file and edit detail.wiki and meta file"
   }
