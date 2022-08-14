#!/bin/sh

CREATED_FILE_PATH="../workspace/svelte_app/src/html"
DYNAMIC_DIR_PATH="${CREATED_FILE_PATH}"

if [ $1 = "-h" ];then
  echo "<dir> <dir> <dir> <file nema> <title>"
  echo "dir => m:modanJs e:event"
else

  for VAR in "${@:1:($#-2)}" ;
    do
      if [ $VAR = "m" ];then
        VAR="modanJs"
      fi

      if [ $VAR = "e" ];then
        VAR="event"
      fi

      if [ $VAR = "f" ];then
        VAR="form"
      fi

      if [ $VAR = "er" ];then
        VAR="errorHundle"
      fi

      if [ $VAR = "p" ];then
        VAR="promise"
      fi
      DYNAMIC_DIR_PATH="${DYNAMIC_DIR_PATH}/${VAR}"
      TO_PAGE_LINK="${TO_PAGE_LINK}/${VAR}"
      mkdir $DYNAMIC_DIR_PATH
      TO_HOME_LINK="..\/${TO_HOME_LINK}"
    done

  FILE_NAME="${@:($#-1):1}.html"
  TITLE="${@:($#):1}"

  TO_PAGE_LINK=".${TO_PAGE_LINK}/${FILE_NAME}"

  CREATED_FILE_PATH="${DYNAMIC_DIR_PATH}/${FILE_NAME}"

  TO_HOME_LINK="${TO_HOME_LINK}home.html"

  LINK_TAG="<div> <a href=\"${TO_PAGE_LINK}\">${TITLE}<\/a><\/div>"

  cat "./template.html" | gsed "s/toHomeLinkPath/${TO_HOME_LINK}/g"| gsed "s/pageTitle/${TITLE}/g" | gsed "s/ <!-- page title -->/${TITLE}/g" >$CREATED_FILE_PATH
  gsed -i "/<!-- toHomeLinkPath -->/i ${LINK_TAG}" "../workspace/svelte_app/src/html/home.html"
fi
