package questao2;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ImprimeEuAmoJava {
	public static void main(String[] args) {
		EuAmoJava(Criptografa("Eu amo Java!"));
	}

	public static void EuAmoJava(String mensagemCriptografada) {
		System.out.println("Mensagem criptografada: " + mensagemCriptografada);
		System.out.println("Eu amo Java!");
	}
	
	public static String Criptografa(String mensagem) {
			MessageDigest criptografar;
			try {
				criptografar = MessageDigest.getInstance("SHA-1");
				criptografar.reset();
				criptografar.update(mensagem.getBytes("UTF-8"));
			} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
				System.out.println("Erro, algoritmo de criptografia não encontrado ou não suportado.");
				e.printStackTrace();
				return null;
			}
			return String.format("%040x", new BigInteger(1, criptografar.digest()));
	}
}
