from pyspark.sql import HiveContext
from pyspark import SparkContext

sc = SparkContext(appName = "Simple App")
log4jLogger = sc._jvm.org.apache.log4j 
log = log4jLogger.LogManager.getLogger(__name__) 

sqlContext = HiveContext(sc)
results = sqlContext.sql("SELECT * from precios.ComunidadesAutonomas")

log.warn("Comunidades autonomas")
results.show()


log.warn("Precios")

precios = sqlContext.read.json("/raw/precios")
precios.registerTempTable("tabla_precios")

results = sqlContext.sql("""
    SELECT count(*) 
    FROM tabla_precios p
    INNER JOIN precios.ComunidadesAutonomas c ON 
        (p.IDCCAA = c.IDCCAA)
    WHERE c.CCAA = "Madrid"
""")
results.show()
