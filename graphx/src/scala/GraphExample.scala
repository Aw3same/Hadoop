import org.apache.spark._
import org.apache.spark.graphx._
import org.apache.spark.rdd.RDD
import org.slf4j.LoggerFactory

object GraphExample {
  private val logger = LoggerFactory.getLogger(getClass.getName)

  def main(args: Array[String]): Unit = {

      logger.warn("Iniciando el proceso...")
      val spark_conf = new SparkConf().setAppName("Graph Example")
      val sc = new SparkContext(spark_conf)

      logger.warn("Preprocesado de la información")
      var vertices = sc.textFile("/raw/graph/metadata-raw.txt").
      flatMap { line => line.split("\\s+") }.distinct()

      vertices.map { vertex => vertex.replace("-", "") + "t" + vertex }.
            saveAsTextFile("/raw/graph/metadata-lookup")

      sc.textFile("/raw/graph/metadata-raw.txt").map { line =>
          var fields = line.split("\\s+")
          if (fields.length == 2) {
           fields(0).replace("-", "") + "t" + fields(1).replace("-", "")
          }
      }.saveAsTextFile("/raw/graph/metadata-processed")


      logger.warn("Proceso con grafos!")
      // Load the edges as a graph
      val graph = GraphLoader.edgeListFile(sc, "/raw/graph/metadata-processed")
      // Run PageRank
      val ranks = graph.pageRank(0.0001).vertices
      // join the ids with the phone numbers
      val entities = sc.textFile("/raw/graph/metadata-lookup").map { line =>
       val fields = line.split("\\s+")
       (fields(0).toLong, fields(1))
      }

      val ranksByVertex = entities.join(ranks).map {
        case (id, (vertex, rank)) => (rank, vertex)
      }

      logger.warn("Resultado:")
      // print out the top 5 entities
      println(ranksByVertex.sortByKey(false).take(5).mkString("n"))
  }
}


object RandomFunExample {
  def main(args: Array[String]) {
    if (args.length == 0) {
      println("RandomFunExample <masterUrl> <name> <sparkHome>")
      System.exit(1)
    }

    val sc = new SparkContext(args(0), args(1), args(2), Seq("GraphXExample.jar"))

    // Create an RDD for the vertices
    val users: RDD[(VertexId, (String, String))] =
      sc.parallelize(Array((3L, ("rxin", "student")), (7L, ("jgonzal", "postdoc")),
        (5L, ("franklin", "prof")), (2L, ("istoica", "prof"))))

    // Create an RDD for edges
    val relationships: RDD[Edge[String]] =
      sc.parallelize(Array(Edge(3L, 7L, "collab"), Edge(5L, 3L, "advisor"),
        Edge(2L, 5L, "colleague"), Edge(5L, 7L, "pi")))

    // Define a default user in case there are relationship with missing user
    val defaultUser = ("John Doe", "Missing")

    // Build the initial Graph
    val graph = Graph(users, relationships, defaultUser)

    //The following failed I had to change the config on the following
    //worker_max_heapsize to 256MB
    //executor_total_max_heapsize to 3GB

    //This will count all the vertices
    graph.numVertices

    //This will count all the edges
    graph.numEdges

    //This will count the out going edges from each node
    val degrees = graph.outDegrees
    degrees.take(10)

    //This will count the in going edges from each node
    val degrees2 = graph.inDegrees
    degrees2.take(10)

    //This will give you the node ID with the number of triangles 
    //next to that triangle
    val tr = graph.triangleCount
    tr.vertices.take(10)

    val connectedComp = graph.connectedComponents().vertices
    connectedComp.take(10)

    val graphPingBasic = graph.pregel("A", 1)(
        (id, dist, newDist) => (dist._1, dist._2 + newDist), 
        triplet => Iterator.empty, 
        (a,b) => a + "|" + b)
    
    val graphPing = graph.pregel("A", 1)(
        (id, dist, message) => {
          if (!message.equals("A")) {
            (dist._1, dist._2 + "_" + message) 
          } else {
            (dist._1, dist._2)
          }
        },
        triplet => Iterator((triplet.dstId, "F")), 
        (a,b) => a)
        
    graphPing.vertices.take(10)
    
    val graphRooted = graph.pregel("A")(
        (id, dist, message) => {
          if (!message.equals("A")) {
            (dist._1, dist._2 + "_" + message) 
          } else {
            (dist._1, dist._2)
          }
        }, triplet => {
            var indexOfUnderScore = triplet.srcAttr._2.indexOf("_")
            if (indexOfUnderScore == -1) {
              Iterator((triplet.dstId, triplet.srcId.toString))  
            } else {
              Iterator((triplet.dstId, triplet.srcAttr._2.substring(indexOfUnderScore + 1)))
            }
          },
        (a,b) => a)
    
    graphRooted.vertices.take(10)
     
  }
}