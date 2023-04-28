CREATE TABLE public.Company (
    id text not null,
    name text not null,
    constraint Company_pkey primary key (id)
) tablespace pg_default;

CREATE unique index "Company_name_key" ON public."Company" USING btree (name) tablespace pg_default;

CREATE TABLE public.Internship (
    id text not null,
    startDate timestamp without time zone not null,
    endDate timestamp without time zone not null,
    companyId text not null,
    studentId text null,
    description text null,
    constraint Internship_pkey primary key (id),
    constraint Internship_companyId_fkey foreign key ("companyId") references "Company" (id) ON update cascade ON
DELETE restrict,
    constraint Internship_studentId_fkey foreign key ("studentId") references "Student" (id) ON update cascade ON delete
    SET
        null
) tablespace pg_default;

CREATE TABLE public.InternshipTag (
    internshipId text not null,
    tagId text not null,
    constraint InternshipTag_pkey primary key ("internshipId", "tagId"),
    constraint InternshipTag_internshipId_fkey foreign key ("internshipId") references "Internship" (id) ON update cascade ON
DELETE restrict,
    constraint InternshipTag_tagId_fkey foreign key ("tagId") references "Tag" (id) ON update cascade ON
DELETE restrict
) tablespace pg_default;

CREATE TABLE public.Student (
    id text not null,
    name text not null,
    constraint Student_pkey primary key (id)
) tablespace pg_default;

CREATE unique index "Student_name_key" ON public."Student" USING btree (name) tablespace pg_default;

CREATE TABLE public.Tag (
    id text not null,
    name text not null,
    constraint Tag_pkey primary key (id)
) tablespace pg_default;

CREATE unique index "Tag_name_key" ON public."Tag" USING btree (name) tablespace pg_default;

CREATE index if not exists "Tag_name_idx" ON public."Tag" USING btree (name) tablespace pg_default;