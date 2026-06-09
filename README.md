# 🛰️ SpaceAlert - Monitor de Clima Espacial

Aplicativo Flutter desenvolvido para a Global Solution 2026 - FIAP.
Monitora eventos de clima espacial em tempo real usando dados reais da NASA.

**Desenvolvido por:** Elizandra de Oliveira Rodrigues — RM 552288 — Turma 3SIZ  
**GitHub:** https://github.com/Lizveira/space-alert

---

## 📱 Proposta da Aplicação

O SpaceAlert consome dados da API Solar Shield (microsserviço desenvolvido na disciplina de Microservices) e exibe alertas de tempestades geomagnéticas classificados por severidade, permitindo que operadores de infraestrutura crítica tomem decisões baseadas em dados reais da NASA.

---

## 🏗️ Arquitetura MVVM

O projeto segue a arquitetura MVVM com Clean Architecture:
lib/
├── data/
│   ├── remote/         # Serviço HTTP (AlertService)
│   ├── model/          # Modelos de dados da API
│   └── repository/     # Implementação do repositório
├── domain/
│   ├── model/          # Entidades do domínio
│   ├── repository/     # Interface do repositório
│   └── usecase/        # Casos de uso
└── presentation/
├── screens/        # Telas do app
├── components/     # Widgets reutilizáveis
├── viewmodel/      # ViewModels
└── navigation/     # Rotas

## 📱 Fluxo de Telas

1. **Splash** → Verifica se usuário já viu introdução
2. **Intro/Onboarding** → Apresenta o app (3 páginas)
3. **Home** → Lista alertas com filtros
4. **Detail** → Detalhes do alerta
5. **Favorites** → Alertas favoritados

## 🔧 Tecnologias

- Flutter 3.x
- Provider (gerenciamento de estado)
- HTTP (consumo de API)
- SharedPreferences (persistência local)
- Clean Architecture + MVVM

## 🚀 Como executar

```bash
flutter pub get
flutter run
```

## 👩‍💻 Integrantes

- Elizandra de Oliveira Rodrigues — RM 552288