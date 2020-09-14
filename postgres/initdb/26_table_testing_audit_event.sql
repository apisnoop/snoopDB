     CREATE UNLOGGED TABLE testing.audit_event (
       release text,
       release_date text,
       audit_id text NOT NULL,
       endpoint text,
       useragent text,
       test text,
       test_hit boolean,
       conf_test_hit boolean,
       data jsonb NOT NULL,
       source text,
       id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
       ingested_at timestamp DEFAULT CURRENT_TIMESTAMP);

     comment on table testing.audit_event is 'events inserted by auditlogger as part of a live testing environment';

     comment on column testing.audit_event.release is 'release this test suite was run for';
     comment on column testing.audit_event.release_date is 'canonical release date (or test run date if version not released yet';
     comment on column testing.audit_event.audit_id is 'audit event id as given in log.  Note these are not necessarily unique.';
     comment on column testing.audit_event.endpoint is 'endpoint hit by this audit event';
     comment on column testing.audit_event.useragent is 'useragent of the event, taken from events request header';
     comment on column testing.audit_event.test is 'the test codename if it can be extracted from useragent, else null';
     comment on column testing.audit_event.test_hit is 'is the useragent of the event a test?';
     comment on column testing.audit_event.conf_test_hit is 'is the useragent of the event a conformance test?';
     comment on column testing.audit_event.data is 'the full json of the audit event';
     comment on column testing.audit_event.source is 'url of the bucket where the test run logs are stored';
     comment on column testing.audit_event.id is 'generated id, this will be unique';
     comment on column testing.audit_event.ingested_at is 'the time at which the testing.audit_event was added to this table';
