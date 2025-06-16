package mbcboard;

import mbcboard.view.AccountView;
import mbcboard.view.BoardView;

public class BoardExam {

	public static void main(String[] args) {

		boolean run = true;
		
		while (run) {
			
			if (AccountSession.getInstance().isLogin()) {
				
				var boardView = new BoardView();
				boardView.menu();
				
			} else {
				
				var accountView = new AccountView();
				accountView.menu();
			}
		}
	}
}
