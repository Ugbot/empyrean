import __builtin__
import pyr
#import pyr.client
import sys
import os

pyr.log(str(len([])) + sys.version + os.name + str(os))

def prepare(scene):
    images = [
        'warrior1.jpg',
        'Caphriel3.JPG',
        'ninja1.jpg',
        'Robot3.jpg',
        'levelOneColor.jpg']
    for i in images:
        scene.addImage('cutscene/' + i)
