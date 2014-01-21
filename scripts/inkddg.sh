#!/bin/bash
while getopts 'ne:' opt ; do
  case $opt in
    n)
      #on duplique le svg de base, et on le renome
      cp /home/valentin/DDG/ddg.svg /home/valentin/"$OPTARG".svg

      #open the file
      inkscape "$OPTARG".svg

      # Creates 'watermark' from the svg file
      inkscape -f="$OPTARG".svg -e  62.png -w  62 -h  62
      inkscape -f="$OPTARG".svg -e  92.png -w  92 -h  92
      inkscape -f="$OPTARG".svg -e 120.png -w 120 -h 120
      inkscape -f="$OPTARG".svg -e 122.png -w 122 -h 122
      inkscape -f="$OPTARG".svg -e 182.png -w 182 -h 182
      inkscape -f="$OPTARG".svg -e 242.png -w 242 -h 242
      inkscape -f="$OPTARG".svg -e "$OPTARG".png -w 300 -h 300

      #Create all the logos
      composite -gravity NorthWest -quality 100  62.png /home/valentin/DDG/logo_homepage_mobile.normal.png logo_homepage_mobile.normal.png
      composite -gravity NorthWest -quality 100  92.png /home/valentin/DDG/logo_homepage_mobile.hdpi.png   logo_homepage_mobile.hdpi.png
      composite -gravity North     -quality 100 120.png /home/valentin/DDG/logo_homepage.normal.png        logo_homepage.normal.png
      composite -gravity NorthWest -quality 100 122.png /home/valentin/DDG/logo_homepage_mobile.retina.png logo_homepage_mobile.retina.png
      composite -gravity North     -quality 100 182.png /home/valentin/DDG/logo_homepage.hdpi.png          logo_homepage.hdpi.png
      composite -gravity North     -quality 100 242.png /home/valentin/DDG/logo_homepage.retina.png        logo_homepage.retina.png

      #Del the 'Watermark'
      rm 62.png 92.png 120.png 122.png 182.png 242.png

      #Zip the result
      zip "$OPTARG".zip logo_homepage_mobile.normal.png logo_homepage_mobile.hdpi.png logo_homepage.normal.png logo_homepage_mobile.retina.png logo_homepage.hdpi.png logo_homepage.retina.png

      #preview the result in sxiv
      multsxiv logo_homepage.hdpi.png

      # create two new directories : local and dropbox
      mkdir ~/DDG/Logos/$OPTARG
      cp "$OPTARG.svg" logo_homepage_mobile.normal.png logo_homepage_mobile.hdpi.png logo_homepage.normal.png logo_homepage_mobile.retina.png logo_homepage.hdpi.png logo_homepage.retina.png -t ~/DDG/Logos/"$OPTARG"

      mkdir "~/Dropbox/DuckDuckGo Assets/Logos/Special/Holiday/Work in progress/$OPTARG"
      cp "$OPTARG.svg" logo_homepage_mobile.normal.png logo_homepage_mobile.hdpi.png logo_homepage.normal.png logo_homepage_mobile.retina.png logo_homepage.hdpi.png logo_homepage.retina.png -t "~/Dropbox/DuckDuckGo Assets/Logos/Special/Holiday/Work in progress/$OPTARG"

      #Del the PNGs
      rm logo_homepage_mobile.normal.png logo_homepage_mobile.hdpi.png logo_homepage.normal.png logo_homepage_mobile.retina.png logo_homepage.hdpi.png logo_homepage.retina.png
    ;;

    e)
      #on duplique le svg de base, et on le renome
      cp /home/valentin/DDG/ddg.svg /home/valentin/"$OPTARG".svg

      #open the file
      inkscape "$OPTARG".svg

      # Creates 'watermark' from the svg file
      inkscape -f="$OPTARG".svg -e  62.png -w  62 -h  62
      inkscape -f="$OPTARG".svg -e  92.png -w  92 -h  92
      inkscape -f="$OPTARG".svg -e 120.png -w 120 -h 120
      inkscape -f="$OPTARG".svg -e 122.png -w 122 -h 122
      inkscape -f="$OPTARG".svg -e 182.png -w 182 -h 182
      inkscape -f="$OPTARG".svg -e 242.png -w 242 -h 242
      inkscape -f="$OPTARG".svg -e "$OPTARG".png -w 300 -h 300

      #Create all the logos
      composite -gravity NorthWest -quality 100  62.png /home/valentin/DDG/logo_homepage_mobile.normal.png logo_homepage_mobile.normal.png
      composite -gravity NorthWest -quality 100  92.png /home/valentin/DDG/logo_homepage_mobile.hdpi.png   logo_homepage_mobile.hdpi.png
      composite -gravity North     -quality 100 120.png /home/valentin/DDG/logo_homepage.normal.png        logo_homepage.normal.png
      composite -gravity NorthWest -quality 100 122.png /home/valentin/DDG/logo_homepage_mobile.retina.png logo_homepage_mobile.retina.png
      composite -gravity North     -quality 100 182.png /home/valentin/DDG/logo_homepage.hdpi.png          logo_homepage.hdpi.png
      composite -gravity North     -quality 100 242.png /home/valentin/DDG/logo_homepage.retina.png        logo_homepage.retina.png

      #Del the 'Watermark'
      rm 62.png 92.png 120.png 122.png 182.png 242.png

      #Zip the result
      zip "$OPTARG".zip logo_homepage_mobile.normal.png logo_homepage_mobile.hdpi.png logo_homepage.normal.png logo_homepage_mobile.retina.png logo_homepage.hdpi.png logo_homepage.retina.png

      #preview the result in sxiv
      multsxiv logo_homepage.hdpi.png

      # create two new directories : local and dropbox
      mkdir ~/DDG/Logos/$OPTARG
      cp "$OPTARG.svg" logo_homepage_mobile.normal.png logo_homepage_mobile.hdpi.png logo_homepage.normal.png logo_homepage_mobile.retina.png logo_homepage.hdpi.png logo_homepage.retina.png -t ~/DDG/Logos/"$OPTARG"

      mkdir "~/Dropbox/DuckDuckGo Assets/Logos/Special/Holiday/Work in progress/$OPTARG"
      cp "$OPTARG.svg" logo_homepage_mobile.normal.png logo_homepage_mobile.hdpi.png logo_homepage.normal.png logo_homepage_mobile.retina.png logo_homepage.hdpi.png logo_homepage.retina.png -t "~/Dropbox/DuckDuckGo Assets/Logos/Special/Holiday/Work in progress/$OPTARG"

      #Del the PNGs
      rm logo_homepage_mobile.normal.png logo_homepage_mobile.hdpi.png logo_homepage.normal.png logo_homepage_mobile.retina.png logo_homepage.hdpi.png logo_homepage.retina.png

      notify-send "Et ouai mon p'tit salaud," "Tous c'est bien déroulé!"
      ;;
  esac
done
