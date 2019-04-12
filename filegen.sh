#!/bin/bash
# filegen.sh
# Генератор мусорных файлов фиксированного размера
# Использование: filegen <file> 
# Автор: agrabarocherga

# проверка на уровень доступа
#if [[ $UID -ne 0 ]]; then
#  echo "ERROR: you must be root to run me. Get more privileges."
#  exit 1
#fi

SIZE=10M 
COUNT=1

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <file>"
  exit 1
fi

if [[ !`touch $1` ]]; then
  echo "ERROR: file $1 could not be created."
  exit 1
fi

echo "Created file: $1"
echo -e "Filling it with random bytes...\c"

if [[ !-e /dev/urandom ]]; then
	mknod -m 666 /dev/random c 1 8
    mknod -m 666 /dev/urandom c 1 9
    chown root:root /dev/random /dev/urandom
fi

if [[ !`dd if=/dev/urandom of=$1 bs=$SIZE count=$COUNT` ]]; then 
  echo "ERROR: Something went wrong."
  exit 1
fi

echo "done!"
echo "File $1 created, size = `expr $SIZE * $COUNT` "

exit 0
