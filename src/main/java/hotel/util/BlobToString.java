package hotel.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

public class BlobToString {
    private BlobToString() {
    }

    public static String getStringFromBlob(Blob blob) {
        String stringBlob ="";
        InputStream inputStream = null;
        ByteArrayOutputStream outputStream = null;
        try {
            inputStream = blob.getBinaryStream();
            outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = outputStream.toByteArray();
            stringBlob = Base64.getEncoder().encodeToString(imageBytes);
        } catch (SQLException e) {
        } catch (IOException e){
        }
        finally {
            try {
                if (inputStream!=null){
                    inputStream.close();}

                if (outputStream!=null){
                    outputStream.close();}
            } catch (IOException e) {
            }
        }
        return stringBlob;
    }
}
