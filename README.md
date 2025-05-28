# Compilador SimpleScript

Este proyecto consiste en la implementación de un compilador educativo para el lenguaje inventado **SimpleScript**, desarrollado como parte de un curso de compiladores. Incluye un analizador léxico y sintáctico, generación de código intermedio y una interfaz web para probar código directamente.

---

## [![Docs](https://img.shields.io/badge/Documentation-PDF-blue)](https://github.com/ajuarezs3/compiladorTraductor/blob/main/documentacion.pdf)

Puedes consultar la documentación técnica completa del proyecto dando click en PDF (definición del lenguaje, gramática, pruebas y arquitectura del sistema) en el siguiente enlace:

> Incluye: definición del lenguaje, tokens, gramática, implementación léxica y sintáctica, interfaz web y pruebas.

---

## 🚀 Tecnologías utilizadas

[![Minimum PHP Version](https://img.shields.io/badge/PHP-7.4%2B-blue)](https://www.php.net/)
[![Laravel](https://img.shields.io/badge/Laravel-9.x-red)](https://laravel.com/)
[![Java](https://img.shields.io/badge/Java-21-green)](https://www.oracle.com/java/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-orange)](https://www.mysql.com/)
[![JFlex](https://img.shields.io/badge/JFlex-1.9.1-yellow)](https://jflex.de/)
[![CUP](https://img.shields.io/badge/CUP-11b-lightgrey)](http://www2.cs.tum.edu/projects/cup/)



### 🔧 Back-End del compilador
- **Java 21**
- **JFlex** – Analizador léxico
- **CUP (Constructor of Useful Parsers)** – Analizador sintáctico

### 🌐 Interfaz Web

### http://20.169.89.69/


🔐 **Credenciales de prueba:**

| Usuario                | Contraseña |
|------------------------|------------|
| ajuarezs3@miumg.edu.gt | umg        |

⚠️ **Nota:** Estos accesos son solo para fines académicos y de pruebas dentro de la UMG.

- **Laravel 9** – Framework PHP
- **Blade** – Motor de plantillas
- **Tailwind CSS** – Estilizado moderno
- **DataTables** – Visualización de entradas previas
- **Interacción con el compilador Java** – mediante ejecución de un `.jar` desde Laravel


## 📷 Interfaz

La aplicación permite:
- Ingresar código en SimpleScript
- Validarlo sintácticamente
- Visualizar errores con línea exacta
- Ver historial de entradas analizadas

---

## 🗂 Estructura del proyecto

```bash
├── analizador/
│   ├── src/org/example/
│   │   ├── Main.java
│   │   ├── AnalizadorLexico.flex
│   │   └── parser.cup
│   └──  target/
        ├── classes/
        │   └── org/example/
        │       ├── AnalizadorLexico.class
        │       ├── Main.class
        │       ├── parser.class
        │       └── sym.class
        ├── generated-sources/
        │   ├── annotations/
        │   ├── cup/org/example/
        │   │   ├── parser.java
        │   │   └── sym.java
        │   └── jflex/org/example/
        │       └── AnalizadorLexico.java
        ├── maven-archiver/
        ├── maven-status/maven-compiler-plugin/
        ├── analizador-1.0-SNAPSHOT.jar
        └── analizador-1.0-SNAPSHOT-jar-with-dependencies.jar
├── web/
    └── src/
        ├── routes/web.php
        ├── resources/views/
        ├── app/Http/Controllers/CodeController.php
        └── public/storage/app/analizador-1.0-SNAPSHOT.jar
└── README.md
```