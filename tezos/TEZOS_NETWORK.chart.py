from re import search
from bases.FrameworkServices.LogService import LogService

update_every = 10 
retries = 3

ORDER = ['validated_blocks', 'injected_endorsements', 'injected_preendorsements', 'injected_blocks']

CHARTS = {
    'validated_blocks': {
        'options': [None, 'Validated blocks', 'count', 'blocks',
                    'blocks', 'line'],
        'lines': [
            ["validatedBlocks", "blocks", 'absolute', 1, 1]
        ]},
}

class Service(LogService):
    def __init__(self, configuration=None, name=None):
        LogService.__init__(self, configuration=configuration, name=name)
        self.log_path = self.configuration.get('path', '/mydata/log/local0.log')
        self.order = ORDER
        self.definitions = CHARTS

    def _get_data(self):
        try:
            data = {}
            data['validatedBlocks'] = 0
            for line in self._get_raw_data():
                if search(r'head is now', line):
                    data['validatedBlocks'] += 1
            return data
        except (ValueError, AttributeError):
            return None
