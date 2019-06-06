CREATE TABLE SCHEDULER_CONFIGURATION
(
    id                   NUMERIC IDENTITY PRIMARY KEY NOT NULL,
    application_name     VARCHAR(255)                 NOT NULL,
    job_name             VARCHAR(255)                 NOT NULL,
    configuration_status VARCHAR(255)                 NOT NULL
);

CREATE TABLE SCHEDULER_CONFIGURATION_VALUE
(
    id                         NUMERIC IDENTITY PRIMARY KEY NOT NULL,
    scheduler_configuration_id NUMERIC                      NOT NULL,
    type                       VARCHAR(255)                 NOT NULL,
    value                      VARCHAR(255)                 NOT NULL,
    FOREIGN KEY (scheduler_configuration_id) REFERENCES SCHEDULER_CONFIGURATION (id)
);

CREATE TABLE SCHEDULER_EXECUTION
(
    id                         NUMERIC IDENTITY PRIMARY KEY NOT NULL,
    scheduler_configuration_id NUMERIC                      NOT NULL,
    next_fire_time             TIMESTAMP                    NOT NULL,
    execution_count            INT                          NOT NULL DEFAULT 0,
    state                      INT                          NOT NULL,
    FOREIGN KEY (scheduler_configuration_id) REFERENCES SCHEDULER_CONFIGURATION (id)
)

-- TODO: DEFINE index

