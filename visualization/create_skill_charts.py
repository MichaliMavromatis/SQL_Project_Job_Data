import pandas as pd
import matplotlib.pyplot as plt
import os

# ---- Absolute-safe paths ----
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CSV_PATH = os.path.join(BASE_DIR, "job_insights_skills.csv")
IMAGES_DIR = os.path.join(BASE_DIR, "images")

print("CSV path:", CSV_PATH)
print("Images dir:", IMAGES_DIR)

# Create images directory
os.makedirs(IMAGES_DIR, exist_ok=True)

# Load data
df = pd.read_csv(CSV_PATH)

# ---------------------------
# Most In-Demand Skills
# ---------------------------
skill_demand = df["skills"].value_counts().head(10)

plt.figure()
skill_demand.plot(kind="bar")
plt.title("Top 10 Most In-Demand Skills (2023)")
plt.xlabel("Skill")
plt.ylabel("Job Postings")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.savefig(os.path.join(IMAGES_DIR, "skill_demand.png"))
plt.close()

# ---------------------------
# Highest Paying Skills
# ---------------------------
avg_salary = (
    df.groupby("skills")["salary_year_avg"]
    .mean()
    .sort_values(ascending=False)
    .head(10)
)

plt.figure()
avg_salary.plot(kind="bar")
plt.title("Top 10 Highest Paying Skills (2023)")
plt.xlabel("Skill")
plt.ylabel("Average Salary")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.savefig(os.path.join(IMAGES_DIR, "skill_salary.png"))
plt.close()

print("✅ Images created successfully")
