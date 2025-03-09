# Flutter Clean Architecture

![Flutter](https://img.shields.io/badge/Flutter-3.29.1-blue?style=flat&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.7.0-blue?style=flat&logo=dart)

## 📌 Descripción

Este proyecto es una aplicación de prueba desarrollada con el objetivo de implementar una **arquitectura limpia** con diversas características interesantes, sirviendo como base para un proyecto escalable y de fácil mantenimiento en Flutter.

https://github.com/user-attachments/assets/63d69682-0fd7-4af1-ade8-e21f9703b49a

## 🛠️ Tecnologías y Paquetes Utilizados

- **Flutter**: Framework de desarrollo para aplicaciones multiplataforma.
- **Dart**: Lenguaje de programación principal.
- **GoRouter**: Manejo de rutas de manera declarativa y estructurada.
- **Provider**: Gestión del estado eficiente y fácil de mantener.
- **Diseño Atómico**: Aplicado en la pantalla `Home` para una mejor organización de los componentes.

## 📂 Estructura del Proyecto

La arquitectura propuesta sigue el patrón de **Clean Architecture**, separando el código en las siguientes capas:

```
/lib
│── core/            # Funcionalidades reutilizables (extensions, constants, etc.)
│── data/            # Capa de datos (datasources, models)
│── domain/          # Capa de dominio (usecases, entidades, interfaces)
│── presentation/    # Capa de presentación (providers, vistas, widgets)
│── main.dart        # Punto de entrada de la aplicación
```

Cada capa contiene los respectivos **providers, vistas, datasource, models, repositories y usecases**, asegurando una separación clara de responsabilidades y un código modular.

## 🚀 Mejoras Futuras

Actualmente, el proyecto implementa un manejo básico de errores y excepciones en las peticiones a los endpoints. Sin embargo, se recomienda una futura mejora mediante la implementación de un **ApiManager** para una gestión más eficiente.

## 📌 Objetivo

Este proyecto está diseñado para servir como base para cualquier tipo de aplicación Flutter, asegurando buenas prácticas, escalabilidad y mantenibilidad a largo plazo.

## 👨‍💻 Desarrollado por

**Jeison Solarte**

---

¡Espero que este README te sea útil! Puedes personalizarlo según sea necesario. 🚀
