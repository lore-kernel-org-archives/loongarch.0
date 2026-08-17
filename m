Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC3841D138
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970372; cv=none; b=aTUMk/lD0ycBlGFe7edmsrVKChuBduUcBkeodvaoxF1LCvcBDIMXsYXgLMqE13hS+x/miNAo0+j6bjjsPhu6bFJ1JQ3SO0MqXSKVP6LunHyWFs8BtOzcwEdWbYmMHUslH7VGSDssXVe3eiDMGC/CT0MmTZWweU5lZNZtlwMqCn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970372; c=relaxed/simple;
	bh=cj6p/BHDbLVfEGwDzLrVQ3P1JMoZztkK5jYHejQUPRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eIuwz3q1mFAOQlFDEDY4TtySlRVjVo16qlLpiyHMdo1T1JgzQgznmjnYFgplbsfMkNDBcF/Qt5UhqrER2dYRYXvRL9uLfC1EZd53Izbmc5g9xuTNr6amFuYm31mcyNNXM3YUElj5jbvrCRki0ORyMaN5l3g4DwWdr9LxCDjSxjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msGXc95R; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msGXc95R"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9034b6b7674so20335986d6.0
        for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 05:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786970370; x=1787575170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xA7SAQunaLLiokSRFDeBuiD3UWcIa3/acCMrG/dMDdE=;
        b=msGXc95RyWlKm+PhSBnFHYOnNgD4qjEat2edIwCCOxlJAEY/uw4RJzjrqyWH3CRNlk
         Wujo17wb/Jq5tkmYl6E9n3tAWMAjoTAUOd4T88HSwhYrDx+KR7vuxBCYQZszgaZ5splz
         /B26X5OX0i2VO6SUSvVzCeAJls43GxFSBtACVOfv0MjZPROlkGh9Hv0KIrf/PYPj/0ot
         UbbmorNudYHhVL4NQ6CzXGti1+Zb17Fn41IMnWoNYY6FWm9LbhV/L3MnUdfXbKpZWLGg
         SUmS8NETJU99qptaocJx59yHSVL4O/ZUFrjcv9JmFEYSNROib4lhX7O9c0nrhKmSNCMQ
         /RVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970370; x=1787575170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xA7SAQunaLLiokSRFDeBuiD3UWcIa3/acCMrG/dMDdE=;
        b=qBKz9mVFLSmFEcJuoi/V5BwUjt0GASi6DeflJbqudqEz5n3ZnfcUCiHZLgBdD9EZyY
         9DTnGx+BstsS8A05VNCQsSzY63bhlQpxqSVoqPlJ65Pt/1skMvSgZTlTEdbgAZaUdFEy
         wuQ+20mQMZ6Eg1NxepSpOYkFmEVtYzTDMdipnzW+v1gfdtyIqmw60VKGAKuavu888IFy
         phE9lVBCBoXRQz+RebAtUiI6Gs5LvdBF/UMz1Jm4sZWfL0N4AuSFiR5FxnMdOOcC+Ic+
         D/cDOxkvqqpYQZCvr4lrDJUm7wWBTzqLmb2nPVqAket0nhkwp0szc7iNxyR6AhgaPLgF
         MVOw==
X-Forwarded-Encrypted: i=1; AHgh+RqmCVg3Tddg4N12c+8HX+qkhUzWD0V810bQFr3Dr5BRCGubrW9RcxUZmMZZZV/mgcMhwN8g8AafmSQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXnIYy+kax43HSnUEWsqzHhWTYoztCsE7hzKtJjKWPC+2S2yHu
	Z1STNwXa9EMjoTHVTC4T4AgzqADeWCd1zKGHjAclH5RyBJR7x4JmdrS4
X-Gm-Gg: AR+sD12s9gAlMi8liKShixEaeOTm614iXoTqU6+29PP0HDUsjigJOLVvEjKaoworYr9
	2cKXPtT3PblJteWwl9Ty3BxgiHAsOzHekx3Z++OabH4TjCkWL5nIzhVTUSeN2j1dvHKUqpIPfQC
	NcGzxg1ocfE7v52S0h92an5z6py+q9/sDZZcm8Hl3vGwjixtGvfV5FLqNhovd7TMfo62ncysup5
	sPZdpnLuXSERC0I5RFqJuXsvsg4f/ZskS4CIXcRAEaQEHaeCjy/yARQNZQscqT6qufEKYGZcv3A
	y1kMePZn9UBgWTdM07vWdSBwOu+yM7wxu2niiDZjhsrbxNoQmp+QLsa46dsTKUE8Sh4oQeC+MJP
	6H7Jc1wsuyyRCQOv/HtEfRhFKE1BW9HXeMI6mgOD9wl7pjnvPGZdgPdHNyiCYGxxPqBynDYLYCh
	4CZwag6o2omFwmECEXHYOj+dufIVj8YMWDODaKiqPnWkFUnAjZOhECTUL6iFOy6HJKDqQnL4qPC
	g==
X-Received: by 2002:a05:6214:4808:b0:908:a729:73a4 with SMTP id 6a1803df08f44-90c4b2d8589mr2651306d6.5.1786970369756;
        Mon, 17 Aug 2026 05:39:29 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c45936c3csm8079496d6.32.2026.08.17.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 05:39:29 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nagachaithanya9911@gmail.com
Subject: [PATCH] LoongArch: KVM: Free init resources if kvm_init() fails
Date: Mon, 17 Aug 2026 12:39:18 +0000
Message-ID: <20260817123918.2738447-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_loongarch_init() calls kvm_loongarch_env_init() to allocate the
per-CPU kvm_context (vmcs) and kvm_loongarch_ops and to register the
perf callbacks, and then calls kvm_init(). If kvm_init() fails its
result is returned directly, but since module_init() does not run
module_exit() on failure, kvm_loongarch_env_exit() is never called and
those resources are leaked.

Call kvm_loongarch_env_exit() when kvm_init() fails, matching the
teardown-on-failure pattern used by riscv_kvm_init().

Fixes: 2bd6ac687261 ("LoongArch: KVM: Implement kvm module related interface")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 arch/loongarch/kvm/main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 3e1005526f4b..b6ddf5827c03 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -428,7 +428,11 @@ static int kvm_loongarch_init(void)
 	if (r)
 		return r;
 
-	return kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	r = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (r)
+		kvm_loongarch_env_exit();
+
+	return r;
 }
 
 static void kvm_loongarch_exit(void)
-- 
2.43.0

