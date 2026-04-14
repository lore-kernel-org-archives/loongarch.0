Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD7A23C4F2
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 00:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776127960; cv=none; b=JN+BsxJ9zsjDJzMxbWceipaGnEnBsL3sWOQIZtzhVRSvxlEeGMttHz+cPGZ/Iy/zntDOObxCv7M9ByZJ5dArYk3rjt/QJkYM5BLKMXnsZLrLptZJysVBNOSFmQsR4/rZ6IaauGSfBHCM3KgmZDvt/FDYEv61GduSRsCuUn7Ywl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776127960; c=relaxed/simple;
	bh=QWpq9riX/z5vABZSqFL2iQ5ORl/fWBZU5VsGZXFuyZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q07azdFEZs/4s7F1xkaWTqW6zdfUGBd0+0Q+bqGJmN+kQlXp6TToNacBgYGOWxbwXWrujwaVHeWZD0IWkmQTczGugwMKjHEeT/EA4uDNN5YY+3piQNsLPEcx7GsK32lCVR8paANkRN1FWUYyL92qGjxEBAAXGCdovfPF+id9/AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=LzRPOmaZ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="LzRPOmaZ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso3631132a91.0
        for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 17:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1776127959; x=1776732759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6QCQwPo5vrqxa+fHlqgB+lkktJCKNc/eQZ81js5sS64=;
        b=LzRPOmaZnyLTWxbQyc05U1WhkP+wTgDdYV0yv74QfOwek86Uz1FYb2DTs4Kuwd0AX8
         3C20mBEoW/24+lYj+jghdlYl9Jg3hDNPBaXmnQVccbyXoRCozAdjX4O4Ed2AQWZcPB1H
         Di6r+eymFSV/ffkESTr+LsZZZZnCN9OE3/3Py2bK1chwjWjw86kjVPnLY5THy+kZ3DIT
         wuONZy/C0di3hZ2Hub1ysppfgvvFx6QjWKGrNTYK8rJHZg/iCc+Hk4kUvPNiueX/9VF8
         6MzT4NxHSIAJY3d7IbMgNKUAiR9RVOVAy3B8YfHPHRUTFLKluCgesyr8BLsbAfC3Rg7e
         gt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776127959; x=1776732759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QCQwPo5vrqxa+fHlqgB+lkktJCKNc/eQZ81js5sS64=;
        b=U+00oUfKeYabhRw4OMnNtvFq5ki/Dhy8FMXfh8yGm98eOdxV4b2t9HrmR7pbiFVttW
         tLhDaf/EQs7wcHmxehYj/9nr1/igb/NuQicBUnl2OTfct+H4Xa7QDMC8mCH5KHWDYvz5
         emx3JyYYOyQVIZo8FT0fVMt4JflwXklXe3DQKjOsyN9Yq85wIrYrK/yr/K4zRnp8+tJP
         3FBw/pA7KjX4X00w6XPyaIvuHpBUCenY6I/NDyuTDXYjUi7AWIbb2O8ekJbOX65wXC+x
         kSqbA1QcCpNb+Ue9uYuYGioJZcqcRs+zeoWBWKZfMOdZLJtL3rJiX0YQNdCq8JV2YYgo
         NrTA==
X-Forwarded-Encrypted: i=1; AFNElJ/WnAxru7mGTLi3w8E0ZxNKPefSYQ2DFZgu0C60rAodfqye0VDF1y80iLJGncMmzGYOKXBll7bLtUc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxG9T02YKB3nOq+Mdt7J3WUpevDP0g5wdLt6MuMtbDDObdDs4J4
	J+oeeuVZRHacqa+7B9VLivKMUan0ZYBobDywRQO8UdvbjSIUXnHCbVXOBKMJu41LTjU=
X-Gm-Gg: AeBDies7lBczf0yCs4fTsfhxVvTC9fvL9lRI5M2vanvC801VnXcIfX+86O4vPOETvkD
	23XvUQBApYDSw1cPpTeGU3vUyobHEwUxAfZpbQkKxMOLD/cR7uz+3WyoEAJPDweJK1vFKP2Iq5q
	eFKsl54mKT9qp0vbMdb7OMFSbuMEVLyYR354w4J/VRcI3K7O7pp0dQwZNNHEVsG3lMtSFWbl34k
	trzqM14zs9cc90CThCH06O3cL56wR4PuIdF2EmkSpWsrzAnWoWQ5KEmyink1TXSX28M0xAMqCVT
	m8WKEv/GSbY85QmwFcoBG94YkkQe/E0LH9s8EEu+fBk3XBhxFrMMEd3sqBGd8h4ZWBb6igjbuKg
	eeKBh/H55DrAbIwIfBem7RX8tR8KbjJbc14golZKNWpQo1DayWdLX5hH8MuSPriT+QM2utNpimt
	5/obqBjra5i94=
X-Received: by 2002:a17:90b:2dc8:b0:35c:a8f:5c5f with SMTP id 98e67ed59e1d1-35e427708acmr16148191a91.8.1776127958859;
        Mon, 13 Apr 2026 17:52:38 -0700 (PDT)
Received: from gpc ([2400:8902:e002:dea1:c507:1213:2c85:ae99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e41bba7bfsm5906431a91.0.2026.04.13.17.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 17:52:38 -0700 (PDT)
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
	WANG Rui <r@hev.cc>
Subject: [PATCH] perf loongarch: Fix build failure with CONFIG_LIBDW_DWARF_UNWIND
Date: Tue, 14 Apr 2026 08:51:52 +0800
Message-ID: <20260414005152.10550-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building perf for LoongArch fails when CONFIG_LIBDW_DWARF_UNWIND is
enabled because unwind-libdw.o is still referenced in
arch/loongarch/util/Build.

Fixes: e62fae9d9e8 ("perf unwind-libdw: Fix a cross-arch unwinding bug")
Signed-off-by: WANG Rui <r@hev.cc>
---
 tools/perf/arch/loongarch/util/Build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loongarch/util/Build
index 3ad73d0289f3..8d91e78d31c9 100644
--- a/tools/perf/arch/loongarch/util/Build
+++ b/tools/perf/arch/loongarch/util/Build
@@ -1,4 +1,3 @@
 perf-util-y += header.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
-- 
2.53.0

