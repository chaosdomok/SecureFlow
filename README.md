# 🛡️ The Golden Pipeline (Secure CI/CD)

Projekt demonstracyjny w pełni zautomatyzowanego i bezpiecznego procesu CI/CD (DevSecOps) dla aplikacji Node.js.

## 🚀 O projekcie
Celem projektu jest wdrożenie koncepcji **Shift Left Security**. Oznacza to, że bezpieczeństwo aplikacji jest sprawdzane automatycznie na każdym etapie budowania obrazu, zanim trafi on do środowiska produkcyjnego.

## 🛠️ Technologie
- **CI/CD:** GitHub Actions
- **Konteneryzacja:** Docker
- **SAST (Static Analysis):** SonarCloud
- **SCA (Software Composition Analysis):** Snyk
- **Vulnerability Scanning:** Trivy

## 🛡️ Bramki bezpieczeństwa (Security Gates)
Pipeline składa się z następujących kroków:
1. **Analiza statyczna kodu:** SonarCloud sprawdza kod pod kątem "Code Smells" i luk w logice.
2. **Skanowanie bibliotek:** Snyk weryfikuje, czy użyte paczki NPM nie posiadają znanych podatności.
3. **Budowa obrazu:** Tworzony jest kontener Docker.
4. **Skanowanie obrazu:** Trivy prześwietla gotowy obraz. Jeśli znajdzie błędy o statusie `CRITICAL`, pipeline zostaje przerwany.

## ⚙️ Jak uruchomić?
1. Sklonuj repozytorium.
2. Skonfiguruj sekrety `SNYK_TOKEN` oraz `SONAR_TOKEN` w ustawieniach GitHub Actions.
3. Wypchnij zmiany na branch `main` – pipeline uruchomi się automatycznie.