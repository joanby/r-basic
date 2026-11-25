# Cambios de la rama `update-2026`

> Esta rama es el mismo curso —Curso completo de Estadística descriptiva - RStudio y Python—, con el código
> adaptado a las versiones de hoy: R 4.5.3 (rmarkdown 2.32, knitr 1.52, reticulate 1.47) y, para Python,
> pandas 3.0, NumPy 2.5, matplotlib 3.11, SciPy 1.18 y seaborn 0.13 (octubre de 2026; revisada en noviembre).
> La rama principal sigue exactamente como en el vídeo.

> **Cómo se ha comprobado.** Se han ejecutado los 56 ficheros del curso: los scripts de R línea a línea, como en
> RStudio, y los `.Rmd` y notebooks de principio a fin. Lo de R, dos veces: con R y paquetes de finales de 2019 y
> con los de hoy; lo que solo fallaba hoy se ha arreglado. **Funcionan los 56.** Los dos últimos en comprobarse,
> `02-load-data.Rmd` y `04-dataframes.ipynb`, descargaban sus datos de webs que ya no existen: ahora los descargan
> de este mismo repositorio (más abajo). Los tres notebooks que piden datos por teclado (`input()`) se han
> ejecutado respondiendo automáticamente.
> Los números pueden variar un poco respecto al vídeo en lo que es aleatorio sin semilla.

## Cómo usarla

`git clone -b update-2026 https://github.com/joanby/r-basic` (o *Code → Download ZIP* desde la rama). Para los
notebooks de Python, `pip install -r requirements.txt`: son las versiones **fijadas** con las que se ha
comprobado.

## Qué ha cambiado y por qué

### Python (notebooks)

| En el vídeo | Hoy | Por qué |
|---|---|---|
| `np.arange(3, 12, dtype=np.float)` | `dtype=float` | NumPy quitó los alias `np.float`, `np.int`…; eran los tipos de Python. |
| `plt.hist(x, 50, normed=1, …)` | `density=1` | matplotlib renombró el argumento. |
| `plt.yscale("symlog", linthreshy=0.01)` | `linthresh=0.01` | Ídem. |
| `df.groupby('key').mean()` (y `median`, `std`) con columnas de texto | `.mean(numeric_only=True)` | pandas descartaba solo las columnas de texto; hoy hay que pedírselo. |
| `planets.distance.mad()` | `(planets.distance - planets.distance.mean()).abs().mean()` | pandas 2 quitó `mad()`; es la misma desviación media absoluta. |
| `pd.datetime(2020, month, day)` | `pd.Timestamp(2020, month, day)` | pandas quitó `pd.datetime`. |
| `fulldata = [data, data2, data2[::2,0]]` (diagramas de caja, tema 8) | `[data[:,0], data2[:,0], data2[::2,0]]` | matplotlib ya no acepta mezclar columnas (2D) y vectores (1D) en la misma lista; son los mismos datos. |
| La lista de tipos de NumPy con `float_` y `complex_` (tema 3) | sin ellos: `float64` y `complex128` ya estaban en la lista | NumPy 2.0 quitó esos dos alias; si los tecleas, `AttributeError`. |
| `x.shape = (4,3)` y `t.shape = (5,2)` (tema 3); `data.shape = (-1,1)` (tema 8) | `x = x.reshape(4, 3)`, `t = t.reshape(5, 2)`, `data = data.reshape(-1, 1)` | NumPy 2.5 avisa (`DeprecationWarning`) de que cambiar la forma asignando `.shape` se va a quitar. `reshape` da la misma matriz. |
| `ax5.boxplot(data, vert=False, …)` (tema 8) | `orientation='horizontal'` | matplotlib 3.11 avisa de que `vert` se quita en la 3.13. Es el mismo gráfico. |
| `sb.distplot(data, fit=stats.laplace, kde=False)` (tema 9) | `sb.histplot(data, stat="density")` y la curva aparte: `ax.plot(xs, stats.laplace.pdf(xs, *stats.laplace.fit(data)))` | seaborn 0.11 dejó `distplot` obsoleto (avisa, y se quita en la 0.14). `histplot` no ajusta distribuciones, así que la Laplace se ajusta con SciPy y se dibuja encima: es lo que hacía `fit=` por dentro. |
| `plt.gca().set_xticklabels(['', "Lun", …, "Dom"])` (nacimientos, tema 9) | `plt.gca().set_xticks(range(7))` y las etiquetas sin el `''` | matplotlib avisa de que poner etiquetas sin fijar antes los ticks puede colocarlas en el sitio equivocado. El `''` era para el tick que matplotlib ponía solo en el −1; con los siete ticks fijados, sobra. |

### Datos que se descargaban de webs que ya no existen (tema 5)

- `02-load-data.Rmd` leía `bulls.dat` y `olive.dat` de `maitra.public.iastate.edu`, una web de la
  Universidad Estatal de Iowa. Ese dominio ya no existe y `read.table` da error. Ahora los lee de este repositorio:
  `https://raw.githubusercontent.com/joanby/r-basic/master/data/bulls.dat` (el mismo fichero) y `…/data/olive.txt`
  (aquí se llama `.txt`; es el que el propio `.Rmd` guarda unas líneas más abajo). Salen las mismas tablas:
  76 × 9 y 572 × 9.
