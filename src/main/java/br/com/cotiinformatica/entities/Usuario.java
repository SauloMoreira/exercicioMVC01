package br.com.cotiinformatica.entities;

public class Usuario {
	
	private Integer idusuario;
	private String nome;
	private String email;
	private String senha;
	private String perfil;
	public Usuario() {
		// TODO Auto-generated constructor stub
	}
	
	public Usuario(Integer idusuario, String nome, String email, String senha, String perfil) {
		super();
		this.idusuario = idusuario;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.perfil = perfil;
	}

	public Integer getIdusuario() {
		return idusuario;
	}
	public void setIdusuario(Integer idusuario) {
		this.idusuario = idusuario;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	@Override
	public String toString() {
		return "Usuario [idusuario=" + idusuario + ", nome=" + nome + ", email=" + email + ", senha=" + senha
				+ ", perfil=" + perfil + "]";
	}


	
}
