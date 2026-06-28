Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D62D3B95E9
	for <loongarch@lists.linux.dev>; Sun, 28 Jun 2026 22:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782684013; cv=none; b=e0qh7+tihGcsYbJP8fSdNQgVfTFedfzpKPapb3j3LGsdXVuE0UsGcvas0BxN+7aZtx45IdJzmruT6OqZS6yU0T45c+Wnji30Xp61eFm205X/f/rozEGd361Txm3wAFlwjHCKLPapdwlnN2x7z/WjmMoU5EPn+j7hYg8QIL7vMVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782684013; c=relaxed/simple;
	bh=Oc6R7UQM4qh34RCqEZRqOVjz1IUFMNkzIANhoWIPBZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLoVjSGntp74ClQDnf+KQlfw1O87Sr2oiVTlTju+DARQwVubO+zkLFq8DWZzFqcHrfB04rSDLnygDB2o/qB7pyUEY8ULEF1qjG/VWx+c0ugMxg/VK9D8RvQlE3rc+DDLpI+aWDz639gI7lod+NFLQ6sdo/6SEyUF3J6N79O/DVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Tzr9/Mvv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Tzr9/Mvv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493a5d32e8cso10721075e9.1
        for <loongarch@lists.linux.dev>; Sun, 28 Jun 2026 15:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782684010; x=1783288810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AS+EdeDaEwImrWWy2E0ShIJW/2Io69CWq0mFP0PBS40=;
        b=Tzr9/MvvBU1Wi0V/3xxx/WBg8ZJMSAPEjDZ44UWcLOPamE4a9rncLTH86glX74bdpE
         k1NnwSx7n6IMuKRhvcFYKw4lPZ4QviBwWA2xh5dZ9W7Yj+4yvsX658JNOutyrhisZt8M
         LtPM1v/03t8m8ybIOT2L6SKvnr43qC0zB6mATTMido6xcIO6fqxtzk/9e1H7Zr6a9Xoi
         ipxfuV/6slg2E/o2BO5Xi3LvUp6uP3djvjzcxCtXWg/flWYpzmMd79F0QgRVVWbIrYK+
         slbioM9Nvy/Z7OSOiJkQlfD2oJdH4sUFFd35ozEoa9ZRx3r0i6aV9mozw2EUsAkYE45F
         9qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782684010; x=1783288810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AS+EdeDaEwImrWWy2E0ShIJW/2Io69CWq0mFP0PBS40=;
        b=TyuHmi7VMpgXPE8ffwV/ZI7VgkApGfZFXOe+74tS71r0sMw7bGBeXIBiZ2m6yrx1kO
         vATqnOes8WY7a0TFnWxDbw1XYVKnOjsp3ehNcORTc/bDD8s/yBziL3I48EAt09cDJMTN
         thinbXPVgMV0V3QY1do2sBf9+ZQwuzNT+6Nv66tct4HDqThXAraHI9+1H1NUFGEKw4Zg
         nWmn5x6CT0KGhE8t7MOhkBUaw+UQ/cfz0a81NaDXLnlYo3g0cDJzYgfLjY6Y1G/oju1O
         OeoZ7yeiDjua7y33Fyhlrt2kQ38MVo9+FtsVxEVtVHqpf0Mf8F/v7Z6zm92hdJ6BGSa9
         rZPg==
X-Forwarded-Encrypted: i=1; AFNElJ9D3746BKePz6MjM+6bXI532p7bU9SkFQr+1y6pUnoDP77EOPEM4zVMFr+8IxZTQz2foiL5T/WBjmU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2l/G4IUbEy2RuNWamBR1UaY1V16uKPXmr9J+dsKf1YfYdSuFo
	31QFk7kqxN30p1Do9hKEnixhIqVS/S89vrnOSnJLVKVExASc9yPOSrKku6nryU9o++s=
