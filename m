Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C33F6613
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811548; cv=none; b=f+v8RA6y3zhnOI5xDG+XSi0d0scBJBO8VOoGElAJusVJuqX9hItp8V6gvT+VySw20my7PNNDheGzz/5Om2rLqiUYxNbO83boZDLGXRwuoE8kByuPOpS2EJEVTwPIms4Fu/5Jfh8e0Rq/pUq3BFUsAMqcSSl9V7GZ1IgNmqXWhbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811548; c=relaxed/simple;
	bh=/L0JztPl1fAH1NKvIkHQ2Z8SbljQvBWmCee1fQtoXjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ilu9DCvbawsF1PgsBGmCQ4ZAhV4jk+ItBGuom/JrBkp8xuwSWwBU4pH96jy3GT5BzB8RBwvNCHdZDCh8XW7h2CKwxF+R7hrVA9YKycioaOHW6ddT7h5/ZTncNZkKw5+koL3wt8+Ht9vIhS717QNNSlM6ueHY7Aav7cnU3LDnou8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ean/W3lV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ean/W3lV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so3575267f8f.1
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811545; x=1783416345; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mWXuvrdGO01kY7ek3iU/KtbfaHe60/89WOqzzwryweQ=;
        b=Ean/W3lVmFO+qGXN21D5xH8K88eDT8PQ2BdkBXm5Eo196roNv2aHA9fjGgvjsp33S6
         RRJB8JK9c4ReNTm3twijjNWeUq9ODvnSx5/QToEnxi4EFwKCxIMlGJTJJMJJs2aorJMH
         dyMRUF0UGbHDgPS1ERnABu3Rv06+Ws1Eb7lkuLsY8rQXTbmQSVT7uppMn+8pvfIJpEfl
         wNwn595bX/1mYRBjUx21Y+ztR5hM997jclpyhYoHvJ0ZNxEx/w04w47XqXWRHEt29nX3
         /MlOzO6rkRxeQ8Kuq8bH6mrDnaUIsi/uocBtcO1a1/ZnudiBdR9VH1nhoByKe7UP2ux0
         FVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811545; x=1783416345;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWXuvrdGO01kY7ek3iU/KtbfaHe60/89WOqzzwryweQ=;
        b=OsA1OuwZxcpk6Dmsg1r6yO/gsMQK93hc9h5x/U6AIMz7XJaaOEsdYxmNzCFnhTzhoV
         mlrzV9vGXM+Y3qUyfFmLwHOXZEb5LYVuH3mtJzwvf2zZc06flL3/Hdl/A+i97EhJ411c
         +i9+AEhaFqqbMhGOz1dxxdYGH1D+ck2QngrXERv0oIqXOlRIhnAF6OWsLj0zlerC2/su
         7jyEt+moTGP5E+bobBlaKZAXQXYSyvUis2axmmj924ojsJnwfsXDKJjnJYSUW9+8aXIG
         NXeJ9qs1Q6+t+2DSOQmikFXy3TYGEISd4VEirsdOH30pSztWj7PRPQuiLR/ZewXYN3EL
         tGHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvV8Cbwh/cJXufowBeMKLf60+X5G6y+orsw/L6iKjl6fxFMIOCAHcMYir0IhNeUWd1BK62/lCxVaU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrOl1jecovGYtuotlSGrten1Kf0I60C66OKovCqux00wlgCA3M
	lblIGSHfdCkhiYfkzgPAEq1xM7h2x9j1lHW8KThCye4jMgKbcbd/wzuOCVMQ5iH65Tw=
X-Gm-Gg: AfdE7clFMmSN7UPSPPVbBeAgTR+++NyZVoRbdWfQPvKH5XyjdCPVq+MD0QFNdLd0JHP
	xLTSsIiTfoQf2ruV+loM3voJQtQ/CfQSP0H2ELEsFs9lCszdy3N9Kn52puNW7YBeRDALyN9O4Br
	WpEq6urz6EToq13KVNm3lU6OzA3BKBxvFkt1nfZH+cR6IbX5YcprIW0cVjNjN+PodgQutRdkJkm
	nqw3B8ZQfs6xvOZbE5PSp/z/5DWUoKa7BkFWDZoOtGMyR2wnH3LIv29ac8YjTED2/m1JZHXQhM9
	d7GjteWD3zo1zDiy2ZFP4il98XHkPucRlRWcrn8QMxszezcmeYU7MUxtQd/03BlE7AdArpX/+8N
	9FClMygXQzyqfLeLqUXJ9o072DB6c+PU8D0zFSWIhIVcMTPl0tO961hjyFEfjfEhPzXPkuy5DKU
	35PKmrOT3ZuMk6F6+wbscqgmJBWvNfVby0eG4hzXz6w5LkiYEIRCaIKr+gKl6PhemrXSsTlCi4n
	QjB
X-Received: by 2002:a05:6000:430a:b0:475:2171:ac1 with SMTP id ffacd0b85a97d-4755297271amr3571604f8f.32.1782811545165;
        Tue, 30 Jun 2026 02:25:45 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-475671d0403sm6335542f8f.29.2026.06.30.02.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:44 -0700 (PDT)
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
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v4 13/17] LoongArch: KVM: Add include defining struct cpu_feature
Date: Tue, 30 Jun 2026 11:24:32 +0200
Message-ID: <052feec0e04ea8f5b2706a19a5b236679eed0aba.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/L0JztPl1fAH1NKvIkHQ2Z8SbljQvBWmCee1fQtoXjc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ4tpQQNXJcLb2chDA6Rfwf/Tlj5ry8+TBqXEf yRqVuJ/alSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakOLaQAKCRCPgPtYfRL+ Tn3UB/9dZ07ubgytZcCLAH8wn9bojhx3+qaDHyC3ka2A956syohAPk4ZTqew39mkqYPxnq4uFWi 1ME/nf+U6xtadYh+K1L1irdpQa1bYXgaMk3MIhNLmqtlqBIdb/KPgYEQ1vyhmE6dns0DdFNdonc R+1PMNywpGP+Z8d7ZejYO3tKP1JE55BeyNAMfRpx/dmcmnVUJ9kWaLxGKJ/lnBoBMHxHcf1EhtA rX0bScMIfWHIcFnQlIjHH/tzZXOcPVULstwVrUU9+7bfDRW/67PGP91QfB9yySiFKep7POcfrpq NgiiMoeJlsJn2SUVDOLwxkAtFkFr4nqwTyxE5ArBsxOsyb6j
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
Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://patch.msgid.link/dd99dd31bbdb74884b27ea940e76872913b6dc1e.1782682124.git.ukleinek@kernel.org
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

