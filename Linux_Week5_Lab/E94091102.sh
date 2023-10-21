#!/bin/bash

# missing list | wrong list
missing="missing_list"
wrong="wrong_list"

## build file
cp student_id ${missing}
cp student_id ${wrong}

# compare
students=$(ls -F compressed_files/ | grep -v \/$)
for student in ${students}
do
    name=${student%%.*}
    ext=${student#*.}
    ## delete exist
    sed -i "/${name}/d" ${missing}
    ## delete correct
    if [ ${ext} = "zip" ] || [ ${ext} = "rar" ] || [ ${ext} = "tar.gz" ]; then
        sed -i "/${name}/d" ${wrong}
    fi
done

# build folder
folder_zip="compressed_files/zip"
folder_rar="compressed_files/rar"
folder_tar="compressed_files/tar.gz"
folder_unknown="compressed_files/unknown"
mkdir ${folder_zip}
mkdir ${folder_rar}
mkdir ${folder_tar}
mkdir ${folder_unknown}

## unzip
mv compressed_files/*.zip ${folder_zip}
unzip "${folder_zip}/*.zip" -d ${folder_zip}

## unrar
mv compressed_files/*.rar ${folder_rar}
unrar x "${folder_rar}/*.rar" ${folder_rar}


## tar.gz
mv compressed_files/*.tar.gz ${folder_tar}
for tar in ${folder_tar}/*.tar.gz
do
    tar xvf $tar -C ${folder_tar}
done 

mv compressed_files/*.* ${folder_unknown}
#move out tar.gz/
mv ${folder_unknown}/tar.gz ${folder_tar}

exit 0
