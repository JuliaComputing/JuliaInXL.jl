# Using JuliaInXL 

## Julia Office Ribbon Tab

If JuliaInXL was installed via the Julia package manager, then in most cases a Julia process should launch automatically when starting your Excel session.

![](assets/media/image77.png)

A Julia tab will also be present in the Office Ribbon that contains a number of buttons and text boxes for controlling the connection between Julia and Excel, as well as loading functionality into the current Julia process.

![](assets/media/image78.png)

The "Launch Local Julia" button will launch a new child Julia process, as well as start a JuliaInXL server process that listens on the currently defined TCP endpoint.

When this button is pressed, any current child Julia process is shutdown before launching a new Julia process.

![](assets/media/image79.png)

Adjacent to the "Launch Local Julia" button is a "Julia File Path" text box for entering the path to a file that can be loaded into the Julia process via the `include` command.

![](assets/media/image80.png)

Below the "Julia File Path", is a "Select Julia File" button, which launches a file chooser dialog box that allows for browsing to a Julia file that can be loaded into the current Julia process.

![](assets/media/image81.png)

![](assets/media/image82.png)

Selecting a file using this dialog box only populates the "Julia File Path" text box with the path to the file selected.

![](assets/media/image83.png)

With a file selected via the "Select Julia File" button or manually entered into the "Julia File Path" text box, the selected file can be loaded into the Julia process using the "Include Julia File" button.

![](assets/media/image84.png)

In the screenshot below, we have included the "sim.jl" file from the "test" directory of the JuliaInXL package installation.  The `simulate` function defined in `sim.jl` is now available for use from the current Julia process and is callable from Excel via `jlcall` as described in a later section.

![](assets/media/image85.png)

Adjacent to the "Julia File Path" text box is the "JuliaInXL TCP Endpoint" textbox.  This textbox displays the currently configured TCP endpoint to use when Excel connects to a JuliaInXL server. The default value is sufficient for most users. This should only be changed if you start and manage your own server process.  

![](assets/media/image86.png)

Below the "JuliaInXL TCP Endpoint" textbox is the "Reconnect" button.  This button resets the TCP client endpoint on the Excel side of the connection, and then attempts to reconnect to the existing JuliaInXL server.  

![](assets/media/image88.png)

If an execution of `jlcall` has resulted in a `#JuliaNotConnected` error, then either the "Launch Local Julia" button or the "Reconnect" button (described below) can be used to re-establish a connection to a JuliaInXL server process.  The "Launch Local Julia" button launches a new julia.exe process, while the "Reconnect" button attempts to connect to a JuliaInXL server in an existing julia.exe process.

The "Terminate" button disconnects the TCP client endpoint on the Excel side of the connection.

![](assets/media/image89.png)

## Calling Julia Functions from Excel using `jlcall`

Once the server is started, julia functions can be called from Excel using the `jlcall` worksheet function. The first argument to `jlcall` is a string, which is the name of the registered Julia function to be called. Subsequent arguments to the `jlcall` function are passed as parameters to the Julia function being called. These can be constant literals, or cell references. Arrays can be passed via cell ranges.

If the Julia function returns an array (1d or 2d), then use `jlcall` as an Excel Array function by selecting a range before entering the function, and pressing `Shift+Ctrl+Enter` to finish.
Functions exposed to Excel should take floats or strings, or their arrays as arguments. In general, it is a good idea to keep the function arguments as loosely typed as possible. Therefore functions should return integers, floats, or strings; or their arrays. However, arrays of dimensions greater than two are not supported.
Note that [Excel stores all numbers as 64 bit IEEE floats](https://support.microsoft.com/en-us/kb/78113). Therefore, be aware of the possibility of truncation if returning large, or high precision, numbers.
Dates are passed in from excel as floating point numbers in its internal encoding (fractional days since 1/1/1900 or 1/1/1904). Thus, they are recieved in Julia functions as floats. They can be converted to Julia DateTime values using the xldate function.

Below we show the initial entry of `jlcall` being called within a cell.

![](assets/media/image90.png)

And the completion of that statement calling the `simulate` function from our example.

![](assets/media/image91.png)

As well as the corresponding result:

![](assets/media/image92.png)

By copying the contents of the cell in which `jlcall` was executed into multiple cells, the original `jlcall` operation can be repeated within multiple cells.

![](assets/media/image93.png)

![](assets/media/image94.png)


## Defining global variables via `jlsetvar`

If you wish to assign a value to a variable within the current Julia process, a `global` variable can be created through the use of the `jlsetvar` function in Excel.  

`jlsetvar` accepts two arguments, where the first argument is a text string for the name of the variable to be created and the second argument is a numeric value, a string value, or a cell reference or cell range whose contents are numbers or strings.

## Executing a Julia expression via `jleval`

If you wish to define a Julia expression to be evaluated in the Julia process hosting the JuliaInXL server, the `jleval` function accepts a single string argument whose contents must be able to be evaluated by the julia function:

```
parse_and_eval(arg) = eval(parse(arg::String))
```


