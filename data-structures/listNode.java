public class listNode
{
    private int info;
    private listNode next;

    public String data;
    public int frequency;

    public listNode (String file, int frequency)
    {
        this.data = file;
        this.frequency = frequency;
        this.next = null;
    }

    public int getFrequency()
    {
        return this.frequency;
    }

    public String getData()
    {
        return this.data;
    }

    public int getInfo()
    {
        return this.info;
    }

    public listNode getNext()
    {
        return this.next;
    }

    public void setInfo(int info)
    {
        this.info = info;
    }

    public void setNext(listNode next)
    {
        this.next = next;
    }
}