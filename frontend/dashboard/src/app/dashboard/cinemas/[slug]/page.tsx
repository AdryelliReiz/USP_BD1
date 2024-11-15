export default async function CinemaPage({
    params,
  }: {
    params: Promise<{ slug: string }>
  }
) {
    const cineId = (await params).slug;
    return (
        <div className="cine-container">
            <h1>Cinema page</h1>
            <p>ID {cineId}</p>
        </div>
    )
}