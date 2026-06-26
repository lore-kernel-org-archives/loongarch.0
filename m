Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FCE3B95F2
	for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 18:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496911; cv=none; b=m6DuoYbOJ9b9DQn0jIFkYvns/03MAqoM2m0/c31eUwjgDYyPvdjriZUGNXSeWtdPCD4NXYg/T1JIIupjKuqlb4w/U45MwGGE8lmNGRb4nHDe4QeBk7aYc+sVh8HMbye8eJjOYGj8XCbQv2H624RovgUu4ktKKtW/vDA4E0R4YQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496911; c=relaxed/simple;
	bh=aA0A5I2lDTZ+3fuKrSnqtIKoZ5aG2/MOhsZpVD8zJV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fBdCtE+VJeHj81vA7NdCsZa89T6qOHyqzcC6P2DAVm1N+/HTfhQ9RGLuqB1ygukulZscAlRKso68M0X/HAfseHYjdqrrgqcOknhmUnv7uK7h2y+9v2nD2OquFq+xFqH4U4tAUlxTt8Z3V51gpKhoOwhboSF4iVBqtqkeVO5F430=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iUYTLTyP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iUYTLTyP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4624a44e152so1048529f8f.2
        for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 11:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496908; x=1783101708; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2RX9n3O90HDR3KKKfuve+ljOjDu+EQUCUgCqbYAMF1E=;
        b=iUYTLTyPzqiKaJ0i7RD096dZZhRCl6nXkAp+5u8O1fvC3v6otqG3HXVBvAYk9WPlH1
         UAEw2fYm0LPIuYj8ZidkRp7t5mYhLhSbUzTfDHj7oAMO3j7ovz1ANfyEIQxG2qpah/Ze
         y2dzXd0ZuXCOJaJdfixHRamECGWnVV1X5MIfaQxy5c0rj9Na898Q2onxWnoXg92M0f/j
         CPVCAtzS//Lltm6WqwMVtutz8oUmADJiJmFzZHVV514xy3+YpJlbzrioD6SrLdD53b/U
         WUzF9rsaXy38KHHVifNxO1HKXnbYLDyLa9BMLJ1tPOlMsjng0tpChSaIaqJU7B3icmjp
         H6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496908; x=1783101708;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RX9n3O90HDR3KKKfuve+ljOjDu+EQUCUgCqbYAMF1E=;
        b=q30Apxgvv8Jvb/xm+38nQhTYgBGtcvIsHydsEAlw3Du5drkACGuRFyWSzkP7Zm1Fr1
         DroZyMccNzvHizwYjherEx2hTU9a9QV67jgiB6zojyCsuJBEWtedzl6ZTM0lyi5FdNeO
         59rT34IYYCp3oG3Ec/G8BZ47tYSe9OQrWL3UwwmCLVlSV6a/0AteRztbbX6GMpSuaa4D
         JmVo9Vclc6dsXf47o+I5XKGjt/jKjBDke8wq04ohRF7mkqQMbWk+16lbGuspuINhC8Jl
         7IT93k6h3A8omuw7/hM8w1owaRV2QZZLspE9zL70bxBNAD4NzmBnCOvSqjp2HC6WSlcZ
         rCNw==
X-Forwarded-Encrypted: i=1; AHgh+RqcfYvnX6EDkMyEUtpFGnQe6WTbYkWHgDyzPJmnFL5zqbLSugxEahkQmZYEMQYZJoOUACVmK++2fak=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvcb2/bNmMFkNGaUk1cnsypoU8KL2rv+2ISrdaylg0LPM8yl6Z
	yBmFZQXx1YrKqqW1yfhP5R0zeVWe+Y7WZJP0hovWgYX/h3/lo4B6C4tZYI6+EBc8XTo=
X-Gm-Gg: AfdE7cmdLfh0jh9W6io9qe25afHGf/cR+uTKj7GdEbApEhKmoBatpaP2g9BAUeoZqOq
	gnbZJC27DWT6znJT11ToSRDAmF+wQRPvx0+NHBuC2b4uhWwhfNRND3BXO0iDYEwklZVUsSwJFCX
	LWiLQHH30gPAN0hTDlVkEVMHCkampZu+A5Qhs7d66tO9ZpLGSKwsc+/RNVtEReB4NwYycRLE+P5
	bT2kTwRVA/ZeFjlohrxKHTZTLxAMb06uwC1q0JEEsn2wYcbMlw77AyWd32v6VGFb4RBNFyQ1qZS
	TC0elSufobVvqxWFP7Fsth9acJ3aF7rbAIw2KZhzOj/ujmoxqEZn5ohpq9W+izQWEBCLtqdLOyX
	OOzkLyQqB+bs2DUw6pSx2md1tmCxBzoEY5C9mosyzaMV721Z7jX2orOhLjA8jallyaZd4l5VGPX
	AoiV4pc+zzxeYf/oWW7HRnTJxplIuWIz9A7PrZo2ucuIFGzTTbCjpPmgxly0Em87g3ywdkLuqDj
	ej2riUJwObIjgE=
X-Received: by 2002:a05:6000:2512:b0:46f:f12b:e45a with SMTP id ffacd0b85a97d-46ff12be583mr1368867f8f.23.1782496908406;
        Fri, 26 Jun 2026 11:01:48 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46f86c34d76sm3712060f8f.3.2026.06.26.11.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/17] LoongArch: KVM: Add include defining struct cpu_feature
Date: Fri, 26 Jun 2026 20:00:33 +0200
Message-ID:  <a6e37d1e4abc0d86ef53b763cbbf1f7cf9898d13.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=aA0A5I2lDTZ+3fuKrSnqtIKoZ5aG2/MOhsZpVD8zJV8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr5ZOhBqzGUIytUOD5ZGIN1r+oKkcY9L/deLX uIj9VKfRLqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+WQAKCRCPgPtYfRL+ TqPRCACs7sMhF30wJXTkHgak8YFIcMgH1Fnp9mip9T3hT6j8ONZSkwKfpSItmZW5WfDx9fsKnEo TplXVIffJ2ViqeEqXitjhzkEmdDXsPonrbGEexNSnl4DH9mq6Vf1VvPxzYTyDOdGyY6OTP+qQ18 ehyl0jShHvjpx54maIABQRC1S7LnREKiXXsfslJwnAzirRBlMxaHLq7mXjuox1xU1TL0MbadVj3 EitUzpL+808folx9RkqnZiUPd2+1IJOOgMee/ovEm/b8uBrL9go31dgL4YjpLM5I5RA+HOFjgkO 4Irh3U2vosSmxP337PkIM7kffPKH4IXohqVQgAmYXXpIfSRR
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

