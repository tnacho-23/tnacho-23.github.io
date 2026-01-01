#!/bin/bash

echo "🎨 Actualizando estructura con diseño Minimalista Azul/Gris..."

# 1. Asegurar directorios
mkdir -p _layouts _includes _posts _sass assets/css assets/images assets/pdfs
mkdir -p ingenieria deporte lifestyle

# 2. Configuración _config.yml (Igual, aseguramos que exista)
cat <<EOF > _config.yml
title: Tu Nombre
email: tu_email@ejemplo.com
description: "Ingeniería, Deporte y Lifestyle"
baseurl: ""
url: "http://localhost:4000"
theme: minima
plugins:
  - jekyll-feed
  - jekyll-seo-tag
EOF

# 3. Gemfile
cat <<EOF > Gemfile
source "https://rubygems.org"
gem "jekyll", "~> 4.3.2"
gem "minima", "~> 2.5"
gem "webrick"
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-seo-tag"
end
EOF

# 4. CREAR ESTILOS CSS (DISEÑO SOLICITADO)
cat <<EOF > assets/css/style.css
:root {
  --primary-blue: #5D9CEC;       /* Azul claro vibrante */
  --soft-blue: #EDF2F7;          /* Azul muy pálido para fondos */
  --text-dark: #2D3748;          /* Gris oscuro para texto */
  --text-gray: #718096;          /* Gris medio para subtítulos */
  --bg-gray: #F7FAFC;            /* Fondo general */
  --white: #FFFFFF;
  --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  --radius: 12px;
}

body {
  font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
  background-color: var(--bg-gray);
  color: var(--text-dark);
  margin: 0;
  padding: 0;
  line-height: 1.6;
}

/* Header Flotante */
header {
  background-color: var(--white);
  box-shadow: var(--shadow);
  padding: 1rem 0;
  position: sticky;
  top: 0;
  z-index: 100;
}

header nav {
  max-width: 900px;
  margin: 0 auto;
  display: flex;
  justify-content: center;
  gap: 2rem;
}

header nav a {
  text-decoration: none;
  color: var(--text-gray);
  font-weight: 600;
  font-size: 1.1rem;
  transition: color 0.3s;
}

header nav a:hover {
  color: var(--primary-blue);
}

/* Contenedor Principal */
main {
  max-width: 900px;
  margin: 2rem auto;
  padding: 0 1rem;
}

/* Estilo de Tarjetas para contenido (No plano) */
.card {
  background: var(--white);
  border-radius: var(--radius);
  box-shadow: var(--shadow);
  padding: 2rem;
  margin-bottom: 2rem;
}

/* Sub-navegación (Pestañas Main/Blog) */
.sub-nav {
  display: flex;
  gap: 1rem;
  margin-bottom: 1.5rem;
  border-bottom: 2px solid var(--soft-blue);
  padding-bottom: 0.5rem;
}

.sub-nav a {
  text-decoration: none;
  color: var(--text-gray);
  padding: 0.5rem 1rem;
  border-radius: 6px;
  transition: all 0.2s;
}

.sub-nav a.active {
  background-color: var(--soft-blue);
  color: var(--primary-blue);
  font-weight: bold;
}

.sub-nav a:hover:not(.active) {
  background-color: #f0f0f0;
}

/* Botones */
.btn {
  display: inline-block;
  background-color: var(--primary-blue);
  color: white;
  padding: 0.6rem 1.2rem;
  text-decoration: none;
  border-radius: 50px;
  box-shadow: 0 2px 5px rgba(93, 156, 236, 0.4);
  transition: transform 0.2s;
}

.btn:hover {
  transform: translateY(-2px);
}

h1 { color: var(--text-dark); }
h2 { color: var(--primary-blue); font-size: 1.5rem; }
EOF

# 5. Layouts Mejorados

# Default
cat <<EOF > _layouts/default.html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>{{ page.title }}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="{{ "/assets/css/style.css" | relative_url }}">
</head>
<body>
  {% include header.html %}
  <main>
    {{ content }}
  </main>
  {% include footer.html %}
</body>
</html>
EOF

# --- Layout: Section MAIN (Equivalente al Home de la sección) ---
# Lógica: Si estoy en Main, la pestaña Main está activa. Blog es un link.
cat <<EOF > _layouts/section_main.html
---
layout: default
---
<div class="card">
  <div class="sub-nav">
    <a href="{{ page.url }}" class="active">Main</a>
    
    <a href="blog/">Blog</a>
  </div>

  <h1>{{ page.title }}</h1>
  
  <div class="intro-content">
    {{ content }}
  </div>

  <div style="margin-top: 2rem; text-align: center;">
    <div style="background: #eee; padding: 2rem; border-radius: 8px; margin-bottom: 1rem;">
      <p style="color: #888;">[ Espacio para Video Promocional 1 ]</p>
    </div>
    <div style="background: #eee; padding: 2rem; border-radius: 8px;">
      <p style="color: #888;">[ Espacio para Carrusel de Fotos ]</p>
    </div>
  </div>
