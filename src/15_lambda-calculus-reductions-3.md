$$
((λx.(x x))(λx.(x x)))
$$

函数 $(λx.(x x))$ 应用到自身上，根据 [β-规约](https://en.wikipedia.org/wiki/Lambda_calculus#%CE%B2-reduction)，将 $x$ 替换为 $(λx.(x x))$，得到 $((λx.(x x))(λx.(x x)))$，这个结果恰好又是原表达式的副本。

因此，这个表达式在逻辑上会无限次地重复自己。这种表达式在 λ 演算中被称为[不动点组合子](https://en.wikipedia.org/wiki/Fixed-point_combinator)。

```title="solution"
CAN'T REDUCE
```