X-Gm-Gg: AfdE7cmG+41UbpGpnP06M9AzG/WtTx2lgLWYF/lC93/NsKjIXVjeuVfwsWrjay7L9Lg
	Tl+kzGo4rrCTn4BI8d/iMgxcRaUjcRTLjEsfQJ4NAcWeMXzsfrdt/ASA43EFzJoKtDOl4rEOvpL
	u/9DKklRDK0/SNgmYXBUcaHAN/luzEOgtLE7zpBuQg03Jb3WTa+O/BXS4DlcK/1Eub8oYaG/axE
	/KFNqBjV4DCiabJ0oH54FMIWS+xYODiUl7wkdFVwblNGzPtRMazXiQjjo8i0pBZVYEluLXkTOL/
	b1NljPvrqrDHdY35fENocsjoMxRTfkKAoRFZanBQqHeP0I/OGaZChjXIBu8R4b1qlibED3bJdiX
	oaeHhSVtIdZ/B+JWRM/ntSH6fdiCT/MnUWlHtG2mu1p9LAfffuoqMeVUHw2Lxb1acaoBkMkEECY
	CnQJnt2KlXBvTgCeRrqg==
X-Received: by 2002:a05:600c:8b88:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-49266893312mr215389855e9.29.1782684009710;
        Sun, 28 Jun 2026 15:00:09 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49268fde98csm279002625e9.6.2026.06.28.15.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:00:09 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 13/16] LoongArch: KVM: Add include defining struct cpu_feature
Date: Sun, 28 Jun 2026 23:58:48 +0200
Message-ID:  <dd99dd31bbdb74884b27ea940e76872913b6dc1e.1782682124.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Oc6R7UQM4qh34RCqEZRqOVjz1IUFMNkzIANhoWIPBZE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQZkyY6dxKuRGgpwtBcHnRi0GpzDaQgf8tazVa ctnH1YtHneJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakGZMgAKCRCPgPtYfRL+ Trz3B/95QuY+r6h4EgtXofXYOb8V+LmxmbXKiJ4MMxH0YTY/T4NHKPqQJv33FVmIQfpjVpcObHc LOCSvX4/fXum5e6qfqhTWhEFv+u9DbDjnjjgkq22QD4Ah2q6LKT0E2jl40W9vvUl3dhtVobogn8 sI2mBVkhjlQBCQNd/aSd+AWK7AsBKV+5bWPALiT0h30SS/oj04CVHi4nqNBnmVfcTJ3hWl2VlkY gCWygCCoh4wFZ2uks8bKYpvotoe1KXCCkWyuxgef/eoTGtR+O5ZT1r/SgZSOyLZrFsk0w8JbPWK rbI3hbbUEJ6HjNDzbXfh8d7XV16SXNMjzVipV+772NXO1h/8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Traditionally <linux/mod_devicetable.h> was a header defining a plethora
of structs, among them struct cpu_features. This was split now with the
objective that only the relevant bits are included.

Currently <linux/mod_devicetable.h> is transitively included in
arch/loongarch/kvm/main.c via:

	arch/loongarch/kvm/main.c ->
	<linux/kvm_host.h> ->
	<linux/entry-virt.h> ->
	<linux/resume_user_mode.h> ->
	<linux/memcontrol.h> ->
	<linux/cgroup.h> ->
	<linux/kernel_stat.h> ->
	<linux/interrupt.h> ->
	<linux/hardirq> ->
	<asm/hardirq.h> ->
	<linux/irq.h> ->
	<asm/irq.h> ->
	<linux/irqdomain.h> ->
	<linux/of.h> ->
	<linux/mod_devicetable.h>

To keep struct cpu_features available once <linux/of.h> stops including
<linux/mod_devicetable.h>, include it here explicitly.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 arch/loongarch/kvm/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index f105a86143f5..aa0fb4c90d90 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -5,6 +5,7 @@
 
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h> /* for struct cpu_feature */
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
-- 
2.47.3

