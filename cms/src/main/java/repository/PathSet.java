package repository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class PathSet {

	
	
	public static String getLocation(int stdId,String name) {
		
		String fileLocation = "";
		String foldername=stdId+" "+name;
//		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		 DateFormat dateformat2=new SimpleDateFormat("dd-MM-yyyy hh-mm aa");
		LocalDateTime now = LocalDateTime.now();

		
//		  String replacedSlashes = dtf.format(now).replaceAll("\\/", " ");
//		  replacedSlashes = replacedSlashes.replaceAll(":", "_");
		 

		fileLocation = System.getProperty("user.dir")+"/uploads/" + foldername + "/" + dateformat2.format(new Date());
		System.out.println(fileLocation);

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
