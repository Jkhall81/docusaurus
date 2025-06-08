import React, { useState, useEffect } from "react";
import Layout from "@theme/Layout";

// Path to your JSON file
const DATA_URL = "/data/cron/cron-jobs.json";

export default function CronJobs() {
  const [jobs, setJobs] = useState([]);
  const [selectedServer, setSelectedServer] = useState("");

  useEffect(() => {
    fetch(DATA_URL)
      .then((res) => res.json())
      .then((data) => {
        setJobs(data);
        if (data.length > 0) {
          setSelectedServer(data[0].server);
        }
      })
      .catch((err) => console.error("Failed to load cron jobs:", err));
  }, []);

  const servers = Array.from(new Set(jobs.map((job) => job.server)));
  const filteredJobs = jobs.filter((job) => job.server === selectedServer);

  return (
    <Layout
      title="Cron Job Documentation"
      description="View and manage scheduled tasks"
    >
      <main className="container margin-vert--lg">
        <h1>Cron Job Documentation</h1>
        <p>
          Use this page to view all current cron jobs, their schedules, what
          scripts they run, and find available time slots on different servers.
        </p>

        <div style={{ marginTop: "2rem" }}>
          <label htmlFor="server-select">
            <strong>Select Server:</strong>
          </label>{" "}
          <select
            id="server-select"
            value={selectedServer}
            onChange={(e) => setSelectedServer(e.target.value)}
          >
            {servers.map((server) => (
              <option key={server} value={server}>
                {server}
              </option>
            ))}
          </select>
        </div>

        <table
          style={{
            marginTop: "1.5rem",
            width: "100%",
            borderCollapse: "collapse",
          }}
        >
          <thead>
            <tr>
              <th style={{ borderBottom: "1px solid #ccc", padding: "0.5rem" }}>
                Schedule
              </th>
              <th style={{ borderBottom: "1px solid #ccc", padding: "0.5rem" }}>
                Command
              </th>
            </tr>
          </thead>
          <tbody>
            {filteredJobs.map((job, index) => (
              <tr key={index}>
                <td
                  style={{ borderBottom: "1px solid #eee", padding: "0.5rem" }}
                >
                  {job.schedule}
                </td>
                <td
                  style={{
                    borderBottom: "1px solid #eee",
                    padding: "0.5rem",
                    fontFamily: "monospace",
                  }}
                >
                  {job.command}
                </td>
              </tr>
            ))}
            {filteredJobs.length === 0 && (
              <tr>
                <td
                  colSpan="2"
                  style={{
                    padding: "1rem",
                    textAlign: "center",
                    color: "#888",
                  }}
                >
                  No jobs found for this server.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </main>
    </Layout>
  );
}