- `04-dataframes.ipynb` leía `http://winterolympicsmedals.com/medals.csv`. Ese dominio está aparcado: responde
  con una página HTML, y pandas falla al leerla (`ParserError`). Si la tecleas en R, es peor: `read.csv` no da
  error y te devuelve una tabla de 20 × 1 hecha de HTML. Ahora:
  `pd.read_csv("https://raw.githubusercontent.com/joanby/r-basic/master/data/medals.csv", index_col=0)` (y lo
  mismo en el `read_table` de más abajo). Ese CSV se guardó desde R, con el número de fila como primera columna:
  `index_col=0` la usa de índice y quedan las 2311 filas × 8 columnas del vídeo.

### Diapositivas (teoría)

- Tema 11: el paquete de la normal en Python es `scipy.stats.norm`, no `scipy.stats.normal` (no existe), y la
  media se le pasa como `loc`, no como `mu`.
- Tema 5: la lista de conjuntos de datos de la UCI se ha movido a `https://archive.ics.uci.edu/datasets`; el
  enlace viejo da 404.

### R Markdown con Python (tema 12)

- `from ggplot import diamonds` / `mtcars`: el paquete `ggplot` de Python ya no se puede instalar. Los mismos datos
  están en `plotnine`: `from plotnine.data import diamonds`.
- `data.mean()` sobre `mtcars`, que tiene la columna de texto `name`: `data.mean(numeric_only=True)` (lo mismo
  con `median`).
- `use_python("/anaconda3/bin/python")` apunta a una ruta de mi ordenador y hoy reticulate **para el documento**
  si no existe. Ahora lleva `required = FALSE`: reticulate usa el Python que encuentre. Si quieres uno concreto,
  cambia la ruta por la tuya.
- **Cachés de knitr subidas al repositorio** (`01-diamonds_cache`, `02-pokemon_cache`, `04-mtcars_cache`): se han
  borrado. Guardaban resultados de los paquetes de entonces; RStudio las vuelve a crear.

### Celdas que dan error a propósito

Algunas celdas del curso enseñan un error (un índice fuera de rango, `math.sqrt(-1.0)`, una función llamada con
argumentos de más, pseudocódigo…). Siguen igual y se han marcado (`raises-exception`) para que *Run All* no se pare
ahí. Una más, `data.loc[[0]]` en `06-Functions.ipynb`: en el vídeo se ejecutó con otra tabla cargada; con
`bodyfat.txt`, cuyas filas empiezan en 1, no hay fila 0. Es justo la diferencia entre `loc` (por etiqueta) e
`iloc` (por posición): `data.loc[[1]]` da la primera fila.

Los scripts de R (`.R`) no han necesitado cambios. R sí ha cambiado dos cosas que se notan en lo que ves:
están en el apartado siguiente.

## Lo que puede verse distinto al vídeo

- **Los números aleatorios de R, aunque fijes la semilla.** Desde R 3.6.0, `sample()` usa otro método para elegir
  (el anterior estaba ligeramente sesgado), así que `set.seed` + `sample` da otros números que en el vídeo. Por
  ejemplo, los `clientes` del tema 7 (`set.seed(2018)`): hoy salen 12, 12, 11, 5 y 10 respuestas de cada valor; en
  el vídeo, 14, 6, 12, 10 y 8. No es un fallo: si quieres los del vídeo, ejecuta antes
  `RNGkind(sample.kind = "Rounding")` (R avisa de que ese método no es uniforme; es lo esperado). Afecta a los
  temas 7, 8 y 9; en el 6 ya eran aleatorios, porque no fija semilla.
- **El texto ya no se convierte en factor.** Desde R 4.0, `read.table`, `read.csv` y `data.frame` tienen
  `stringsAsFactors = FALSE` por defecto. Las diapositivas de los temas 6 y 7 muestran `Factor w/ …` donde hoy
  sale `chr`, y `summary()` de esa columna ya no cuenta cuántas veces sale cada valor; la del tema 5 dice que por
  defecto R sí convierte. Para verlo como en el vídeo, añade `stringsAsFactors = TRUE`.
- **`df.groupby('key').apply(norm_by_col2)`** (tema 5): no da error, pero en pandas 3 la función ya no recibe la
  columna `key`. El resultado sale sin ella y con un índice doble (la clave y el número de fila).
- **Las medallas** (tema 5): el índice empieza en 1 y no en 0, y la columna `Event gender` se llama
  `Event.gender` (R cambia los espacios de los nombres por puntos al guardar).
- **El histograma con la Laplace** (tema 9): `histplot` elige otros intervalos y otros colores que `distplot`.

## Lo que no se ha ejecutado

- Los tres notebooks que piden datos por teclado (`06-Functions.ipynb`, `07-io.ipynb` y `01-collections.ipynb`) se
  han comprobado con respuestas automáticas, no tecleando.

## Lo que sigue dando aviso

- `y.shape = (2,5)` en `02-numpy.ipynb` (tema 3) da el mismo `DeprecationWarning` de NumPy 2.5, pero funciona. No
  se ha cambiado porque la celda demuestra precisamente que `y = x` es el mismo objeto: al cambiar la forma de `y`
  cambia la de `x`. `reshape` crea otro objeto y rompería esa demostración y las celdas que la siguen.
