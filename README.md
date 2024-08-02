Olá, esse é um banco de dados criado em MySQL para aprendizado da linguagem SQL.

Abaixo o contexto do estudo de caso

Vamos criar um caso fictício para que você possa praticar SQL. Vou criar um cenário simples de um sistema de gerenciamento de uma loja de livros. O banco de dados terá três tabelas principais: livros, autores e vendas.


__________________________________________________________________________________________________________________________
Estrutura das Tabelas

- Tabela livros: Contém informações sobre os livros disponíveis na loja.

	livro_id (INT): Identificador único do livro.
	titulo (VARCHAR): Título do livro.
	autor_id (INT): Identificador do autor (chave estrangeira).
	ano_publicacao (YEAR): Ano de publicação do livro.
	preco (DECIMAL): Preço do livro.

- Tabela autores: Contém informações sobre os autores dos livros.

	autor_id (INT): Identificador único do autor.
	nome (VARCHAR): Nome do autor.
	nacionalidade (VARCHAR): Nacionalidade do autor.

- Tabela vendas: Registra as vendas realizadas.

	venda_id (INT): Identificador único da venda.
	livro_id (INT): Identificador do livro vendido (chave estrangeira).
	data_venda (DATE): Data da venda.
	quantidade (INT): Quantidade de exemplares vendidos.
	valor_total (DECIMAL): Valor total da venda.


__________________________________________________________________________________________________________________________
Exemplo de Dados

- Tabela livros:

	livro_id	titulo	autor_id	ano_publicacao	preco
	1	"O Senhor dos Anéis"	1	1954	45.90
	2	"Harry Potter"	2	1997	39.90
	3	"O Código Da Vinci"	3	2003	29.90
	4	"As Crônicas de Nárnia"	4	1950	34.90


- Tabela autores:

	autor_id	nome	nacionalidade
	1	"J.R.R. Tolkien"	"Britânico"
	2	"J.K. Rowling"	"Britânica"
	3	"Dan Brown"	"Americano"
	4	"C.S. Lewis"	"Britânico"


- Tabela vendas:

	venda_id	livro_id	data_venda	quantidade	valor_total
	1	1	2024-01-10	3	137.70
	2	2	2024-02-15	2	79.80
	3	3	2024-03-05	1	29.90
	4	4	2024-04-12	5	174.50



__________________________________________________________________________________________________________________________
Consultas para Praticar


- Selecionar todos os livros e seus respectivos autores.


	SELECT livros.titulo, autores.nome
	FROM tbl_livros AS livros
	JOIN tbl_autores AS autores ON livros.id_autor = autores.id_autor;

- Encontrar o total de vendas para cada livro.


	SELECT livros.titulo, SUM(vendas.quantidade) AS total_vendido
	FROM tbl_vendas AS vendas
	JOIN tbl_livros AS livros ON vendas.id_livro = livros.id_livro
	GROUP BY livros.titulo;

- Calcular o valor total das vendas para cada autor.



	SELECT 

	autores.nome AS Nome,

	SUM(vendas.valor_total) AS "Total das Vendas"
    
	FROM tbl_vendas AS vendas
    
	JOIN tbl_livros AS livros ON vendas.id_livro = livros.id_livro
	JOIN tbl_autores AS autores ON livros.id_autor = autores.id_autor

	GROUP BY autores.nome; 

- Encontrar os livros publicados antes do ano 2000.

	SELECT titulo
	FROM tbl_livros
	WHERE ano_publicacao <2000

- Listar os autores com mais de um livro na loja.

	SELECT autores.nome,

	COUNT(livros.id_livro) AS num_livros
      
	FROM tbl_autores AS autores      
      
	JOIN tbl_livros AS livros ON autores.id_autor = livros.id_autor
      
	GROUP BY autores.nome
	HAVING	 num_livros >1;



