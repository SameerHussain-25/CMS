package repository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class PathSet {

	
	
	public static String getLocation(int stdId) {
		
		String fileLocation = "";
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();

		String replacedSlashes = dtf.format(now).replaceAll("\\/", " ");
		replacedSlashes = replacedSlashes.replaceAll(":", "_");

		fileLocation = System.getProperty("user.dir")+"/uploads/" + stdId + "/" + replacedSlashes;

		// creating directory if not exist.
		try {

			Path path = Paths.get(fileLocation);

			if (!Files.exists(path)) {

				// java.nio.file.Files;
				Files.createDirectories(path);
				System.out.println("Directory is created!");
				
			}

		} catch (IOException e) {
			System.err.println("Failed to create directory!" + e.getMessage());
		}

		return fileLocation;
	}
	
	
}
