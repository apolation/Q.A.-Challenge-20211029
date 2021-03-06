<h1>Arquitetura do projeto</h1>

Configurando sua máquina
-------------------------
Necessário instalar:
-----------------------

*	Ruby for Windows: linguagem de programação utilizada nos testes de API.
*	Cmder for Windows: Sistema que trás as funcionalidades bash (Terminal) para o Windows.
*	DevKit: Kit de ferramentas que o sistema operacional precisa para que o desenvolvimento funcione.

Considerações
----------------------------------------------------------------------------------
Escolhi Cucumber por ter mais domínio e conhecimento, uma das vantagens do cucumber é a facilidade de entender as regras de negócio utilizando Sintax do Gherkin.\
É uma solução opensource.\
Não possuo conhecimento sobre Selenium e Ghost Inspect, fiz algumas pesquisas sobre\
Selenium parece ser meio "travado" em sua execução.\
Ghost Inspect aparentemente é simples e intuitivo de criar os planos de testes, porém é uma solução paga.

Obrigado pelo teste, estou à disposição para quaisquer esclarecimentos.
-------------------------------

Link da apresentação:\
https://www.loom.com/embed/a95e61fabd6d4dfa8319a53449c09d78
----------------------------------------------------------------------



Configurando o ambiente de automação de testes
------------------------------------------------------------

Para que sua automação possa ser realizada é necessário instalar alguns recursos, conforme será descrito abaixo:

Windows
--------

<h3>1. Instalando o Console do Cmder</h3>

*	Baixe em: <https://github.com/cmderdev/cmder/releases/download/v1.3.14/cmder.zip> .
*	Descompactar na pasta C:\Cmder.
*	Selecione o cmder.exe e arrastar até sua barra de ferramentas do Windows para criar um atalho.
*	Executar o cmder.exe.

<h3>2. Instalando o Ruby para Windows de acordo com a versão do seu sistema operacional e arquitetura x86 (32bits) ou x64 (64bits)</h3>

*	Baixe em: <http://rubyinstaller.org/downloads/>.
*	Executar o arquivo baixado e seguir as instruções clicando em ‘next’.
* 	Selecionar os 3 checkbox exibidos e continuar a dar ‘next’ até o ‘finish’.
*	No Console do Cmder, digite o comando ruby –v , se a instalação estiver correta aparecerá a versão instalada.

<h3>4. Alterando os sources do rubygems</h3>

O Rubygems precisa de uma atualização de certificado de sergurança para permitir utilizar com https,
e para não precisar atualizar isso, passamos a utilizar então o repositório de gems em http, fazendo o
seguinte:
*	No Console do Cmder, digite o comando:
```bash
gem sources -a http://rubygems.org/
gem sources -r https://rubygems.org/
```

<h3>5. Instalando o bundler</h3>

No Console do Cmder, digite o comando:
```bash
gem install bundler
```

Após clonar o projeto, dentro da pasta raíz do mesmo, digite o comando:
```bash
bundle install
```

E pronto, ambiente configurado.


Automação de Testes
--------------------

Para a automação de testes algumas gems do Ruby são essenciais, sendo elas:
*	Capybara
*	Cucumber
*	Rspec

Para manter o controle das Gems usadas no projeto, adicione no arquivo Gemfile e serão instaladas de uma só vez.
Com o arquivo Gemfile configurado, utiliza-se a gem bundler para instalação das dependências listadas:
```bash
gem install bundler
bundle install
```

<h3>Aprendendo a usar o env.rb</h3>

*	O env.rb inicializa configurações do teste, tal como o navegador que deve ser utilizado se a automação fosse de web, por exemplo.
*	O require sob em memória os arquivos das Gems necessárias.

<h3>Configurando Profiles no arquivo cucumber.yml</h3>

O arquivo cucumber.yml é utilizado para definir os profiles utilizados para nossa automação.

Quero executar os testes sem aparecer o passo a passo, mas com ele me dando o report em HTML na pasta raíz do projeto:

````bash
cucumber -p report
````

Os profiles podem ser usados para diversas configurações como ambiente, massa, browser, entre outros.


<h3>Utilizando Tags</h3>

Utilizamos a tag para diferenciar os cenários por grupos, funcionalidades ou etapas de testes. As tags são inseridas na linha de cima do nome do cenário.
No terminal, quando quisermos rodar os cenários que estão nomeados com tags, basta utilizarmos o seguinte comando:

````bash
Cucumber –-tag @nome_da_tag
````
Ou 
````bash
Cucumber –t @nome_da_tag
````

Esse comando rodará todos os cenários que tiverem a tag.

Executando os testes automatizados
-----------------------------------

Para executar o testes automatizados usaremos alguns comandos a partir da pasta raiz do nosso projeto.

*	Para execução de todos os cenários implementados utilizamos o seguinte código:
````bash
cucumber
````

Todos os testes são executados.

*	Para execução de algum cenário específico utilizamos as tags:
````bash
Todos os testes: cucumber ou cucumber -t @weather

````
O teste demarcado com a tag é executado.

*	Para execução de todos os cenários e gerar um report em html, utilizamos o seguinte código:
````bash
cucumber -p report
````

Na pasta raiz do projeto é gerado um arquivo HTML com o report dos cenários de testes.

Basta abrir no seu navegador e visualizar o resultado.
