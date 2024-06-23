libcamera-still --camera 1 --vflip -t 200 -o cam1.jpg 
libcamera-still --camera 0 --vflip -t 200 -o cam0.jpg

ffmpeg -y -i cam0.jpg -i cam1.jpg  -filter_complex hstack sbs.jpg
ffmpeg -y -i cam1.jpg -i cam0.jpg  -filter_complex hstack sbs-swap.jpg
ffmpeg -y -framerate 2 -i cam%d.jpg out.gif
