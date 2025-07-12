export default function RichText({ text }: { text: string }) {
  return <div dangerouslySetInnerHTML={{ __html: text }} />
}
