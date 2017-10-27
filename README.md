# Pulp Project Infrastructure Management using Ansible

## Introduction

This repository holds Ansible playbooks to deploy infrastructure that supports the Pulp project itself, e.g. website, etc.

You need Ansible >=2.3 to be able to handle the (new) YAML-based 'hosts' file format.

## Admin-specific Production Settings

You can use `group_vars/all/local_settings.yml` for you local
settings like `ansible_become_pass` if your computer storage is
encrypted. Use `--ask-sudo-pass` if you don't want to use this
method. Currently Ansible is unable to ask _when needed_ so
the global setting has been disabled in `ansible.cfg`.

## Dealing with Secrets

We use Ansible Vault (`ansible-vault` command) to hide some parameters
like service credentials or emails to avoid SPAM.

To make it easy all such files are named '\*.vault.yml' and git
attributes are defined to make diff-ing and merging easy.

Your config needs to be enhanced to tel git how to handle these files.
This is very easy, look at this URL for more info:
  https://github.com/building5/ansible-vault-tools

