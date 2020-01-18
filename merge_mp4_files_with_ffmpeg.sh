# Step 1: Convert MP4 format files to TS format
for i in `ls 昆虫总动员/*.mp4`;
do
    ffmpeg -i $i -vcodec copy -acodec copy -vbsf h264_mp4toannexb $i.ts
done

# Step 2: Merge the TS files into single file
param=""
for ((i=1;i<=179;i++));
do
    param=$param" 昆虫总动员/昆虫总动员"$i".mp4.ts"
done
cat $param > 昆虫总动员/昆虫总动员.ts

# Step 3: Convert the merged TS file back to MP4
ffmpeg -i 昆虫总动员/昆虫总动员.ts -acodec copy -vcodec copy -absf aac_adtstoasc 昆虫总动员/昆虫总动员.mp4
