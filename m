Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A6B3164AA
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767172515; cv=none; b=ZuwgFBwxR5hl4qiVnC3lbnuDZnEXqZxFF/ksWFgrVBQzkeZ/R2cHfbh6x5yHrXsRRtfqB9MshMvPgr8QCsckNNBh8yER2tM1a1xBuWKvJgiP8Ih3LSg+ayrD3KuH7MEbiJnOVAZ/i48YJG39FT+Kh8UquJTom8hcqtSHjsuvFco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767172515; c=relaxed/simple;
	bh=z+kguRRaqZHMZx2XZis3aztpcnjb4raCwVyceh6uPlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PF16v6ZzsXO8VXtYkT8Sw26L4Q+wzqNsq4jSivBAWeXKM/aWLLV37t03gSZKawrgDGopbpzWG8KsV0u0BQmi2SUr3NJyo9hrqm8pVXRxhFcwLt+691t40JMpBc71AWOqsUjQXxN1RxzTLULQMcVBJgZN4olRLZ1xM+uSc65sLWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space; spf=pass smtp.mailfrom=bytefly.space; dkim=pass (2048-bit key) header.d=bytefly-space.20230601.gappssmtp.com header.i=@bytefly-space.20230601.gappssmtp.com header.b=rz3KX4V6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytefly.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytefly-space.20230601.gappssmtp.com header.i=@bytefly-space.20230601.gappssmtp.com header.b="rz3KX4V6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0c20ee83dso136363325ad.2
        for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 01:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytefly-space.20230601.gappssmtp.com; s=20230601; t=1767172511; x=1767777311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cqaN5izDEsgH/os+tYDrb4IvKYYnm+SnIE1Vz4Q+hU8=;
        b=rz3KX4V6DVlCFZGaTRJ5RQbwGGIkSdNZMixWIs2Dj5jLFaLw1kqMEOyGi7E86LmyFF
         vsQuzjXRBN78/WrrOHmH996ENo7Pl6a5z5B9SKjJhJHbcWpC8DmMwtHMmN2Jf617UpDF
         a3nKDw9jZnqOmw/br6zxsj0/ZzN+mRzVBHTQc0EZWfjK6ogcenwlUcHLg+NKgFM83HSh
         bBckxB72WRsw58TPbWzOuz+d9bgLTaN5fj1+NqGH8OXXHHzGrZcC84IcxfppIEKPEZbu
         swa95+SzZBZ0rnFZ2CCxw5w0w0e/bWEa8511K6pHhOinltO3KO8O8LvCWhRfh8o7x/uZ
         B/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767172511; x=1767777311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqaN5izDEsgH/os+tYDrb4IvKYYnm+SnIE1Vz4Q+hU8=;
        b=G8XuuKaujmR56eUfvB98LdhjFRw7COdPbjGtdgVrhBIHIa6Tvu67Dd7jh5tD7Yb6re
         Ah5P5v2o8PyhLwspE940V9vyUgjgmdYfsXGMw+2kaOvMmsxubTl5WUNbScxVEDYdul/0
         zKEhZkTLrpERa/ctPPc0wIPkzGlZth2PDP2IHO6a6DnWFcPGiFqRUmf8tJwcwvzaduF9
         hZeuPKAG4JO2KfF73McpES7kH+YRDXKdLoIopYS6bRlGVUPRtOiJnuIxZqhC9ZHO48sE
         lvxaJFf+7v3QW5obAAVU+XPOd+Eacbg+Kk2SZD2/3m4+Tba3qCdTPxbrhmrz54nAAFF7
         xSyA==
X-Forwarded-Encrypted: i=1; AJvYcCWzIfE4R76jw4PWgmh+DPAwLx/ukJMNffepq7kQRzcERZCCFC9lFgPuAvBRYwxeuayMn6xqzd0cLts=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr5HGHdOoS65ytb31642RdfN7B7YTPswG1bB9oDzm4wICHH3h8
	/n6RSmQeVTIqbX/qmwFrXetn7DmEK5L5aXFIyEkIj15O4vhVeY/JMXCF+WXdJipMhsM=
