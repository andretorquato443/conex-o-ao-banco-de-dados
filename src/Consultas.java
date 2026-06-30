import java.sql.*;
import java.util.Scanner;

public class Consultas {

    // Consulta 1
    public static void consulta1(Connection conn) throws SQLException {

        String sql =
                "select p.nome " +
                "from Perfil p " +
                "join Assinante a on p.assinante_id = a.assinante_id " +
                "join Plano pl on a.plano_id = pl.plano_id " +
                "where pl.nome = 'Familia'";

        Statement st = conn.createStatement();

        ResultSet rs = st.executeQuery(sql);

        while(rs.next()){
            System.out.println(rs.getString(1));
        }

        rs.close();
        st.close();
    }

    // Consulta 2
    public static void consulta2(Connection conn) throws SQLException{

        String sql =
                "select f.nome " +
                "from Filme f " +
                "join AvaliacaoFilme a on f.filme_id = a.filme_id " +
                "group by f.filme_id,f.nome " +
                "having avg(a.nota) > " +
                "(select avg(nota) from AvaliacaoFilme)";

        Statement st = conn.createStatement();

        ResultSet rs = st.executeQuery(sql);

        while(rs.next()){
            System.out.println(rs.getString(1));
        }

        rs.close();
        st.close();

    }

    // Consulta 3 (PARAMETRIZADA)
    public static void consulta3(Connection conn) throws SQLException{

        Scanner sc = new Scanner(System.in);

        System.out.print("Nome da série: ");
        String serie = sc.nextLine();

        String sql =
                "select p.nome " +
                "from Perfil p " +
                "join HistoricoEpisodio h on p.perfil_id=h.perfil_id " +
                "join Episodio e on h.episodio_id=e.episodio_id " +
                "join Serie s on e.serie_id=s.serie_id " +
                "where s.nome=? " +
                "group by p.nome,p.perfil_id,e.episodio_id " +
                "having count(*)>1";

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, serie);

        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            System.out.println(rs.getString(1));
        }

        rs.close();
        ps.close();

    }

    // Consulta 4 (PARAMETRIZADA)
    public static void consulta4(Connection conn) throws SQLException{

        Scanner sc = new Scanner(System.in);

        System.out.print("Nome do perfil: ");

        String perfil = sc.nextLine();

        String sql =
                "select f.nome " +
                "from Filme f " +
                "join HistoricoFilme h on f.filme_id=h.filme_id " +
                "join Perfil p on h.perfil_id=p.perfil_id " +
                "where p.nome=? " +
                "and 8 < (" +
                "select avg(a.nota) " +
                "from AvaliacaoFilme a " +
                "where a.filme_id=f.filme_id)";

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, perfil);

        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            System.out.println(rs.getString(1));
        }

        rs.close();
        ps.close();

    }

    // Consulta 5
    public static void consulta5(Connection conn) throws SQLException{

        String sql =
                "select p.nome " +
                "from Perfil p " +
                "where not exists(" +
                "select * " +
                "from AvaliacaoSerie a " +
                "join Serie s on a.serie_id=s.serie_id " +
                "where a.perfil_id=p.perfil_id " +
                "and s.genero='Comedia')";

        Statement st = conn.createStatement();

        ResultSet rs = st.executeQuery(sql);

        while(rs.next()){
            System.out.println(rs.getString(1));
        }

        rs.close();
        st.close();

    }

        // Consulta 6
    public static void consulta6(Connection conn) throws SQLException {

        String sql =
                "select genero, p.nome, count(*) as quantidade_visualizacoes " +
                "from FilmesAssistidos fa " +
                "join Assinante a on fa.assinante_id = a.assinante_id " +
                "join Plano p on p.plano_id = a.plano_id " +
                "group by genero, p.nome";

        Statement st = conn.createStatement();

        ResultSet rs = st.executeQuery(sql);

        while (rs.next()) {
            System.out.println(
                    rs.getString(1) + " | " +
                    rs.getString(2) + " | " +
                    rs.getInt(3));
        }

        rs.close();
        st.close();
    }

    // Consulta 7
    public static void consulta7(Connection conn) throws SQLException {

        String sql =
                "select fa.perfil_id, fa.perfil, p.nome, count(*) " +
                "from FilmesAssistidos fa " +
                "join Assinante a on fa.assinante_id = a.assinante_id " +
                "join Plano p on p.plano_id = a.plano_id " +
                "group by fa.perfil_id, fa.perfil, p.nome";

        Statement st = conn.createStatement();

        ResultSet rs = st.executeQuery(sql);

        while (rs.next()) {
            System.out.println(
                    rs.getInt(1) + " | " +
                    rs.getString(2) + " | " +
                    rs.getString(3) + " | " +
                    rs.getInt(4));
        }

        rs.close();
        st.close();
    }

    // Consulta 8
    public static void consulta8(Connection conn) throws SQLException {

        String sql =
                "select s.nome, count(*) " +
                "from Serie s " +
                "join Episodio e on s.serie_id = e.serie_id " +
                "join HistoricoEpisodio h on e.episodio_id = h.episodio_id " +
                "group by s.serie_id, s.nome";

        Statement st = conn.createStatement();

        ResultSet rs = st.executeQuery(sql);

        while (rs.next()) {
            System.out.println(
                    rs.getString(1) + " | " +
                    rs.getInt(2));
        }

        rs.close();
        st.close();
    }

    // Consulta 9
    public static void consulta9(Connection conn) throws SQLException {

        String sql =
                "select p.perfil_id, p.nome, a.nome " +
                "from Perfil p " +
                "join Assinante a on p.assinante_id = a.assinante_id " +
                "except " +
                "select h.perfil_id, p.nome, a.nome " +
                "from HistoricoFilme h " +
                "join Perfil p on h.perfil_id = p.perfil_id " +
                "join Assinante a on p.assinante_id = a.assinante_id";

        Statement st = conn.createStatement();

        ResultSet rs = st.executeQuery(sql);

        while (rs.next()) {
            System.out.println(
                    rs.getInt(1) + " | " +
                    rs.getString(2) + " | " +
                    rs.getString(3));
        }

        rs.close();
        st.close();
    }

    // Consulta 10
    public static void consulta10(Connection conn) throws SQLException {

        String sql =
                "select p.perfil_id, p.nome, avg(e.duracao) " +
                "from Perfil p " +
                "join HistoricoEpisodio h on p.perfil_id = h.perfil_id " +
                "join Episodio e on h.episodio_id = e.episodio_id " +
                "group by p.perfil_id, p.nome";

        Statement st = conn.createStatement();

        ResultSet rs = st.executeQuery(sql);

        while (rs.next()) {
            System.out.println(
                    rs.getInt(1) + " | " +
                    rs.getString(2) + " | " +
                    rs.getDouble(3));
        }

        rs.close();
        st.close();
    }

}