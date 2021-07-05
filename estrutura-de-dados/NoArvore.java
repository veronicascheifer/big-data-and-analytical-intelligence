public class NoArvore
{
    public long item;

    public String termo;
    public ListaArquivos listaArquivos;
    public NoArvore dir;
    public NoArvore esq;

    public NoArvore()
    {
        this.termo = "";
        listaArquivos = new ListaArquivos();
        dir = null;
        esq = null;
    }

    public NoArvore(String termo)
    {
        this.termo = termo;
        listaArquivos = new ListaArquivos();
        dir = null;
        esq = null;
    }
}