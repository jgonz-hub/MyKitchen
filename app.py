from flask import Flask, render_template, request
import mysql.connector
app = Flask(__name__)

# recipes = [
#     {"id": 1, "title" : "Sancocho", "description": "Sabe rico"},
#     {"id": 2, "title" : "Arroz con Gandules", "description": "bueno con lechon"},
#     {"id": 3, "title" : "Pasteles", "description": "Bueno para la navidad"},
# ]

# Configure your MySQL database connection
db_config = {
    "host": "database-1.cz1imqcncgge.us-east-2.rds.amazonaws.com",
    "user": "feljon",
    "password": "feljonisu822",
    "database": "database-1",
}

@app.route('/')
def home():
    # Connect to the MySQL database
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor(dictionary=True)

    # Fetch data from the Recipes table
    cursor.execute("SELECT * FROM Recipes")
    recipes = cursor.fetchall()

    # Close the database connection
    cursor.close()
    conn.close()

    return render_template('home.html', recipes=recipes)

@app.route('/recipe/<int:recipe_id>')
def recipe(recipe_id):

    recipe_data = next((recipe for recipe in recipes if recipe['id']== recipe_id), None)
    if recipe_data:
        return render_template('recipe.html', recipe=recipe_data)
    else:
        return "recipe not found", 404

@app.route('/search', methods=['POST'])
def search():
    query = request.form.get('search_query')
    # Filter recipes based on the search query (for simplicity, we'll do a case-insensitive search)
    filtered_recipes = [recipe for recipe in recipes if query.lower() in recipe['title'].lower()]
    return render_template('search_results.html', recipes=filtered_recipes)

if __name__ == '__main__':
    app.run(debug=True)