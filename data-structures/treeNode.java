public class treeNode
{
    public long item;

    public String term;
    public filesList filesList;
    public treeNode right;
    public treeNode left;

    public treeNode()
    {
        this.term = "";
        filesList = new filesList();
        right = null;
        left = null;
    }

    public treeNode(String term)
    {
        this.term = term;
        filesList = new filesList();
        right = null;
        left = null;
    }
}