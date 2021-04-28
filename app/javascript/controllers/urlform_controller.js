import {Controller} from "stimulus"

export default class extends Controller {
    static targets = ['originalUrl', 'shortUrl','error'];
    checkAndSubmit(e){
        const targetValue = this.originalUrlTarget.value
        this.clear() 
        if(this.validURL(targetValue)){
            this.post(targetValue)
        }
        else
        {
            this.errorTarget.className = "error"
            this.errorTarget.innerHTML  = 'it seems that the Url is incorrect'
        }
    }
    validURL(str) {
        let pattern = new RegExp('^(https?:\\/\\/)?'+ // protocol
          '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+ // domain name
          '((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
          '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path
          '(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string
          '(\\#[-a-z\\d_]*)?$','i'); // fragment locator
        return !!pattern.test(str);
      }
      clear() {
        this.shortUrlTarget.className = "hidden"
        this.shortUrlTarget.innerHTML  = ''
        this.errorTarget.className = "hidden"
            this.errorTarget.innerHTML  = ''
      
      }
      async post(orurl){
        const rawResponse = await fetch('/shortenurls/', {
            method: 'POST',
            headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
            },
            body: JSON.stringify({originalUrl: orurl})
        });
        const content = await rawResponse.json();
        this.shortUrlTarget.className = "mylink"
        this.shortUrlTarget.innerHTML  = `http://127.0.0.1:3000/${content.shortUrl}`
    }
  }