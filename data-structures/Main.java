import java.util.ArrayList;

public class Main
{
	public static void main(String[] args) {
	    
		System.out.println("Linked List");
		
		filesList list = new filesList();
		
		list.insertSorted("file1.txt", 1);
		list.insertSorted("file3.txt", 10);
		list.insertSorted("file2.txt", 5);
		list.insertSorted("file4.txt", 3);
		
        BinaryTreeSearch tree = new BinaryTreeSearch();
        tree.insert("ball", "file1.txt");
        tree.insert("house", "file1.txt");
        tree.insert("data", "file1.txt");
        tree.insert("ball", "file1.txt");
        tree.insert("house", "file1.txt");
        tree.insert("data", "file2.txt");
        tree.insert("ball", "file2.txt");
        tree.insert("tree", "file2.txt");
        tree.insert("tree", "file2.txt");
        tree.insert("tree", "file2.txt");
        tree.insert("tree", "file2.txt");

        //User input simulation
        ArrayList<String> terms = new ArrayList<String>();
        terms.add("house");
        terms.add("ball");
        terms.add("data");
        
        searchEngine searchEngine = new searchEngine();
        searchEngine.searchTerms(terms, list, tree);
	}
}
