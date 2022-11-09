window.addEventListener('load', function () {   
    const createTodoButton = document.querySelector('#todo-button');
    const newTodo = document.querySelector('#todo');
    const todoList = document.querySelector('#todo-list');

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
        if (xhr.readyState === 4) {
            const todos = JSON.parse(xhr.response).todos;
            for (let i = 0; i < todos.length; i++) {
                let li = document.createElement('li');
                li.innerText= todos[i];
                todoList.appendChild(li);
            }
        }
    }
    xhr.open("GET", "/api/todos", true);
    xhr.send();

    class ThemeSwitcher {
        constructor(configuration) {
             const defaultConfig = {
                targetElementClass: "application",
                  triggerButtonClass: "theme-switcher-button",
                  triggerButtonActiveClass: "theme-switcher-button-active",
                  darkThemeClass: "dark-theme",
                  themeLocalStorageID: "theme",
                  onChangeTheme: () => {}
             };
   
             this.activeTheme = "light";
             this.options = Object.assign(defaultConfig, configuration);
   
             this.initialization();
        }
   
        initialization() {
             this.defineElements();
             this.applyCurrentTheme();
             this.switchThemeHandler();
             this.registerMatchMediaListener();
        }
   
        defineElements() {
             const { triggerButtonClass, targetElementClass } = this.options;
   
             this.triggerButton = document.querySelector(`.${triggerButtonClass}`);
             this.targetElement = document.querySelector(`.${targetElementClass}`);
        }
   
        onChangeThemeHandler() {
             const { onChangeTheme } = this.options;
   
             if (onChangeTheme) {
                  return onChangeTheme(this);
             }
        }
   
        setDarkTheme() {
             //prettier-ignore
             const {
                  darkThemeClass,
                  themeLocalStorageID,
                  triggerButtonActiveClass
             } = this.options;
   
             localStorage.setItem(themeLocalStorageID, "dark");
   
             this.activeTheme = "dark";
             this.targetElement.classList.add(darkThemeClass);
             this.triggerButton.classList.add(triggerButtonActiveClass);
   
             this.onChangeThemeHandler();
        }
   
        setLightTheme() {
             //prettier-ignore
             const {
                  darkThemeClass,
                  themeLocalStorageID,
                  triggerButtonActiveClass
             } = this.options;
   
             localStorage.setItem(themeLocalStorageID, "light");
   
             this.activeTheme = "light";
             this.targetElement.classList.remove(darkThemeClass);
             this.triggerButton.classList.remove(triggerButtonActiveClass);
   
             this.onChangeThemeHandler();
        }
   
        setPreferredTheme() {
             const conditionID1 = window.matchMedia;
             const conditionID2 = window.matchMedia("(prefers-color-scheme: dark)").matches;
   
             conditionID1 && conditionID2 ? this.setDarkTheme() : this.setLightTheme();
        }
   
        applyCurrentTheme() {
             //prettier-ignore
             const { themeLocalStorageID } = this.options;
   
             if (localStorage.getItem(themeLocalStorageID) != null) {
                  this.activeTheme = localStorage.getItem(themeLocalStorageID);
   
                  switch (localStorage.getItem(themeLocalStorageID)) {
                       case "light":
                            return this.setLightTheme();
                       case "dark":
                            return this.setDarkTheme();
                       default:
                            return this.setPreferredTheme();
                  }
             } else {
                  return this.setPreferredTheme();
             }
        }
   
        switchThemeHandler() {
             this.triggerButton.addEventListener("click", () => {
                  switch (this.activeTheme) {
                       case "light":
                            return this.setDarkTheme();
                       case "dark":
                            return this.setLightTheme();
                  }
             });
        }
   
        registerMatchMediaListener() {
             const prefersColorScheme = window.matchMedia("(prefers-color-scheme: dark)");
   
             prefersColorScheme.addEventListener("change", this.applyCurrentTheme.bind(this));
        }
   }
   
   new ThemeSwitcher({
        onChangeTheme: ({ triggerButton, activeTheme }) => {
             switch (activeTheme) {
                  case "light":
                       triggerButton.textContent = `Light Theme`;
                       break;
                  case "dark":
                       triggerButton.textContent = `Dark Theme`;
                       break;
             }
        }
   });



    createTodoButton.addEventListener('click', function () {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/api/todos", true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({
            todo: newTodo.value
        }))
        
        let li = document.createElement('li');
        li.innerText= newTodo.value;
        todoList.appendChild(li);
        newTodo.value = '';


    });
});