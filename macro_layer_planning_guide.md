# Guía para Planificación de Capas de Macros ZMK

## Objetivo
Esta guía te permitirá crear capas de macros organizadas, eficientes y reutilizables para cualquier framework o funcionalidad, replicando la metodología exitosa del sistema Git.

## Fase 1: Análisis y Categorización de Comandos

### 1.1 Identificación de Comandos Base
- **Comandos Atómicos**: Comandos individuales más frecuentes
- **Workflows Completos**: Secuencias de comandos que se ejecutan juntos habitualmente
- **Prefijos Modulares**: Comandos base que se combinan con otros elementos
- **Comandos de Control**: Modificadores que se combinan con prefijos
- **Referencias/Utilidades**: Elementos que se reutilizan en múltiples contextos

### 1.2 Criterios de Selección
- Priorizar comandos de **uso frecuente**
- Incluir **workflows completos** que ahorren múltiples pulsaciones
- Crear **elementos modulares** que se puedan combinar
- Evitar comandos muy específicos o de uso esporádico

### 1.3 Principio de Modularidad
- **Separar prefijos de sus modificadores** (ej: `git flow feature` + `start`)
- **Crear snippets independientes** que se puedan combinar
- **Evitar duplicación** de funcionalidad entre snippets

## Fase 2: Organización Estructural

### 2.1 Estructura de Categorías
```markdown
### Comandos Atómicos
- Comandos individuales más frecuentes

### Workflows Completos  
- Secuencias de comandos habituales

### Prefijos [Framework/Sistema]
- Comandos base modulares

### Comandos de Control
- Modificadores que se combinan con prefijos

### Referencias/Utilidades
- Elementos reutilizables

### Prefijos [Tipo Específico] (Tap Dance)
- Elementos que requieren combinaciones de teclas
```

### 2.2 Criterios de Agrupación
- **Frecuencia de uso**: Los más usados en categorías principales
- **Relación funcional**: Agrupar comandos relacionados
- **Tipo de interacción**: Separar comandos simples de tap dance

## Fase 3: Sistema de Asignación de Bindings

### 3.1 Jerarquía de Asignación
1. **Comandos más frecuentes** → Letras fáciles de acceder (ASDF, QWER)
2. **Prefijos principales** → Letras lógicas (primera letra del comando)
3. **Workflows** → Esquina superior izquierda (QWE, ASD)
4. **Comandos de control** → Letras consecutivas (IJK, etc.)
5. **Referencias** → Letras disponibles restantes

### 3.2 Reglas de Asignación
- **Letra predominante**: Usar primera letra del comando cuando sea posible
- **Lógica mnemotécnica**: Asociaciones fáciles de recordar
- **Accesibilidad**: Comandos frecuentes en posiciones cómodas
- **Consistencia**: Mantener patrones lógicos

### 3.3 Tap Dance para Elementos Específicos
- **Formato**: `LETRA+LETRA` para elementos relacionados
- **Lógica**: Primera letra del prefijo + primera letra del elemento específico
- **Ejemplo**: `F+F` para `feat:`, `X+X` para `fix:`

## Fase 4: Formato de Documentación

### 4.1 Estructura de Línea
```markdown
- **BINDING** → `comando o snippet`
```

### 4.2 Ventajas del Formato
- **Alineación visual** mejorada
- **Fácil lectura** de bindings
- **Búsqueda rápida** por binding o comando
- **Mantenimiento** simplificado

## Fase 5: Validación y Optimización

### 5.1 Criterios de Validación
- ✅ **Cobertura**: ¿Están los comandos más frecuentes?
- ✅ **Modularidad**: ¿Se pueden combinar elementos?
- ✅ **Eficiencia**: ¿Se reducen pulsaciones significativamente?
- ✅ **Memorabilidad**: ¿Son los bindings lógicos?
- ✅ **Escalabilidad**: ¿Se puede expandir fácilmente?

### 5.2 Optimizaciones Comunes
- **Workflows vs Comandos Atómicos**: Balancear automatización con flexibilidad
- **Referencias reutilizables**: Crear elementos que se usen en múltiples contextos
- **Eliminar redundancia**: Evitar múltiples formas de hacer lo mismo

## Fase 6: Implementación

### 6.1 Orden de Implementación
1. **Comandos atómicos** más frecuentes
2. **Workflows completos** principales
3. **Sistema de prefijos** modulares
4. **Tap dance** para elementos específicos
5. **Referencias y utilidades**

### 6.2 Testing y Refinamiento
- **Probar workflows completos** más frecuentes
- **Validar combinaciones** de prefijos + modificadores
- **Ajustar bindings** según uso real
- **Documentar casos de uso** comunes

## Template Base

```markdown
# Plan de Snippets [SISTEMA/FRAMEWORK]

### Comandos Atómicos
- **X** → `comando_frecuente_1`
- **Y** → `comando_frecuente_2`

### Workflows Completos
- **Q** → `comando1 && comando2`
- **W** → `workflow_completo_frecuente`

### Prefijos de [SISTEMA]
- **F** → `prefijo_principal `
- **V** → `prefijo_secundario `

### Comandos de Control
- **I** → `modificador1 `
- **J** → `modificador2 `

### Referencias/Utilidades
- **M** → `referencia_util`

### Prefijos [TIPO] (Tap Dance)
- **F+F** → `elemento_especifico1: `
- **F+X** → `elemento_especifico2: `
```

## Principios Clave para el Éxito

1. **Modularidad sobre Completitud**: Mejor pocos elementos combinables que muchos específicos
2. **Frecuencia sobre Completitud**: Priorizar comandos de uso diario
3. **Consistencia sobre Optimización**: Mantener patrones lógicos predecibles
4. **Iteración sobre Perfección**: Empezar simple y refinar con el uso
5. **Documentación clara**: El formato debe ser autoexplicativo

## Casos de Uso Comunes

### Para Frameworks de Desarrollo:
- Comandos de build, test, deploy
- Gestión de dependencias
- Comandos de debugging

### Para Sistemas de Administración:
- Comandos de sistema frecuentes
- Gestión de servicios
- Monitoreo y logs

### Para Herramientas CLI:
- Comandos con muchas opciones
- Workflows de configuración
- Operaciones repetitivas

---

**Resultado esperado**: Un sistema de macros que reduzca significativamente las pulsaciones de teclado manteniendo flexibilidad y siendo fácil de recordar y usar.
