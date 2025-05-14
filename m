Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A42284663
	for <loongarch@lists.linux.dev>; Wed, 14 May 2025 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235689; cv=none; b=gp7oUvtcHOA2B8nMYE327VIcfQcGD4AubfZKKA46Uf/jVGYoQYRCAtbyUpwO2EE+0bThjq1J5lQH7AB44uVIjDrTucxMhbGkPGioOLhwIZcja+//UbZhMFuVO/X7/GHACE8FjwpxRWgONk8gUDFuuKZ91qu4GZF/upY+rXnVP4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235689; c=relaxed/simple;
	bh=dbXx+MD2QCNjSXPlgp390XJDfrTSi22QXjpUAVmjpNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HBHBtyv2GMmtAYQ5cjJeXx8GfNmVPl3F0sDPLjD7MbDprUH5ewKh583n6nW2nMCXmj8tCl2rs05EnKYgW8tpoa85W8FhAgCopssAYLGpq2HyIOzNhEm84n6/FGdSdTbPVuvX/rpiYG221rZzxw1HsglLUC2lDvaD0flvuLLWs4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSodNn0p; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSodNn0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747235688; x=1778771688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dbXx+MD2QCNjSXPlgp390XJDfrTSi22QXjpUAVmjpNs=;
  b=BSodNn0p5g9mwA+zoWlQu+vWMlXS/KBiPn1UbHxNNJtLbpdyjSsqHVn1
   h6oR62DWKtNQ2v0tUra0DVfx/fKEKjiIVIc1o3rJDpqpDkzvDhP/xQiAu
   50EuaqZoCyc+HPj1BP//AXrXDxd4cvzNE0OCgTsHlmxMXxEA9IwHh0i+P
   a2IGbupzaCSlr2lAW15bKHZIVr9udK1xw7rfczGOgKVvbkoahd8aVTuxB
   DkeJKVq4FU0/EuihJI+rJEu3m2uk5Io0AUg0yLqMP3AyQDb1wNIaeVFHW
   jdQlVFqM+4Bb9st8fvWY8GwxZ6PD095rQZT7LYfvbAGO7aKNUyU1r3RE2
   Q==;
X-CSE-ConnectionGUID: f5Usvd6qQuexXXY8At/tBg==
X-CSE-MsgGUID: 67e3Z9O4Q/2JY9mNPSoLAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49072797"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49072797"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:14:47 -0700
X-CSE-ConnectionGUID: PnJJIKlyTqaZd4PmKT1G2Q==
X-CSE-MsgGUID: xQEo3F7WS/a5yxyQ6pAJUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="142939176"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2025 08:14:47 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	irogers@google.com,
	mark.rutland@arm.com,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: eranian@google.com,
	ctshao@google.com,
	tmricht@linux.ibm.com,
	Kan Liang <kan.liang@linux.intel.com>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: [PATCH V2 12/15] loongarch/perf: Remove driver-specific throttle support
Date: Wed, 14 May 2025 08:13:58 -0700
Message-Id: <20250514151401.2547932-13-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250514151401.2547932-1-kan.liang@linux.intel.com>
References: <20250514151401.2547932-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The throttle support has been added in the generic code. Remove
the driver-specific throttle support.

Besides the throttle, perf_event_overflow may return true because of
event_limit. It already does an inatomic event disable. The pmu->stop
is not required either.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Cc: Bibo Mao <maobibo@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>
Cc: loongarch@lists.linux.dev
---
 arch/loongarch/kernel/perf_event.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/perf_event.c b/arch/loongarch/kernel/perf_event.c
index f86a4b838dd7..8ad098703488 100644
--- a/arch/loongarch/kernel/perf_event.c
+++ b/arch/loongarch/kernel/perf_event.c
@@ -479,8 +479,7 @@ static void handle_associated_event(struct cpu_hw_events *cpuc, int idx,
 	if (!loongarch_pmu_event_set_period(event, hwc, idx))
 		return;
 
-	if (perf_event_overflow(event, data, regs))
-		loongarch_pmu_disable_event(idx);
+	perf_event_overflow(event, data, regs);
 }
 
 static irqreturn_t pmu_handle_irq(int irq, void *dev)
-- 
2.38.1

