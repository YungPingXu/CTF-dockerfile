## CTF 環境建置
也已經含 pwn 的環境，x86 裝置可以直接跑  
M1/M2 晶片的話則不能跑 pwn 的部分  
預設已包含 python，版本為 **python 3.10**  

**第一次執行時：**
### 建立 docker image
```sh
docker build . -t ubuntu-22.04
```
### 建立 docker container
將當前目錄裡的內容 mount 到 /home  
讓當前目錄與 /home 裡面的內容同步  
其中一邊只要內容有更動，也會反映到另外一邊  
並且設定進入 container 時的預設路徑為 /home  

**Mac 電腦**
```sh
docker run -it --privileged --cap-add=SYS_PTRACE --name ubuntu-22.04 --mount type=bind,source=`pwd`,target=/home --workdir /home ubuntu-22.04:latest
```
**Windows 電腦**
```sh
docker run -it --privileged --cap-add=SYS_PTRACE --name ubuntu-22.04 --mount type=bind,source=%CD%,target=/home --workdir /home ubuntu-22.04:latest
```
進到 container 裡後，設定 fish ternimal 顯示完整路徑  
```sh
echo "set fish_prompt_pwd_dir_length 0" > ~/.config/fish/config.fish
```
**之後執行時：**
### 啟動 docker container
```sh
docker start ubuntu-22.04
```
### 以 fish terminal 執行 container
```sh
docker exec -it ubuntu-22.04 fish
```