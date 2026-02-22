import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String }

  connect() {
    this.draggedElement = null
    this.dragPointerY = null
    this.autoScrollFrame = null

    this.onDragStart = this.onDragStart.bind(this)
    this.onDragOver = this.onDragOver.bind(this)
    this.onDrop = this.onDrop.bind(this)
    this.onDragEnd = this.onDragEnd.bind(this)

    this.element.addEventListener("dragstart", this.onDragStart)
    this.element.addEventListener("dragover", this.onDragOver)
    this.element.addEventListener("drop", this.onDrop)
    this.element.addEventListener("dragend", this.onDragEnd)
  }

  disconnect() {
    this.element.removeEventListener("dragstart", this.onDragStart)
    this.element.removeEventListener("dragover", this.onDragOver)
    this.element.removeEventListener("drop", this.onDrop)
    this.element.removeEventListener("dragend", this.onDragEnd)
  }

  onDragStart(event) {
    const item = event.target.closest("[data-reorder-item]")
    if (!item) return

    this.draggedElement = item
    item.classList.add("opacity-50")
    event.dataTransfer.setData("text/plain", item.dataset.reorderId || "")
    event.dataTransfer.effectAllowed = "move"

    this.startAutoScroll()
  }

  onDragOver(event) {
    if (!this.draggedElement) return

    event.preventDefault()
    this.dragPointerY = event.clientY
    const target = event.target.closest("[data-reorder-item]")
    if (!target || target === this.draggedElement) return

    const targetRect = target.getBoundingClientRect()
    const isAfter = event.clientY > targetRect.top + targetRect.height / 2

    if (isAfter) {
      target.after(this.draggedElement)
    } else {
      target.before(this.draggedElement)
    }
  }

  onDrop(event) {
    if (!this.draggedElement) return

    event.preventDefault()
    this.persistOrder()
  }

  moveUp(event) {
    const item = event.target.closest("[data-reorder-item]")
    if (!item) return

    const previous = item.previousElementSibling
    if (!previous) return

    previous.before(item)
    this.persistOrder()
  }

  moveDown(event) {
    const item = event.target.closest("[data-reorder-item]")
    if (!item) return

    const next = item.nextElementSibling
    if (!next) return

    next.after(item)
    this.persistOrder()
  }

  onDragEnd() {
    if (this.draggedElement) {
      this.draggedElement.classList.remove("opacity-50")
      this.draggedElement = null
    }

    this.stopAutoScroll()
  }

  persistOrder() {
    const chapterIds = Array.from(this.element.querySelectorAll("[data-reorder-item]"))
      .map((item) => item.dataset.reorderId)

    fetch(this.urlValue, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": this.csrfToken,
        "Accept": "application/json"
      },
      body: JSON.stringify({ chapter_ids: chapterIds })
    })
  }

  get csrfToken() {
    return document.querySelector("meta[name='csrf-token']")?.getAttribute("content") || ""
  }

  startAutoScroll() {
    if (this.autoScrollFrame) return

    const step = () => {
      if (!this.draggedElement || this.dragPointerY == null) {
        this.autoScrollFrame = null
        return
      }

      const edgeThreshold = 80
      const maxSpeed = 18
      const viewportHeight = window.innerHeight
      let scrollDelta = 0

      if (this.dragPointerY < edgeThreshold) {
        const intensity = (edgeThreshold - this.dragPointerY) / edgeThreshold
        scrollDelta = -Math.ceil(maxSpeed * intensity)
      } else if (this.dragPointerY > viewportHeight - edgeThreshold) {
        const intensity = (this.dragPointerY - (viewportHeight - edgeThreshold)) / edgeThreshold
        scrollDelta = Math.ceil(maxSpeed * intensity)
      }

      if (scrollDelta !== 0) {
        window.scrollBy(0, scrollDelta)
      }

      this.autoScrollFrame = window.requestAnimationFrame(step)
    }

    this.autoScrollFrame = window.requestAnimationFrame(step)
  }

  stopAutoScroll() {
    this.dragPointerY = null
    if (this.autoScrollFrame) {
      window.cancelAnimationFrame(this.autoScrollFrame)
      this.autoScrollFrame = null
    }
  }
}
