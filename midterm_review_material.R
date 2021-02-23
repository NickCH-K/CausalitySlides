## Causal Diagrams

- Let's draw (and justify) a diagram to get the effect of Building Code Restrictions `BCR`, which prevent housing from being built, on `Rent`
- Consider perhaps: the `Sup`ply of housing built, characteristics of the `loc`ation that lead to `BCR`s being passed, `Dem`and for housing in the area, the overall economy...

## Causal Diagrams Answer

One answer, with non-BCR `Laws`, `Labor` market, `econ`omy:

```{r, dev='CairoPNG', echo=FALSE, fig.width=7, fig.height=5.5}
dag <- dagify(Rent~Dem+Sup+Laws,
              Laws~loc+U1,
              Sup~loc+BCR+econ,
              Dem~loc+Labor+econ,
              BCR~loc+U1,
              Labor~econ,
              coords=list(
                x=c(Rent=3,Dem=2,Sup=2,Laws=1,loc=0,U1=0,econ=2,BCR=1,Labor=1.5),
                y=c(Rent=1,Dem=1.5,Sup=3,Laws=1,loc=2,U1=1,econ=2.25,BCR=1.5,Labor=1.85)
              )) %>% tidy_dagitty()
ggdag(dag,node_size=20)
```

## Causal Diagram Answer

Open front doors:

- `BCR -> Sup -> Rent`
- (note all others closed because they use Sup as a collider)

Open back doors:

- `BCR <- U1 -> Laws -> Rent`
- `BCR <- loc -> Laws -> Rent`
- `BCR <- loc -> Dem -> Rent`
- `BCR <- loc -> Sup -> Rent`

Which others paths are there, closed by colliders?

## Causal Diagram Answer

- If we control for Laws, then BCR <- U1 -> Laws <- loc -> etc. opens back up! 
- Thankfully if we control for `loc` that shuts it back down
- We can identify this by controlling just for `loc` and `Laws`
