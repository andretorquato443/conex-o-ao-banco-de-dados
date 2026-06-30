import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexoes {

    private static final String URL =
            "jdbc:postgresql://localhost:5432/netflix";

    private static final String USUARIO = "postgres";

    private static final String SENHA = "pVZ GW2476!";

    public static Connection conectar() throws SQLException {

        return DriverManager.getConnection(
                URL,
                USUARIO,
                SENHA
        );
    }

}