qrphr4github
============

This is a demo electronic health record (EHR)

Tob used with: Rails 4.0.0, Ruby 2.0.0 (or higher)

Methods to be used are:

- http://localhost:3000/patients => in order to list and maintain patient demographics

- http://localhost:3000/patientsedit => in order to change existing patient demogrpahics

- http://localhost:3000/results => in order to list results and query for result details

A new result record can be created via the URL:

- http://{domain}/pt/{patient_id}/{aes-encrypted and b64-encoded text}
 