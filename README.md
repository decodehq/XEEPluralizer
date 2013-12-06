![Alt text](/images/xee_01.png)

XEEPluralizer
=============

XEEPluralizer is a class that helps you perform gramtically correct pluralization of the words in various languages.
Pluralization is a trivial task for most of the well known world's langauges. But for some langages (mostly Slavic) it can be a nuisance.
For example in English word "wolf" woulf be pluralized like this:
<li>
<ul>1 wolf</ul>
<ul>2 wolves</ul>
<ul>3 wolves</ul>
<ul>...</ul>
</li>

In Slovenian, for example, the same thing would look like this:
<li>
<ul>1 volk</ul>
<ul>2 volkovi</ul>
<ul>3 volkova</ul>
<ul>4 volkova</ul>
<ul>5 volkov</ul>
<ul>6 volkov</ul>
<ul>...</ul>
<ul>20 volkov</ul>
<ul>21 volk</ul>
<ul>22 volkova</ul>
<ul>23 volkova</ul>
<ul>24 volkova</ul>
<ul>25 volkov</ul>
<ul>...</ul>
</li>


Usage
------------

```objc
XEEPluralizer* pluralizerWolf = [[XEEPluralizer alloc] initWithWordForms:
  @{kXEEPluralizerFormSingular : NSLocalizedString(@"wolfSingular", nil),
    kXEEPluralizerFormDual : NSLocalizedString(@"wolfDual", nil),
    kXEEPluralizerFormPaucal : NSLocalizedString(@"wolfPaucal", nil),
    kXEEPluralizerFormPlural : NSLocalizedString(@"wolfPlural", nil)
  }];
    
for (int i = 0; i< 100; i++) {
  NSLog(@"%@", [pluralizerWolf pluralizedSyntagmForQuantity:N]);
}
```

Localizable.strings // English
```
"wolfSingular" = "wolf";
"wolfPlural" = "wolves";
```

Localizable.strings // Croatian
```
"wolfSingular" = "vuk";
"wolfPaucal" = "vuka";
"wolfPlural" = "vukova";
```

Localizable.strings // Slovenian
```
"wolfSingular" = "volk";
"wolfDual" = "volkova";
"wolfPaucal" = "volkovi";
"wolfPlural" = "volkov";
```




