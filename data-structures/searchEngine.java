import java.util.ArrayList;
import java.util.Scanner;

public class searchEngine {
   private treeBinarySearch _treeBinarySearch; 
   public filesList _filesList;

    public searchEngine() {
        _treeBinarySearch = new treeBinarySearch();
        _filesList = new filesList();
    }

    public void searchTerm(ArrayList<String> terms, filesList filesList, treeBinarySearch treeBinarySearch){

        for (int i = 0; i < terms.size(); i++)
        {
            treeNode currentNode = treeBinarySearch.search(terms.get(i));    
            System.out.println("Search Term: " + currentNode.termo);
            currentNode.filesList.printFiles();
        }
    }
}
