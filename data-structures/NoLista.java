public class NoLista
{
    private int info;
    private NoLista proximo;

    public String dado;
    public int frequencia;

    public NoLista (String arquivo, int frequencia)
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

    public NoLista getProximo()
    {
        return this.proximo;
    }

    public void setInfo(int info)
    {
        this.info = info;
    }

    public void setProximo(NoLista proximo)
    {
        this.proximo = proximo;
    }
}