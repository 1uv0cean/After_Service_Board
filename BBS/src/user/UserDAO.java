package user;


import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;



public class UserDAO {

	// dao : 데이터베이스 접근 객체의 약자로서

	// 실질적으로 db에서 회원정보 불러오거나 db에 회원정보 넣을때



	private Connection conn; // connection:db에접근하게 해주는 객체

	private PreparedStatement pstmt;

	private ResultSet rs;



	// mysql에 접속해 주는 부분

	public UserDAO() { // 생성자 실행될때마다 자동으로 db연결이 이루어 질 수 있도록함

		try {

			String dbURL = "jdbc:mysql://localhost:3306/bbs?serverTimezone=UTC&characterEncoding=euckr&useUnicode=true&mysqlEncoding=euckr"; // localhost:3306 포트는 컴퓨터설치된 mysql주소

			String dbID = "root";

			String dbPassword = "1234";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			


			
		} catch (Exception e) {

			e.printStackTrace(); // 오류가 무엇인지 출력

		}

	}



	// 로그인을 시도하는 함수****

	public int login(String userName, String userPassword) {

		String SQL = "SELECT userPassword FROM user WHERE userName = ?";

		try {
			

			// pstmt : prepared statement 정해진 sql문장을 db에 삽입하는 형식으로 인스턴스가져옴

			pstmt = conn.prepareStatement(SQL);

			// sql인젝션 같은 해킹기법을 방어하는것... pstmt을 이용해 하나의 문장을 미리 준비해서(물음표사용)

			// 물음표해당하는 내용을 유저아이디로, 매개변수로 이용.. 1)존재하는지 2)비밀번호무엇인지

			pstmt.setString(1, userName);

			// rs:result set 에 결과보관

			rs = pstmt.executeQuery();

			// 결과가 존재한다면 실행

			if (rs.next()) {

				// 패스워드 일치한다면 실행

			   
				if (decrypt(rs.getString(1)).equals(userPassword)) {

					return 1; // 로그인 성공

				} else

					return 0; // 비밀번호 불일치

			}

			return -1; // 아이디가 없음 오류



		} catch (Exception e) {

			e.printStackTrace();

		}

		return -2; // 데이터베이스 오류를 의미

	}
	public int join(User user) {

		String SQL = "INSERT INTO user VALUES (?,?,?)";

		try {
			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			String salt = new String(com.sun.org.apache.xerces.internal.impl.dv.util.Base64.encode(bytes));
			
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user.getUserName());
			
			pstmt.setString(2, encrypt(user.getUserPassword()));

			pstmt.setString(3, salt);
			

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // DB 오류

	}
	private static final String key = "aesEncryptionKey";
	private static final String initVector = "encryptionIntVec";
	 
	public static String encrypt(String value) {
	    try {
	        IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
	        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
	 
	        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
	        cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
	 
	        byte[] encrypted = cipher.doFinal(value.getBytes());
	        return com.sun.org.apache.xerces.internal.impl.dv.util.Base64.encode(encrypted);
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return null;
	}
	public static String decrypt(String encrypted) {
	    try {
	        IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
	        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
	 
	        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
	        cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
	        byte[] original = cipher.doFinal(com.sun.org.apache.xerces.internal.impl.dv.util.Base64.decode(encrypted));
	 
	        return new String(original);
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	 
	    return null;
	}

	}


	

