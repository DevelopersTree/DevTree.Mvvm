# DevTree.Mvvm [![NuGet](https://img.shields.io/nuget/v/DevTree.Mvvm.svg)](https://www.nuget.org/packages/DevTree.Mvvm/)
A tiny MVVM framework for tiny apps. Most of the time a really small MVVM framework is enough to get work done. No need for fancy stuff.

## Documentation
This package contains only two classes:

### `BindableBase`
Which serves as a base class for your ViewModels. It contains a couple of helpful methods: `SetProperty<T>`:
This method is used to simplify notification-aware properties. It will automatically fire `PropertyChanged` event whenever the property is changed.

```csharp
private int _myProperty;
public int MyProperty
{
    get { return _myProperty; }
    set { SetProperty(ref _myProperty, value); }
}
```

### `DelegateCommand`
Which is an implementation of ICommand from [WpfTutorial](http://www.wpftutorial.net/delegatecommand.html). Usage:

This is how you declare a command in your ViewModel:

```csharp
 public ICommand SomeComamnd { get; }
```

And in the constructor, initialize the command like so:

```csharp
SomeComamnd = new DelegateCommand(p => DoSomething(p), p => CheckIfICanDoSomething(p));
```

One of the useful methods of this class is it's `RaisePropertyChanged` which you call whenever something changes that might affect the commands ability to execute. This manual check is much more efficient than WPF's own implementation that checks whether the command can execute too frequently.
