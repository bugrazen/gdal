@echo off
echo.
echo Turkiye' ye ait OSM verilerini indirmek icin bir tusa basiniz!!!
echo.
PAUSE > NUL
@echo off
echo.
start https://download.geofabrik.de/europe/turkey-latest-free.shp.zip
echo.
@echo off
echo.
echo Turkiye' ye ait OSM verileri indiriliyor!!!
echo.
@echo off
echo.
echo indirme isleminden sonra bir tusa basiniz.
echo.
PAUSE > NUL
@echo off
setlocal
cd /d %~dp0
Call :UnZipFile "C:\Users\bugra\Desktop\turkey-latest-free.shp" "C:\Users\bugra\Desktop\turkey-latest-free.shp.zip"
exit /b

:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%
@echo off
echo.
echo DOSYA CIKARTMA ISLEMI TAMAMLANDI. LUTFEN BIR TUSA BASARAK VERI ISLEME VE VERI TABANINA ATMA ISLEMLERINE GECINIZ!!!
echo.
PAUSE > NUL
@echo off
echo.
echo Filtre uygulayarak shapefile verisini GPKG biciminde disa aktarmak icin tiklayin
echo --------------------------
echo.
PAUSE > NUL
@echo off
echo.
call "C:\Program Files\QGIS 3.32.0\bin\o4w_env.bat"
call ogr2ogr -where ""fclass" in ('motorway','motorway_link','primary','primary_link','secondary','tertiary','tertiary_link','trunk','trunk_link')" -f "GPKG" C:\Users\bugra\Desktop\turkey-latest-free.shp\osm_yol.gpkg C:\Users\bugra\Desktop\turkey-latest-free.shp\gis_osm_roads_free_1.shp
echo GPKG biciminde disa aktarma islemi tamamlandi, diger adim icin tiklayiniz
echo --------------------------
echo.
PAUSE > NUL
@echo off
echo.
echo Olusturdugumuz GPKG verisini veri tabanina aktarmak icin tiklayiniz!
echo --------------------------
PAUSE > NUL
@echo off
echo.
call ogr2ogr -overwrite -f PostgreSQL PG:"user=youtube password=123 host=192.168.0.17 dbname=yt port=5432 schemas=osm" C:\Users\bugra\Desktop\turkey-latest-free.shp\osm_yol.gpkg gis_osm_roads_free_1 -nln osm_yol -progress
echo --------------------------
echo veri tabanina aktarma islemleri tamamlandi. Cikmak icin tiklayiniz!
PAUSE > NUL

exit
