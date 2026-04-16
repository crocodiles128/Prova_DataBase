1 
    SGBD:
    os relacionais são preferiveis visando que são mais estáveis, podem ser facilmente migrados de ambiente, tem alta relacionatividade, mantemcom melhor integridade os dados, e em casos de falha, a ação é revertida sem corromper os dados nele

    ACID:
    pois evitam conflitos como por exemplo alunousername e professores,username; e geram um "escopo" de permissão, onde o user só consegue acesso ao que deveria conseguir



normalização:

planilha Legada
a planilha estátoda desnormatizada, com varias entidade na mesma fonte
ex:

dados de disciplina
dados de docente
dados de aluno
dados de matrícula
dados de operador pedagógico

além disso tem 
redundância de dados (ex: aluno repetido várias vezes)
dependencias erradas
relacionamento n:n implícito entre alunos e disciplinas





#NF1

deve eliminar grupos repetidos gerar atomicidade

alguns dados já estão atomicos
porem, ha repetição de registros por conta do relacionamento entre aluno e disciplinas





#NF2

deve eliminar dependencias parciais

dependencias identificadas:
Nome_Usuario, Email_Usuario, Endereco_Usuario dependem apenas do aluno
Nome_Disciplina, Carga_H dependem apenas da disciplina

criei a entidade ALUNO E DISCIPLINA




#NF3

deve eliminar dependencias transitivas

problema:

docente depende da disciplina e ciclo depende da oferta



solução
criei a entidade DOCENTE e TURMA (oFERTA)
e separei o relacionamento n:n





modelo:

ALUNO (
    id_aluno PK,
    nome,
    email,
    endereco,
    ativo
)

DOCENTE (
    id_docente PK,
    nome,
    ativo
)

DISCIPLINA (
    cod_disciplina PK,
    nome,
    carga_h,
    ativo
)

OPERADoR (
    id_operador PK
)

TURMA (
    id_turma PK,
    cod_disciplina FK,
    id_docente FK,
    ciclo,
    ativo
)

MATRICULA (
    id_matricula PK,
    id_aluno FK,
    data_ingresso,
    id_operador FK,
    ativo
)

MATRICULA_TURMA (
    id_matricula FK,
    id_turma FK,
    score_final,
    PRIMARY KEY (id_matricula, id_turma)
)




problema:

dois operadores tentam alterar a mesma nota simultaneamente

resolve com uso de iscolamento


o isolamento garante que transações concorrentes não interfiram negativamente entre si, elas são executadas como se fossem duas completamente separadas

uso de locks

o SGBD aplica bloqueios (locks):

quando um operador altera uma nota, o registro é bloqueado (lock exclusivo)

o outro operador espera o término (lock wait)ou retorna um erro

então:
evita o lost update
