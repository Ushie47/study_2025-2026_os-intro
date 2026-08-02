# Stages of Project Implementation

**Individual Project №1**

| | |
|---|---|
| **Name** | David Michael Francis |
| **Discipline** | Operating Systems |
| **University** | RUDN University, Moscow, Russia |
| **Language** | English |

## Purpose of the work

Learn how to host a site on a GitHub page and complete the first stage of a personal individual project.

## Task

1. Install the necessary software
2. Download Website Theme Template
3. Host it on git hosting
4. Set the parameter for site URLs
5. Place the site template on GitHub pages

---

## 1. Install the necessary software

The first step was installing Hugo, the static site generator used to build the website. I downloaded the extended edition (which supports Sass/SCSS) from the official Hugo releases page on GitHub.

![screenshot of the Hugo releases page on GitHub, showing the `hugo_extended_0.164.0_linux-amd64.deb` asset](images/Screenshot1.png)

The file was downloaded to my Downloads folder inside WSL Ubuntu.

![terminal output of `ls` showing the downloaded `.deb` file](images/Screenshot2.png)

I installed it using `apt`:

```bash
sudo apt install ./hugo_extended_0.164.0_linux-amd64.deb
```

Once installed, I confirmed the version and that the extended build was active:

```bash
hugo version
```

![terminal output showing `hugo v0.164.0+extended`](images/Screenshot3.png)

I also confirmed Git was installed and configured my identity for commits:

```bash
git --version
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

---

## 2. Download Website Theme Template

Next, I created a new Hugo project and initialised it as a Git repository.

```bash
hugo new site blog
cd blog
git init
```

![terminal output showing the site scaffold being created](images/Screenshot4.png)

I then chose a theme from the Hugo themes directory and added it as a Git submodule of the project:

```bash
git submodule add https://github.com/luizdepra/hugo-coder.git themes/hugo-coder
```

![terminal output confirming the theme was cloned successfully](images/Screenshot5.png)

Adding the theme as a submodule keeps it version-controlled separately from the main project, which is the standard way Hugo themes are managed.

---

## 3. Host it on git hosting

Before pushing the project online, I created a personal access setup for authentication and previewed the site locally to confirm it built correctly:

```bash
hugo server
```

Once confirmed locally, I created a new empty repository on GitHub to host the project.

!["Create a new repository" page on GitHub](images/Screenshot6.png)

I linked my local project to the new GitHub repository and pushed the code:

```bash
git add .
git commit -m "Initial Hugo site"
git remote add origin git@github.com:Ushie47/blog.git
git branch -M main
git push -u origin main
```

![terminal output confirming the push succeeded](images/Screenshot7.png)

---

## 4. Set the parameter for site URLs

For the site to render correctly once deployed, the `baseURL` parameter in the Hugo configuration file needed to match the exact URL where GitHub Pages would serve the site.

```bash
nano hugo.toml
```

```toml
baseURL = "https://ushie47.github.io/blog/"
```

I committed and pushed this change:

```bash
git add hugo.toml
git commit -m "Set baseURL and site config"
git push
```

![terminal output confirming the push](images/Screenshot8.png)

---

## 5. Place the site template on GitHub pages

To deploy the site automatically, I enabled GitHub Pages with the "GitHub Actions" build source, under repository **Settings → Pages**.

![screenshot of the GitHub Pages settings, with Source set to "GitHub Actions"](images/Screenshot9.png)

I then created a deployment workflow file to build and publish the site on every push to the main branch:

```bash
mkdir -p .github/workflows
nano .github/workflows/hugo.yml
```

```bash
git add .github/workflows/hugo.yml
git commit -m "Add GitHub Pages deploy workflow"
git push
```

![terminal output confirming the push](images/Screenshot10.png)

I monitored the deployment under the repository's **Actions** tab.

![screenshot of the GitHub Actions run completing successfully](images/Screenshot11.png)

Once the workflow completed, the site went live.
![screenshot of the live website at `https://ushie47.github.io/blog/`](images/Screenshot12.png)

## Conclusion

Through this stage, I learned how to install Hugo, structure a static site project, manage a theme as a Git submodule, configure a project for deployment, and automatically publish a website using GitHub Actions and GitHub Pages. This provided a working foundation for the personal website that will be expanded in later stages of the project.
