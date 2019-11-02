import java.io.File
import java.io.BufferedWriter
import java.io.FileWriter

object Main extends App {

  // This is the main ini file of OBS
  val filePath = "C:/Users/Sebastian/AppData/Roaming/obs-studio/global.ini"
  val iniFile = new File(filePath)

  println(s"Found ini file: ${iniFile.exists()}")

  // These are the strings to change
  val contentRecording = "SceneCollection=1 Recording\nSceneCollectionFile=1_Recording\nProfile=1.1 Recording StSt\nProfileDir=11_Recording_StSt"
  val contentStreaming = "SceneCollection=2 Streaming\nSceneCollectionFile=2_Streaming\nProfile=2 Streaming\nProfileDir=2_Streaming"

  // Check current configuration
  val fileContent = scala.io.Source.fromFile(iniFile).getLines.mkString("\n")
  val foundRecording = fileContent.contains(contentRecording)
  val foundStreaming = fileContent.contains(contentStreaming)

  println(s"Found recording: $foundRecording")
  println(s"Found streaming: $foundStreaming")

  // Change content
  var updatedFileContent = fileContent
  if(foundRecording) {
    updatedFileContent = fileContent.replace(contentRecording, contentStreaming)
    println("Replaced recording settings with streaming settings.")
  } else if (foundStreaming) {
    updatedFileContent = fileContent.replace(contentStreaming, contentRecording)
    println("Replaced streaming settings with recording settings.")
  } else {
    println("Did nothing.")
  }

  // Save
  val writer = new BufferedWriter(new FileWriter(iniFile))
  writer.write(updatedFileContent)
  writer.close()

  println("Updated file.")
}
