package Controle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Modelo.Pessoa;

public class PessoaDAO {
		public boolean inserir(Pessoa p) {
			//instanciar a clase
			Conexao c = Conexao.getInstancia();
			
			//Abrir a conexao com o BD
			Connection con = c.conectar();		
			String query = "INSERT INTO pessoa(idPessoa, PrimeiroNome)VALUES (?, ?) ";
			
			try {
				PreparedStatement ps = con.prepareStatement (query);
				
				//Seta os parametros
				ps.setInt(1, p.getIdPessoa());
				ps.setString(2, p.getPrimeiroNome());
				
				//Consolidar a conexao do comando do banco

				ps.executeUpdate();
				
				//Fechar a conexao
				c.fecharConexao();
				
				return true;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return false;
		}

}
