from re import search
from bases.FrameworkServices.LogService import LogService

update_every = 10 
retries = 3

ORDER = ['execution', 'consensus']

CHARTS = {
    'execution': {
        'options': [None, 'Execution', 'count', 'execution_blocks',
                    'execution_blocks', 'line'],
        'lines': [
            ["execution", "execution", 'absolute', 1, 1]
        ]},
    'consensus': {
        'options': [None, 'Consensus', 'count', 'consensus_blocks',
                    'consensus_blocks', 'line'],
        'lines': [
            ["consensus", "consensus", 'absolute', 1, 1]
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
            data['execution'] = 0
            data['consensus'] = 0
            for line in self._get_raw_data():
                if search(r'Chain head was updated', line):
                    data['execution'] += 1
                if search(r'Slot Event', line):
                    data['consensus'] += 1
            return data
        except (ValueError, AttributeError):
            return None
