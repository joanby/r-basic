# Cambios de la rama `update-2026`

> Esta rama es el mismo curso —Curso completo de Estadística descriptiva - RStudio y Python—, con el código
> adaptado a las versiones de hoy: R 4.5.3 (rmarkdown 2.32, knitr 1.52, reticulate 1.47) y, para Python,
> pandas 3.0, NumPy 2.5, matplotlib 3.11 y SciPy 1.18 (octubre de 2026). La rama principal sigue
> exactamente como en el vídeo.

> **Cómo se ha comprobado.** Se han ejecutado los 56 ficheros del curso: los scripts de R línea a línea, como en
> RStudio, y los `.Rmd` y notebooks de principio a fin. Lo de R, dos veces: con R y paquetes de finales de 2019 y
> con los de hoy; lo que solo fallaba hoy se ha arreglado. **Funcionan 54 de 56.** Los tres notebooks que piden
> datos por teclado (`input()`) se han ejecutado respondiendo automáticamente.
> **No comprobados (necesitan internet, no accesible desde el entorno de prueba):** `02-load-data.Rmd` (descarga
> `bulls.dat` de la web de la Universidad de Iowa) y `04-dataframes.ipynb` (descarga un CSV).
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

Los scripts de R (`.R`) no han necesitado cambios.
