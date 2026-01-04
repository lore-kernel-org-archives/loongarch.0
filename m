Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B041D88A4
	for <loongarch@lists.linux.dev>; Sun,  4 Jan 2026 16:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767543822; cv=none; b=JAnakc/a58n2OIQsTVy8TGhXeEYdtDMXvulG+vAGaZqBqJMZk+OdHL4Aa+gS0U3JkVMO1HTVAewheSnuV125OfIoNSX20ejJ0BoPH7Zh4nxzJNY8TIywVf3+SnOGxOCLY73fL2q0we6VkyiC/8CN+PMY2IPZvKZDYljigwuGl10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767543822; c=relaxed/simple;
	bh=eXy8dJxgdO4IOADeWzWF2vncup0JjrNG9ubJINT0K5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mBAg4gU5pIrKWGnAser2oFtPq+2eN34YD+91KzslIFsZci/UnquqwiHLpRcl/LuwGYcsqnIvwoRMiSw3QV/9/d9NbAJH2iFk7lpSGyIhdYrfmO/Hx/1IsPIKCHff9vlk5zis6oRqBhYrUZonzXROlxdmAsqTcShUIZqgRwSIoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space; spf=pass smtp.mailfrom=bytefly.space; dkim=pass (2048-bit key) header.d=bytefly-space.20230601.gappssmtp.com header.i=@bytefly-space.20230601.gappssmtp.com header.b=i8NL5vst; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytefly.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytefly-space.20230601.gappssmtp.com header.i=@bytefly-space.20230601.gappssmtp.com header.b="i8NL5vst"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34ccb7ad166so12255408a91.2
        for <loongarch@lists.linux.dev>; Sun, 04 Jan 2026 08:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytefly-space.20230601.gappssmtp.com; s=20230601; t=1767543821; x=1768148621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EiSxz2yDPnHRK0lKIWI7snTOOhCOMT5nNtbjzhr1fj0=;
        b=i8NL5vst0qg+Ha9yboVhZzPvK+llEZOqK+VJ3t7oZFJuT2sO8a/j+EKl/Clzjy/+gq
         DiJJEA6mGxgiEM/SgBwSBj9HqObN0qysea0aprQbZgp33VW2wrCMFsu7w+t/DhNYpd7o
         tpvmPm9uFIMk/c73vdx6kJmHwSNXPnZzGlIR3RvAh6MN/0wDEYyzoWmXzhTAFU4kofD1
         x1AtY16OjJZTGCZTFj3HT7k39VSYLoR87ZMpYMZp1HkPdST/NTLeJu1OnEMNLzy0fYO+
         cBLOfhfc653zC6aRhCLH5gj6rxtVEs/U5+1JH1NWEWEwY077ICip3hetpbMDiI+RlyYQ
         apRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767543821; x=1768148621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiSxz2yDPnHRK0lKIWI7snTOOhCOMT5nNtbjzhr1fj0=;
        b=DiYqqIBOWd+J6OgekBLhGguH3oxkcnzVAf9jSXtHu3vdiZQ4wjgPI1C+wfQtToNf+d
         zDLYTBo5pLVyF/yX97d15FvRGCXRXdHofIXkYrBNKG4mWt77Fqyo1APhbGy6TpCGY+Hq
         8tj4NKvuFR2KZnUGHE7EPTYqYQJ6va9lGY7Q8uO6kiENyB2fk6PeBd1uD/+Jb1/QUgGH
         q2xF0caDrnnmd2T7a9aFjqtBsqYi/81Yv9WVARTsRzc+O1RjkXJMSzYKzy7oepOP59EU
         BMQ1O2jzHmSWc2+zOS+2GmjkdNtJZ0b+yrmAhClwGfE8FWDDzUtDJF4vq3PULVdzvO+I
         boig==
X-Forwarded-Encrypted: i=1; AJvYcCXD8JA3krfIKhODkgSB4wUFEdSe5IKJa69vcJz7BJdrPM9Lm7lzWEsWPq5g9idACR3uDVo4RyZr9Q4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTRbZI7/XydmKypbrgGIn0TPorCgeB5uyvTj3oqgu82MwR4Go0
	f+ya4i9BoviOxWUYUjSQQX9Lg339b+/i0wKpTqORo8laILvD/jrHndj0qEugnKdqZf0=
X-Gm-Gg: AY/fxX5POjV4eaLRJm6q60mbOgyb9+lCd3u4ePtrr7CH6qa4o8+t5YE1zW+HOKvvWYs
	CHNk6tXptKvWdigwN5scwqKbSlZMcDBGncS87wb0LyXFaHv6cYfzR4QhkGyO61tApw661ThzMlR
	bPi3VY3P0rjdwKPuvFD1XbL1O0We1m6edS1IXIQvG0kPd9JibLAwjR5RGuBKyEJJMOSJucUy6ts
	VzScKOdFSr9/KsZGnw/8H8lHkuO1PX9JYR0W9pXeWABQFkACiPa4eHARck1qIN0cAT0wg0TUYKM
	a1R9U6yNGx/U3N4JuRR2PuL8REflRBL8k95lhanwm9hu6vV5YllMQxL4+ZCj8EnIzhnq7OYsVvw
	KjnjyqMo2M07un/MK6NOTg0fr+DyI/AwLG2BVxART8aEl0iL5d/cCJ9wWzLaQas9FGdaieRiv/7
	epnQ==
X-Google-Smtp-Source: AGHT+IFIt0L/lSx8x4bwgvwsbukxt5schrdOqEBeVjh0PRwngkl52ZaA4mBXXVo3bGBUMETqo7YQkQ==
X-Received: by 2002:a17:90b:2fc5:b0:33b:a906:e40 with SMTP id 98e67ed59e1d1-34e92137cd4mr33880998a91.2.1767543820504;
        Sun, 04 Jan 2026 08:23:40 -0800 (PST)
