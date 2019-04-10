# PEARC19 StashCache Tools
Tools used in the publishing of the PEARC19 StashCache paper

Cite as:

Derek Weitzel, Marian Zvada, Ilija Vukotic, Rob Gardner, Brian Bockelman, Mats Rynge, Edgar Fajardo Hernandez, Brian Lin, and Mátyás Selmeci. 2019. StashCache: A Distributed Caching Federation for the Open Science Grid.In PEARC ’19: Practice and Experience in Advanced Research Computing, Jul 28–Aug. 1, 2019, Chicago, IL.ACM, New York, NY, USA, 7 pages.

## Requirements

* Access to a StashCache origin
* Access to an HTTP server

The current tools hardcode the HTTP and StashCache URL in `test.sh`.  You can change those URL's to match your own.

## Setting up Tests

Create the test files with the `create_tests.sh` script.  It is run with a single argument, the directory for which to place the test files.

## Submitting the Test

The tests are submitted with DAGMan.  The `submit.dag` describes the workflow, as well as the sites that will run the tests.  `test.sh` is actually runs the tests on the remote worker node.

Once the tests have completed, it will generate output files named `out.<jobid>.<site>`.  Use the `parse.py` script to read in the output and output a CSV file which can be input to the jupyter notebooks.

## Juptyer Notebooks

The juptyer notebooks are used to visualize the data as well as calculate percent differences.
