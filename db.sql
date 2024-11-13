CREATE TABLE country (
    id UUID NOT NULL PRIMARY KEY,
    country TEXT NOT NULL,
    iso2 VARCHAR(255) NOT NULL,
    iso3 VARCHAR(255) NOT NULL,
    flag_icon_path TEXT NOT NULL
);

CREATE TABLE calling_code (
    id UUID NOT NULL PRIMARY KEY,
    country UUID NOT NULL,
    calling_code VARCHAR(255) NOT NULL,
    FOREIGN KEY (country) REFERENCES country(id) ON DELETE CASCADE
);

CREATE TABLE sex (
    id UUID NOT NULL PRIMARY KEY,
    code INT NOT NULL,
    sex VARCHAR(255) NOT NULL,
    icon_path TEXT NOT NULL
);


CREATE TABLE diet (
    id UUID NOT NULL PRIMARY KEY,
    diet VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE skin_type (
    id UUID NOT NULL PRIMARY KEY,
    skin_type VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE blood_type (
    id UUID NOT NULL PRIMARY KEY,
    blood_type VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE user_account(
    id UUID NOT NULL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    is_google_authenticated INT NOT NULL,
    password TEXT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birthdate TIMESTAMP NOT NULL,
    sex UUID NOT NULL,
    address TEXT NOT NULL,
    country UUID NOT NULL,
    calling_code UUID NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    height FLOAT NULL,
    mass FLOAT NULL,
    blood_type UUID NULL,
    skin_type UUID NULL,
    created_at TIMESTAMP NOT NULL,
    verified_at TIMESTAMP NULL,
    last_login_at TIMESTAMP NULL,
    personal_details_updated_at TIMESTAMP NULL,
    password_updated_at TIMESTAMP NULL,
    account_status INT NOT NULL,
    account_status_updated_at TIMESTAMP NULL,
    FOREIGN KEY (sex) REFERENCES sex(id) ON DELETE CASCADE,
    FOREIGN KEY (country) REFERENCES country(id) ON DELETE CASCADE,
    FOREIGN KEY (calling_code) REFERENCES calling_code(id) ON DELETE CASCADE,
    FOREIGN KEY (blood_type) REFERENCES blood_type(id) ON DELETE CASCADE,
    FOREIGN KEY (skin_type) REFERENCES skin_type(id) ON DELETE CASCADE
);

CREATE TABLE chat(
    id UUID NOT NULL PRIMARY KEY,
    user_account UUID NOT NULL,
    created_at TIMESTAMP NOT NULL,
    FOREIGN KEY (user_account) REFERENCES user_account(id) ON DELETE CASCADE
);

CREATE TABLE chat_message(
    id UUID NOT NULL PRIMARY KEY,
    chat UUID NOT NULL,
    user_account UUID NOT NULL,
    sender VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    image_path TEXT NULL,
    created_at TIMESTAMP NOT NULL,
    FOREIGN KEY (chat) REFERENCES chat(id) ON DELETE CASCADE,
    FOREIGN KEY (user_account) REFERENCES user_account(id) ON DELETE CASCADE
);

CREATE TABLE generated_meal(
    id UUID NOT NULL PRIMARY KEY,
    user_account UUID NOT NULL,
    prompt TEXT NULL,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    image_path TEXT NOT NULL,
    created_at TIMESTAMP NULL,
    FOREIGN KEY (user_account) REFERENCES user_account(id) ON DELETE CASCADE
);

CREATE TABLE generated_workout(
    id UUID NOT NULL PRIMARY KEY,
    user_account UUID NOT NULL,
    prompt TEXT NULL,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    FOREIGN KEY (user_account) REFERENCES user_account(id) ON DELETE CASCADE
);

CREATE TABLE medical_appointment_note(
    id UUID NOT NULL PRIMARY KEY,
    user_account UUID NOT NULL,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    insights TEXT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NULL,
    generated_insights_updated_at TIMESTAMP NULL,
    FOREIGN KEY (user_account) REFERENCES user_account(id) ON DELETE CASCADE
);

CREATE TABLE diet_preference(
    id UUID NOT NULL PRIMARY KEY,
    user_account UUID NOT NULL,
    diet UUID NOT NULL,
    FOREIGN KEY (user_account) REFERENCES user_account(id) ON DELETE CASCADE,
    FOREIGN KEY (diet) REFERENCES diet(id) ON DELETE CASCADE
);