</div>
EOF

# --- Layout: Section BLOG ---
# Lógica: Si estoy en Blog, Main es un link que sube un nivel (../).
cat <<EOF > _layouts/section_blog.html
---
layout: default
---
<div class="card">
  <div class="sub-nav">
    <a href="../">Main</a>
    
    <a href="{{ page.url }}" class="active">Blog</a>
  </div>

  <h1>Blog: {{ page.title }}</h1>
  
  <div class="blog-list">
    {% for post in site.posts %}
      {% if post.categories contains page.category_filter %}
        <div style="border-bottom: 1px solid #eee; padding: 1rem 0;">
          <h3 style="margin:0;"><a href="{{ post.url }}" style="color: var(--primary-blue); text-decoration:none;">{{ post.title }}</a></h3>
          <small style="color: #999;">{{ post.date | date: "%d %b, %Y" }}</small>
          <p>{{ post.excerpt | strip_html | truncatewords: 20 }}</p>
        </div>
      {% endif %}
    {% endfor %}
  </div>
</div>
EOF

# 6. Includes

# Header
cat <<EOF > _includes/header.html
<header>
  <nav>
    <a href="{{ "/" | relative_url }}">Home</a>
    <a href="{{ "/ingenieria/" | relative_url }}">Ingeniería</a>
    <a href="{{ "/deporte/" | relative_url }}">Deporte</a>
    <a href="{{ "/lifestyle/" | relative_url }}">Lifestyle</a>
    <a href="{{ "/cv/" | relative_url }}">CV</a>
  </nav>
</header>
EOF

# Footer
cat <<EOF > _includes/footer.html
<footer style="text-align: center; padding: 2rem; color: #718096; font-size: 0.9rem;">
  <p>&copy; 2026 Tu Nombre. Todos los derechos reservados.</p>
</footer>
EOF

# 7. Páginas de contenido (Se mantienen igual, la magia está en el layout)

# Home
cat <<EOF > index.md
---
layout: default
title: Home
---
<div class="card" style="text-align: center;">
  <h1>Bienvenido a mi Portafolio</h1>
  <p>Explora mis facetas en Ingeniería, Deporte y Estilo de Vida.</p>
</div>
EOF

# CV
cat <<EOF > cv.md
---
layout: default
title: CV
permalink: /cv/
---
<div class="card">
  <h1>Curriculum Vitae</h1>
  <p>Experiencia profesional y académica detallada.</p>
  
  <div style="margin-top: 2rem;">
    <a href="#" class="btn">Descargar CV (Español)</a>
    <a href="#" class="btn" style="background-color: #718096;">Download CV (English)</a>
  </div>
</div>
EOF

# Ingeniería
cat <<EOF > ingenieria/index.md
---
layout: section_main
title: Ingeniería
permalink: /ingenieria/
---
**¿A qué me dedico?**
Soy especialista en desarrollo de software y robótica. Aquí encontrarás mis proyectos principales y demos técnicos.
EOF

cat <<EOF > ingenieria/blog.md
---
layout: section_blog
title: Ingeniería
category_filter: ingenieria
permalink: /ingenieria/blog/
---
EOF

# Deporte
cat <<EOF > deporte/index.md
---
layout: section_main
title: Deporte
permalink: /deporte/
---
**Mi vida deportiva**
El deporte es mi motor. Aquí comparto mis entrenamientos y competiciones.
EOF

cat <<EOF > deporte/blog.md
---
layout: section_blog
title: Deporte
category_filter: deporte
permalink: /deporte/blog/
---
EOF

# Lifestyle
cat <<EOF > lifestyle/index.md
---
layout: section_main
title: Lifestyle
permalink: /lifestyle/
---
**Sobre mí**
Viajes, lectura y café. Un vistazo a lo que me inspira fuera del trabajo.
EOF

cat <<EOF > lifestyle/blog.md
---
layout: section_blog
title: Lifestyle
category_filter: lifestyle
permalink: /lifestyle/blog/
---
EOF

# Post prueba
cat <<EOF > _posts/2026-01-01-proyecto-robotica.md
---
layout: default
title: "Brazo robótico con Arduino"
date: 2026-01-01
categories: ingenieria
---
<div class="card">
  <h1>Brazo robótico con Arduino</h1>
  <p>Detalles sobre cómo construí un brazo robótico usando servos y control PID.</p>
</div>
EOF

echo "✨ ¡Listo! Estructura y diseño aplicados. Ejecuta 'docker run' para ver los cambios."