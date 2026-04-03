### Estrutura do Projeto - P1 (Desenvolvimento de Sistemas Móveis)

Ana Júlia Gouveia Mazzi e Ana Luiza Soares 

Para esta atividade, adotamos uma arquitetura baseada em Camadas de Responsabilidade, garantindo que a lógica de negócio, os dados e a interface visual fiquem separados. Isso facilita a manutenção e segue as boas práticas pedidas em aula.

### Arquitetura Adotada

A organização das pastas dentro de lib/app foi dividida da seguinte forma:

- Models (/models): Contém as classes que definem a estrutura dos nossos dados. Aqui temos o UsuarioModel, que representa o contrato do que é um usuário no sistema (nome, email e senha).

- Data (/data): Camada responsável pela persistência. Como solicitado, utilizamos um Mock Store com o padrão Singleton (UsuarioMockStore). Isso permite que a lista de usuários cadastrados seja acessível por todo o app e permaneça "viva" na memória durante a execução, simulando um banco de dados.

- ViewModels (/viewmodels): É a ponte entre a View e os Dados. As ViewModels (LoginViewModel e SignupViewModel) lidam com a lógica de decisão, como verificar se as credenciais batem ou comandar a criação de um novo perfil, sem "poluir" o código da tela.

- Views (/views): Contém apenas a interface do usuário (UI). Aqui estão as telas de Splash, Login, Cadastro e Home. Utilizamos o pacote validatorless para garantir que o usuário preencha os campos corretamente antes de disparar qualquer ação.

<img width="781" height="427" alt="image" src="https://github.com/user-attachments/assets/c7175355-92ab-4966-9cb2-772379b3e594" />

### Fluxo de Funcionamento

1. O app inicia pela SplashPage (3 segundos).

2. O usuário realiza o cadastro na SignupPage, que salva os dados na MockStore.

3. Na LoginPage, o sistema valida os dados informados consultando a store através da ViewModel.

4. Após o sucesso, o usuário é direcionado para a HomePage.
