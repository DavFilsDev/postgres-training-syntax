"""
Generate fake data for testing PostgreSQL projects
"""

from faker import Faker
import csv

fake = Faker()

# Example: generate 100 fake users
with open('datasets/fake_users.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['id', 'name', 'email', 'password'])
    for i in range(1, 101):
        writer.writerow([i, fake.name(), fake.email(), 'hashed_password'])
