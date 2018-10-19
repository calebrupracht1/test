resource "aws_s3_bucket" "bosh" {
    bucket = "${var.prefix}-bosh"
    acl = "private"
    force_destroy= true

    tags {
        Name = "${var.prefix}-bosh"
        Environment = "${var.prefix}"
    }
}

resource "aws_s3_bucket" "buildpacks" {
    bucket = "${var.prefix}-buildpacks"
    acl = "private"
    force_destroy= true

    tags {
        Name = "${var.prefix}-buildpacks"
        Environment = "${var.prefix}"
    }
}

resource "aws_s3_bucket" "droplets" {
    bucket = "${var.prefix}-droplets"
    acl = "private"
    force_destroy= true

    tags {
        Name = "${var.prefix}-droplets"
        Environment = "${var.prefix}"
    }
}

resource "aws_s3_bucket" "packages" {
    bucket = "${var.prefix}-packages"
    acl = "private"
    force_destroy= true

    tags {
        Name = "${var.prefix}-packages"
        Environment = "${var.prefix}"
    }
}

resource "aws_s3_bucket" "buildpacks-backup" {
    bucket = "${var.prefix}-buildpacks-backup"
    acl = "private"
    force_destroy= true

    tags {
        Name = "${var.prefix}-buildpacks-backup"
        Environment = "${var.prefix}"
        Type = "backup"
    }
}

resource "aws_s3_bucket" "droplets-backup" {
    bucket = "${var.prefix}-droplets-backup"
    acl = "private"
    force_destroy= true

    tags {
        Name = "${var.prefix}-droplets-backup"
        Environment = "${var.prefix}"
        Type = "backup"
    }
}

resource "aws_s3_bucket" "packages-backup" {
    bucket = "${var.prefix}-packages-backup"
    acl = "private"
    force_destroy= true

    tags {
        Name = "${var.prefix}-packages-backup"
        Environment = "${var.prefix}"
        Type = "backup"
    }
}

resource "aws_s3_bucket" "om-backup" {
    bucket = "${var.prefix}-om-backup-artifact"
    acl = "private"
    force_destroy= true

    tags {
        Name = "${var.prefix}-packages-backup"
        Environment = "${var.prefix}"
        Type = "backup"
    }
}

resource "aws_s3_bucket" "ert-backup" {
    bucket = "${var.prefix}-ert-backup-artifact"
    acl = "private"
    force_destroy= true

    tags {
        Name = "${var.prefix}-packages-backup"
        Environment = "${var.prefix}"
        Type = "backup"
    }
}

resource "aws_s3_bucket" "director-backup" {
    bucket = "${var.prefix}-director-backup-artifact"
    acl = "private"
    force_destroy= true

    tags {
        Name = "${var.prefix}-packages-backup"
        Environment = "${var.prefix}"
        Type = "backup"
    }
}

resource "aws_s3_bucket" "resources" {
    bucket = "${var.prefix}-resources"
    acl = "private"
    force_destroy= true

    tags {
        Name = "${var.prefix}-resources"
        Environment = "${var.prefix}"
    }
}
