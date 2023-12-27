package girogi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import girogi.GDo;

public class GDao {
   // MySQL db연동 시작 
   String id = "root";
   String password = "1111";
   String url = "jdbc:mysql://localhost:3307/girogi?characterEncoding=utf-8";

   // 디비 연동에 필요한 jdbc 클래스 선언
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   public void connect_cp() {
      try {
         // 컨텍스트 객체 생성
         Context initctx = new InitialContext();
         // context.xml접근
         Context envctx = (Context) initctx.lookup("java:/comp/env");
         // 'jdbc/pool' 이름의 커넥션 풀에 접근
         DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
         // 커넥션 풀로부터 커넥션 하나 빌려오기
         conn = ds.getConnection();

         System.out.println("커넥션 풀로부터 db 연결 성공!");

      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public void connect() {

      try {
         // MySQL 드라이버 로딩
         Class.forName("com.mysql.jdbc.Driver");
         // DB연결
         conn = DriverManager.getConnection(url, id, password);
         System.out.println("DB 연결 완료");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public void disConnect() {
      if (conn != null) {
         try {
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      if (pstmt != null) {
         try {
            pstmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }

      }
      if (rs != null) {
         try {
            rs.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
   }

   // 입력된 데이터 저장 메소드
   public void insertAddr(GDo ado) {
      System.out.println("insert() 처리 시작!!");

      // 디비 연결
      connect_cp();

      // sql 처리 루틴
      String sql = "insert into text(title, content, createdAt) values (?,?,?)";

      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, ado.getTitle());
         pstmt.setString(2, ado.getContent());
         pstmt.setTimestamp(3, ado.getCreatedAt());

         // sql문 실행: 테이블에 변화가 있으면 업데이트(executeUpdate())
         pstmt.executeUpdate();
         System.out.println("insertAddr() 처리 완료!!");
      } catch (SQLException e) {
         e.printStackTrace();
      }

      // 디비 연결 종료
      disConnect();
   }
// 입력된 전체 데이터 가져오는 메서드
public ArrayList<GDo> getAllAddr(String order) {
    System.out.println("getAllAddr() 처리 시작!!");

    ArrayList<GDo> aList = new ArrayList<>();

    connect_cp();
    // sql문 처리
    String sql = "select * from text ";

    // 정렬 기준에 따라 ORDER BY 구문 추가
    if (order.equals("1")) {
        sql += "ORDER BY createdAt ASC"; // 오래된 게시글부터 정렬
    } else if (order.equals("2")) {
        sql += "ORDER BY createdAt DESC"; // 최근 게시글부터 정렬
    }

    try {
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery(); // 얘는 셀렉트 문이기 때문에 executeQuery 호출
        while (rs.next()) {
            GDo temp = new GDo();
            temp.setNum(rs.getInt(1));
            temp.setTitle(rs.getString(2));
            temp.setContent(rs.getString(3));
            temp.setCreatedAt(rs.getTimestamp(4)); // 수정된 부분

            aList.add(temp);
        }
        System.out.println("getAllAddr() 처리 완료!!");
    } catch (SQLException e) {
        e.printStackTrace();
    }
    disConnect();
    return aList;
	}
//전체 데이터에서 하나의 데이터 가져오기 (수정/삭제 위해서)
public GDo getOneAddr(int num) {
	  System.out.println("getOneAddr() 처리시작!!");
	  GDo ado = new GDo();
	  connect_cp();
	  
	  //sql처리
	  String sql = "select * from text where num=?";
	  try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
  	  
  	  rs = pstmt.executeQuery();
  	  while(rs.next()) {
  		  ado.setNum(rs.getInt(1));
  		  ado.setTitle(rs.getString(2));
  		  ado.setContent(rs.getString(3));
  		  ado.setCreatedAt(rs.getTimestamp(4));

  	  }
  	  System.out.println("getOneAddr() 처리 완료!!");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  disConnect();
	  
	  
	  return ado;
}

//선택된 데이터 수정하기
public void modifyAddr(GDo ado) {
	  System.out.println("modifyAddr() 처리 시작!!");
	  connect_cp();
	  
	  //sql 처리
	  String sql ="update text set title=?, content=?, CreatedAt=? where num=?";
	  try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ado.getTitle());
		pstmt.setString(2, ado.getContent());
		pstmt.setTimestamp(3, ado.getCreatedAt());
		pstmt.setInt(4, ado.getNum());
		
		pstmt.executeUpdate();
		System.out.println("modifyAddr() 처리 완료 !!");
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  
	  
	  disConnect();
	  
}

//선택된 데이터 삭제하기
public void deleteAddr(int num) {
	  System.out.println("deleteAddr() 처리 시작!!");
	  connect_cp();
	  
	  //sql 처리
	  String sql = "delete from text where num=?";
	  
	  try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		pstmt.executeUpdate();
		System.out.println("deleteAddr() 처리완료!!");
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  disConnect();
}

public int getPostCount() {
    System.out.println("getPostCount() 처리 시작!!");
    connect_cp();
    
    int count = 0; // 레코드 수를 저장할 변수
    
    // SQL 처리
    String sql = "SELECT COUNT(*) AS count FROM text"; // 테이블명을 적절하게 수정해야 합니다.
    try {
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            count = rs.getInt("count");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        disConnect();
    }
    
    return count;
}

}
