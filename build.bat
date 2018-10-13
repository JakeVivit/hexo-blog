@echo off
echo ====================clean=====================
call hexo clean

echo ====================hexo generate =====================
call hexo g

call pscp -r -v public root@jyjvip.cn:/data/www/
echo ====================upload successful=====================

