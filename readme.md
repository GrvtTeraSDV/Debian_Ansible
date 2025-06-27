# 🐧 debian-ansible

[![Docker Pulls](https://img.shields.io/docker/pulls/grvtterasdv/debian-ansible.svg)](https://hub.docker.com/r/grvtterasdv/debian-ansible)
[![Image Size](https://img.shields.io/docker/image-size/grvtterasdv/debian-ansible/latest)](https://hub.docker.com/r/grvtterasdv/debian-ansible/tags)

> 🛠️ Minimal Ansible runner image based on Debian Bookworm, built for automation pipelines and infrastructure deployments.

---

## 🧩 Features

- ✅ Based on `debian:bookworm`
- 🐍 Includes Python 3, `pipx`, and:
  - `ansible`
  - `ansible-lint`
- 🧰 Useful system tools included:
  - `git`, `openssh-client`, `curl`, `make`, `ca-certificates`
- 💡 Lightweight and production-ready for:
  - GitLab CI / GitHub Actions
  - Jenkins agents
  - Local testing / Ansible automation

---

## 📦 Tags

| Tag       | Description              | OS           |
|-----------|--------------------------|--------------|
| `latest`  | Latest image (Bookworm)  | Debian 12    |
| `bookworm`| Debian Bookworm-based    | Debian 12    |

---

## 🐳 Example Usage

```bash
docker run --rm \
  -v $(pwd):/work \
  -w /work \
  grvtterasdv/debian-ansible \
  ansible-playbook site.yml -i inventory.ini
```

## 🚀 GitLab CI Example

```yaml
image: grvtterasdv/debian-ansible:latest

before_script:
  - eval $(ssh-agent -s)
  - ssh-add ~/.ssh/id_rsa

ansible-deploy:
  stage: deploy
  script:
    - ansible-playbook playbooks/deploy.yml -i inventory/prod.ini
```
## 📫 Maintainer
Author: grvtterasdv
Feel free to open an issue or suggest improvements!

## 📝 License
This project is licensed under the MIT License – see the LICENSE file for details.