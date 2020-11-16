# make sure we are in the right directory
cd ~/projects/jchugo2020/causes2020
# remove the old published version
rm -rf public/
# create the public folder again
hugo --ignoreCache --forceSyncStatic --gc
# prep the docs folder which github server serves from as root
rm -rf ~/projects/jamesacampbell.github.io/docs/
# copy over the files
cp -R public/ ~/projects/jamesacampbell.github.io/docs/
cp -R ~/projects/jamesacampbell.github.io/trans/ ~/projects/jamesacampbell.github.io/docs/
# push the changes to github server
cd ~/projects/jamesacampbell.github.io/
git yolo