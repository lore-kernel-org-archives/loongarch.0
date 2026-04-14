Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D4838BF68
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776153886; cv=none; b=u+zt1S2QXjnX8b6E9noI/yAfziQON7xTZ0AHR89S9M1BcTtAx2/Tno5Vc1dO8tgHC6mDHxfT8XSLOx8levEU7FlsIOXwtu7ZVkPnWrArZvZTCBRK8aTaRsCD4r4Ihgyak9IWFCfz6OV1paRnQSIhUrIHEOKrsITI1UxUUocSxhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776153886; c=relaxed/simple;
	bh=Ec6D8ghiJod3XJD1Pjf1H4xYLvALUzxMeT73/KuO6I8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ipAjprL6wwGJICUzVJbr3yS3ENDr9zKZ3u8+UlPfzSgkFVikLiiBf3zfbbtSxxbUifhIgeavAlUo66zgkrMEI7e5AAV7pxq9jsFVej7XyaxFlAGn7KwoxCj8Bx5+mKsnY0XTIJV/kMSzivXbUoCmyM1SPVSzifYwVUkP/l0Rc38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=pqfcGQe9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="pqfcGQe9"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso3494051a91.3
        for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1776153884; x=1776758684; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cv7zAPMflcyGHNeP1lrJ+83AUW2Bg3mHm0koPEfVDwQ=;
        b=pqfcGQe93zAPW5gWh4Vozv0ZeP4JAFYHC9wXdggY+WfNzXg7OH+KpkrDACUGotulKH
         cB+LK1fklO5oGHbrs1FMun+whN6Lx3a3QluuCgOYC9OdPbwQ0NGXx0jeTPcYRYXtj0hu
         vJ/opTs4c4vwOLDBbUilyyXeAdvLfFIAzYUeJZi4aHwppxLZwrGvVC09GmdUNC6j+Kub
         opA3Uykiev2BQ9yixI8hZu8OScBW446/+NyZashuNp/lEfr2VcRE19oT6fWtEifWMf0t
         vxfiydU0VExjiWGd69dbN2DX2aOAfS36oE5AobWhTV93HRPt+JR0utXr6xcs9mqWSz3b
         d6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776153884; x=1776758684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cv7zAPMflcyGHNeP1lrJ+83AUW2Bg3mHm0koPEfVDwQ=;
        b=TMriFPkhm4/1xOS2UpEF57e+k4sbct15pTiCgseHvHauHcqIwQI6qcV/P4Zq/3cQet
         +7EKCbQoGJ8236OEhzCgduC9cB7LDgenOK0D9Y5GC9YAZ3qzbw0u7LGA7U1yXsfqmpYD
         XIp894iEoSFkXLRUJT53pWx5te5IVNWlFXzwvnPxx2AB7Ig6pJ3k5+3J1CnZYqnisCbW
         iFJ2zNSKWPUQR24Z9i7EjWkqOtBjjjV1M5vBbq5GhZyYXaStkL1+6BJryGv3TAljarjx
         V+N4LgHKbifrkImEALL8g9obGQOtLxPoAvJM4vihyxJspVZ2t3s3EVWRLMDjC/wqJDOz
         W6mw==
X-Forwarded-Encrypted: i=1; AFNElJ9ux6UOA0K5M+jk8uQIuk0C6roES+aFUUw54xjbQ2TwkIv56f2PxQy+pXqys7gNRIQbH5YTMPIHDio=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2fIn5C9WKsPq65kuhGI5Lh2wVLndLUONrMD6hH4373qr2MR1E
	HgtbU0LB+f82P6PbPcQ62zxQ3+zf/kiYWBwx611ARXg71vNsvpmMPKjF93RhNxVZ10E=
X-Gm-Gg: AeBDievFlCOywHgHTdyyhLw2cufKbN7EU7GLdyfU2UiCDRgRuCODnGKXmihylgetGTB
	NzcR1NTDecQ8DhhgRMX5l/j2cJargWPxeRiZ9EEiuE5hVgpLLPhhzVtsPddZh490UJLJQrpEGkw
	A5qjYAvX2Z6Xxy+RbxaX+BKKkdpYyCiDmgHdhD9ox4h4YjBL3fb2DeyU0Bo+BAf7gFM9s66nO05
	EfVHD/9vl2T8/4XCdhDW69PI59bAK+2+JU0jJ5gKIk73SrDx0HWMBPFLzGt9oxpyPNmC6gRlie8
	hzdr4GDvqC/jKCc5SWFW5u/JwWW/xI91dc8vKyAlpiWdYqsN0MLNwJ4xK6bsctj+gtkZ+Aw34Xk
	f3HaEgCcR5sZW3Phzul0Xn8Lk2K1lo+KpFQZxlHgzi7RT2XnF9GVdWtdZRtwaFANvnpLCjpD+qM
	BSGIw8YaquQA==
X-Received: by 2002:a17:902:7607:b0:2b2:49a7:a5ca with SMTP id d9443c01a7336-2b2d59411admr109194875ad.5.1776153884528;
        Tue, 14 Apr 2026 01:04:44 -0700 (PDT)
Received: from xpc ([2400:8902:e002:de21:a5e:ca8a:49d9:fb8a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4e04e20sm136683025ad.32.2026.04.14.01.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:04:43 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Haiyong Sun <sunhaiyong@loongson.cn>,
	WANG Rui <r@hev.cc>
Subject: [PATCH] perf loongarch: Fix discarded-qualifiers warning in _get_field()
Date: Tue, 14 Apr 2026 16:04:24 +0800
Message-ID: <20260414080424.320060-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Haiyong Sun <sunhaiyong@loongson.cn>

arch/loongarch/util/header.c: In function ‘_get_field’:
arch/loongarch/util/header.c:31:15: warning: assignment discards ‘const’
qualifier from pointer target type
arch/loongarch/util/header.c:36:12: warning: assignment discards ‘const’
qualifier from pointer target type

Signed-off-by: Haiyong Sun <sunhaiyong@loongson.cn>
Signed-off-by: WANG Rui <r@hev.cc>
---
 tools/perf/arch/loongarch/util/header.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/arch/loongarch/util/header.c b/tools/perf/arch/loongarch/util/header.c
index 0c6d82333..46f53a74f 100644
--- a/tools/perf/arch/loongarch/util/header.c
+++ b/tools/perf/arch/loongarch/util/header.c
@@ -26,7 +26,7 @@
 
 static char *_get_field(const char *line)
 {
-	char *line2, *nl;
+	const char *line2, *nl;
 
 	line2 = strrchr(line, ' ');
 	if (!line2)
-- 
2.53.0

