from django.test import SimpleTestCase
from web_app.forms import SugarForm,bpForm

class TestForms(SimpleTestCase):

    def test_sugar_form_valid_data(self):
        form = SugarForm(data={
            'userid' : 1,
            'testid' : 2
        })
        
        self.assertIsNone('userid')


    def test_sugar_form_no_data(self):
            form = SugarForm(data={})
            self.assertFalse(form.is_valid())
            self.assertEquals(len(form.errors),2)

    def test_bp_form_valid_data(self):
        form = bpForm(data={
            'uid' : 1,
            'tid' : 2
        })
        self.assertTrue(form.is_valid())


    def test_bp_form_no_data(self):
            form = bpForm(data={})

            self.assertFalse(form.is_valid())
            self.assertEquals(len(form.errors),2)        