# RaizenTest

Para a realização dos testes uitlizar os seguintes artefatos :

[ExcelRaizen.xlsx](https://github.com/carloscmattins/RaizenTest/blob/main/ExcelRaizen.xlsx) - que servira de insumo para o teste, esse arquivo contempla 2 bases disponibilizadas conforme o pedido pelo exercicio nas tabs Sheet1 e Sheet2.

* Sales of diesel by UF and type
* Sales of oil derivative fuels by UF and product


[Raizen.ipynb](https://github.com/carloscmattins/RaizenTest/blob/main/Raizen.ipynb) - Arquivo do tipo NOTEBOOK responsavel para o processo do pipeline


<B>DOCKER</B>

Para realização dos testes do PIPELINE foram usados 2 containers: MYSQL e JUPYTER NOTEBOOK :

--Comando utilizado para baixar as imagens do docker :

* docker pull jupyter/minimal-notebook
* docker pull mysql:latest

--Subir as imagens em container
* docker run -p 3307:3306 --name mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7
* docker run -it -v <b>caminho a definir na maquina local:/home/jovyan/workspace</b>  --name <b>nome da imagem</b> -p 8888:8888 jupyter/minimal-notebook

Obs. Caso utilize a imagem do JUPYTER/MINIMAL-NOTEBOOK sera necessario instalar alguns frameworks adicionais para rodar o PIPELINE

* docker exec <b>CONTAINER ID</b> pip install pandas
* docker exec <b>CONTAINER ID</b> pip install openpyxl
* docker exec <b>CONTAINER ID</b> pip install xlrd
* docker exec <b>CONTAINER ID</b> pip install sqlalchemy


<b>MYSQL</b>

Conectar na maquina criada através do seguinte comando :

* docker exec -it <b>container id mysql</b> bash

Digitar o seguinte comando:

* mysql -uroot -p
* Digitar a senha que no caso é <b>root</b>

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


No arquivo <b>Raizen.ipynb</b> substituir o trecho em destaque pelo caminho onde se encontra o artefato ExcelRaizen.xlsx e a <b>Sheet_Name</b> - (Sheet1 ou Sheet2) para analise do resultado.
![Tela](https://user-images.githubusercontent.com/30783094/124328930-e7f70100-db60-11eb-8fd0-6aebe54ff61d.GIF)
