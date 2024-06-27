from re import search
from bases.FrameworkServices.LogService import LogService

update_every = 10 
retries = 3

ORDER = ['validated_blocks', 'injected_attestations', 'injected_preattestations', 'injected_blocks']

CHARTS = {
    'validated_blocks': {
        'options': [None, 'Validated blocks', 'count', 'blocks',
                    'blocks', 'line'],
        'lines': [
            ["validatedBlocks", "blocks", 'absolute', 1, 1]
        ]},
    'injected_attestations': {
        'options': [None, 'Injected attestations', 'count', 'blocks',
                    'blocks', 'line'],
        'lines': [
            ["injectedAttestations", "blocks", 'absolute', 1, 1]
        ]},
    'injected_preattestations': {
        'options': [None, 'Injected preattestations', 'count', 'blocks',
                    'blocks', 'line'],
        'lines': [
            ["injectedPreAttestations", "blocks", 'absolute', 1, 1]
        ]},
    'injected_blocks': {
        'options': [None, 'Injected blocks', 'count', 'blocks',
                    'blocks', 'line'],
        'lines': [
            ["injectedBlocks", "blocks", 'absolute', 1, 1]
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
            data['injectedAttestation'] = 0
            data['injectedPreAttestation'] = 0
            data['injectedBlocks'] = 0
            for line in self._get_raw_data():
                if search(r'head is now', line):
                    data['validatedBlocks'] += 1
                if search(r'injected attestation', line):
                    data['injectedAttestation'] += 1
                if search(r'injected preattestation', line):
                    data['injectedPreAttestation'] += 1
                if search(r'round 0 injected', line):
                    data['injectedBlocks'] += 1
            return data
        except (ValueError, AttributeError):
            return None
