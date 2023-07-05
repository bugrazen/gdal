# ![gdalicon](https://github.com/bugrazen/gdal/assets/95212909/17cc19ab-ba12-4596-a9c0-abb72cfbea63)

Coğrafi Bilgi Sistemi (CBS) verilerini okumak, yazmak, işlemek için kullanılan ve ShapeFile, GeoPackage, GeoJson ve TIFF gibi birçok coğrafi veri biçimini işleyebilen bir kütüphanedir.


-----


#### [Kurulum ve örnek kodların kullanımı hakkında daha fazla bilgi için videomu izleyebilirsiniz](https://www.youtube.com/watch?v=UzQbdMha7_E)

-----

## Örnek kodlar

```
ogr2ogr -f PostgreSQL PG:"user=youtube host=localhost password=123 dbname=yt port=5432 schemas=public" C:\Users\bugra\Desktop\ms-buildings\ms-building-footprints-turkiye.gpkg 120323223 -nln 120323223_gdal -progress
```
```
ogr2ogr -f PostgreSQL PG:"user=youtube host=localhost password=123 dbname=yt port=5432 schemas=gdal" ms-building-footprints-turkiye.gpkg -progress
```
```
ogr2ogr -f PostgreSQL PG:"user=youtube host=localhost password=123 dbname=yt port=5432 schemas=public" C:\Users\bugra\Desktop\turkey-latest-free.shp\gis_osm_roads_free_1.shp -nln osm_roads_gdal -progress
```
