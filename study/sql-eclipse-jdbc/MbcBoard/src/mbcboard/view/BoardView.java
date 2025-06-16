package mbcboard.view;

import java.util.Scanner;

import mbcboard.AccountSession;
import mbcboard.service.BoardService;

public class BoardView {

	private static Scanner in = new Scanner(System.in);
	
	public void menu() {
		
		while (AccountSession.getInstance().isLogin()) {
			
			var accountSession = AccountSession.getInstance();
			var currentUser = accountSession.getCurrentUser();
			
			System.out.println();
			System.out.println(String.format("로그인한 유저 ID : %s", currentUser.getId()));
			System.out.println("MBC 자유 게시판 서비스입니다.");
			System.out.println("1. 모두보기");
			System.out.println("2. 게시글 작성");
			System.out.println("3. 게시글 자세히 보기");
			System.out.println("4. 게시글 수정");
			System.out.println("5. 게시글 삭제");
			System.out.println("6. 로그아웃");

			System.out.print(">>>");
			String select = in.next();
			
			switch (select) {
			
				case "1" -> getBoardListView(); 	// 1. 모두보기
				case "2" -> postBoardView(); 		// 2. 게시글 작성
				case "3" -> getBoardDetailView(); 	// 3. 게시글 자세히 보기
				case "4" -> updateBoardView(); 		// 4. 게시글 수정
				case "5" -> deleteBoardView(); 		// 5. 게시글 삭제
				
				case "6" -> { // "6. 로그아웃
					System.out.println();
					System.out.println(String.format("%s님 로그아웃 하셨습니다.", currentUser.getName()));
					accountSession.onLogoutEvent();
				}
				
				default -> {
					System.out.println();
					System.out.println("1~6 까지만 입력 바랍니다.");
				}
			}
		}
	}

	/**
	 * 1. 모두보기
	 */
	private void getBoardListView() {

		BoardService boardService = new BoardService();
		var boardList = boardService.getBoardList();

		System.out.println();
		System.out.println("========== 게시글 목록 ===========");
		System.out.println("게시번호\t 제목\t\t 작성자\t 작성일");
		for (var board : boardList) {
			System.out.println(String.format("%d\t %s\t %s\t %s", 
					board.getBno(),
					board.getTitle(),
					board.getWriter(),
					board.getCreatedate().toString()));
		}
	}

	/**
	 * 2. 게시글 작성
	 */
	private void postBoardView() {
		var accountSession = AccountSession.getInstance();
		var currentUser = accountSession.getCurrentUser();
		
		BoardService boardService = new BoardService();

		System.out.println();
		System.out.println("게시글 작성");
		
		System.out.print("제목 : ");
		in.nextLine();
		String bTitle = in.nextLine();
		
		System.out.print("내용 : ");
		String bContent = in.nextLine();
		
		boardService.postBoard(currentUser.getId(), bTitle, bContent);
	}

	/**
	 * 3. 게시글 자세히 보기
	 */
	private void getBoardDetailView() {
		BoardService boardService = new BoardService();
		
		getBoardListView();

		System.out.println();
		System.out.print("조회할 게시글 번호 :");
		int boardIndex = Integer.parseInt(in.next());
		
		var boardDTO = boardService.getBoardDetail(boardIndex);

		System.out.println("========== 게시글 상세정보 ===========");
		System.out.println(String.format("작성자:%s\t\t\t글번호:%d", boardDTO.getWriter(), boardDTO.getBno()));
		System.out.println(String.format("제목:%s\t\t작성일자:%s", boardDTO.getTitle(), 
				boardDTO.getCreatedate()));
//				boardDTO.getBdate().toLocalDate().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일. HH:mm:ss"))));
		System.out.println(String.format("내용:%s", boardDTO.getContent()));
	}

	/**
	 * 4. 게시글 수정
	 */
	private void updateBoardView() {
		var accountSession = AccountSession.getInstance();
		var currentUser = accountSession.getCurrentUser();
		
		BoardService boardService = new BoardService();

		getBoardListView();

		System.out.println();
		System.out.print("수정할 게시글 번호 :");
		int bno = Integer.parseInt(in.next());

		var currentBoard = boardService.findBoardInfo(bno);
		
		if (currentBoard.getWriter().equals(currentUser.getId())) {

			System.out.print("제목 : ");
			String bTitle = in.next();
			
			System.out.print("내용 : ");
			String bContent = in.next();
			
			boardService.updateBoard(bno, currentUser.getId(), bTitle, bContent);
			
		} else {
			System.out.println();
			System.out.println("(!) 본인이 작성한 글만 수정할 수 있습니다.");
		}
	}

	/**
	 * 5. 게시글 삭제
	 */
	private void deleteBoardView() {
		var accountSession = AccountSession.getInstance();
		var currentUser = accountSession.getCurrentUser();
		
		BoardService boardService = new BoardService();

		getBoardListView();

		System.out.println();
		System.out.print("삭제할 게시글 번호 :");
		int bno = Integer.parseInt(in.next());

		var currentBoard = boardService.findBoardInfo(bno);
		
		if (currentBoard.getWriter().equals(currentUser.getId())) {
			
			boardService.deleteBoard(bno);
			
		} else {
			System.out.println();
			System.out.println("(!) 본인이 작성한 글만 삭제할 수 있습니다.");
		}		
	}
}
