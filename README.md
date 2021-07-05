# RaizenTest

Para a realização dos testes uitlizar os seguintes artefatos :

[ExcelRaizen.xlsx](https://github.com/carloscmattins/RaizenTest/blob/main/ExcelRaizen.xlsx) - que servira de insumo para o teste, esse arquivo contempla 2 bases disponibilizadas conforme o pedido pelo exercicio nas tabs Sheet1 e Sheet2.

* Sales of diesel by UF and type
* Sales of oil derivative fuels by UF and product


[RaizenTest.ipynb](https://github.com/carloscmattins/RaizenTest/blob/main/RaizenTest.ipynb) - Arquivo do tipo NOTEBOOK responsavel para o processo do pipeline


<b>OBSERVACAO: </b>

Salvar esses 2 arquivos numa mesma pasta na maquina local para usar como mapeamento futuro com a workspace da maquina Jupyter-Notebook definido logo abaixo

----

<B>DOCKER</B>

Para realização dos testes do PIPELINE foram usados 2 containers: MYSQL e JUPYTER NOTEBOOK :

--Comando utilizado para baixar as imagens do docker :

* docker pull jupyter/minimal-notebook
* docker pull mysql:latest

--Subir as imagens em container
* docker run -p 3307:3306 --name mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7
* docker run -it -v <b>caminho a definir na maquina local:/home/jovyan/workspace</b>  --name <b>nome da imagem</b> -p 8888:8888 jupyter/minimal-notebook

<b>O caminho a definir acima no mapeamento usar o mesmo onde estao os arquivos baixados do GITHUB, para facilitar o mapeamento entre a maquina local e a worskpace da maquina do Jupyter-Notebook</b>

Obs. Caso utilize a imagem do JUPYTER/MINIMAL-NOTEBOOK sera necessario instalar alguns frameworks adicionais para rodar o PIPELINE

* docker exec <b>CONTAINER ID</b> pip install pandas
* docker exec <b>CONTAINER ID</b> pip install openpyxl
* docker exec <b>CONTAINER ID</b> pip install xlrd
* docker exec <b>CONTAINER ID</b> pip install sqlalchemy

-----
<b>MYSQL</b>

Conectar na maquina criada através do seguinte comando :

* docker exec -it <b>container id mysql</b> bash

Digitar o seguinte comando:

* mysql -uroot -p
* Digitar a senha que no caso é <b>root</b>


Foi disponibilizado um script de criacao do Database e Tabela para ingestao dos dados abaixo ou seguir o passo a passo conforme preferir

[ScriptMysql.sql](https://github.com/carloscmattins/RaizenTest/blob/main/scriptMysql.sql)

Após entrar no banco criar o DATABASE raizen :
 
 * create database raizen;
 
Entrar em seguida no database :

* use raizen;

Criar a tabela que sera utilizada para carregar as informações vindas do PIPELINE :

<b>create table t_raizen (
yearmonth date, 
uf varchar(30),
product varchar(100),
unit varchar(10),
volume double(20,2),
created_at timestamp
);</b>

---
<b>JUPYTER NOTEBOOK</b>

Foi desenvolvido um script <b>RaizenTest.ipynb</b> utilizando o framework PANDAS para leitura do arquivo em EXCEL alem da gravacao na base de Dados Mysql e sua Leitura após a carga dos dados.

Para acessar o ambiente digitar o seguinte comando :
* http://localhost:8888/

No meu caso foi solicitado o <b>TOKEN</b> de acesso, tive que somente localizar na maquina o token conforme tela abaixo e copiar e colar no Browser.

![TelaTokenJupyter](https://user-images.githubusercontent.com/30783094/124404156-1404b480-dd10-11eb-9998-988b9d7dc510.GIF)

Após a autenticação sera exibida a Tela inicial com o <B>workspace</B> onde estarao os artefatos para o PIPELINE

![TelaInicialJupyter](https://user-images.githubusercontent.com/30783094/124404243-807fb380-dd10-11eb-871c-ab6c385eccd3.GIF)

Selecionar o o arquivo <b>RaizenTest.ipynb</b> conforme tela abaixo :

![TelaScriptJupyter](https://user-images.githubusercontent.com/30783094/124404442-4d89ef80-dd11-11eb-9d55-c46bf3811800.GIF)


Sera necesario ajustar o IP da maquina de quem for executar o script, achar no script o seguinte trecho

<b>engine = sqlalchemy.create_engine('mysql+pymysql://root:root@IPDAMAQUINALOCAL:3307/raizen')</b>

![AjustarIPAcesso](https://user-images.githubusercontent.com/30783094/124404945-6bf0ea80-dd13-11eb-9429-1a63587490c8.gif)

Feito esse ajuste rodar todos os trechos do script....

----
<b>EVIDENCIA</b>

Segue uma imagem da evidencia de carga através do SELECT pelo script no final da execuação

![EvidenciaCarga](https://user-images.githubusercontent.com/30783094/124404884-30eeb700-dd13-11eb-85c5-cbaa493e8b99.GIF)






