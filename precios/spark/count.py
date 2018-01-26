from pyspark.sql import HiveContext
from pyspark import SparkContext

sc = SparkContext(appName = "Simple App")
log4jLogger = sc._jvm.org.apache.log4j 
log = log4jLogger.LogManager.getLogger(__name__) 

sqlContext = HiveContext(sc)
results = sqlContext.sql("SELECT count(*) from precios.precio_combustible").collect()

log.warn("Total %s" % results)