X-Gm-Gg: AY/fxX7znoE+TV+iNOJOgFcArWeQeLUdOyEcXXBIMy86KGvw7rHaq6P6MjWMvhX9tlf
	hnx0CC7wk0uZEeb1CRcjCaSoYfxxUSd9wY2h4uYyyxnxWT20zgprX9zfoKti5rKsFVD+DnSnJln
	ImVQ+Vd1eyEBJCGBPW4I8bqv5snNbpg+uCL7orEY7an+/GI+mcZcQFW6wxxfNdXYBeT2xyc8bGH
	2caeeZY4iEqkRt/TQQbTtDC7vGO8CrCmCHtGmwElw0i+23D/iAPLlddwUA1e2/eUFFqWtp8rywc
	IZfrclgKRhO5Fr92qHctlW9EGPsDBnjJDxiPGiJDt4TTjJEgzTbV+MyBabq0eE/wsKkNpMGSant
	PKuWubfvjPtw7x6p+F6uj0SZizfkB5nbcDBW2XWFfNr6qE6kgeM64srhnBrGMZOwKyMbWBqc=
X-Google-Smtp-Source: AGHT+IEEHAEmUHoBPsk2VWXa0Bxxl2Wl+1W1VgdLinYqxfVL+B8yrv2/848F+XVxTJyQxSLPq3mDmg==
X-Received: by 2002:a17:902:ce92:b0:2a2:d066:b668 with SMTP id d9443c01a7336-2a2f222adc2mr292537615ad.12.1767172511271;
        Wed, 31 Dec 2025 01:15:11 -0800 (PST)
Received: from xpc ([2400:8902:e002:dec1:95fc:f49b:fe:1151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666casm319258255ad.3.2025.12.31.01.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 01:15:10 -0800 (PST)
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
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lisa Robinson <lisa@bytefly.space>
Subject: [PATCH] LoongArch: Fix PMU counter allocation for mixed-type event groups
Date: Wed, 31 Dec 2025 17:15:00 +0800
Message-ID: <20251231091500.530432-1-lisa@bytefly.space>
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
 arch/loongarch/kernel/perf_event.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/perf_event.c b/arch/loongarch/kernel/perf_event.c
index 9d257c8519c9..82cc08c2b056 100644
--- a/arch/loongarch/kernel/perf_event.c
+++ b/arch/loongarch/kernel/perf_event.c
@@ -633,15 +633,24 @@ static int validate_group(struct perf_event *event)
 
 	memset(&fake_cpuc, 0, sizeof(fake_cpuc));
 
-	if (loongarch_pmu_alloc_counter(&fake_cpuc, &leader->hw) < 0)
+	if ((PERF_TYPE_HARDWARE == leader->attr.type ||
+	     PERF_TYPE_HW_CACHE == leader->attr.type ||
+	     PERF_TYPE_RAW == leader->attr.type) &&
+	    loongarch_pmu_alloc_counter(&fake_cpuc, &leader->hw) < 0)
 		return -EINVAL;
 
 	for_each_sibling_event(sibling, leader) {
-		if (loongarch_pmu_alloc_counter(&fake_cpuc, &sibling->hw) < 0)
+		if ((PERF_TYPE_HARDWARE == sibling->attr.type ||
+		     PERF_TYPE_HW_CACHE == sibling->attr.type ||
+		     PERF_TYPE_RAW == sibling->attr.type) &&
+		    loongarch_pmu_alloc_counter(&fake_cpuc, &sibling->hw) < 0)
 			return -EINVAL;
 	}
 
-	if (loongarch_pmu_alloc_counter(&fake_cpuc, &event->hw) < 0)
+	if ((PERF_TYPE_HARDWARE == event->attr.type ||
+	     PERF_TYPE_HW_CACHE == event->attr.type ||
+	     PERF_TYPE_RAW == event->attr.type) &&
+	    loongarch_pmu_alloc_counter(&fake_cpuc, &event->hw) < 0)
 		return -EINVAL;
 
 	return 0;
-- 
2.52.0

