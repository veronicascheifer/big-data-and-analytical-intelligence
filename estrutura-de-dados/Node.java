public class Node
{
    private int info;
    private Node proximo;

    public String dado;
    public int frequencia;

    public Node (String arquivo, int frequencia)
    {
        this.dado = arquivo;
        this.frequencia = frequencia;
        this.proximo = null;
    }

    public int getFrequencia()
    {
        return this.frequencia;
    }

    public String getDado()
    {
        return this.dado;
    }

    public int getInfo()
    {
        return this.info;
    }

    public Node getProximo()
    {
        return this.proximo;
    }

    public void setInfo(int info)
    {
        this.info = info;
    }

    public void setProximo(Node proximo)
    {
        this.proximo = proximo;
    }
}