# ucum

Dart Library Mimicking the Unified Code for Units of Measure FHIR Library Functionality

#### All credit goes to (I assume Graham) and everyone else who built this library in Java. With the help of ChatGPT, I've managed to get it to work in Dart. 

#### As does the original library, this package provides a set of services around UCUM:

- first step in using this library is getting the Ucum service

```dart
    ucumService = await getUcumEssenceService();
```

- validate a UCUM unit (and also against a particular base unit)
- decide whether one unit can be converted/compared to another
- translate a quantity from one unit to another 

```dart
    await ucumService.convert(Decimal.fromString('15'), '/min', '/h');
```

- prepare a human readable display of a unit 
- multiply 2 quantities together


### While I'll be maintaining this package, I want to ensure I give proper credit everywhere it's due
- This is the [original Java Library]()
- The essence file can be downloaded from: [http://unitsofmeasure.org](http://unitsofmeasure.org)


### Original Copyright Notice
/*******************************************************************************
BSD 3-Clause License

Copyright (c) 2023, Grey Faulkenberry
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* Neither the name of the copyright holder nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*******************************************************************************/
