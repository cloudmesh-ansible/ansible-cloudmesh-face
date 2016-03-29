""" self.run with

python setup.py install; nosetests -v --nocapture tests/cm_basic/test_face.py:Test_face.test_001

nosetests -v --nocapture tests/cm_basic/test_face.py

or

nosetests -v tests/cm_basic/test_face.py

"""
from __future__ import print_function
from cloudmesh_client.common.Shell import Shell
from cloudmesh_client.util import HEADING

from cloudmesh_client.util import banner
from cloudmesh_client.common.dotdict import dotdict


# noinspection PyMethodMayBeStatic,PyMethodMayBeStatic,PyPep8Naming
class Test_face(object):
    """  """

    data = dotdict({
        "name": "ABC"
    })

    def run(self, command):
        command = command.format(**self.data)
        banner(command, c="-")
        print(command)
        parameter = command.split(" ")
        shell_command = parameter[0]
        args = parameter[1:]
        result = Shell.execute(shell_command, args)
        print(result)
        return str(result)

    def setup(self):
        pass

    def test_001(self):
        HEADING("simple test")

        result = self.run("echo {name}")
        assert data.name in result

        