Received: from xpc ([2400:8902:e002:dec2:6246:24bc:b792:73cd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79a17fdesm40021606a12.8.2026.01.04.08.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 08:23:40 -0800 (PST)
From: Lisa Robinson <lisa@bytefly.space>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>,
	dapeng1.mi@linux.intel.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lisa Robinson <lisa@bytefly.space>
Subject: [PATCH v2] LoongArch: Fix PMU counter allocation for mixed-type event groups
Date: Mon,  5 Jan 2026 00:23:04 +0800
Message-ID: <20260104162304.64604-1-lisa@bytefly.space>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When validating a perf event group, validate_group() unconditionally
attempts to allocate hardware PMU counters for the leader, sibling
events and the new event being added.

This is incorrect for mixed-type groups. If a PERF_TYPE_SOFTWARE event
ispart of the group, the current code still tries to allocate a hardware
PMU counter for it, which can wrongly consume hardware PMU resources and
cause spurious allocation failures.

Fix this by only allocating PMU counters for hardware events during group
validation, and skipping software events.

A trimmed down reproducer is as simple as this:

  #include <stdio.h>
  #include <assert.h>
  #include <unistd.h>
  #include <string.h>
  #include <sys/syscall.h>
  #include <linux/perf_event.h>

  int
  main (int argc, char *argv[])
  {
  	struct perf_event_attr attr = { 0 };
  	int fds[5];

  	attr.disabled = 1;
  	attr.exclude_kernel = 1;
  	attr.exclude_hv = 1;
  	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED |
  		PERF_FORMAT_TOTAL_TIME_RUNNING | PERF_FORMAT_ID | PERF_FORMAT_GROUP;
  	attr.size = sizeof (attr);

  	attr.type = PERF_TYPE_SOFTWARE;
  	attr.config = PERF_COUNT_SW_DUMMY;
  	fds[0] = syscall (SYS_perf_event_open, &attr, 0, -1, -1, 0);
  	assert (fds[0] >= 0);

  	attr.type = PERF_TYPE_HARDWARE;
  	attr.config = PERF_COUNT_HW_CPU_CYCLES;
  	fds[1] = syscall (SYS_perf_event_open, &attr, 0, -1, fds[0], 0);
  	assert (fds[1] >= 0);

  	attr.type = PERF_TYPE_HARDWARE;
  	attr.config = PERF_COUNT_HW_INSTRUCTIONS;
  	fds[2] = syscall (SYS_perf_event_open, &attr, 0, -1, fds[0], 0);
  	assert (fds[2] >= 0);

  	attr.type = PERF_TYPE_HARDWARE;
  	attr.config = PERF_COUNT_HW_BRANCH_MISSES;
  	fds[3] = syscall (SYS_perf_event_open, &attr, 0, -1, fds[0], 0);
  	assert (fds[3] >= 0);

  	attr.type = PERF_TYPE_HARDWARE;
  	attr.config = PERF_COUNT_HW_CACHE_REFERENCES;
  	fds[4] = syscall (SYS_perf_event_open, &attr, 0, -1, fds[0], 0);
  	assert (fds[4] >= 0);

  	printf ("PASSED\n");

  	return 0;
  }

Fixes: b37042b2bb7c ("LoongArch: Add perf events support")
Signed-off-by: Lisa Robinson <lisa@bytefly.space>
---
Changes in v2:
- Factor out duplicated perf event type checks into an inline helper.
---
 arch/loongarch/kernel/perf_event.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/perf_event.c b/arch/loongarch/kernel/perf_event.c
index 9d257c8519c9..e34a6fb33e11 100644
--- a/arch/loongarch/kernel/perf_event.c
+++ b/arch/loongarch/kernel/perf_event.c
@@ -626,6 +626,18 @@ static const struct loongarch_perf_event *loongarch_pmu_map_cache_event(u64 conf
 	return pev;
 }
 
+static inline bool loongarch_pmu_event_requires_counter(const struct perf_event *event)
+{
+	switch (event->attr.type) {
+	case PERF_TYPE_HARDWARE:
+	case PERF_TYPE_HW_CACHE:
+	case PERF_TYPE_RAW:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int validate_group(struct perf_event *event)
 {
 	struct cpu_hw_events fake_cpuc;
@@ -633,15 +645,18 @@ static int validate_group(struct perf_event *event)
 
 	memset(&fake_cpuc, 0, sizeof(fake_cpuc));
 
-	if (loongarch_pmu_alloc_counter(&fake_cpuc, &leader->hw) < 0)
+	if (loongarch_pmu_event_requires_counter(leader) &&
+	    loongarch_pmu_alloc_counter(&fake_cpuc, &leader->hw) < 0)
 		return -EINVAL;
 
 	for_each_sibling_event(sibling, leader) {
-		if (loongarch_pmu_alloc_counter(&fake_cpuc, &sibling->hw) < 0)
+		if (loongarch_pmu_event_requires_counter(sibling) &&
+		    loongarch_pmu_alloc_counter(&fake_cpuc, &sibling->hw) < 0)
 			return -EINVAL;
 	}
 
-	if (loongarch_pmu_alloc_counter(&fake_cpuc, &event->hw) < 0)
+	if (loongarch_pmu_event_requires_counter(event) &&
+	    loongarch_pmu_alloc_counter(&fake_cpuc, &event->hw) < 0)
 		return -EINVAL;
 
 	return 0;
-- 
2.52.0

