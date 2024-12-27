from re import search
from bases.FrameworkServices.LogService import LogService

update_every = 10 
retries = 3

ORDER = ['validated_blocks', 'rollup_applied_blueprints', 'evm_applied_blueprints']

CHARTS = {
    'validated_blocks': {
        'options': [None, 'Validated blocks', 'count', 'blocks',
                    'blocks', 'line'],
        'lines': [
            ["validatedBlocks", "blocks", 'absolute', 1, 1]
        ]},
    'rollup_applied_blueprints': {
        'options': [None, 'Rollup applied blueprints', 'count', 'rollup_blueprints',
                    'rollup_blueprints', 'line'],
        'lines': [
            ["rollupAppliedBlueprint", "rollup blueprints", 'absolute', 1, 1]
        ]},
    'evm_applied_blueprints': {
        'options': [None, 'EVM applied blueprints', 'count', 'evm_blueprints',
                    'evm_blueprints', 'line'],
        'lines': [
            ["evmAppliedBlueprint", "evm blueprints", 'absolute', 1, 1]
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
            data['rollupAppliedBlueprint'] = 0
            data['evmAppliedBlueprint'] = 0
            for line in self._get_raw_data():
                if search(r'head is now', line):
                    data['validatedBlocks'] += 1
                if search(r'The rollup node kernel applied blueprint', line):
                    data['rollupAppliedBlueprint'] += 1
                if search(r'Applied a blueprint for level', line):
                    data['evmAppliedBlueprint'] += 1
            return data
        except (ValueError, AttributeError):
            return None
