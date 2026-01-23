---
layout: default
title: "Continual Learning For Object Classification Using Gaussian Modeling"
date: 2026-01-23
categories: ingenieria
---
<div class="card" style="text-align: justify;"> 
  <h1>Continual Learning</h1>

  <p> Hace algunos meses junto a mi profesor guía, dr. Javier Ruiz del Solar, y mi profesor co-guía, dr. Patricio Loncomilla, presentamos en la Conferencia Internacional sobre Análisis de Imágenes y Procesamiento (ICIAP) resultados preliminares sobre mi tesis en el paper titulado "Continual Object Learning Using Gaussian Modeling". </p>

  <p> Los proceedings ya fueron publicados y nuestro trabajo se encuentra disponible aquí: 
  
  <div style="display: flex; justify-content: center; margin-top: 1rem; margin-bottom: 1rem;">
    <a href="https://link.springer.com/chapter/10.1007/978-3-032-11381-8_16" 
       target="_blank" 
       rel="noopener noreferrer" 
       style="background-color: #004a99; color: white; padding: 10px 25px; text-decoration: none; border-radius: 5px; font-weight: bold; display: inline-flex; align-items: center; gap: 8px;">
      <i class="fas fa-file-pdf"></i> Ver Paper en Springer
    </a>
  </div>

  <hr>

  <h3>Resumen del Trabajo</h3>
  <p>En esta investigación, proponemos un sistema de reconocimiento de objetos capaz de aprender de forma continua, abordando el desafío de incorporar nuevas clases sin necesidad de reentrenar modelos completos ni sufrir de "olvido catastrófico".</p>

  <div class="carousel-container">

  <div class="carousel-item">
    <img src="/assets/images/ingenieria/continual_learning/diagram.png" alt="Diagram">
  </div>
  </div>

  <p style="font-size: 0.8rem; color: #718096; margin-top: 0.5rem;">
    Diagrama de la Aquitectura Propuesta
  </p>
  <ul>
    <li><strong>Arquitectura Dual:</strong> El sistema separa la extracción de características (usando modelos fundacionales basados en ViT) de la clasificación propiamente tal.</li>
    <li><strong>Modelado con Gaussianas:</strong> Cada clase de objeto se representa de forma independiente mediante distribuciones Gaussianas o Modelos de Mezcla de Gaussianas (GMM), lo que facilita la adición de nuevas categorías.</li>
    <li><strong>Eficiencia de Datos:</strong> A diferencia de los modelos tradicionales, este enfoque permite alcanzar un alto desempeño utilizando solo una pequeña fracción de los datos de entrenamiento.</li>
  </ul>

  <h3>Resultados Destacados</h3>
  <p>Validamos nuestra propuesta utilizando los datasets ImageNet y Caltech-256, obteniendo conclusiones muy prometedoras:</p>
  <ul>
    <li>La variante <strong>GMM-up-to-4</strong> mantiene una robustez notable, con una caída de accuracy menor al 0.5% respecto al baseline original en ImageNet.</li>
    <li>Para aprender una nueva clase y alcanzar un <strong>80% de accuracy</strong>, el modelo solo requiere entre 20 y 30 ejemplos.</li>
    <li>Con 40 a 50 ejemplos, el accuracy logra superar el 90%, demostrando una gran capacidad de aprendizaje rápido y secuencial.</li>
  </ul>
