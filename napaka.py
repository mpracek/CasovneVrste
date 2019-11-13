---------------------------------------------------------------------------
OSError                                   Traceback (most recent call last)
<ipython-input-1-3364981fe86a> in <module>
      2 
      3 from __future__ import print_function
----> 4 from keras.callbacks import LambdaCallback
      5 from keras.models import Sequential
      6 from keras.layers import Dense

c:\programdata\lib\site-packages\keras\__init__.py in <module>
      1 from __future__ import absolute_import
      2 
----> 3 from . import utils
      4 from . import activations
      5 from . import applications

c:\programdata\lib\site-packages\keras\utils\__init__.py in <module>
      1 from __future__ import absolute_import
----> 2 from . import np_utils
      3 from . import generic_utils
      4 from . import data_utils
      5 from . import io_utils

c:\programdata\lib\site-packages\keras\utils\np_utils.py in <module>
      4 from __future__ import print_function
      5 
----> 6 import numpy as np
      7 
      8 

c:\programdata\lib\site-packages\numpy\__init__.py in <module>
    138 
    139     # Allow distributors to run custom init code
--> 140     from . import _distributor_init
    141 
    142     from . import core

c:\programdata\lib\site-packages\numpy\_distributor_init.py in <module>
     24                 # NOTE: would it change behavior to load ALL
     25                 # DLLs at this path vs. the name restriction?
---> 26                 WinDLL(os.path.abspath(filename))
     27                 DLL_filenames.append(filename)
     28     if len(DLL_filenames) > 1:

c:\programdata\lib\ctypes\__init__.py in __init__(self, name, mode, handle, use_errno, use_last_error)
    342 
    343         if handle is None:
--> 344             self._handle = _dlopen(self._name, mode)
    345         else:
    346             self._handle = handle

OSError: [WinError 193] %1 ni veljaven program Win32