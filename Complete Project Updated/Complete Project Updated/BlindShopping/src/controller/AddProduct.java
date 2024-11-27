package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dbConnector.DbConnection;

@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	PreparedStatement ps;
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	private List<FileItem> fileItem = null;

	protected List<FileItem> initRequest(HttpServletRequest req) {
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		if (!isMultipart)
			throw new UnsupportedOperationException();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(REQUEST_SIZE);
		List<FileItem> formItems = null;
		try {
			formItems = upload.parseRequest(req);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return formItems;
	}

	protected String getFieldValue(List<FileItem> formItems, String fieldName) {
		String value = null;
		try {
			for (FileItem fi : formItems) {
				if (fi.isFormField()) {
					if (fi.getFieldName().equals(fieldName)) {
						value = fi.getString();
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return value;
	}

	protected File uploadFile(List<FileItem> formItems, String destFolder) {
		String uploadPath = destFolder;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		File uploadedFile = null;
		try {
			for (FileItem fi : formItems) {
				if (!fi.isFormField()) {
					String fileName = new File(fi.getName()).getName();
					String filePath = uploadPath + File.separator + fileName;
					uploadedFile = new File(filePath);
					fi.write(uploadedFile);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return uploadedFile;
	}

	DbConnection dbConnection;

	public void init(ServletConfig config) throws ServletException {
		try {
			con=dbConnection.getConnection();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {

			fileItem = initRequest(request);

			System.out.println("2");
			File file = uploadFile(fileItem,
					"D:\\TestingWorkspace\\BlindShopping\\WebContent\\products\\");

			String productImage = file.getName();

			System.out.println("Image name " + productImage);
			String productname = getFieldValue(fileItem, "productname");
			String price = getFieldValue(fileItem, "price");
			String producttype = getFieldValue(fileItem, "producttype");
			String description = getFieldValue(fileItem, "description");
			
			System.out.println("Product Nsame:" + productname);
			System.out.println("Product Priced:" + price);
			System.out.println("Product Description:" + description);

			String[] cnt = productImage.split("\\.");
			String fileext = cnt[1];
			System.out.println("Ext " + fileext);
			if (fileext.equals("jpg") || fileext.equals("png")) {
				String query = "INSERT INTO `product`(`producttype`, `name`, `image`, `price`, `description`)  VALUES  ('"+producttype+"','"
						+ productname
						+ "','"
						+ productImage
						+ "','"
						+ price
						+ "','"
						+ description
						+ "')";
				System.out.println(query);
				ps = con.prepareStatement(query);

				System.out.println("Value Inseted");
				ps.executeUpdate();
				response.sendRedirect("AdminHome.jsp?add=done");
			} else {
				System.out.println("Invalide Format ");
				response.sendRedirect("AddProduct.jsp?invalide=format");
			}

		} catch (Exception e) {

			System.out.println("exception " + e);
		}

	}

}
