
## Explorando a estrutura do Result em Swift

Se você é desenvolvedor Swift muito provavelmente conhece o tipo `Result`. Ele é utiliza a feature de [generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html) do Swift, e nos auxilia a lidar com requisições que podem dar certo - nos trazendo um valor de retorno, ou errado, resultando em um erro.

Ao realizar operações é bem comum que tenhamos no mínimo dois outputs; `if-else`, `is nil or not` e `success-failure` nos são bem familiares. Você já parou pra pensar no porquê essa estrutura funciona tão bem? 

Para o caso `success-failure`, temos a assinatura de método:
```
enum Result<Success, Failure> where Failure : Error
```
Isto é, `Result` é um `enum` associado à dois tipos: `Success` e `Failure`, tal que `Failure` é do tipo `Error`.

```swift
enum Result<Success, Failure> where Failure : Error {
    case success(Success)
    case failure(Failure)
}
 ```
O construtor `succcess` está associado à um tipo `Success` (Tipo Genérico), permitindo que essa estrutura seja flexível e reutilizável por qualquer outro tipo, você define. Já o construtor `failure` demanda a conformidade com o tipo `Error`; qualquer tipo que conforme com esse protocolo representa um erro. Apesar dessa pequena limitação, você pode tanto utilizar os tipos de `Error` do Swift ou criar os seus. 
```swift
load { [weak self] result in
    switch result {
    case .success(let data):
      self?.render(data)
    case .failure(let error):
      switch error {
      case .networkUnavailable:
          self?.showErrorView(withMessage: .offline)
      case .timedOut:
          self?.showErrorView(withMessage: .timedOut)
      }
    }
}
```
Agora que já conhecemos a estrutura do `Result` vamos olhar para o [`Optional`](https://developer.apple.com/documentation/swift/optional):
```
enum Optional<Wrapped> {
  case none
  case some(value: Wrapped)
}
```
Peguemos como exemplo [`String.popLast()`](https://developer.apple.com/documentation/swift/string/2997140-poplast):
```
func popLast() -> Character?
```
 Na [documentação](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html) temos que:
> Optionals say **either** “there is a value, and it equals x” or “there isn’t a value at all”.  

Agora um exemplo meu para representar se um ícone usará a imagem de uma URL ou uma imagem default:
```
typealias IconType<URL, UIImage> {
  case withURL(URL)
  case placeholder(UIImage)
}
```

Percebeu que todos esses exemplos possuem uma estrutura em comum? Como até destaquei na explicação de `Optionals`, essa estrura se chama `Either` e pode ser definida assim:
```
type Either<A: Type, B: Type> {
  left(value: A),
  right(value: B)
}
```
As utilidades e variações são tantas que podemos até mesmo definir o que é um número e o que é uma lista! 
```
type Nat {
  zero
  succ(pred: Nat)
}

type List<A: Type> {
  nil
  cons(head: A, tail: List<A>)
}
```

E aí, ficou curioso(a) em saber mais sobre `Result` e `Either`? Aqui vão algumas
sugestões de leitura sobre o assunto:
- [The power of Result types in Swift](https://www.swiftbysundell.com/articles/the-power-of-result-types-in-swift/)
- [Point Free - The algebra of enums](https://www.pointfree.co/episodes/ep4-algebraic-data-types#t706)
- [Some types in Kind language](https://github.com/Kindelia/Kind#some-types)

Caso queira ir além e se aprofundar no uso de `Enums`, recomendo estudar sobre Algebraic Data Type (ADT).
