Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61673280008
	for <loongarch@lists.linux.dev>; Fri, 16 May 2025 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747420169; cv=none; b=i1g+YLcpzzM0RuBuDUeh2GH+0CauL6K5L7AbITregcanRFKAak//nui9Q4qkqwqdo2seAit/n6HkSfmaU2f1kjx32V8EhlwczbxhDpYcE1GlaCrV3Ys3rDaYUNvKYiVnVAzz/paw0FxvLLX3N4xA3WLffHljLzrDTUTaaJsXkUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747420169; c=relaxed/simple;
	bh=dbXx+MD2QCNjSXPlgp390XJDfrTSi22QXjpUAVmjpNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rU6ctIUDvdwn/YBuEyaT+vFuFnkhJg1QtswAGWGbZRlVJ6GN3hXHmosvBVAmlaDiSS1q3qJpjluvl5cOy+tASzh7aTCnIX6JHaSilxyLbPDi0lnsKb9Z6DhdbNaaOoCE9n6RbaQ1+wF6mFfoOExx+I0MwO74ImUG89/hvHv0wig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgREOhL7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgREOhL7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747420167; x=1778956167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dbXx+MD2QCNjSXPlgp390XJDfrTSi22QXjpUAVmjpNs=;
  b=EgREOhL71igdYKawo8Azs4IRuwTOrh9FlcblXNZD6jf8/j/SRIcf21Mf
   0wqDdxexe4/Up7TgZ87dqK/R3lKVZkcZODKwAYvKZQHCOsqvhghgkN6zp
   QzlCy4gAYUR14q59c+j+MKLkv16ETF3+iOEdFuCXKj4YndmhF2MhiF9Dt
   yU7lJyijuugJcGm190r4bCLwXWm3Nnd9TUPDSNrYXhMIPUk5EEqKws3z+
   9929hIZFMlAEp4tQ1jOSN8IFOkHxRJmbrYx7gPxWSEq3fdBioFGZPTzzR
   7K+BbsazPBoFJc0I4Uzcy1Q4WxzBKk2tzPEsuIISfcbjg1bV7eybDIWdB
   w==;
X-CSE-ConnectionGUID: HdrKOwtcSOK+9Y02TRwzjg==
X-CSE-MsgGUID: UFUMw5MFQSqGDcSJETMDaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49328900"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49328900"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 11:29:25 -0700
X-CSE-ConnectionGUID: 2mfqUfHSQ9WU4ftQ6Yo07Q==
X-CSE-MsgGUID: HyEO6Qh3TJu/Eqdx6PeuxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="169802623"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 11:29:24 -0700
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
	leo.yan@arm.com,
	Kan Liang <kan.liang@linux.intel.com>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: [PATCH V3 13/16] loongarch/perf: Remove driver-specific throttle support
Date: Fri, 16 May 2025 11:28:50 -0700
Message-Id: <20250516182853.2610284-14-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250516182853.2610284-1-kan.liang@linux.intel.com>
References: <20250516182853.2610284-1-kan.liang@linux.intel.com>
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

