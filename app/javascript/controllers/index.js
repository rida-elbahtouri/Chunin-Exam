import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start(document.documentElement);
const context = require.context(".", true, /_controller\.js$/);
console.log("hello")
application.load(definitionsFromContext(context));
