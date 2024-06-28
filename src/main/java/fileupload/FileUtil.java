package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class FileUtil {
	public static String uploadFile(HttpServletRequest req, String sDirectory) throws ServletException, IOException {
        Part part = req.getPart("attachedFile");
        if (part == null || part.getSize() == 0) {
            throw new IOException("파일이 업로드되지 않았습니다.");
        }

        String partHeader = part.getHeader("content-disposition");
        String[] phArr = partHeader.split("filename=");
        String originalFileName = phArr[1].trim().replace("\"", "");

        if (originalFileName.isEmpty()) {
            throw new IOException("파일 이름이 비어 있습니다.");
        }

        // 보안을 위해 파일 이름에서 특수 문자를 제거합니다.
        originalFileName = originalFileName.replaceAll("[^a-zA-Z0-9.-]", "_");

        // 저장 디렉토리가 없으면 생성합니다.
        File directory = new File(sDirectory);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        File savedFile = new File(directory, originalFileName);
        part.write(savedFile.getAbsolutePath());

        return originalFileName;
    }

	public static String renameFile(String sDirectory, String fileName) {
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName = now + ext;
		File oldFile = new File(sDirectory + File.separator + fileName);
		File newFile = new File(sDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile);

		return newFileName;
	}

	public static void download(HttpServletRequest req, HttpServletResponse resp, String directory, String sfileName,
			String ofileName) {
		String sDirectory = req.getServletContext().getRealPath(directory);

		try {
			File file = new File(sDirectory, sfileName);
			InputStream iStream = new FileInputStream(file);

			String client = req.getHeader("User-Agent");
			if (client.indexOf("WOW64") == -1) {
				ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
			}

			resp.reset();
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName + "\"");
			resp.setHeader("Content-Length", "" + file.length());

			OutputStream oStream = resp.getOutputStream();

			byte b[] = new byte[(int) file.length()];
			int readBuffer = 0;
			while ((readBuffer = iStream.read(b)) > 0) {
				oStream.write(b, 0, readBuffer);
			}

			iStream.close();
			oStream.close();
		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("예외가 발생하였습니다.");
			e.printStackTrace();
		}
	}
	public static void deleteFile(HttpServletRequest req, String directory, String filename) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		File file = new File(sDirectory + File.separator + filename);
		if(file.exists()) {
			file.delete();
		}
	}
}