Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFFF2EA172
	for <loongarch@lists.linux.dev>; Fri,  9 Jan 2026 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767927207; cv=none; b=Tm+M+LjpLlCH+tje6tJ42NBxCDF725hIkkIi+f9sf4o4YVWXXL2Cps2OZcDLL5vrdZO9mlTnFYrQOyGRk/fXD3aZmWLP400vByp2+T2vzM0SgBz9K08G8w8cHrnCiDYjo7sGGJw4BoVl1MA64fCH/DT06LLFTuJVNUCY8jm9Tak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767927207; c=relaxed/simple;
	bh=jlDI4QhjXX0sm+AzlIRpnFAmVKzlWGzF2ws15pSU3dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=biml7+n5Eu+hr3ajeTMWR9ws855V8wn8TqIIkwfl5KU5BV8SnbYC4u349vszWIk/Tx8D9d7qHnyDJu2Q/mJGwHKHZHUPuJdJSnOONXZk0+nyR6wVG8F60mfadBYf+j9rki2CdaXwvzYVaLQq+O+d+H2adbaUudGz094K4bhbv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space; spf=pass smtp.mailfrom=bytefly.space; dkim=pass (2048-bit key) header.d=bytefly-space.20230601.gappssmtp.com header.i=@bytefly-space.20230601.gappssmtp.com header.b=nIsekICZ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytefly.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytefly-space.20230601.gappssmtp.com header.i=@bytefly-space.20230601.gappssmtp.com header.b="nIsekICZ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so3388785b3a.0
        for <loongarch@lists.linux.dev>; Thu, 08 Jan 2026 18:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytefly-space.20230601.gappssmtp.com; s=20230601; t=1767927204; x=1768532004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uUXH7ztgyQ+0f072AQRkPa8ArAP5onIH7wP+MjdfZtU=;
        b=nIsekICZ8p4Mox8J0BrdIWaokKI0AqrkvhuMfzJjDQULvKy47xVchA60NoYKhQAKpo
         PPOQQo2T5+5FQvKW6b0P+3AOQRTpnQVt1dhNfXrBOFNgouh5srXTLSo89MX9EolTCat2
         MdXkj2G9IxWZkaks2tsMi1Wo9mQnFz/X9z9wG9kI7Pk8/Df8mYjuJq0jAXWnRRTxb4Ii
         6omG1P4T1KPwbl2UveGD3B8qNnBZKssMawuuQ5npyF54DlxXP5T4WV7BnxP5Z+fJz3tD
         qses9qhJrArox+OHvKcUMWECx9EWqlZhjASB7mXhNtQRUh7S0FhYnsY+S1VQF3TFJn89
         HxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767927204; x=1768532004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUXH7ztgyQ+0f072AQRkPa8ArAP5onIH7wP+MjdfZtU=;
        b=Az26b1iOIOAwUCdG0n4ER3R1N7dLmLa/XFuvavyyBnWe2Z7t1NHa4uXskSkyNp2aY5
         Re3Vz8KYax3eU1Yx0oyH2eGULPyGNg6SQIVBCVK6j5EW+5rfD5gitxkG3lRvGgaG47/+
         4Kje54ftAVRz0aS8FkG7FcIaCzWRHXJ5At+gzUUKAMm6qN8d0Z1JUyDQCKlxZnvGBONE
         b2kmLWRV97e8SyxVJtO6QkXUFHKlAuct0mpyA6v57WmyKmOeSRLI7T1a8X7W0KaRhtWA
         fAmYDfv09ohzG4MNiydKPgnN7pmNUQSzYrsd2RGYlhTHBVUFOZjsDbxfXv8DmG3oCDyA
         PRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqnSdRVfb1IFvo/2Ng4owWy81wJz9i8XuglFDfOxVSb2pg8hInYcK7lj5tnlOP+QYB047q/uqqrO4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCNMZb1cgSISgC+kSHWp1nVsixaBxDYI7UaeUR8gV1ekZYO5Ae
	kEH+3JRILUJgY1dW2xz/IeKw8Vywbo4K/kOi1s3nzRhX2iyUtXa74sl9LBvJudswDdo=
X-Gm-Gg: AY/fxX5JE21EODBhKkiBz1kUF/8DQEY9A7WM/Mn31uzYz9w2UBO7c1qVaB694K3e+Vk
	o0YaTfZXFZdbFR4/3ASZtidtRBRah+xMcsqYUNswbZhItPA8PEEbolj310GKVXXawBK0pJuVNMR
	JIFrjhyC+EZmj5MpWwhzHpPep2oZykkHLEfcZqAM43X171I/uUjqWdVjbu+LIJS3e38jezNd9WI
	W4QzmPnu/bGJtxl/Kpo1BKJi6AAWsNy5i5SZRe8E3L9sFsbZ/vxNpuLbdkgI1N4hURgB7LJ1zZF
	QfpR7CQtR2TwmHtH4ojLMtauHbexyeidx/PIbt03+xR6q/g9qS8piXEbgWAwXQFXM7A8z2W7jvo
	a9YolZKYWtUZof7Vq6QQxzGIZWwazv3Jn7/huVRVPzBa9I0uDc+lOj2Vu7qJCW7uLyAuNsX4s9a
	4XGQ==
X-Google-Smtp-Source: AGHT+IH0HUr0MdRXguipbzsaEA/OlWzBSmlBph10zKzEYjFwr3gALLho1tjkPB9DgVkeAspeCEoTkg==
X-Received: by 2002:a05:6a00:1c9e:b0:7fb:eb9c:66a7 with SMTP id d2e1a72fcca58-81b7f3f2282mr6338630b3a.36.1767927204353;
        Thu, 08 Jan 2026 18:53:24 -0800 (PST)
Received: from xpc ([2400:8902:e002:dec2:6246:24bc:b792:73cd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc9e7e824sm9069051a12.30.2026.01.08.18.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:53:23 -0800 (PST)
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
Subject: [PATCH v3] LoongArch: Fix PMU counter allocation for mixed-type event groups
Date: Fri,  9 Jan 2026 10:53:12 +0800
Message-ID: <20260109025312.226700-1-lisa@bytefly.space>
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
is part of the group, the current code still tries to allocate a hardware
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
Changes in v3:
- Fix typo.
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

