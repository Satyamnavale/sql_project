-- Create the Team Table
CREATE TABLE Team (
    team_id INT PRIMARY KEY,
    team_name VARCHAR2(50),
    coach VARCHAR2(50),
    captain VARCHAR2(50)
);

-- Create the Player Table
CREATE TABLE Player (
    player_id INT PRIMARY KEY,
    name VARCHAR2(100),
    dob DATE,
    nationality VARCHAR2(50),
    role VARCHAR2(20), -- e.g., batsman, bowler, all-rounder
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

-- Create the Match Table
CREATE TABLE Match (
    match_id INT PRIMARY KEY,
    match_date DATE,
    venue VARCHAR2(100),
    match_type VARCHAR2(10), -- e.g., Test, ODI, T20
    team1_id INT,
    team2_id INT,
    winner_team_id INT,
    FOREIGN KEY (team1_id) REFERENCES Team(team_id),
    FOREIGN KEY (team2_id) REFERENCES Team(team_id),
    FOREIGN KEY (winner_team_id) REFERENCES Team(team_id)
);

-- Create the Performance Table
CREATE TABLE Performance (
    performance_id INT PRIMARY KEY,
    player_id INT,
    match_id INT,
    runs_scored INT,
    wickets_taken INT,
    balls_faced INT,
    overs_bowled INT,
    FOREIGN KEY (player_id) REFERENCES Player(player_id),
    FOREIGN KEY (match_id) REFERENCES Match(match_id)
);

-- Create the Ranking Table
CREATE TABLE Ranking (
    player_id INT PRIMARY KEY,
    total_runs INT,
    total_wickets INT,
    batting_average FLOAT,
    bowling_economy FLOAT,
    team_rank INT,
    FOREIGN KEY (player_id) REFERENCES Player(player_id)
);

-- Inserting cricket teams
INSERT INTO Team (team_id, team_name, coach, captain)
VALUES (1, 'India', 'Rahul Dravid', 'Rohit Sharma');

INSERT INTO Team (team_id, team_name, coach, captain)
VALUES (2, 'Australia', 'Andrew McDonald', 'Pat Cummins');

INSERT INTO Team (team_id, team_name, coach, captain)
VALUES (3, 'England', 'Brendon McCullum', 'Ben Stokes');

INSERT INTO Team (team_id, team_name, coach, captain)
VALUES (4, 'New Zealand', 'Gary Stead', 'Kane Williamson');

INSERT INTO Team (team_id, team_name, coach, captain)
VALUES (5, 'South Africa', 'Mark Boucher', 'Temba Bavuma');

INSERT INTO Team (team_id, team_name, coach, captain)
VALUES (6, 'Pakistan', 'Grant Bradburn', 'Babar Azam');


-- Inserting players
INSERT INTO Player (player_id, name, dob, nationality, role, team_id)
VALUES (1, 'Virat Kohli', TO_DATE('1988-11-05', 'YYYY-MM-DD'), 'India', 'Batsman', 1);

INSERT INTO Player (player_id, name, dob, nationality, role, team_id)
VALUES (2, 'Rohit Sharma', TO_DATE('1987-04-30', 'YYYY-MM-DD'), 'India', 'Batsman', 1);

INSERT INTO Player (player_id, name, dob, nationality, role, team_id)
VALUES (3, 'David Warner', TO_DATE('1986-10-27', 'YYYY-MM-DD'), 'Australia', 'Batsman', 2);

INSERT INTO Player (player_id, name, dob, nationality, role, team_id)
VALUES (4, 'Pat Cummins', TO_DATE('1993-05-08', 'YYYY-MM-DD'), 'Australia', 'Bowler', 2);

INSERT INTO Player (player_id, name, dob, nationality, role, team_id)
VALUES (5, 'Ben Stokes', TO_DATE('1991-06-04', 'YYYY-MM-DD'), 'England', 'All-rounder', 3);

INSERT INTO Player (player_id, name, dob, nationality, role, team_id)
VALUES (6, 'Kane Williamson', TO_DATE('1990-08-08', 'YYYY-MM-DD'), 'New Zealand', 'Batsman', 4);

INSERT INTO Player (player_id, name, dob, nationality, role, team_id)
VALUES (7, 'Quinton de Kock', TO_DATE('1992-12-17', 'YYYY-MM-DD'), 'South Africa', 'Wicketkeeper-Batsman', 5);

INSERT INTO Player (player_id, name, dob, nationality, role, team_id)
VALUES (8, 'Babar Azam', TO_DATE('1994-10-15', 'YYYY-MM-DD'), 'Pakistan', 'Batsman', 6);


-- Inserting match data
INSERT INTO Match (match_id, match_date, venue, match_type, team1_id, team2_id, winner_team_id)
VALUES (101, TO_DATE('2025-01-10', 'YYYY-MM-DD'), 'Wankhede Stadium, Mumbai', 'ODI', 1, 2, 1);

INSERT INTO Match (match_id, match_date, venue, match_type, team1_id, team2_id, winner_team_id)
VALUES (102, TO_DATE('2025-01-12', 'YYYY-MM-DD'), 'Lords Cricket Ground, London', 'Test', 3, 4, 3);

INSERT INTO Match (match_id, match_date, venue, match_type, team1_id, team2_id, winner_team_id)
VALUES (103, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 'The Oval, London', 'T20', 2, 5, 2);



-- Inserting performance stats
INSERT INTO Performance (performance_id, player_id, match_id, runs_scored, wickets_taken, balls_faced, overs_bowled)
VALUES (1, 1, 101, 85, 0, 70, 0); -- Virat Kohli in match 101 (India vs Australia)

INSERT INTO Performance (performance_id, player_id, match_id, runs_scored, wickets_taken, balls_faced, overs_bowled)
VALUES (2, 2, 101, 120, 0, 95, 0); -- Rohit Sharma in match 101 (India vs Australia)

INSERT INTO Performance (performance_id, player_id, match_id, runs_scored, wickets_taken, balls_faced, overs_bowled)
VALUES (3, 3, 102, 45, 1, 40, 7); -- Ben Stokes in match 102 (England vs New Zealand)

INSERT INTO Performance (performance_id, player_id, match_id, runs_scored, wickets_taken, balls_faced, overs_bowled)
VALUES (4, 4, 102, 15, 3, 12, 10); -- Kane Williamson in match 102 (England vs New Zealand)

INSERT INTO Performance (performance_id, player_id, match_id, runs_scored, wickets_taken, balls_faced, overs_bowled)
VALUES (5, 5, 103, 80, 1, 50, 4); -- Quinton de Kock in match 103 (South Africa vs Pakistan)

INSERT INTO Performance (performance_id, player_id, match_id, runs_scored, wickets_taken, balls_faced, overs_bowled)
VALUES (6, 6, 103, 60, 0, 48, 0); -- Babar Azam in match 103 (South Africa vs Pakistan)

INSERT INTO Performance (performance_id, player_id, match_id, runs_scored, wickets_taken, balls_faced, overs_bowled)
VALUES (7, 7, 101, 75, 0, 50, 0); -- David Warner in match 101 (India vs Australia)


-- Inserting player rankings
INSERT INTO Ranking (player_id, total_runs, total_wickets, batting_average, bowling_economy, team_rank)
VALUES (1, 12000, 0, 53.6, NULL, 1); -- Virat Kohli

INSERT INTO Ranking (player_id, total_runs, total_wickets, batting_average, bowling_economy, team_rank)
VALUES (2, 9000, 0, 48.4, NULL, 2); -- Rohit Sharma

INSERT INTO Ranking (player_id, total_runs, total_wickets, batting_average, bowling_economy, team_rank)
VALUES (3, 6000, 120, 43.5, 5.2, 3); -- Ben Stokes

INSERT INTO Ranking (player_id, total_runs, total_wickets, batting_average, bowling_economy, team_rank)
VALUES (4, 8000, 350, 41.2, 3.6, 4); -- Kane Williamson

INSERT INTO Ranking (player_id, total_runs, total_wickets, batting_average, bowling_economy, team_rank)
VALUES (5, 10000, 50, 50.1, 4.2, 5); -- Quinton de Kock

INSERT INTO Ranking (player_id, total_runs, total_wickets, batting_average, bowling_economy, team_rank)
VALUES (6, 11000, 0, 47.3, NULL, 6); -- Babar Azam

-- Trigger to update player stats after each performance
CREATE OR REPLACE TRIGGER update_player_stats
AFTER INSERT ON Performance
FOR EACH ROW
BEGIN
    UPDATE Ranking
    SET total_runs = total_runs + :new.runs_scored,
        total_wickets = total_wickets + :new.wickets_taken
    WHERE player_id = :new.player_id;
END;

-- Trigger to update team ranking after each match
CREATE OR REPLACE TRIGGER update_team_ranking
AFTER INSERT ON Match
FOR EACH ROW
BEGIN
    UPDATE Ranking
    SET team_rank = (SELECT COUNT(*) + 1
                     FROM Team t
                     WHERE t.team_id = :new.winner_team_id)
    WHERE team_id = :new.winner_team_id;
END;


CREATE OR REPLACE PROCEDURE generate_leaderboard AS
BEGIN
    FOR rec IN (SELECT p.name, SUM(perf.runs_scored) AS total_runs
                FROM Performance perf
                JOIN Player p ON perf.player_id = p.player_id
                GROUP BY p.name
                ORDER BY total_runs DESC) LOOP
        DBMS_OUTPUT.PUT_LINE('Player: ' || rec.name || ' - Runs: ' || rec.total_runs);
    END LOOP;
END;

CREATE OR REPLACE PROCEDURE generate_performance_report(p_player_id INT) AS
BEGIN
    FOR rec IN (SELECT m.match_date, perf.runs_scored, perf.wickets_taken
                FROM Performance perf
                JOIN Match m ON perf.match_id = m.match_id
                WHERE perf.player_id = p_player_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Date: ' || rec.match_date || ' - Runs: ' || rec.runs_scored || ' - Wickets: ' || rec.wickets_taken);
    END LOOP;
END;










