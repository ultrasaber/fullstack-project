#!/bin/bash
rails g model Genre name:string
rails g model Song title:string artist:string price:integer preview_link:string on_sale:boolean
rails g model Order pst_rate:integer gst_rate:integer hst_rate:integer status:string
rails g model LineItem price:integer
rails g model Province pst_rate:integer gst_rate:integer hst_rate:integer
