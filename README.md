# Expense Tracker

## Description

Expense tracker is for now a simple open source and free mobile app designed to follow your expenses and incomes for your personnal comfort and information.

The frontend part is built in dart/Flutter then converted to natives langages like Swift, Kotlin, Javascript, etc.

The backend part is built in PostgreSQL for the database and Python for the API.

```mermaid
%%{init: {
    'theme': 'base',
    'themeVariables': {
      'primaryColor': '#BB2528',
      'primaryTextColor': '#fff',
      'primaryBorderColor': '#7C0000',
      'secondaryColor': '#006100',
      'tertiaryColor': '#fff'
        }
    }
}%%
graph LR
%% Colors %%
classDef blue fill:#4d59c2,stroke:#000,stroke-width:2px,color:#fff
classDef red fill:#E57373,stroke:#000,stroke-width:2px,color:#fff
classDef green fill:#37a146,stroke:#000,stroke-width:2px,color:#fff
classDef grey fill:#9e9e9e,stroke:#000,stroke-width:2px,color:#fff

subgraph User Flow
    direction LR

    subgraph Authentication
    direction LR
    Onboarding(Onboarding):::blue --> Introduction(Introduction):::blue
    Introduction --> Login(Login):::blue
    Introduction --> Register(Register):::blue

    end
    subgraph General
    direction LR
    Login --> Navbar
    Register --> Navbar
    Onboarding --> Navbar
    Navbar(Navbar):::blue
    Navbar --> Home(Home):::blue
    Navbar --> Calendar(Calendar):::blue
    Navbar --> Forms(Forms):::blue
    Navbar --> Settings(Settings):::blue
    end

end
```

### Features

```mermaid
%%{init:
    {
    'theme': 'base',
    'themeVariables':
        {
        'primaryColor': '#BB2528',
        'primaryTextColor': '#fff',
        'primaryBorderColor': '#7C0000',
        'secondaryColor': '#006100',
        'tertiaryColor': '#fff'

        }
    }
}%%
graph LR
%% Colors %%
classDef blue fill:#4d59c2,stroke:#000,stroke-width:2px,color:#fff
classDef red fill:#E57373,stroke:#000,stroke-width:2px,color:#fff
classDef green fill:#37a146,stroke:#000,stroke-width:2px,color:#fff
classDef grey fill:#9e9e9e,stroke:#000,stroke-width:2px,color:#fff
classDef title fontSize: 50px, padding: 20px;

General:::title
Authentication:::title
Specific:::title

subgraph Authentication[Authentication]
Oboarding(Onboarding):::green --> Introduction(Introduction):::green
Introduction --> Login(Login):::green
Introduction --> Register(Register):::green
end

subgraph General[General]
direction LR
Login --> Navbar(Navbar):::green
Register --> Navbar
Navbar(Navbar):::blue
Navbar --> Home(Home):::blue
Navbar --> Calendar(Calendar):::blue
Navbar --> Forms(Forms):::blue
Navbar --> Settings(Settings):::blue
end

subgraph Specific[Specific]
direction LR
Home --> GetLatestNews(Get Latest News):::grey
Home --> ViewTotal(View total):::grey
Calendar --> ViewCalendar(View calendar):::green
Calendar --> SeeEvents(See events):::grey
Calendar --> AddEvent(Add/Remove event):::grey
Forms --> AddExpense(AddExpense):::green
Forms --> AddIncome(AddIncome):::green
Settings --> ChangeLanguage(Change language):::green
Settings --> ChangeCurrency(Change currency):::grey
Settings --> ChangeTheme(Change theme):::green
end

subgraph Legends[Legends]
Done(Done):::green
Progress(Progress):::blue
Todo(Todo):::grey
end


```

### Support

- [x] iOS
- [ ] Android
- [ ] web
- [ ] Windows
- [ ] Linux
- [ ] MacOS

### i18n

- [x] English
- [x] French
- [ ] Others

## Installation

No content for the installation yet.
