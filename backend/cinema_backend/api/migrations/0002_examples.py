# Generated by Django 5.1.3 on 2024-11-12 14:02

from django.db import migrations

def load_sql_file(apps, schema_editor):
    sql_file_path = 'schemas/cinema - DMLNew.sql'
    with open(sql_file_path, 'r') as f:
        sql_commands = f.read()
    schema_editor.execute(sql_commands)


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_DDL'),
    ]

    operations = [
        migrations.RunPython(load_sql_file),
    ]
