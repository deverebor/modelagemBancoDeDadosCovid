<h1 align="center">Modelagem - Banco de Dados Covid</h1>

<p align="center">
<strong>ESTE BANCO NÃO POSSÚI DADOS VERIDICOS, SÃO APENAS FICTICIOS PARA ESTUDO.</strong>
</p>

<p align="center">
  <img src="https://c.tenor.com/UOlZB9S6Yh8AAAAd/civid19-coronavirus.gif" width="500">
</p>

> Atividade aplicada pelo professor [Edson Mota](https://www.linkedin.com/in/edsonmottac/).

Modelagem feita no [Draw.io](https://app.diagrams.net/) `modelagem disponivél na pasta assets`.

Banco criado e desenvolvido utilizando o Microsoft SQL Server Management Studio 18.

## 📦 Dependências para rodar a aplicação

- `Microsoft SQL Server Management Studio 18 +.`
- `Draw.io, para visualização do diagrama.`

## 📜 Sobre o banco

Escolhi esse tema como parte central do meu trabalho por ser um assunto recente e possuir uma modelagem mais interessante e precisa. Para ter acesso aos scripts basta clicar [aqui](/databases/) ou ir a pasta `databases`.

### 🪄 Storage Procedure e Views

Dentro do arquivo `script.sql` está as procedures e views que foram criadas para a modelagem.

- Storage Procedure
  Feito uma procedure para pesquisa **nome** de pessoas infectadas.
- Views
  Criada uma view para mapear as **pessoas mortas** por unidade.

### 👨🏾‍🔬 Modelagem inical do banco

![banco](/assets/img/modelagemBancoDeDadosCovid.png)

>Feita no draw.io disponibilizado no [diagrama](assets/img/templates/)

Primeiro foi criado uma modelagem parcial para a visualização do banco e poder ter a noção de como poderia aplicar a minha lógica sobre.

A partir desta modelagem eu consegui filtrar e construir o **diagrama** final, que pode ser analisado a baixo.

### 📊 Diargama do Banco

Uma vez modelado apliquei a estrutura no SQL Server Management Studio 18.
La pude modificar e aplicar todas as alterações necessárias.

![diagrama](/assets/img/diagramaBancoDeDadosCovid.png)

## 📚 Oque aprendi ?

- Criação de scrips no SQL Server Management Studio.
- Criação e utilização prática do Storage Procedure.
- Criação e utilização prática das Views.
- Modelagem e manipulação do banco de dados.

## 📌 Links úteis

- Slide da apresentação [aqui](assets/slide/Banco%20de%20Dados%20-%20Covid%20UNIME.pptx)
- [Brasil.io](https://brasil.io/dataset/covid19/caso/) usado como base para a modelagem.

## 🤝🏾 Agradecimentos

Créditos especiais para [Bruno Lucciola](https://www.linkedin.com/in/brunolucciola/), [Gabriel Mendes](https://www.linkedin.com/in/gabriel-mendes-3a668917b/) e [Gabriel Melo](https://github.com/ArkGM) por ajudar a otimizar as buscas no DB e me auxiliar nas ideias da Procedures e View.

## 👨🏾‍🦱 Equipe composta por

- Lucas Pereira Souza.

<div align="center">
  <a href="https://www.linkedin.com/in/lucas-souza-dev/">
  <img height="25px" src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
</a>
  <p>
  📩 lucasp.sdev@gmail.com
  </p>
</div>

---

<p align="center">
Desenvolvido com 💘 por Lucas Souza.
</p>
